﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;

namespace WebChatIndentityServer4s.Areas.Identity.Pages.Account
{
    public class RegisterModel : PageModel
    {
        private readonly SignInManager<ManageUser> _signInManager;
        private readonly UserManager<ManageUser> _userManager;
        private readonly IUserStore<ManageUser> _userStore;
        private readonly IUserEmailStore<ManageUser> _emailStore;
        private readonly ILogger<RegisterModel> _logger;
        private readonly IEmailSender _emailSender;
        private readonly ManageAppDbContext _context;

        public RegisterModel(
            UserManager<ManageUser> userManager,
            IUserStore<ManageUser> userStore,
            SignInManager<ManageUser> signInManager,
            ILogger<RegisterModel> logger,
            IEmailSender emailSender,
            ManageAppDbContext context)
        {
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
            _context = context;
        }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public string ReturnUrl { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public IList<AuthenticationScheme> ExternalLogins { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 5)] // Số "{0}" là đại diện cho "[Display(Name = "UserName")]", Số 2 định dạng cho "MinimumLength = 5", còn số "{1}" định dạng cho "100"(Nhĩa là độ dài tối thiểu)
            [Display(Name = "UserName")]
            public string UserName { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 5)] // Số "{0}" là đại diện cho "[Display(Name = "UserName")]", Số 2 định dạng cho "MinimumLength = 5", còn số "{1}" định dạng cho "100"(Nhĩa là độ dài tối thiểu)
            [Display(Name = "Full Name")]
            public string FullName { get; set; }

            [Required]
            [Display(Name = "Avatar")]
            public string Avatar { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Password { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [DataType(DataType.Password)]
            [Display(Name = "Confirm password")]
            [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
            public string ConfirmPassword { get; set; }
        }


        public async Task OnGetAsync(string returnUrl = null)
        {
            ReturnUrl = returnUrl;
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
        }

        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl ??= Url.Content("~/");
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            if (ModelState.IsValid)
            {
                var avatars = new string[] {"avatar1.jpg", "avatar2.jpg", "avatar3.jpg", "avatar4.jpg" };

                var index = int.Parse(Input.Avatar);
                if (index < 0 || index > avatars.Count() - 1)
                    index = 0;

                var avatarName = avatars[index];


                // Cách 1
                //var user = CreateUser();

                //Cách 2
                var user = new ManageUser {UserName = Input.UserName, Email = Input.Email, FullName = Input.FullName,  Avatar = avatarName};

                await _userStore.SetUserNameAsync(user, Input.Email, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, Input.Email, CancellationToken.None);

                var checkRole = _context.Roles.Where(x => x.Name == "User").FirstOrDefault();
                

                var result = await _userManager.CreateAsync(user, Input.Password);


                if (checkRole != null)
                {
                    var checkRoleUser = _context.UserRoles.Where(x => x.UserId == user.Id).FirstOrDefault();
                    if(checkRoleUser == null)
                    {
                        var roleUsers = new IdentityUserRole<string>()
                        {
                            UserId = user.Id,
                            RoleId = checkRole.Id
                        };
                        _context.UserRoles.Add(roleUsers);
                        await _context.SaveChangesAsync();
                    }
                    

                    
                }
                if (result.Succeeded)
                {
                    _logger.LogInformation("User created a new account with password.");

                    var userId = await _userManager.GetUserIdAsync(user);
                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = userId, code = code, returnUrl = returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(Input.Email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");

                    
                    if (_userManager.Options.SignIn.RequireConfirmedAccount) // Yêu cầu tài khoản đã được xác nhận
                    {
                        return RedirectToPage("RegisterConfirmation", new { email = Input.Email, returnUrl = returnUrl });
                    }
                    else
                    {
                        await _signInManager.SignInAsync(user, isPersistent: false);
                        return LocalRedirect(returnUrl);
                    }
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }

            // If we got this far, something failed, redisplay form
            return Page();
        }

        private ManageUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<ManageUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(ManageUser)}'. " +
                    $"Ensure that '{nameof(ManageUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }

        private IUserEmailStore<ManageUser> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<ManageUser>)_userStore;
        }
    }
}

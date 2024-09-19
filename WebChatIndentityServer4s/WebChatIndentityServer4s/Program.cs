using Microsoft.EntityFrameworkCore;
using WebChatIndentityServer4s.Data;
using System;
using Microsoft.AspNetCore.Identity;
using WebChatIndentityServer4s.IdentityServer;
using Microsoft.AspNetCore.Identity.UI.Services;
using WebChatIndentityServer4s.Service;
using Microsoft.OpenApi.Models;
using WebChatIndentityServer4s.Data.Entity;
using Microsoft.Extensions.DependencyInjection;
using WebChatIndentityServer4s.Hubs;
using System.Text.Encodings.Web;
using System.Text.Unicode;
var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSignalR();
//builder.Services.AddRazorPages();

// "Account Login" của IdentityServer4 không phải là 1 MVC mà chỉ là 1 IdentityPage thôi nên phải thêm câu lệnh "builder.Services.AddRazorPages()" này vào thì mới chạy đc Login chứng thực trên "Swagger"
//builder.Services.AddRazorPages(option =>
//{
//    option.Conventions.AddAreaFolderRouteModelConvention("Identity", "/Account/", model =>
//    {
//        foreach (var selector in model.Selectors)
//        {
//            var attributeRouteModel = selector.AttributeRouteModel;
//            attributeRouteModel.Order = -1;
//            attributeRouteModel.Template = attributeRouteModel.Template.Remove(0, "Identity".Length);
//        }
//    });
//});

IMvcBuilder build = builder.Services.AddRazorPages(option =>
{
    option.Conventions.AddAreaFolderRouteModelConvention("Identity", "/Account/", model =>
    {
        foreach (var selector in model.Selectors)
        {
            var attributeRouteModel = selector.AttributeRouteModel;
            attributeRouteModel.Order = -1;
            attributeRouteModel.Template = attributeRouteModel.Template.Remove(0, "Identity".Length);
        }
    });
});

#if DEBUG
var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
if(environment == Environments.Development)
{
    build.AddRazorRuntimeCompilation();
}
#endif
builder.Services.AddDbContext<ManageAppDbContext>(option => option.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

//builder.Services.AddDefaultIdentity<ManageUser>(options => options.SignIn.RequireConfirmedAccount = true)
//    .AddEntityFrameworkStores<ManageAppDbContext>();

//builder.Services.AddDefaultIdentity<ManageUser>(options => options.SignIn.RequireConfirmedAccount = true)
//    .AddEntityFrameworkStores<ManageAppDbContext>();


builder.Services.AddIdentity<ManageUser, IdentityRole>() // AddIdentity để sử dụng được UserManager và roleManager
    .AddEntityFrameworkStores<ManageAppDbContext>()
    .AddDefaultTokenProviders();

//builder.Services.AddIdentityServer(option =>
//{
//    option.Events.RaiseErrorEvents = true;
//    option.Events.RaiseInformationEvents = true;
//    option.Events.RaiseFailureEvents = true;
//    option.Events.RaiseSuccessEvents = true;
//})
//    .AddInMemoryApiResources(Config.Apis)  // Bên folder IdentityServer thêm config
//                                           // .AddInMemoryClients(builder.Configuration.GetSection("IdentityServer:Clients"))
//    .AddInMemoryClients(builder.Configuration.GetSection("IdentityServer:Clients")) // Lấy ra các Client
//    .AddInMemoryIdentityResources(Config.Ids)
//    .AddInMemoryApiScopes(Config.ApiScopes)
//    .AddAspNetIdentity(ManageUser)
//    .AddDeveloperSigningCredential();
builder.Services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));

var builders = builder.Services.AddIdentityServer(option =>
{
    option.Events.RaiseErrorEvents = true;
    option.Events.RaiseInformationEvents = true;
    option.Events.RaiseFailureEvents = true;
    option.Events.RaiseSuccessEvents = true;
})
    .AddInMemoryApiResources(Config.Apis)  // Bên folder IdentityServer thêm config
                                           // .AddInMemoryClients(builder.Configuration.GetSection("IdentityServer:Clients"))
    .AddInMemoryClients(Config.Clients) // Lấy ra các Client
    .AddInMemoryIdentityResources(Config.Ids)
    .AddInMemoryApiScopes(Config.ApiScopes)
    .AddAspNetIdentity<ManageUser>()
    .AddDeveloperSigningCredential();

builder.Services.AddControllersWithViews();

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "WebApp Space Api", Version = "v1" });

    // Add Security Swagger
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Type = SecuritySchemeType.OAuth2,
        Flows = new OpenApiOAuthFlows
        {
            Implicit = new OpenApiOAuthFlow
            {
                AuthorizationUrl = new Uri(builder.Configuration["AuthorityUrl"] + "/connect/authorize"), // Đường dẫn tới địa chỉ chứng thực
                Scopes = new Dictionary<string, string>
                {
                    {
                        "api.WebApp",
                        "WebApp API"
                    }
                }
            }
        }
    });

    // Cho phép API Client đã cấu hình trong file "Config.cs" mới được truy cập
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference{Type = ReferenceType.SecurityScheme, Id = "Bearer"}
            },
            new List<string>{"api.WebApp"}
        }
    });
});

builder.Services.AddTransient<IEmailSender, EmailSenderService>();
//builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddAuthentication()
    .AddLocalApi("Bearer", option =>
    {
        option.ExpectedScope = "api.WebApp"; // Cái Scope này chính là dấu tích bên đăng nhập, và chỉ cho phép Api "WebApp" truy cập
    });

builder.Services.AddAuthorization(option =>
{
    option.AddPolicy("Bearer", option => // Thêm một chính sách
    {
        option.AddAuthenticationSchemes("Bearer"); // Với Authen bắt buộc phải có 1 Schemes là Bearer
        option.RequireAuthenticatedUser(); // Chỉ cho phép thằng nào đăng nhập vào thôi
    });
});



var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseIdentityServer();

app.UseRouting();
app.UseAuthentication(); ;

app.UseAuthorization();


app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
            name: "areas",
            pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
            );

    endpoints.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

    endpoints.MapDefaultControllerRoute();
    endpoints.MapRazorPages();
    endpoints.MapHub<ChatHub>("/chatHub"); // Bên Client gọi đến "/chatHub" này thì sẽ gọi được thằng "ChatHub.cs"
    
});

//app.MapControllerRoute(
//    name: "default",
//    pattern: "{controller=Home}/{action=Index}/{id?}");

app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.OAuthClientId("swagger");
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "WebApp ManageBrans Space Api V1");
});

app.Run();

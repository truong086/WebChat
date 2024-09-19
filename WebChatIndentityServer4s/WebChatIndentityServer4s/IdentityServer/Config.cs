using IdentityServer4;
using IdentityServer4.Models;
using System.Runtime.Intrinsics.Arm;
using System.Security.Principal;

namespace WebChatIndentityServer4s.IdentityServer
{
    public class Config
    {
        // Định nghĩa các Resource gì // Cho User Quản lý // Trả về 1 danh sách các IdentityResource
        public static IEnumerable<IdentityResource> Ids => new IdentityResource[]
        {
            // User Quản lý những gì này // Chuẩn của Identity ít nhất phải có 2 thằng này
            new IdentityResources.OpenId(),
            new IdentityResources.Profile()

            // Vd:
            //new IdentityResources.Email(),
            //new IdentityResources.Phone()

        };

        // Danh sách các API ở đây ta chỉ có mỗi thằng knowledgespace
        public static IEnumerable<ApiResource> Apis => new ApiResource[]
        {
            // Những API mình có
            new ApiResource("api.WebApp", "WebApp API")
        };


        // Scopes này là cho phép truy vấn, truy xuất call những gì từ API
        public static IEnumerable<ApiScope> ApiScopes => new ApiScope[]
        {
            new ApiScope("api.WebApp", "WebApp API")
        };

        /* Định nghĩa ra các Client chính là các ứng dụng ta định làm, chính là webportal, server(chính là swagger) và ...*/
        public static IEnumerable<Client> Clients => new Client[]
        {
            new Client
            {
                ClientId = "WebApp",
                ClientSecrets = {new Secret("secret".Sha256())}, // "secret" này là Key và sẽ đc mã hóa theo thuật toán "Sha256()"

                AllowedGrantTypes = GrantTypes.Code,
                RequireConsent = false,
                RequirePkce = true,
                AllowOfflineAccess = true,
                AllowedCorsOrigins = {"http://localhost/"},

                // Đăng nhập thành công thì redirect lại theo đường dẫn này 
                RedirectUris = { "https://localhost:5002/signin-oidc" },

                // Khi Logout nó chạy cổng này và xử lý Logout bên kia
                PostLogoutRedirectUris = {"https://localhost:5002/signout-callback-oidc"},

                // Ở Client này cho phép truy cập đến những cái này 
                AllowedScopes = new List<string>
                {
                    // Ở đây chúng ta cho truy cập cả thông tin User lẫn API
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    IdentityServerConstants.StandardScopes.OfflineAccess,
                    "api.WebApp"

                }
            },

            new Client
            {
                ClientId = "swagger",
                ClientName = "Swagger Client",

                AllowedGrantTypes = GrantTypes.Implicit,
                AllowAccessTokensViaBrowser = true,
                RequireConsent = false,

                RedirectUris = {"https://localhost:5000/swagger/oauth2-redirect.html"}, // Chuyển hướng
                PostLogoutRedirectUris = {"https://localhost:500/swagger/oauth2-redirect.html"}, // Chuyển hướng đăng xuất
                AllowedCorsOrigins = {"https://localhost:5000"}, // Cho phép nguồn gốc cores

                AllowedScopes = new List<string>
                {
                    IdentityServerConstants.StandardScopes.OpenId,
                    IdentityServerConstants.StandardScopes.Profile,
                    "api.WebApp"
                }
            }

        };
    }
}

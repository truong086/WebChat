using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace WebChatIndentityServer4s.Data
{
    // Đây là file kết nối đến Database
    public class ManageAppDbContextFactory : IDesignTimeDbContextFactory<ManageAppDbContext>
    {
        public ManageAppDbContext CreateDbContext(string[] args)
        {
            var environmentName = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");

            IConfigurationRoot configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json") // Đọc cấu hình từ file "appsettings.json"
                .AddJsonFile($"appsettings.{environmentName}.json") // Với môi trường Development là "ASPNETCORE_ENVIRONMENT" này
                .Build();

            var builder = new DbContextOptionsBuilder<ManageAppDbContext>();
            var connectionString = configuration.GetConnectionString("DefaultConnection");
            builder.UseSqlServer(connectionString);
            return new ManageAppDbContext(builder.Options);
        }
    }
}

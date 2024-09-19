using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection;
using WebChatIndentityServer4s.Data.Entity;

namespace WebChatIndentityServer4s.Data
{
    public class ManageAppDbContext : IdentityDbContext<ManageUser>
    {
        public ManageAppDbContext(DbContextOptions dbContextOptions) : base(dbContextOptions)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<IdentityRole>().Property(x => x.Id).HasMaxLength(50).IsRequired();
            modelBuilder.Entity<ManageUser>().Property(x => x.Id).HasMaxLength(50).IsRequired();

            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }

        public DbSet<ManageUser> ManageUsers { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<ThongBao> Thongbaos { get; set; }
        public DbSet<RoomUser> RoomUsers { get; set; }
        
    }
}

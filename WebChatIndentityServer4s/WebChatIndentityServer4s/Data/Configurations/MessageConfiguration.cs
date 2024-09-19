using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebChatIndentityServer4s.Data.Entity;

namespace WebChatIndentityServer4s.Data.Configurations
{
    public class MessageConfiguration : IEntityTypeConfiguration<Message>
    {
        public void Configure(EntityTypeBuilder<Message> builder)
        {
            builder.ToTable("Message");
            builder.Property(s => s.Content).IsRequired().HasMaxLength(500);

            // Quan hệ 1 - nhiều
            builder.HasOne(s => s.ToRoom) // 1 room sẽ có nhiều message
                .WithMany(m => m.Messages)
                .HasForeignKey(s => s.ToRoomId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}

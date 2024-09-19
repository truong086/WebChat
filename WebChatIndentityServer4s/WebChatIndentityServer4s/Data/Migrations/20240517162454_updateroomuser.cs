using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebChatIndentityServer4s.Data.Migrations
{
    public partial class updateroomuser : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Action",
                table: "RoomUsers",
                type: "bit",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Action",
                table: "RoomUsers");
        }
    }
}

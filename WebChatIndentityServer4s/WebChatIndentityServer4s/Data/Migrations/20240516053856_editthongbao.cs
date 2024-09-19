using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebChatIndentityServer4s.Data.Migrations
{
    public partial class editthongbao : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Active",
                table: "Thongbaos",
                type: "bit",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Active",
                table: "Thongbaos");
        }
    }
}

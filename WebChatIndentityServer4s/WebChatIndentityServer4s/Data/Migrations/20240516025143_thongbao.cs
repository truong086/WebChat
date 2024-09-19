using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebChatIndentityServer4s.Data.Migrations
{
    public partial class thongbao : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Thongbaos",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    message = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(50)", nullable: true),
                    RoomsId = table.Column<int>(type: "int", nullable: true),
                    Timestamp = table.Column<DateTime>(type: "datetime2", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Thongbaos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Thongbaos_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Thongbaos_Rooms_RoomsId",
                        column: x => x.RoomsId,
                        principalTable: "Rooms",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Thongbaos_RoomsId",
                table: "Thongbaos",
                column: "RoomsId");

            migrationBuilder.CreateIndex(
                name: "IX_Thongbaos_UserId",
                table: "Thongbaos",
                column: "UserId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Thongbaos");
        }
    }
}

USE [WebChats]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](50) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Timestamp] [datetime2](7) NULL,
	[ToRoomId] [int] NOT NULL,
	[FromUserId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AdminId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomUsers]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomsId] [int] NULL,
	[UserId] [nvarchar](50) NULL,
	[CreateAt] [datetime2](7) NULL,
	[Action] [bit] NULL,
 CONSTRAINT [PK_RoomUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thongbaos]    Script Date: 9/18/2024 3:10:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thongbaos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[UserId] [nvarchar](50) NULL,
	[RoomsId] [int] NULL,
	[Timestamp] [datetime2](7) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Thongbaos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240424163957_Initial', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516025143_thongbao', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516053856_editthongbao', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516151439_roomuser', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517162454_updateroomuser', N'6.0.29')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2c71009a-30ef-43b1-914c-ef4049c073e3', N'Admin', N'Admin', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2c71009a-30ef-43b1-914c-ef4049c073e4', N'User', N'User', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2c71009a-30ef-43b1-914c-ef4049c073e5', N'QuanLy', N'QuanLy', N'QuanLy')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'73716aae-3c2e-4454-8071-fc9dd32141a8', N'2c71009a-30ef-43b1-914c-ef4049c073e3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'61de569e-f885-4fd8-82ed-d7e839b80fef', N'2c71009a-30ef-43b1-914c-ef4049c073e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', N'2c71009a-30ef-43b1-914c-ef4049c073e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'febf5cae-ad62-437b-90b0-14f70f523726', N'2c71009a-30ef-43b1-914c-ef4049c073e4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3a2c616c-d2dd-49a3-958c-a69eed87138e', N'2c71009a-30ef-43b1-914c-ef4049c073e5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2c71009a-30ef-43b1-914c-ef4049c073e1', N'1234dđfga', N'avatar1.jpg', N'admin3@gmail.com', N'ADMIN3@GMAIL.COM', N'admin3@gmail.com', N'ADMIN3@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEFjLAd0WLuB259biVZLbVLzXtEKKjjbxCRI2K856ii+6Ustw7cJwDUoj/DQ0gF6NuQ==', N'ACPK4BJPBDAR7XXNMTJNOIESQKGN5YY2', N'70cc86a2-ff7e-4043-9447-992b3433b8eb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3a2c616c-d2dd-49a3-958c-a69eed87138e', N'cmnvadmin aa', N'avatar1.jpg', N'admin12@gmail.com', N'ADMIN12@GMAIL.COM', N'admin12@gmail.com', N'ADMIN12@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIIgBIuzqgOhi4UvzEDgIF9ySj2BFTl0yo8LoJtX/tkI8tG8nh4Wge6t2M16WDJpDg==', N'2U3UHTLX3ATP5QII567UHPWGI7HRZL2Y', N'ae4632bf-b616-439f-a892-5203418688e7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3be827df-01fb-477b-96b4-924b97926102', N'ABC123s', N'avatar1.jpg', N'admin1@gmail.com', N'ADMIN1@GMAIL.COM', N'admin1@gmail.com', N'ADMIN1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELnfL1B1JVCN73OgT0QUm+lhE6hRGZtl1Y8+cl9Osjgp7klYHOVysnfVwkAGifVnFg==', N'7SILQ5TCO623PYKQDD5LHXBIOCUPHF7C', N'2f20f885-d782-47ea-944c-6f1642f94d2c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'61de569e-f885-4fd8-82ed-d7e839b80fef', N'admin kalapsks', N'avatar1.jpg', N'admin12a@gmail.com', N'ADMIN12A@GMAIL.COM', N'admin12a@gmail.com', N'ADMIN12A@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEF6DWswTxB0n2cOLQWW4LIlbmsxEog6UUqOA5eU13oBbwDiq5at341hUVad4cptRvw==', N'G7FBPNGQXUHPT5H2QH6ULFIRQOULXPD7', N'1e59ba05-0615-435a-a6c5-8620588fc827', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6a053c71-40f2-4eab-90bc-38df732352fa', N'Admin', N'avatar1.jpg', N'admin2@gmail.com', N'ADMIN2@GMAIL.COM', N'admin2@gmail.com', N'ADMIN2@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECyKobtLz08jzTQHvuQByP9SiW7BNI8MBdEMP5tJUK30cquRmcBVku/FR8fdZrkVMQ==', N'SY6NEB6NXEVXI65WTSC2HAIQQDIEBUNV', N'354c3006-a25f-4531-89be-bd54b4f5efcd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'73716aae-3c2e-4454-8071-fc9dd32141a8', N'ADmin 6', N'avatar1.jpg', N'admin5@gmail.com', N'ADMIN5@GMAIL.COM', N'admin5@gmail.com', N'ADMIN5@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOMo6g+74pEYu7a/yHj8Iim+S8b1zFpBgx0ysDlL2wiNndYkDVYUJhZrizlDrcxutg==', N'TY32S2IK37SHR325ZDH6JO5TYXIKGOAK', N'de10b739-7d30-4158-9934-3bbc9e3f3b50', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', N'admin8', N'avatar1.jpg', N'admin8@gmail.com', N'ADMIN8@GMAIL.COM', N'admin8@gmail.com', N'ADMIN8@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM6e4zie+MWLpmS+Ux7lMDGzVQJmpz066sO88iarI/nhNvWirLys7DKlVWHw7z4bvw==', N'JSGYO2LH6LRQWM7Q3YUPU2XEQWYNC6CC', N'601acae6-6847-471f-9164-cb9fdb648e01', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ebb47697-a999-411b-8cba-735e6662be9c', N'ABC123', N'avatar1.png', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAECrtXDF7RTGBCdoMk/SYjKHwwOWPsjhmGb6e/jI4Bye8IB4Bp6ddmIcG0j5vIb1huw==', N'MUD57ETND3AOOEFJ4R724Y4W6YDD3YHG', N'995bae58-d334-4b52-badb-5f509e3095ab', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Avatar], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'febf5cae-ad62-437b-90b0-14f70f523726', N'admin6', N'avatar1.jpg', N'admin6@gmail.com', N'ADMIN6@GMAIL.COM', N'admin6@gmail.com', N'ADMIN6@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGdryEJ0xOxutIYgMdIIJv517swj+9MrNrcEqPOCZ9sg2ZPAoVDDvtMAWc5pI2AqTQ==', N'G6EV2BEUFLYQCMQKUVSN42YR3A655AAE', N'6ab22830-baea-4da7-af19-af4fbdce223c', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (180, N'ALO', CAST(N'2024-05-13T13:37:32.8939230' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (181, N'ALOAlo', CAST(N'2024-05-13T13:37:38.4893869' AS DateTime2), 5, N'3be827df-01fb-477b-96b4-924b97926102')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (182, N':O:O:O:O:O', CAST(N'2024-05-13T13:37:46.9730657' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (183, N':):):)', CAST(N'2024-05-13T13:37:49.0574584' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (184, N'<a href="/uploads/202437130553_2022-01-13 (1).png" target="_blank"><img src="/uploads/202437130553_2022-01-13 (1).png" class="post-image"></a>', CAST(N'2024-05-13T13:37:53.1036372' AS DateTime2), 5, N'3be827df-01fb-477b-96b4-924b97926102')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (185, N'🎫🎫🎫🛒🛒', CAST(N'2024-05-13T13:38:03.1339040' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (186, N'Alo ', CAST(N'2024-05-13T13:38:56.8801445' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (187, N'🥼🥼🥼🥼🥼🥼🥼🥼👕👕👕👕👕👕👕', CAST(N'2024-05-13T13:39:48.1788583' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (188, N'aaa', CAST(N'2024-05-15T09:36:23.7111301' AS DateTime2), 5, N'3be827df-01fb-477b-96b4-924b97926102')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (189, N'ALo', CAST(N'2024-05-16T16:48:06.4466316' AS DateTime2), 5, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (190, N'B|B|B|', CAST(N'2024-05-16T16:48:10.8786037' AS DateTime2), 5, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (191, N'🎭🎭🎭🎭🎭', CAST(N'2024-05-16T16:48:58.4360744' AS DateTime2), 6, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (192, N'<a href="/uploads/202449160508_2022-01-13 (1).png" target="_blank"><img src="/uploads/202449160508_2022-01-13 (1).png" class="post-image"></a>', CAST(N'2024-05-16T16:49:08.6400071' AS DateTime2), 6, N'3be827df-01fb-477b-96b4-924b97926102')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (193, N':-):-):-)', CAST(N'2024-05-16T16:49:13.0682995' AS DateTime2), 6, N'3be827df-01fb-477b-96b4-924b97926102')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (194, N':D:D:D', CAST(N'2024-05-16T16:49:19.1157228' AS DateTime2), 6, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (195, N'ALo', CAST(N'2024-05-16T16:59:08.3901761' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (196, N'<a href="/uploads/202459160513_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202459160513_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-16T16:59:13.7351911' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (197, N':P:P:P:P', CAST(N'2024-05-16T16:59:19.7132464' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (198, N'🥽🥽🥽👔👔👔👔', CAST(N'2024-05-16T16:59:26.7835770' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (199, N'Alo', CAST(N'2024-05-16T16:59:52.9347502' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (200, N'Alo alo', CAST(N'2024-05-16T16:59:56.4435715' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (201, N':O:O:O:O', CAST(N'2024-05-16T17:00:00.5231305' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (202, N':-):-):-)', CAST(N'2024-05-16T17:00:05.4289955' AS DateTime2), 5, N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (203, N'🕶🕶🕶', CAST(N'2024-05-16T17:00:15.2364127' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (204, N'a', CAST(N'2024-05-16T18:37:24.1062524' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (205, N'a', CAST(N'2024-05-16T18:38:33.1268547' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (206, N'a', CAST(N'2024-05-16T19:09:20.9277846' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (207, N'a', CAST(N'2024-05-16T19:09:30.9103910' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (208, N'a', CAST(N'2024-05-16T19:09:31.2437505' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (209, N'a', CAST(N'2024-05-16T19:09:31.5237592' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (210, N'a', CAST(N'2024-05-16T19:09:31.7634826' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (211, N'a', CAST(N'2024-05-16T19:09:31.9917755' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (212, N'a', CAST(N'2024-05-16T19:09:32.2384380' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (213, N'a', CAST(N'2024-05-16T19:09:32.4459610' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (214, N'a', CAST(N'2024-05-16T19:09:32.6525537' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (215, N'a', CAST(N'2024-05-16T19:09:32.8769873' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (216, N'á', CAST(N'2024-05-16T19:09:33.1757469' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (217, N's', CAST(N'2024-05-16T19:09:33.4482140' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (218, N's', CAST(N'2024-05-16T19:09:33.7613125' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (219, N'đ', CAST(N'2024-05-16T19:09:34.0343518' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (220, N'f', CAST(N'2024-05-16T19:09:34.2769836' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (221, N'd', CAST(N'2024-05-16T19:09:34.4716074' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (222, N'sd', CAST(N'2024-05-16T19:09:34.7263274' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (223, N's', CAST(N'2024-05-16T19:09:34.9533665' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (224, N's', CAST(N'2024-05-16T19:09:35.1544922' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (225, N's', CAST(N'2024-05-16T19:09:35.3699102' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (226, N's', CAST(N'2024-05-16T19:09:35.5966941' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (227, N'ss', CAST(N'2024-05-16T19:09:35.8229211' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (228, N's', CAST(N'2024-05-16T19:09:36.0624796' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (229, N's', CAST(N'2024-05-16T19:09:36.3179371' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (230, N's', CAST(N'2024-05-16T19:09:36.5457414' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (231, N's', CAST(N'2024-05-16T19:09:36.8025971' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (232, N's', CAST(N'2024-05-16T19:09:37.0542316' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (233, N's', CAST(N'2024-05-16T19:09:37.3028455' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (234, N's', CAST(N'2024-05-16T19:09:37.5598000' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (235, N'Mày là ai', CAST(N'2024-05-17T00:57:23.0705196' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (236, N'alo', CAST(N'2024-05-17T00:57:29.5192884' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (237, N'a', CAST(N'2024-05-17T00:58:57.1623020' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (238, N'a', CAST(N'2024-05-17T01:03:32.7874279' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (239, N'a', CAST(N'2024-05-17T01:03:35.4196397' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (240, N'a', CAST(N'2024-05-17T01:03:35.8590443' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (241, N'a', CAST(N'2024-05-17T01:03:36.1064986' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (242, N'a', CAST(N'2024-05-17T01:03:36.3128109' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (243, N'a', CAST(N'2024-05-17T01:03:36.5225303' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (244, N'a', CAST(N'2024-05-17T01:03:39.5889001' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (245, N'<a href="/uploads/202403170544_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202403170544_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:03:44.3686417' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (246, N'a', CAST(N'2024-05-17T01:04:42.6779673' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (247, N'a', CAST(N'2024-05-17T01:04:43.2400680' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (248, N'a', CAST(N'2024-05-17T01:05:20.7244563' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (249, N'a', CAST(N'2024-05-17T01:09:15.7747872' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (250, N'a', CAST(N'2024-05-17T01:09:18.3888861' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (251, N'a', CAST(N'2024-05-17T01:09:19.0650483' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (252, N's', CAST(N'2024-05-17T01:09:19.4337577' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (253, N's', CAST(N'2024-05-17T01:09:19.8050466' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (254, N'd', CAST(N'2024-05-17T01:09:20.1770652' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (255, N'f', CAST(N'2024-05-17T01:09:20.5399778' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (256, N'g', CAST(N'2024-05-17T01:09:20.9551824' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (257, N'h', CAST(N'2024-05-17T01:09:21.3516348' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (258, N'j', CAST(N'2024-05-17T01:09:21.7231603' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (259, N'k', CAST(N'2024-05-17T01:09:22.0982249' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (260, N'k', CAST(N'2024-05-17T01:09:22.4769203' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (261, N'a', CAST(N'2024-05-17T01:09:50.6162051' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (262, N'a', CAST(N'2024-05-17T01:10:01.0422117' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (263, N'a', CAST(N'2024-05-17T01:12:15.8449813' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (264, N'a', CAST(N'2024-05-17T01:12:21.8285321' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (265, N's', CAST(N'2024-05-17T01:12:22.4760547' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (266, N'd', CAST(N'2024-05-17T01:12:22.9045153' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (267, N'f', CAST(N'2024-05-17T01:12:23.2617147' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (268, N'g', CAST(N'2024-05-17T01:12:23.6421068' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (269, N'h', CAST(N'2024-05-17T01:12:24.0558007' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (270, N'<a href="/uploads/202412170528_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202412170528_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:12:28.1077881' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (271, N':-)', CAST(N'2024-05-17T01:13:08.2671628' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (272, N':D', CAST(N'2024-05-17T01:13:13.5492084' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (273, N'<3<3<3<3', CAST(N'2024-05-17T01:13:15.9494631' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (274, N'😔😔😔😔', CAST(N'2024-05-17T01:13:24.1530178' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (275, N'<a href="/uploads/202413170529_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202413170529_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:13:29.7371101' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (276, N'a', CAST(N'2024-05-17T01:13:31.9904355' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (277, N'<a href="/uploads/202415170520_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202415170520_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:15:20.0911818' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (278, N'a', CAST(N'2024-05-17T01:15:23.2335423' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
GO
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (279, N'<a href="/uploads/202419170501_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202419170501_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:19:01.3617979' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (280, N'a', CAST(N'2024-05-17T01:19:04.2963894' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (281, N'<a href="/uploads/202420170513_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202420170513_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:20:13.5517798' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (282, N's', CAST(N'2024-05-17T01:20:41.2101522' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (283, N'a', CAST(N'2024-05-17T01:22:36.9442907' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (284, N'<a href="/uploads/202422170541_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202422170541_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:22:41.2920284' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (285, N'<a href="/uploads/202423170528_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202423170528_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T01:23:28.8718834' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (286, N'Alo', CAST(N'2024-05-17T02:01:29.7572479' AS DateTime2), 6, N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (287, N'<a href="/uploads/202401170533_BaiKiemTraMMT-2.jpg" target="_blank"><img src="/uploads/202401170533_BaiKiemTraMMT-2.jpg" class="post-image"></a>', CAST(N'2024-05-17T02:01:33.7135949' AS DateTime2), 6, N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (288, N'e', CAST(N'2024-05-17T23:27:36.4011071' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (289, N'Alo', CAST(N'2024-05-17T23:28:01.3574791' AS DateTime2), 6, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (290, N'alo', CAST(N'2024-05-17T23:28:09.5980444' AS DateTime2), 5, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (291, N'ơi', CAST(N'2024-05-17T23:28:11.7460538' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (292, N'Mày là ai', CAST(N'2024-05-17T23:28:15.5425731' AS DateTime2), 5, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (293, N'Tao là mày', CAST(N'2024-05-17T23:28:20.7339377' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (294, N'Mày là ai', CAST(N'2024-05-17T23:28:24.0420558' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (295, N'Tao cũng là mày', CAST(N'2024-05-17T23:28:29.4788532' AS DateTime2), 5, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (296, N'Alo ', CAST(N'2024-05-17T23:28:38.2513995' AS DateTime2), 6, N'73716aae-3c2e-4454-8071-fc9dd32141a8')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (297, N',', CAST(N'2024-05-17T23:37:06.3244935' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (298, N'ddd', CAST(N'2024-05-17T23:37:09.5560891' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (299, N'ALo', CAST(N'2024-07-10T12:45:05.4013068' AS DateTime2), 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (300, N'ALo alo clo', CAST(N'2024-07-10T12:45:20.9775020' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (301, N':):):)', CAST(N'2024-07-10T12:45:24.2192971' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
INSERT [dbo].[Message] ([Id], [Content], [Timestamp], [ToRoomId], [FromUserId]) VALUES (302, N'💕💕💕', CAST(N'2024-07-10T12:45:37.2307868' AS DateTime2), 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1')
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [Name], [AdminId]) VALUES (5, N'Mày là ais', N'ebb47697-a999-411b-8cba-735e6662be9c')
INSERT [dbo].[Rooms] ([Id], [Name], [AdminId]) VALUES (6, N'ABC XYZ Javas', N'3be827df-01fb-477b-96b4-924b97926102')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomUsers] ON 

INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (1, 6, N'2c71009a-30ef-43b1-914c-ef4049c073e1', NULL, NULL)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (2, 5, N'2c71009a-30ef-43b1-914c-ef4049c073e1', CAST(N'2024-05-17T00:23:23.0388026' AS DateTime2), 1)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (3, 6, N'febf5cae-ad62-437b-90b0-14f70f523726', CAST(N'2024-05-17T01:32:40.7071715' AS DateTime2), NULL)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (4, 5, N'febf5cae-ad62-437b-90b0-14f70f523726', CAST(N'2024-05-17T01:32:58.4748624' AS DateTime2), NULL)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (5, 6, N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', CAST(N'2024-05-17T02:01:07.8840462' AS DateTime2), NULL)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (6, 6, N'3a2c616c-d2dd-49a3-958c-a69eed87138e', CAST(N'2024-05-18T01:24:37.8530582' AS DateTime2), 0)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (7, 6, N'61de569e-f885-4fd8-82ed-d7e839b80fef', CAST(N'2024-05-18T01:25:51.3407877' AS DateTime2), 1)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (8, 5, N'61de569e-f885-4fd8-82ed-d7e839b80fef', CAST(N'2024-05-18T01:25:58.7070162' AS DateTime2), NULL)
INSERT [dbo].[RoomUsers] ([Id], [RoomsId], [UserId], [CreateAt], [Action]) VALUES (9, 5, N'3a2c616c-d2dd-49a3-958c-a69eed87138e', CAST(N'2024-05-18T01:27:55.2866002' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[RoomUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Thongbaos] ON 

INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (1, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:21:08.1527467' AS DateTime2), 0)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (2, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:21:07.6551461' AS DateTime2), 0)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (3, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:21:07.4527624' AS DateTime2), 0)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (4, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:21:07.4548847' AS DateTime2), 0)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (5, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:21:07.4505883' AS DateTime2), 0)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (6, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:22:56.4722597' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (7, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:22:56.4824229' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (8, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:22:58.6227606' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (9, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:23:05.3060443' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (10, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:24:43.3817480' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (11, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:24:44.9352801' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (12, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:24:48.4058181' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (13, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:24:49.1595684' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (14, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:24:53.0495830' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (15, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:24:54.1237581' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (16, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:24:54.2962936' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (17, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:24:54.4416702' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (18, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:25:27.8865373' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (19, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:25:28.5576523' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (20, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:25:29.7023886' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (21, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:25:55.9666375' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (22, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:25:59.7375156' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (23, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:26:02.3132587' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (24, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T20:26:04.5334603' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (25, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:35:16.2286995' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (26, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:36:13.8730284' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (27, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:36:21.8786614' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (28, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-16T20:36:27.2905811' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (29, N'admin@gmail.com muốn tham gia vào room Mày là ai', N'ebb47697-a999-411b-8cba-735e6662be9c', 5, CAST(N'2024-05-16T21:23:52.4170765' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (30, N'admin@gmail.com muốn tham gia vào room Mày là ai', N'ebb47697-a999-411b-8cba-735e6662be9c', 5, CAST(N'2024-05-16T21:24:22.0435341' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (31, N'admin@gmail.com muốn tham gia vào room ABC XYZ Java', N'ebb47697-a999-411b-8cba-735e6662be9c', 6, CAST(N'2024-05-16T21:25:12.9210825' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (32, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T21:29:57.8667234' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (33, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T21:33:43.4721829' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (34, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-16T21:34:07.0497259' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (36, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:21:08.2778323' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (37, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:22:02.6401852' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (38, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:22:06.2092027' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (39, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:22:13.7633738' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (40, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:22:54.6646933' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (41, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:23:28.7411540' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (42, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:24:06.7011974' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (43, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:24:13.7614551' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (44, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:26:59.6933201' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (45, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:34:40.9667377' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (46, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:37:26.5765518' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (47, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:38:03.6100764' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (48, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:38:14.9929439' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (49, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:38:30.1016859' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (50, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:38:54.2393626' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (51, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:39:10.0426391' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (52, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:39:45.0211486' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (53, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:39:48.7812100' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (54, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:40:00.1948066' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (55, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:40:39.3107756' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (56, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:40:49.4929861' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (57, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:40:52.1731733' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (58, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:41:00.6259381' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (59, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:41:10.1639160' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (60, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:44:10.9175650' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (61, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:45:00.5979535' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (62, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:45:04.1132314' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (63, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:45:56.4988535' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (64, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:48:37.2043410' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (65, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:49:57.0461184' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (66, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:50:01.5779243' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (67, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:50:13.5249799' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (68, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:51:04.1206158' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (69, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:51:22.5597950' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (70, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:51:43.8206860' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (71, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:51:46.4084654' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (72, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:53:13.2244551' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (73, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:53:22.7036643' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (74, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:53:25.5765244' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (75, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:53:35.3337570' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (76, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T00:55:40.6081824' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (77, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T00:55:44.1425377' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (78, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:32:15.9246097' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (79, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:32:46.2766944' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (80, N'admin6@gmail.com muốn tham gia vào room Mày là ai', N'febf5cae-ad62-437b-90b0-14f70f523726', 5, CAST(N'2024-05-17T01:32:48.7090711' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (81, N'admin6@gmail.com muốn tham gia vào room Mày là ai', N'febf5cae-ad62-437b-90b0-14f70f523726', 5, CAST(N'2024-05-17T01:33:07.3334842' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (82, N'admin6@gmail.com muốn tham gia vào room Mày là ai', N'febf5cae-ad62-437b-90b0-14f70f523726', 5, CAST(N'2024-05-17T01:35:12.1870542' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (83, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:35:15.1960906' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (84, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:35:49.1549576' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (85, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:36:52.0142101' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (86, N'admin6@gmail.com muốn tham gia vào room Mày là ai', N'febf5cae-ad62-437b-90b0-14f70f523726', 5, CAST(N'2024-05-17T01:36:54.6328372' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (87, N'admin6@gmail.com muốn tham gia vào room ABC XYZ Java', N'febf5cae-ad62-437b-90b0-14f70f523726', 6, CAST(N'2024-05-17T01:37:56.2131843' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (88, N'admin8@gmail.com muốn tham gia vào room ABC XYZ Java', N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', 6, CAST(N'2024-05-17T02:00:32.7739011' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (89, N'admin8@gmail.com muốn tham gia vào room Mày là ai', N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', 5, CAST(N'2024-05-17T02:01:14.4096338' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (90, N'admin8@gmail.com muốn tham gia vào room Mày là ai', N'c38e9ae7-ad50-43ab-a004-9524c9ac3df4', 5, CAST(N'2024-05-17T02:01:16.8667613' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (91, N'admin5@gmail.com muốn tham gia vào room Mày là ai', N'73716aae-3c2e-4454-8071-fc9dd32141a8', 5, CAST(N'2024-05-17T23:26:14.5779277' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (92, N'admin5@gmail.com muốn tham gia vào room ABC XYZ Java', N'73716aae-3c2e-4454-8071-fc9dd32141a8', 6, CAST(N'2024-05-17T23:26:17.4106386' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (93, N'admin5@gmail.com muốn tham gia vào room ABC XYZ Java', N'73716aae-3c2e-4454-8071-fc9dd32141a8', 6, CAST(N'2024-05-17T23:26:50.6380906' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (94, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T23:27:08.2207310' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (95, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T23:27:11.8838686' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (96, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T23:33:44.8539161' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (97, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T23:33:49.4216054' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (98, N'admin3@gmail.com muốn tham gia vào room ABC XYZ Java', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 6, CAST(N'2024-05-17T23:33:51.2503708' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (99, N'admin3@gmail.com muốn tham gia vào room Mày là ai', N'2c71009a-30ef-43b1-914c-ef4049c073e1', 5, CAST(N'2024-05-17T23:33:53.1772821' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (100, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:11:38.0260414' AS DateTime2), NULL)
GO
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (101, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:11:48.4701141' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (102, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:12:05.3929742' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (103, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:12:53.7234803' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (104, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:15:45.1290743' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (105, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:15:48.7010781' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (106, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:15:55.9842001' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (107, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:15:58.3830763' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (108, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:16:00.5958669' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (109, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:16:03.3724464' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (110, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:16:05.5243981' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (111, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:17:18.4916992' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (112, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:17:21.3954414' AS DateTime2), NULL)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (113, N'admin12a@gmail.com muốn tham gia vào room Mày là ai', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 5, CAST(N'2024-05-18T01:17:26.7033295' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (114, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:17:28.9717721' AS DateTime2), 1)
INSERT [dbo].[Thongbaos] ([Id], [message], [UserId], [RoomsId], [Timestamp], [Active]) VALUES (115, N'admin12a@gmail.com muốn tham gia vào room ABC XYZ Java', N'61de569e-f885-4fd8-82ed-d7e839b80fef', 6, CAST(N'2024-05-18T01:17:35.8689308' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Thongbaos] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_AspNetUsers_FromUserId] FOREIGN KEY([FromUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_AspNetUsers_FromUserId]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Rooms_ToRoomId] FOREIGN KEY([ToRoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Rooms_ToRoomId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_AspNetUsers_AdminId] FOREIGN KEY([AdminId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_AspNetUsers_AdminId]
GO
ALTER TABLE [dbo].[RoomUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsers_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[RoomUsers] CHECK CONSTRAINT [FK_RoomUsers_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[RoomUsers]  WITH CHECK ADD  CONSTRAINT [FK_RoomUsers_Rooms_RoomsId] FOREIGN KEY([RoomsId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[RoomUsers] CHECK CONSTRAINT [FK_RoomUsers_Rooms_RoomsId]
GO
ALTER TABLE [dbo].[Thongbaos]  WITH CHECK ADD  CONSTRAINT [FK_Thongbaos_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Thongbaos] CHECK CONSTRAINT [FK_Thongbaos_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Thongbaos]  WITH CHECK ADD  CONSTRAINT [FK_Thongbaos_Rooms_RoomsId] FOREIGN KEY([RoomsId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Thongbaos] CHECK CONSTRAINT [FK_Thongbaos_Rooms_RoomsId]
GO

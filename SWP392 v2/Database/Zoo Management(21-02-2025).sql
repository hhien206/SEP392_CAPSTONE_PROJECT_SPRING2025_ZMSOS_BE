USE [master]
GO
/****** Object:  Database [Zoo_Management_And_Staff_Operations_System]    Script Date: 2/9/2025 1:25:02 PM ******/
CREATE DATABASE [Zoo_Management_And_Staff_Operations_System]

USE [Zoo_Management_And_Staff_Operations_System]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsentTime](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[reason] [int] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[account_name] [nvarchar](500) NULL,
	[password] [nvarchar](500) NULL,
	[status] [varchar](20) NULL,
	[created_date] [date] NULL,
	[updated_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_type_id] [int] NULL,
	[description] [nvarchar](500) NULL,
	[classify] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
	[url_image] [nvarchar](Max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Individual](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[birth_date] [date] NULL,
	[name] [nvarchar](500) NULL,
	[age] [nvarchar](500) NULL,
	[gender] [nvarchar](500) NULL,
	[weight] [nvarchar](500) NULL,
	[height] [nvarchar](500) NULL,
	[arrival_date] [date] NULL,
	[notes] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[quantity] [int] NULL,
	[notes] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalCage]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalCage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[cage_id] [int] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalIncidentHistory]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalIncidentHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[content] [nvarchar](500) NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scientific_name] [nvarchar](500) NULL,
	[vietnamese_name] [nvarchar](500) NULL,
	[english_name] [nvarchar](500) NULL,
	[family] [nvarchar](500) NULL,
	[weight_range] [nvarchar](500) NULL,
	[characteristics] [nvarchar](500) NULL,
	[distribution] [nvarchar](500) NULL,
	[habitat] [nvarchar](500) NULL,
	[diet] [nvarchar](500) NULL,
	[reproduction] [nvarchar](500) NULL,
	[eat_frequency] [nvarchar](500) NULL,
	[conservation_status] [nvarchar](20) NULL,
	[url_image] [nvarchar](Max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalUpdateHistory]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalUpdateHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[animal_id] [int] NULL,
	[account_id] [int] NULL,
	[detail] [nvarchar](500) NULL,
	[update_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[reciever_id] [int] NULL,
	[application_type_id] [int] NULL,
	[title] [nvarchar](500) NULL,
	[details] [nvarchar](500) NULL,
	[reply] [nvarchar](500) NULL,
	[date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationType]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cage]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zoo_area_id] [int] NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CageUpdateHistory]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CageUpdateHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cage_id] [int] NULL,
	[account_id] [int] NULL,
	[detail] [nvarchar](500) NULL,
	[update_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[leader_id] [int] NULL,
	[member_id] [int] NULL,
	[title] [nvarchar](500) NULL,
	[details] [nvarchar](500) NULL,
	[score] [float] NULL,
	[max_score] [float] NULL,
	[date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaderAssign]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaderAssign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NULL,
	[leader_id] [int] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberAssign]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAssign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NULL,
	[member_id] [int] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[headline] [nvarchar](500) NULL,
	[content] [nvarchar](500) NULL,
	[date] [datetime] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[content] [nvarchar](500) NULL,
	[created_date] [datetime] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sender_id] [int] NULL,
	[receiver_id] [int] NULL,
	[title] [nvarchar](500) NULL,
	[content] [nvarchar](500) NULL,
	[date] [datetime] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportAttachment]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportAttachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[report_id] [int] NULL,
	[file_url] [nvarchar](max) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](500) NULL,
	[max_absence_per_month] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[date] [date] NULL,
	[note] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_type_id] [int] NULL,
	[schedule_id] [int] NULL,
	[task_name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[note] [nvarchar](500) NULL,
	[priority] [nvarchar](500) NULL,
	[time_start] [time](7) NULL,
	[time_end] [time](7) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalAssign](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_id] [int] NULL,
	[animal_cage_id] [int] NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zoo_area_id] [int] NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskEstimate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_type_id] [int] NULL,
	[animal_type_id] [int] NULL,
	[time_estimate] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[email] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[phoneNumber] [nvarchar](20) NULL,
	[experience] [nvarchar](20) NULL,
	[gender] [nvarchar](20) NULL,
	[avartar_url] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZooArea]    Script Date: 2/9/2025 1:25:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZooArea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[description] [nvarchar](500) NULL,
	[status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AbsentTime] ON 

INSERT [dbo].[AbsentTime] ([id], [account_id], [reason], [from_date], [to_date], [status]) VALUES (1, 2, 1, CAST(N'2024-05-10' AS Date), CAST(N'2024-05-11' AS Date), N'Approved')
SET IDENTITY_INSERT [dbo].[AbsentTime] OFF
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [role_id], [account_name], [password], [status], [created_date], [updated_date]) VALUES (1, 1, N'admin', N'admin123', N'Active', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Account] ([id], [role_id], [account_name], [password], [status], [created_date], [updated_date]) VALUES (2, 2, N'john_doe', N'staff123', N'Active', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[Account] ([id], [role_id], [account_name], [password], [status], [created_date], [updated_date]) VALUES (3, 3, N'emma_smith', N'manager123', N'Active', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([id], [animal_type_id], [description], [status]) VALUES (1, 1, N'Alpha male lion with distinctive dark mane', N'Active')
INSERT [dbo].[Animal] ([id], [animal_type_id], [description], [status]) VALUES (2, 2, N'Young female zebra, very social', N'Active')
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalCage] ON 

INSERT [dbo].[AnimalCage] ([id], [animal_id], [cage_id], [from_date], [to_date], [status]) VALUES (1, 1, 1, CAST(N'2023-01-01' AS Date), NULL, N'Active')
INSERT [dbo].[AnimalCage] ([id], [animal_id], [cage_id], [from_date], [to_date], [status]) VALUES (2, 2, 2, CAST(N'2023-02-01' AS Date), NULL, N'Active')
SET IDENTITY_INSERT [dbo].[AnimalCage] OFF
GO
SET IDENTITY_INSERT [dbo].[AnimalType] ON 

INSERT [dbo].[AnimalType] ([id], [scientific_name], [vietnamese_name], [english_name], [family], [weight_range], [characteristics], [distribution], [habitat], [diet], [reproduction], [conservation_status]) VALUES (1, N'Panthera leo', N'Lion', N'Lion', N'Felidae', N'150-250 kg', N'Màu lông vàng, có b?m (con đ?c)', N'Châu Phi', N'Savanna', N'Th?t', N'Đ? con', N'Endangered')
INSERT [dbo].[AnimalType] ([id], [scientific_name], [vietnamese_name], [english_name], [family], [weight_range], [characteristics], [distribution], [habitat], [diet], [reproduction], [conservation_status]) VALUES (2, N'Equus quagga', N'Zebra', N'Zebra', N'Equidae', N'200-450 kg', N'S?c đen tr?ng', N'Châu Phi', N'Đ?ng c?', N'C?', N'Đ? con', N'Least Concern')
SET IDENTITY_INSERT [dbo].[AnimalType] OFF
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([id], [sender_id], [reciever_id], [application_type_id], [title], [details], [reply], [date], [status]) VALUES (1, 2, 3, 1, N'Xin ngh? ?m', N'B? c?m cúm, c?n ngh? 2 ngày', N'Đ?ng ?', CAST(N'2024-05-01' AS Date), N'Approved')
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[ApplicationType] ON 

INSERT [dbo].[ApplicationType] ([id], [name], [description]) VALUES (1, N'Leave Request', N'Employee leave application')
INSERT [dbo].[ApplicationType] ([id], [name], [description]) VALUES (2, N'Supply Order', N'Request for equipment or food supplies')
SET IDENTITY_INSERT [dbo].[ApplicationType] OFF
GO
SET IDENTITY_INSERT [dbo].[Cage] ON 

INSERT [dbo].[Cage] ([id], [zoo_area_id], [name], [description], [status]) VALUES (1, 1, N'Lion Enclosure', N'Open-air habitat with rocky terrain for lions.', N'Active')
INSERT [dbo].[Cage] ([id], [zoo_area_id], [name], [description], [status]) VALUES (2, 1, N'Zebra Habitat', N'Grassland enclosure with watering holes.', N'Active')
INSERT [dbo].[Cage] ([id], [zoo_area_id], [name], [description], [status]) VALUES (3, 2, N'Tiger Sanctuary', N'Tree-filled environment with climbing structures.', N'Active')
SET IDENTITY_INSERT [dbo].[Cage] OFF
GO

SET IDENTITY_INSERT [dbo].[LeaderAssign] ON 

INSERT [dbo].[LeaderAssign] ([id], [team_id], [leader_id], [from_date], [to_date], [status]) VALUES (1, 1, 3, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), N'Active')
INSERT [dbo].[LeaderAssign] ([id], [team_id], [leader_id], [from_date], [to_date], [status]) VALUES (2, 2, 2, CAST(N'2025-02-09' AS Date), NULL, N'Active')
SET IDENTITY_INSERT [dbo].[LeaderAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberAssign] ON 

INSERT [dbo].[MemberAssign] ([id], [team_id], [member_id], [from_date], [to_date], [status]) VALUES (1, 1, 2, CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), N'Active')
SET IDENTITY_INSERT [dbo].[MemberAssign] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [account_id], [headline], [content], [date], [status]) VALUES (1, 3, N'New Exhibit Opening', N'The Aquatic Pavilion will open next month with new marine species.', CAST(N'2025-02-04T20:33:31.993' AS DateTime), N'Published')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [account_id], [content], [created_date], [status]) VALUES (1, 2, N'Your leave request has been approved', CAST(N'2025-02-04T20:33:31.993' AS DateTime), N'Unread')
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([id], [sender_id], [receiver_id], [title], [content], [date], [status]) VALUES (1, 2, 3, N'Lion Health Report', N'Leo shows normal appetite and activity levels', CAST(N'2024-05-02T00:00:00.000' AS DateTime), N'Reviewed')
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportAttachment] ON 

INSERT [dbo].[ReportAttachment] ([id], [report_id], [file_url], [status]) VALUES (1, 1, N'/reports/simba_health.pdf', N'Active')
SET IDENTITY_INSERT [dbo].[ReportAttachment] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role_name], [max_absence_per_month]) VALUES (1, NULL, 2)
INSERT [dbo].[Role] ([id], [role_name], [max_absence_per_month]) VALUES (2, NULL, 3)
INSERT [dbo].[Role] ([id], [role_name], [max_absence_per_month]) VALUES (3, NULL, 4)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([id], [account_id], [date], [note], [status]) VALUES (1, 2, CAST(N'2024-05-01' AS Date), N'Morning shift', N'Active')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([id], [schedule_id], [task_name], [description], [note], [time_start], [time_end], [status]) VALUES (1, 1, N'Cho sư t? ăn', N'Th?t b? và nư?c s?ch', N'Ki?m tra kh?u ph?n', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), N'Completed')
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([id], [name], [Description], [status]) VALUES (1, N'Big Cat Care Team', N'Responsible for lions, tigers, and leopards', N'Active')
INSERT [dbo].[Team] ([id], [name], [Description], [status]) VALUES (2, N'Conservation Team', N'Manages endangered species and habitats', N'Active')
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [account_id], [email], [address], [phoneNumber], [gender], [avartar_url]) VALUES (1, 1, N'admin@wildlifezoo.com', N'123 Zoo Street, New York', N'0123-456-789', NULL, N'/avatars/admin.jpg')
INSERT [dbo].[User] ([id], [account_id], [email], [address], [phoneNumber], [gender], [avartar_url]) VALUES (2, 2, N'john@wildlifezoo.com', N'456 Oak Avenue, California', N'0987-654-321', NULL, N'/avatars/staff1.jpg')
INSERT [dbo].[User] ([id], [account_id], [email], [address], [phoneNumber], [gender], [avartar_url]) VALUES (3, 3, N'emma@wildlifezoo.com', N'789 Pine Road, Texas', N'0555-123-456', NULL, N'/avatars/manager1.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[ZooArea] ON 

INSERT [dbo].[ZooArea] ([id], [name], [description], [status]) VALUES (1, N'African Savanna', N'Exhibit for đ?ng v?t châu Phi như sư t?, ng?a v?n.', N'Active')
INSERT [dbo].[ZooArea] ([id], [name], [description], [status]) VALUES (2, N'Tropical Rainforest', N'Exhibit for h?, voi, và g?u trúc.', N'Active')
INSERT [dbo].[ZooArea] ([id], [name], [description], [status]) VALUES (3, N'Aquatic Pavilion', N'Exhibit for sinh v?t bi?n như cá heo, rùa bi?n.', N'Inactive')
SET IDENTITY_INSERT [dbo].[ZooArea] OFF
GO
ALTER TABLE [dbo].[AbsentTime]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD FOREIGN KEY([animal_type_id])
REFERENCES [dbo].[AnimalType] ([id])
GO
ALTER TABLE [dbo].[Individual]  WITH CHECK ADD FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[Flock]  WITH CHECK ADD FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[AnimalCage]  WITH CHECK ADD FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[AnimalCage]  WITH CHECK ADD FOREIGN KEY([cage_id])
REFERENCES [dbo].[Cage] ([id])
GO
ALTER TABLE [dbo].[AnimalIncidentHistory]  WITH CHECK ADD FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[AnimalUpdateHistory]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[AnimalUpdateHistory]  WITH CHECK ADD FOREIGN KEY([animal_id])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([application_type_id])
REFERENCES [dbo].[ApplicationType] ([id])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([reciever_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Cage]  WITH CHECK ADD FOREIGN KEY([zoo_area_id])
REFERENCES [dbo].[ZooArea] ([id])
GO
ALTER TABLE [dbo].[CageUpdateHistory]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[CageUpdateHistory]  WITH CHECK ADD FOREIGN KEY([cage_id])
REFERENCES [dbo].[Cage] ([id])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([leader_id])
REFERENCES [dbo].[LeaderAssign] ([id])
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD FOREIGN KEY([member_id])
REFERENCES [dbo].[MemberAssign] ([id])
GO
ALTER TABLE [dbo].[LeaderAssign]  WITH CHECK ADD FOREIGN KEY([leader_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[LeaderAssign]  WITH CHECK ADD FOREIGN KEY([team_id])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[MemberAssign]  WITH CHECK ADD FOREIGN KEY([member_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[MemberAssign]  WITH CHECK ADD FOREIGN KEY([team_id])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([receiver_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([sender_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ReportAttachment]  WITH CHECK ADD FOREIGN KEY([report_id])
REFERENCES [dbo].[Report] ([id])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([schedule_id])
REFERENCES [dbo].[Schedule] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD FOREIGN KEY([zoo_area_id])
REFERENCES [dbo].[ZooArea] ([id])
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([task_type_id])
REFERENCES [dbo].[TaskType] ([id])
GO
ALTER TABLE [dbo].[AnimalAssign]  WITH CHECK ADD FOREIGN KEY([task_id])
REFERENCES [dbo].[Task] ([id])
GO
ALTER TABLE [dbo].[AnimalAssign]  WITH CHECK ADD FOREIGN KEY([animal_cage_id])
REFERENCES [dbo].[AnimalCage] ([id])
GO
ALTER TABLE [dbo].[TaskEstimate]  WITH CHECK ADD FOREIGN KEY([task_type_id])
REFERENCES [dbo].[TaskType] ([id])
GO
ALTER TABLE [dbo].[TaskEstimate]  WITH CHECK ADD FOREIGN KEY([animal_type_id])
REFERENCES [dbo].[AnimalType] ([id])
GO
USE [master]
GO
ALTER DATABASE [Zoo_Management_And_Staff_Operations_System] SET  READ_WRITE 
GO

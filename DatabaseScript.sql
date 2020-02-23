USE [master]
GO
/****** Object:  Database [Patients]    Script Date: 2019-12-06 2:47:21 PM ******/
DROP DATABASE IF EXISTS [Patients]
CREATE DATABASE [Patients]
--- CONTAINMENT = NONE
--- ON  PRIMARY 
---( NAME = N'Patients', FILENAME = N'C:\Users\saiva\Patients.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
--- LOG ON 
---( NAME = N'Patients_log', FILENAME = N'C:\Users\saiva\Patients_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Patients] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Patients].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Patients] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Patients] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Patients] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Patients] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Patients] SET ARITHABORT OFF 
GO
ALTER DATABASE [Patients] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Patients] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Patients] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Patients] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Patients] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Patients] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Patients] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Patients] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Patients] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Patients] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Patients] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Patients] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Patients] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Patients] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Patients] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Patients] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Patients] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Patients] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Patients] SET  MULTI_USER 
GO
ALTER DATABASE [Patients] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Patients] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Patients] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Patients] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Patients] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Patients] SET QUERY_STORE = OFF
GO
USE [Patients]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Patients]
GO
/****** Object:  User [users]    Script Date: 2019-12-06 2:47:21 PM ******/
CREATE USER [users] FOR LOGIN [BUILTIN\Users]
GO
/****** Object:  User [patientSQL]    Script Date: 2019-12-06 2:47:21 PM ******/
CREATE USER [patientSQL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [users]
GO
ALTER ROLE [db_owner] ADD MEMBER [patientSQL]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2019-12-06 2:47:21 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[concentrationUnit]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[concentrationUnit](
	[concentrationCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_concentrationUnit] PRIMARY KEY CLUSTERED 
(
	[concentrationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[postalPattern] [varchar](120) NULL,
	[phonePattern] [varchar](50) NULL,
	[federalSalesTax] [float] NOT NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diagnosis]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosis](
	[diagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[diagnosisCategoryId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[diagnosisCategory]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosisCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dispensingUnit]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dispensingUnit](
	[dispensingCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dispensingUnit] PRIMARY KEY CLUSTERED 
(
	[dispensingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medication]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication](
	[din] [varchar](8) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[image] [varchar](50) NULL,
	[medicationTypeId] [int] NOT NULL,
	[dispensingCode] [varchar](50) NOT NULL,
	[concentration] [float] NOT NULL,
	[concentrationCode] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medicationType]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicationType](
	[medicationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_medicationType] PRIMARY KEY CLUSTERED 
(
	[medicationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patientId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[provinceCode] [char](2) NULL,
	[postalCode] [varchar](10) NULL,
	[OHIP] [varchar](50) NULL,
	[dateOfBirth] [datetime] NULL,
	[deceased] [bit] NOT NULL,
	[dateOfDeath] [datetime] NULL,
	[homePhone] [varchar](50) NULL,
	[gender] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patientDiagnosis]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientDiagnosis](
	[patientDiagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NOT NULL,
	[diagnosisId] [int] NOT NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_patientDiagnosis] PRIMARY KEY CLUSTERED 
(
	[patientDiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patientMedication]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientMedication](
	[patientMedicationId] [int] IDENTITY(1,1) NOT NULL,
	[patientTreatmentId] [int] NOT NULL,
	[din] [varchar](8) NOT NULL,
	[dose] [float] NULL,
	[frequency] [int] NULL,
	[frequencyPeriod] [varchar](50) NULL,
	[exactMinMax] [varchar](50) NULL,
	[comments] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patientTreatment]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientTreatment](
	[patientTreatmentId] [int] IDENTITY(1,1) NOT NULL,
	[treatmentId] [int] NOT NULL,
	[datePrescribed] [datetime] NOT NULL,
	[comments] [varchar](max) NULL,
	[patientDiagnosisId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[countryCode] [char](2) NOT NULL,
	[salesTaxCode] [varchar](50) NOT NULL,
	[salesTax] [float] NOT NULL,
	[includesFederalTax] [bit] NOT NULL,
	[firstPostalLetter] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatment]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment](
	[treatmentId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[diagnosisId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[treatmentMedication]    Script Date: 2019-12-06 2:47:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatmentMedication](
	[treatmentId] [int] NOT NULL,
	[din] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'2.1.11-servicing-32099')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3df213f8-3a69-4e91-9296-feca67cf1bb6', N'Administrators', N'ADMINISTRATORS', N'e8cd57f6-f535-4427-8ed2-4ea4d1b2a90d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6d89112a-dfe4-4d80-a06c-a201c67160af', N'Medical Staff', N'MEDICAL STAFF', N'41d53fa4-9075-4677-b2e6-282bb68d96f7')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'80839aaa-1aaa-450c-949e-51a967b74416', N'Members', N'MEMBERS', N'9fa50947-18c2-463f-8c3b-ea5d3ea1a00f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a95fe148-13c8-44e9-932a-2b7d5e66d49d', N'3df213f8-3a69-4e91-9296-feca67cf1bb6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4119e304-e024-416c-8f5a-4142bfe84fbb', N'6d89112a-dfe4-4d80-a06c-a201c67160af')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a95fe148-13c8-44e9-932a-2b7d5e66d49d', N'6d89112a-dfe4-4d80-a06c-a201c67160af')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4119e304-e024-416c-8f5a-4142bfe84fbb', N'80839aaa-1aaa-450c-949e-51a967b74416')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8ed570f4-bf45-46d2-9e26-ca7450a26510', N'80839aaa-1aaa-450c-949e-51a967b74416')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a95fe148-13c8-44e9-932a-2b7d5e66d49d', N'80839aaa-1aaa-450c-949e-51a967b74416')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4119e304-e024-416c-8f5a-4142bfe84fbb', N'mary@fred.com', N'MARY@FRED.COM', N'mary@fred.com', N'MARY@FRED.COM', 0, N'AQAAAAEAACcQAAAAEF46/hVDwxsZXtwWcvAR07S2DarDP1Q8VDNtzvRfT67hJBS52Vj8eKPvlABSITG+AA==', N'IYFKSNPHJF274OUKL2QZ5FSCM346FBGA', N'cc0c1d87-41b8-4b13-902e-82561132f8c2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'850ff804-896f-44e6-a076-904365748056', N'gord@fred.com', N'GORD@FRED.COM', N'gord@fred.com', N'GORD@FRED.COM', 0, N'AQAAAAEAACcQAAAAEHehtjfXNyEI9CDN74+BdeNzwjUnwsqS86ipwbwmjPbehvh8ZupdK+ILCUQl2lcD6Q==', N'PEQPBEFGJTKKVMSU3MOX5NWTNLXJ6JC2', N'a6e5e493-9cae-4e90-9ac9-5379c9c37a07', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8ed570f4-bf45-46d2-9e26-ca7450a26510', N'julie@fred.com', N'JULIE@FRED.COM', N'julie@fred.com', N'JULIE@FRED.COM', 0, N'AQAAAAEAACcQAAAAEA5hcNwqLegftbPzAPE1JFf9J60f46y7fHwRnuP1d0rQVZNyg0GrnoLbAxtcPdifzg==', N'UNZN4XDH5PQJHZZFM5LMY2DMTDJLLJIE', N'9e418957-0500-4d1e-8c4a-36b505ac5030', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a95fe148-13c8-44e9-932a-2b7d5e66d49d', N'fred@fred.com', N'FRED@FRED.COM', N'fred@fred.com', N'FRED@FRED.COM', 0, N'AQAAAAEAACcQAAAAEE6ezkagQN//0HKdWp5xGhdLbK2HxVzpoiuuVWqDH3K8UP6ippEhWfMB2sxITBKZgQ==', N'MTBL6RURUSGAWJLSSY4DXYTJGMPEZBXE', N'5c08bc56-8411-4665-8716-df77dfe9d876', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'%')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'cc')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'D234')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'D235')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'mcg')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'mg')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'n/a')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'UI')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax]) VALUES (N'CA', N'Canada', N'[A-Za-z]\\d[A-Za-z][ -]?\\d[A-Za-z]\\d', N'\([0-9]{3}\)[0-9]{3}-[0-9]{4}', 13)
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax]) VALUES (N'IN', N'India', N'^[1-9][0-9]{5}$', N'^[6-9]\d{9}$', 18)
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern], [federalSalesTax]) VALUES (N'US', N'United States Of America', N'\d{5}(-\d{4})?', N'\(\d{3}\) \d{3}-\d{4}', 0)
SET IDENTITY_INSERT [dbo].[diagnosis] ON 

INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (1, N'eczema', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (2, N'hives', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (3, N'stenosis of left coronary artery', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (4, N'mitral valve disease', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (5, N'ventral septal defect', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (6, N'asthma', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (7, N'bronchial infection', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (8, N'pneumonia', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (9, N'varicose veins', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (10, N'stenosis of carotid artery', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (11, N'peripheral vascular disease', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (12, N'basal cell carcinoma', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (13, N'compound fracture of femur', 5)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (14, N'greenstick fracture - radius', 5)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [diagnosisCategoryId]) VALUES (15, N'fractured clavicle', 5)
SET IDENTITY_INSERT [dbo].[diagnosis] OFF
SET IDENTITY_INSERT [dbo].[diagnosisCategory] ON 

INSERT [dbo].[diagnosisCategory] ([id], [name]) VALUES (1, N'cardiovascular')
INSERT [dbo].[diagnosisCategory] ([id], [name]) VALUES (2, N'respiratory')
INSERT [dbo].[diagnosisCategory] ([id], [name]) VALUES (3, N'circulatory')
INSERT [dbo].[diagnosisCategory] ([id], [name]) VALUES (4, N'dermatology')
INSERT [dbo].[diagnosisCategory] ([id], [name]) VALUES (5, N'musculoskeletal')
SET IDENTITY_INSERT [dbo].[diagnosisCategory] OFF
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'caplets')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'doses')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'each')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'mg')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'oz')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'tablets')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'tsp')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'00178403', N'Aspirin', N'Aspirin.jpg', 1, N'tablets', 325, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'00559407', N'Tylenol', N'Tylenol.jpg', 1, N'tablets', 500, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'02017849', N'Benadryl', N'benadryl.jpg', 2, N'caplets', 25, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'1', N'car', N'car', 2, N'caplets', 123, N'%')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97897898', N'suture', N'suture.jpg', 6, N'each', 0, N'n/a')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'4546', N'Asplax', N'asplax.jpg', 1, N'each', 12, N'mcg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97988768', N'Flovent HFA', N'flovent.jpg', 8, N'doses', 125, N'mcg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98748734', N'ratio-salbutamol', N'salbutamol.jpg', 8, N'doses', 100, N'mcg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98765421', N'RossValve', N'aorticValve.jpg', 10, N'each', 0, N'n/a')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98798798', N'stent, arterial', N'stent.jpg', 12, N'each', 0, N'n/a')
SET IDENTITY_INSERT [dbo].[medicationType] ON 

INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (1, N'pain relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (2, N'alergy relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (3, N'bath salts')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (4, N'itch relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (6, N'closing incisions')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (8, N'asthma relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (9, N'baths')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (10, N'heart valve')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (12, N'opening arteries')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (13, N'rash/eczema relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (14, N'blood thinning')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (15, N'anti bacterial')
SET IDENTITY_INSERT [dbo].[medicationType] OFF
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (1, N'Fred', N'Penner', N'123 Songbird Rd', N'Kitchener', NULL, N'K3K 5M3', NULL, CAST(N'1945-03-04T00:00:00.000' AS DateTime), 1, CAST(N'1999-06-12T00:00:00.000' AS DateTime), N'519-654-7894', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (3, N'John', N'Doe', N'232 King St N', N'Waterloo', NULL, N'N2H 3K5', NULL, CAST(N'1997-02-12T00:00:00.000' AS DateTime), 0, NULL, N'456-456-4566', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (29, N'Varun', N'Bandari', N'131 University Ave W', N'Waterloo', NULL, N'N2H 3K5', NULL, CAST(N'1999-12-01T15:04:00.000' AS DateTime), 0, NULL, N'999-999-9999', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (5, N'Mary', N'Miller', N'78 Kingsway Court', N'Kitcheneer', NULL, N'K6K 3L3', N'0980980980UP', CAST(N'1998-02-23T00:00:00.000' AS DateTime), 0, NULL, N'519-564-8971', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (6, N'Teddy', N'Popping', N'56 Middleton Rd', N'Waterloo', NULL, NULL, N'2817816545KL', CAST(N'1950-06-09T00:00:00.000' AS DateTime), 0, NULL, N'519-456-5987', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (7, N'Shania', N'Twang', N'86 Storey Lane', N'Waterloo', NULL, N'K3K 2K2', N'9898538730TF', CAST(N'1987-05-05T00:00:00.000' AS DateTime), 0, NULL, N'519-231-8546', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (8, N'Heddy', N'Lorse', N'68 Overhill Dr', N'Kitchener', NULL, N'K4K 4K4', N'6432684318YY', CAST(N'1918-04-21T00:00:00.000' AS DateTime), 0, NULL, N'519-871-3787', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (9, N'Tony', N'Arbuckle', N'78 Highland Rd', N'Kitchener', NULL, N'N2G 3G3', N'098487I763GF', CAST(N'1962-04-23T00:00:00.000' AS DateTime), 0, NULL, N'519-598-7261', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (10, N'Gloria', N'Kerblunski', N'15 Dairy Rd', N'Kitchener', NULL, N'N2G 7J8', N'8457-643-987-NM', CAST(N'1978-05-03T00:00:00.000' AS DateTime), 0, NULL, N'519-564-8915', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (11, N'Jebu', N'Yulio', N'375 Park St', N'Waterloo', NULL, N'N8E 9E9', N'8579874953GH', CAST(N'1953-03-10T00:00:00.000' AS DateTime), 0, NULL, N'519-897-9561', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (12, N'Eisen', N'Stroman', N'25 Elm St', N'Cambridge', NULL, N'L2K 4L4', N'2323-903-255-LM', CAST(N'1949-11-22T00:00:00.000' AS DateTime), 0, NULL, N'519-876-5423', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (13, N'Donna', N'Koragasu', N'65 Windy Lane', N'Waterloo', NULL, N'L8K 3W3', N'2898-978-978-KL', CAST(N'1979-01-21T00:00:00.000' AS DateTime), 1, CAST(N'2004-09-11T00:00:00.000' AS DateTime), N'519-876-5413', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (14, N'Tayo', N'Izanami', N'89 Kami Crt.', N'Kitchener', NULL, N'N4L 3E1', N'8973987240FG', CAST(N'1967-07-21T00:00:00.000' AS DateTime), 0, NULL, N'519-784-5456', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (15, N'Jewel', N'Weber', N'56 Weber St', N'Kitchener', NULL, NULL, N'8728934875TR', CAST(N'1973-02-27T00:00:00.000' AS DateTime), 0, NULL, N'519-876-5463', N'F')
SET IDENTITY_INSERT [dbo].[patient] OFF
SET IDENTITY_INSERT [dbo].[patientDiagnosis] ON 

INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (1, 1, 4, N'')
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (2, 1, 4, N'')
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (3, 5, 6, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (4, 5, 3, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (5, 5, 3, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (6, 5, 5, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (7, 3, 1, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (8, 1, 2, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (9, 1, 6, N'early observations')
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (10, 1, 2, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (11, 1, 7, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (12, 1, 1, NULL)
INSERT [dbo].[patientDiagnosis] ([patientDiagnosisId], [patientId], [diagnosisId], [comments]) VALUES (13, 1, 1, N'iu')
SET IDENTITY_INSERT [dbo].[patientDiagnosis] OFF
SET IDENTITY_INSERT [dbo].[patientMedication] ON 

INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (3, 6, N'00178403', 1, 1, N'week', N'exact', NULL)
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (5, 7, N'00178403', 1, 1, N'day', N'exact', NULL)
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (6, 9, N'98798798', 1, 1, N'day', N'min', NULL)
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (7, 10, N'00178403', 1, 1, N'month', N'exact', NULL)
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (8, 11, N'97988768', 2, 0, N'week', N'exact', NULL)
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax], [comments]) VALUES (9, 11, N'98748734', 2, 0, N'day', N'exact', NULL)
SET IDENTITY_INSERT [dbo].[patientMedication] OFF
SET IDENTITY_INSERT [dbo].[patientTreatment] ON 

INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (3, 1, CAST(N'1987-09-08T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (4, 1, CAST(N'1989-10-12T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (5, 2, CAST(N'1989-10-12T00:00:00.000' AS DateTime), N'added to steriod cream', 2)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (6, 14, CAST(N'1998-02-08T00:00:00.000' AS DateTime), N'put on exercise program & blood thinners', 3)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (7, 5, CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'thinner', 4)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (8, 7, CAST(N'1999-02-09T00:00:00.000' AS DateTime), N'heavier exercise stuff', 5)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (9, 12, CAST(N'1999-04-15T00:00:00.000' AS DateTime), N'full failure of artery', 6)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (10, 11, CAST(N'1999-04-16T00:00:00.000' AS DateTime), N'heavier thinners', 6)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (11, 13, CAST(N'1990-10-08T00:00:00.000' AS DateTime), N'associated with eczema?', 7)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (27, 11, CAST(N'2019-11-08T13:41:09.000' AS DateTime), N'nerve blockage', 6)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (29, 12, CAST(N'2019-11-08T22:42:19.000' AS DateTime), N'strong', 6)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [treatmentId], [datePrescribed], [comments], [patientDiagnosisId]) VALUES (28, 6, CAST(N'2019-11-08T22:34:08.000' AS DateTime), N'left articular vein ', 5)
SET IDENTITY_INSERT [dbo].[patientTreatment] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MI', N'Michigan', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NY', N'New York', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'KY', N'Kentucky', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CA', N'California', N'US', N'state tax', 0.0725, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ME', N'Maine', N'US', N'state tax', 0.055, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NJ', N'New Jersey', N'US', N'state tax', 0.06625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CT', N'Connecticut', N'US', N'state tax', 0.0635, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'PA', N'Pennsylvania', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'FL', N'Forida', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AZ', N'Arizona', N'US', N'state tax', 0.056, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'GA', N'Georgia', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'DC', N'District of Columbia', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WA', N'Washington', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'TX', N'Texas', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WV', N'West Virginia', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AK', N'Alaska', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'AR', N'Arkansas', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'CO', N'Colorado', N'US', N'state tax', 0.029, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'DE', N'Delaware', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'HI', N'Hawaii', N'US', N'state tax', 0.04, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ID', N'Idaho', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IL', N'Illinois', N'US', N'state tax', 0.0625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IN', N'Indiana', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'IA', N'Iowa', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'KA', N'Kansas', N'US', N'state tax', 0.065, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'LA', N'Louisiana', N'US', N'state tax', 0.0445, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MD', N'MaryLand', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MA', N'Massachusetts', N'US', N'state tax', 0.0625, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MN', N'Minnesota', N'US', N'state tax', 0.06875, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MS', N'Mississippi', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MO', N'Missouri', N'US', N'state tax', 0.04225, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'MT', N'Montana', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NE', N'Nebraska', N'US', N'state tax', 0.055, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NV', N'Nevada', N'US', N'state tax', 0.0685, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NH', N'New Hampshire', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NM', N'New Mexico', N'US', N'state tax', 0.05125, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'NC', N'North Carolina', N'US', N'state tax', 0.0475, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'ND', N'North Dakota', N'US', N'state tax', 0.05, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OH', N'Ohio', N'US', N'state tax', 0.0575, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OK', N'Oklahoma', N'US', N'state tax', 0.045, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'OR', N'Oregon', N'US', N'state tax', 0, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'PR', N'Puerto Rico', N'US', N'state tax', 0.115, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'RI', N'Rhode Island', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'SC', N'South Carolina', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'SD', N'South Dakota', N'US', N'state tax', 0.045, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'TN', N'Tennessee', N'US', N'state tax', 0.07, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'UT', N'Utah', N'US', N'state tax', 0.0485, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'VT', N'Vermont', N'US', N'state tax', 0.06, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'VA', N'Virginia', N'US', N'state tax', 0.043, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WI', N'Wisconsin', N'US', N'state tax', 0.05, 1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [salesTaxCode], [salesTax], [includesFederalTax], [firstPostalLetter]) VALUES (N'WY', N'Wyoming', N'US', N'state tax', 0.04, 1, NULL)
SET IDENTITY_INSERT [dbo].[treatment] ON 

INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (1, N'steroid cream', N'topical use, initialliy 0.10, max concentration', 1)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (2, N'baths', N'oatmeal-based soaps and baths salts, usually every other day', 1)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (3, N'antihistamine', N'oral or topical', 2)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (4, N'calamine lotion', N'topical to affected area', 2)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (5, N'insertion of stent', N'insert through catheter from femoral/brachial artery, dilate at site', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (6, N'artery replacement', N'open-heart surgery', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (7, N'lifestyle changes, medication', N'aspirin & blood thinners', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (8, N'valve replacement', N'open heart surgery: mechanical or biological valve', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (9, N'antibiotics', N'penicillin', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (10, N'anticlotting medication', N'aspirin  blood thinners', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (11, N'suturing', N'suturing the opening between the left & right ventricles', 5)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (12, N'patch', N'suturing a patch over opening', 5)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (13, N'inhaler: dilator', N'salbutamol to dilate broncial', 6)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (14, N'inhaler: steriod', N'flovent to strengthen alveoli & reduce inflamation', 6)
SET IDENTITY_INSERT [dbo].[treatment] OFF
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (3, N'02017849')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (5, N'00559407')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (5, N'98798798')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (7, N'00178403')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (7, N'00559407')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (8, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (8, N'98765421')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (10, N'00178403')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (11, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (12, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (13, N'98748734')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (14, N'97988768')
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaadiagnosis_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[diagnosis] ADD  CONSTRAINT [aaaaadiagnosis_PK] PRIMARY KEY NONCLUSTERED 
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ailmentId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [ailmentId] ON [dbo].[diagnosis]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [categorydiagnosis]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [categorydiagnosis] ON [dbo].[diagnosis]
(
	[diagnosisCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diseasecategoryId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [diseasecategoryId] ON [dbo].[diagnosis]
(
	[diagnosisCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaacategory_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[diagnosisCategory] ADD  CONSTRAINT [aaaaacategory_PK] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [categoryId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [categoryId] ON [dbo].[diagnosisCategory]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aaaaamedication_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[medication] ADD  CONSTRAINT [aaaaamedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatient_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [aaaaapatient_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [homePhone]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [homePhone] ON [dbo].[patient]
(
	[homePhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [patientId] ON [dbo].[patient]
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [postalCode]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [postalCode] ON [dbo].[patient]
(
	[postalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [provinceCode]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [provinceCode] ON [dbo].[patient]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [provincepatient]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [provincepatient] ON [dbo].[patient]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatientMedication_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [aaaaapatientMedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientMedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [medicationpatientMedication]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [medicationpatientMedication] ON [dbo].[patientMedication]
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientTreatmentpatientMedication]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [patientTreatmentpatientMedication] ON [dbo].[patientMedication]
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatientTreatment_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[patientTreatment] ADD  CONSTRAINT [aaaaapatientTreatment_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientProcedureId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [patientProcedureId] ON [dbo].[patientTreatment]
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedureId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [procedureId] ON [dbo].[patientTreatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedurepatientProcedure]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [procedurepatientProcedure] ON [dbo].[patientTreatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aaaaaprovince_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [aaaaaprovince_PK] PRIMARY KEY NONCLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ProvinceCode]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [ProvinceCode] ON [dbo].[province]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaatreatment_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[treatment] ADD  CONSTRAINT [aaaaatreatment_PK] PRIMARY KEY NONCLUSTERED 
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diagnosisId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [diagnosisId] ON [dbo].[treatment]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diagnosisprocedure]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [diagnosisprocedure] ON [dbo].[treatment]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedureId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [procedureId] ON [dbo].[treatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aaaaatreatmentMedication_PK]    Script Date: 2019-12-06 2:47:22 PM ******/
ALTER TABLE [dbo].[treatmentMedication] ADD  CONSTRAINT [aaaaatreatmentMedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[treatmentId] ASC,
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [medicationtreatmentMedication]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [medicationtreatmentMedication] ON [dbo].[treatmentMedication]
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [treatmentId]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [treatmentId] ON [dbo].[treatmentMedication]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [treatmenttreatmentMedication]    Script Date: 2019-12-06 2:47:22 PM ******/
CREATE NONCLUSTERED INDEX [treatmenttreatmentMedication] ON [dbo].[treatmentMedication]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[country] ADD  CONSTRAINT [DF_country_federalSalesTax]  DEFAULT ((0)) FOR [federalSalesTax]
GO
ALTER TABLE [dbo].[diagnosis] ADD  CONSTRAINT [DF__diagnosis__categ__1ED998B2]  DEFAULT ((0)) FOR [diagnosisCategoryId]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMe__patie__0F975522]  DEFAULT ((0)) FOR [patientTreatmentId]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMed__dose__108B795B]  DEFAULT ((0)) FOR [dose]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMe__frequ__117F9D94]  DEFAULT ((0)) FOR [frequency]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF_patientMedication_exactMinMax]  DEFAULT (N'exact') FOR [exactMinMax]
GO
ALTER TABLE [dbo].[patientTreatment] ADD  CONSTRAINT [DF__patientTr__treat__0AD2A005]  DEFAULT ((0)) FOR [treatmentId]
GO
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [DF_province_salesTax]  DEFAULT ((0)) FOR [salesTax]
GO
ALTER TABLE [dbo].[treatment] ADD  CONSTRAINT [DF__treatment__diagn__014935CB]  DEFAULT ((0)) FOR [diagnosisId]
GO
ALTER TABLE [dbo].[treatmentMedication] ADD  CONSTRAINT [DF__treatment__treat__7C8480AE]  DEFAULT ((0)) FOR [treatmentId]
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
ALTER TABLE [dbo].[diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_diagnosis_diagnosisCategory] FOREIGN KEY([diagnosisCategoryId])
REFERENCES [dbo].[diagnosisCategory] ([id])
GO
ALTER TABLE [dbo].[diagnosis] CHECK CONSTRAINT [FK_diagnosis_diagnosisCategory]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_concentrationUnit] FOREIGN KEY([concentrationCode])
REFERENCES [dbo].[concentrationUnit] ([concentrationCode])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_concentrationUnit]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_dispensingUnit] FOREIGN KEY([dispensingCode])
REFERENCES [dbo].[dispensingUnit] ([dispensingCode])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_dispensingUnit]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_medicationType] FOREIGN KEY([medicationTypeId])
REFERENCES [dbo].[medicationType] ([medicationTypeId])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_medicationType]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_province] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_province]
GO
ALTER TABLE [dbo].[patientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_patientDiagnosis_diagnosis] FOREIGN KEY([diagnosisId])
REFERENCES [dbo].[diagnosis] ([diagnosisId])
GO
ALTER TABLE [dbo].[patientDiagnosis] CHECK CONSTRAINT [FK_patientDiagnosis_diagnosis]
GO
ALTER TABLE [dbo].[patientDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_patientDiagnosis_patient] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([patientId])
GO
ALTER TABLE [dbo].[patientDiagnosis] CHECK CONSTRAINT [FK_patientDiagnosis_patient]
GO
ALTER TABLE [dbo].[patientMedication]  WITH CHECK ADD  CONSTRAINT [FK_patientMedication_medication] FOREIGN KEY([din])
REFERENCES [dbo].[medication] ([din])
GO
ALTER TABLE [dbo].[patientMedication] CHECK CONSTRAINT [FK_patientMedication_medication]
GO
ALTER TABLE [dbo].[patientMedication]  WITH CHECK ADD  CONSTRAINT [FK_patientMedication_patientTreatment] FOREIGN KEY([patientTreatmentId])
REFERENCES [dbo].[patientTreatment] ([patientTreatmentId])
GO
ALTER TABLE [dbo].[patientMedication] CHECK CONSTRAINT [FK_patientMedication_patientTreatment]
GO
ALTER TABLE [dbo].[patientTreatment]  WITH CHECK ADD  CONSTRAINT [FK_patientTreatment_patientDiagnosis] FOREIGN KEY([patientDiagnosisId])
REFERENCES [dbo].[patientDiagnosis] ([patientDiagnosisId])
GO
ALTER TABLE [dbo].[patientTreatment] CHECK CONSTRAINT [FK_patientTreatment_patientDiagnosis]
GO
ALTER TABLE [dbo].[patientTreatment]  WITH CHECK ADD  CONSTRAINT [patientTreatment_FK01] FOREIGN KEY([treatmentId])
REFERENCES [dbo].[treatment] ([treatmentId])
GO
ALTER TABLE [dbo].[patientTreatment] CHECK CONSTRAINT [patientTreatment_FK01]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
ALTER TABLE [dbo].[treatment]  WITH CHECK ADD  CONSTRAINT [FK_treatment_diagnosis] FOREIGN KEY([diagnosisId])
REFERENCES [dbo].[diagnosis] ([diagnosisId])
GO
ALTER TABLE [dbo].[treatment] CHECK CONSTRAINT [FK_treatment_diagnosis]
GO
ALTER TABLE [dbo].[treatmentMedication]  WITH CHECK ADD  CONSTRAINT [FK_treatmentMedication_medication] FOREIGN KEY([din])
REFERENCES [dbo].[medication] ([din])
GO
ALTER TABLE [dbo].[treatmentMedication] CHECK CONSTRAINT [FK_treatmentMedication_medication]
GO
ALTER TABLE [dbo].[treatmentMedication]  WITH CHECK ADD  CONSTRAINT [FK_treatmentMedication_treatment] FOREIGN KEY([treatmentId])
REFERENCES [dbo].[treatment] ([treatmentId])
GO
ALTER TABLE [dbo].[treatmentMedication] CHECK CONSTRAINT [FK_treatmentMedication_treatment]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character short form for country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'countryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formal name of country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate the postal or zip code for this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'postalPattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate a phone number in this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'phonePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'list of countries and data pertinent to them' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'??I?????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2805' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'medical name for ailment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'?L??????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to major categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:41:56 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05/01/2007 4:51:33 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key, allowing category to be renamed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1605' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'major medical categories: cardiology, respiratory, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:39:53 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:22:41 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosisCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8-digit drug identification number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_InputMask', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'name of drug as branded by manufacturer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'brandName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'brandName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'file-name of product image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1890' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'«???????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'type of drug ... anticoagulant, antihistimine, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dispensing units: pills, capsils, mg, tablespoons, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'concentration quantity, n concentration units, zero if n/a' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'concentration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'concentration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/05/2007 1:34:43 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/06/2007 4:31:38 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random patient number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'patient''s first or given name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'firstName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'firstName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'É???????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'patient''s surname or family name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'lastName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'lastName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'street address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character province code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'postal code: A9A 9A9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'postalCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'postalCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'12-character provincial medical' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OHIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OHIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date of birth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dateOfBirth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dateOfBirth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if yes, date of death required else, ignore date of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'deceased' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'deceased' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date of death (null if alive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dateOfDeath' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dateOfDeath' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10-digit home phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'homePhone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'homePhone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M or F' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'gendre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'gendre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:37:11 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/07/2008 11:02:39 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to the procedure for this patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to medication by drug identification number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'number of dispensing units at a time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'number of doses per day/week/month; zero if as-required' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'frequency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'frequency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'period of frequency: per day, week, month or as-required' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequencyPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dosage frequency is exactly x periods, minimum of, or maximum of' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'exactMinMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 3:21:50 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:13:47 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key for treatment on this patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date treatment prescribed to patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'datePrescribed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'datePrescribed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2400' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'general free-form comments about treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:53:09 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:13:47 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''treatment'' and ''patientTreatment''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'CONSTRAINT',@level2name=N'patientTreatment_FK01'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character province code ... ON, BC, etc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2820' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'full province name ... Ontario, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'12/01/2007 8:47:41 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/07/2008 11:05:46 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2640' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formal name of the procedure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3585' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free-form decription of the procedure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'915' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 11:22:02 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:18:56 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to treatment this record is for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to medication for this treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29/05/2007 1:18:23 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:19:00 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
USE [master]
GO
ALTER DATABASE [Patients] SET  READ_WRITE 
GO

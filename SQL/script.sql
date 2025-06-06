USE [master]
GO
/****** Object:  Database [EvalLLM]    Script Date: 6/1/2025 8:16:01 PM ******/
CREATE DATABASE [EvalLLM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EvalLLM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\EvalLLM.mdf' , SIZE = 4923392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EvalLLM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2022\MSSQL\DATA\EvalLLM_log.ldf' , SIZE = 991232KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EvalLLM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EvalLLM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EvalLLM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EvalLLM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EvalLLM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EvalLLM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EvalLLM] SET ARITHABORT OFF 
GO
ALTER DATABASE [EvalLLM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EvalLLM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EvalLLM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EvalLLM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EvalLLM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EvalLLM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EvalLLM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EvalLLM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EvalLLM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EvalLLM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EvalLLM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EvalLLM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EvalLLM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EvalLLM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EvalLLM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EvalLLM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EvalLLM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EvalLLM] SET RECOVERY FULL 
GO
ALTER DATABASE [EvalLLM] SET  MULTI_USER 
GO
ALTER DATABASE [EvalLLM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EvalLLM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EvalLLM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EvalLLM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EvalLLM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EvalLLM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EvalLLM', N'ON'
GO
ALTER DATABASE [EvalLLM] SET QUERY_STORE = ON
GO
ALTER DATABASE [EvalLLM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EvalLLM]
GO
/****** Object:  Table [dbo].[DimBenchmark]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimBenchmark](
	[benchmark_id] [int] IDENTITY(1,1) NOT NULL,
	[benchmark_name] [nvarchar](100) NULL,
	[benchmark_description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[benchmark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[date_id] [int] NOT NULL,
	[full_date] [date] NULL,
	[day] [int] NULL,
	[month] [int] NULL,
	[month_name] [nvarchar](20) NULL,
	[day_name] [nvarchar](20) NULL,
	[year] [int] NULL,
	[quarter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimModel]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimModel](
	[model_id] [int] IDENTITY(1,1) NOT NULL,
	[model_name] [nvarchar](255) NULL,
	[model_sha] [nvarchar](255) NULL,
	[model_precision] [nvarchar](100) NULL,
	[model_type] [nvarchar](100) NULL,
	[model_weight_type] [nvarchar](100) NULL,
	[model_architecture] [nvarchar](255) NULL,
	[model_has_chat_template] [bit] NULL,
	[metadata_base_model] [nvarchar](255) NULL,
	[metadata_generation] [nvarchar](50) NULL,
	[metadata_hub_license] [nvarchar](100) NULL,
	[metadata_params_billions] [float] NULL,
	[features_is_not_available_on_hub] [bit] NULL,
	[features_is_merged] [bit] NULL,
	[features_is_moe] [bit] NULL,
	[features_is_flagged] [bit] NULL,
	[features_is_official_provider] [bit] NULL,
	[metadata_upload_date] [date] NULL,
	[valid_from] [date] NULL,
	[valid_to] [date] NULL,
	[is_current_version] [bit] NULL,
	[raw_model_id] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactEvaluation]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactEvaluation](
	[evaluation_id] [int] IDENTITY(1,1) NOT NULL,
	[model_id] [int] NULL,
	[benchmark_id] [int] NULL,
	[date_id] [int] NULL,
	[score_value] [float] NULL,
	[normalized_score] [float] NULL,
	[raw_model_id] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactModelSnapshot]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactModelSnapshot](
	[snapshot_id] [int] IDENTITY(1,1) NOT NULL,
	[model_id] [int] NULL,
	[date_id] [int] NULL,
	[model_average_score] [float] NULL,
	[metadata_hub_hearts] [int] NULL,
	[metadata_co2_cost] [float] NULL,
	[raw_model_id] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[snapshot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stg_raw_evalllm]    Script Date: 6/1/2025 8:16:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stg_raw_evalllm](
	[id] [nvarchar](200) NULL,
	[model_name] [nvarchar](250) NULL,
	[model_sha] [nvarchar](50) NULL,
	[model_precision] [nvarchar](50) NULL,
	[model_type] [nvarchar](50) NULL,
	[model_weight_type] [nvarchar](50) NULL,
	[model_architecture] [nvarchar](150) NULL,
	[model_average_score] [float] NULL,
	[model_has_chat_template] [bit] NULL,
	[evaluations_ifeval_name] [nvarchar](100) NULL,
	[evaluations_ifeval_value] [float] NULL,
	[evaluations_ifeval_normalized_score] [float] NULL,
	[evaluations_bbh_name] [nvarchar](100) NULL,
	[evaluations_bbh_value] [float] NULL,
	[evaluations_bbh_normalized_score] [float] NULL,
	[evaluations_math_name] [nvarchar](100) NULL,
	[evaluations_math_value] [float] NULL,
	[evaluations_math_normalized_score] [float] NULL,
	[evaluations_gpqa_name] [nvarchar](100) NULL,
	[evaluations_gpqa_value] [float] NULL,
	[evaluations_gpqa_normalized_score] [float] NULL,
	[evaluations_musr_name] [nvarchar](100) NULL,
	[evaluations_musr_value] [float] NULL,
	[evaluations_musr_normalized_score] [float] NULL,
	[evaluations_mmlu_pro_name] [nvarchar](100) NULL,
	[evaluations_mmlu_pro_value] [float] NULL,
	[evaluations_mmlu_pro_normalized_score] [float] NULL,
	[features_is_not_available_on_hub] [bit] NULL,
	[features_is_merged] [bit] NULL,
	[features_is_moe] [bit] NULL,
	[features_is_flagged] [bit] NULL,
	[features_is_official_provider] [bit] NULL,
	[metadata_upload_date] [date] NULL,
	[metadata_submission_date] [date] NULL,
	[metadata_generation] [nvarchar](50) NULL,
	[metadata_base_model] [nvarchar](150) NULL,
	[metadata_hub_license] [nvarchar](50) NULL,
	[metadata_hub_hearts] [int] NULL,
	[metadata_params_billions] [float] NULL,
	[metadata_co2_cost] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_DimModel_raw_model_id]    Script Date: 6/1/2025 8:16:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_DimModel_raw_model_id] ON [dbo].[DimModel]
(
	[raw_model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactEvaluation]  WITH CHECK ADD FOREIGN KEY([benchmark_id])
REFERENCES [dbo].[DimBenchmark] ([benchmark_id])
GO
ALTER TABLE [dbo].[FactEvaluation]  WITH CHECK ADD FOREIGN KEY([date_id])
REFERENCES [dbo].[DimDate] ([date_id])
GO
ALTER TABLE [dbo].[FactEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_FactEval_RawModel] FOREIGN KEY([raw_model_id])
REFERENCES [dbo].[DimModel] ([raw_model_id])
GO
ALTER TABLE [dbo].[FactEvaluation] CHECK CONSTRAINT [FK_FactEval_RawModel]
GO
ALTER TABLE [dbo].[FactModelSnapshot]  WITH CHECK ADD FOREIGN KEY([date_id])
REFERENCES [dbo].[DimDate] ([date_id])
GO
ALTER TABLE [dbo].[FactModelSnapshot]  WITH CHECK ADD  CONSTRAINT [FK_FactSnapshot_RawModel] FOREIGN KEY([raw_model_id])
REFERENCES [dbo].[DimModel] ([raw_model_id])
GO
ALTER TABLE [dbo].[FactModelSnapshot] CHECK CONSTRAINT [FK_FactSnapshot_RawModel]
GO
USE [master]
GO
ALTER DATABASE [EvalLLM] SET  READ_WRITE 
GO

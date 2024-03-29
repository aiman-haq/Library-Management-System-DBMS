USE [Lib]
GO
/****** Object:  Table [dbo].[Book_Issue]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Issue](
	[Book_Issue_ID] [int] NOT NULL,
	[Title_ID] [int] NOT NULL,
	[Issued_by] [int] NOT NULL,
	[Issued_to] [int] NOT NULL,
	[Title_Category_idCategory] [int] NOT NULL,
	[Issue_Date] [datetime] NULL,
	[Return_Date] [datetime] NULL,
	[Issued] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_Issue_ID] ASC,
	[Title_ID] ASC,
	[Issued_by] ASC,
	[Issued_to] ASC,
	[Title_Category_idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[Title_ID] [int] NOT NULL,
	[Category_idCategory] [int] NOT NULL,
	[ISBN] [nvarchar](50) NULL,
	[Title_Name] [varchar](50) NULL,
	[Pages] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Edition] [int] NULL,
 CONSTRAINT [PK__Title__443DAAD70A98308C] PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC,
	[Category_idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Book_quantity_remaining]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Book_quantity_remaining] as
select distinct title.Title_ID,Quantity,quantity-(select count(issued) from Book_Issue where Issued=1 and title.Title_ID=Book_Issue.Title_ID) as available_quantity
from title left join Book_Issue on Title.Title_ID = Book_Issue.Title_ID
GO
/****** Object:  Table [dbo].[Author]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Author_ID] [int] NOT NULL,
	[Full_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[idCategory] [int] NOT NULL,
	[Cat_Name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Publisher_id] [int] NOT NULL,
	[Full_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_ID] [int] NOT NULL,
	[Full_Name] [varchar](20) NOT NULL,
	[Email_Address] [varchar](20) NOT NULL,
	[Contact_no] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [int] NOT NULL,
	[Full_name] [varchar](20) NOT NULL,
	[Email_Address] [varchar](20) NOT NULL,
	[Contact_no#] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title_has_Author]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title_has_Author](
	[Title_ID] [int] NOT NULL,
	[Author_ID] [int] NOT NULL,
	[Title_Category_idCategory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC,
	[Author_ID] ASC,
	[Title_Category_idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title_has_Publisher]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title_has_Publisher](
	[Title_ID] [int] NOT NULL,
	[Publisher_id] [int] NOT NULL,
	[Title_Category_idCategory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC,
	[Publisher_id] ASC,
	[Title_Category_idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title_has_Type]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title_has_Type](
	[Title_ID] [int] NOT NULL,
	[Type_Type_id] [int] NOT NULL,
	[Title_Category_idCategory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Title_ID] ASC,
	[Type_Type_id] ASC,
	[Title_Category_idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_3]    Script Date: 6/14/2020 2:30:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_3](
	[Type_id] [int] NOT NULL,
	[Type_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (1, N'Alexandre')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (2, N'Agatha Christie')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (3, N'Andy Weir')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (4, N'Arthur Canon Doyle')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (5, N'William Shakespeare')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (6, N'J.K Rowling')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (7, N'Charles Dickens')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (8, N'Stephen King')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (9, N'Dan Brown')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (10, N'Nicholas Sparks')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (11, N'George Orwell')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (12, N'Suzanne Collins')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (13, N'Shirley Jackson')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (14, N'Gillian Flynn')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (15, N'John. W. Kimball')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (16, N'William Frey')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (17, N'Tim Soderberg')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (18, N'Swaroop C H')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (19, N'Libby Rittenberg')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (20, N'Lynn Loomis')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (21, N'Frank W.K. Firk')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (22, N'Steven James')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (23, N'Brian A. Klems')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (24, N'Kelly James Enger')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (25, N'Rashid.A')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (26, N'Angelo Pio Rossi')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (27, N'J.W. LaMoreaux')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (28, N'Danny H. Martinez')
INSERT [dbo].[Author] ([Author_ID], [Full_Name]) VALUES (29, N'Robert Wilson')
GO
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (1, 1, 2, 5, 3, CAST(N'2020-01-12T00:00:00.000' AS DateTime), CAST(N'2020-01-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (2, 3, 4, 10, 3, CAST(N'2020-03-21T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (3, 5, 1, 7, 1, CAST(N'2019-11-07T00:00:00.000' AS DateTime), CAST(N'2019-11-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (4, 7, 5, 11, 2, CAST(N'2019-09-11T00:00:00.000' AS DateTime), CAST(N'2019-09-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (5, 1, 2, 5, 3, CAST(N'2020-06-14T12:21:34.000' AS DateTime), CAST(N'2020-06-17T12:21:34.000' AS DateTime), 0)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (6, 3, 1, 10, 3, CAST(N'2020-06-10T13:43:55.000' AS DateTime), CAST(N'2020-06-25T13:43:55.000' AS DateTime), 1)
INSERT [dbo].[Book_Issue] ([Book_Issue_ID], [Title_ID], [Issued_by], [Issued_to], [Title_Category_idCategory], [Issue_Date], [Return_Date], [Issued]) VALUES (7, 7, 2, 1, 2, CAST(N'2020-05-12T13:43:55.000' AS DateTime), CAST(N'2020-05-22T13:43:55.000' AS DateTime), 0)
GO
INSERT [dbo].[Category] ([idCategory], [Cat_Name]) VALUES (1, N'Article')
INSERT [dbo].[Category] ([idCategory], [Cat_Name]) VALUES (2, N'Journal')
INSERT [dbo].[Category] ([idCategory], [Cat_Name]) VALUES (3, N'Novel')
INSERT [dbo].[Category] ([idCategory], [Cat_Name]) VALUES (4, N'Textbook')
GO
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (1, N'Maik Nauka')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (2, N'Elsevier')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (3, N'Springer')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (4, N'Stanford Law School')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (5, N'Frederick M.Lawrence')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (6, N'Bloomsbury')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (7, N'Doubleday')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (8, N'Yale University')
INSERT [dbo].[Publisher] ([Publisher_id], [Full_Name]) VALUES (10, N' Chapman & Hall')
GO
INSERT [dbo].[Staff] ([Staff_ID], [Full_Name], [Email_Address], [Contact_no]) VALUES (1, N'Yousuf Aamir', N'ya1@gmail.com', 332456778)
INSERT [dbo].[Staff] ([Staff_ID], [Full_Name], [Email_Address], [Contact_no]) VALUES (2, N'Rizwana Abbas', N'ra2@hotmail.com', 342568996)
INSERT [dbo].[Staff] ([Staff_ID], [Full_Name], [Email_Address], [Contact_no]) VALUES (3, N'Sohail Asad', N'sa3@yahoo.com', 352467795)
INSERT [dbo].[Staff] ([Staff_ID], [Full_Name], [Email_Address], [Contact_no]) VALUES (4, N'Kazim Raza', N'kr4@outlook.com', 314894679)
INSERT [dbo].[Staff] ([Staff_ID], [Full_Name], [Email_Address], [Contact_no]) VALUES (5, N'Salman Ahmed', N'sa5@gmail.com', 345689597)
GO
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (1, N'Abdullah Masood', N'am1@gmail,com', 332876453)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (2, N'Abdur Rafay', N'ar2@hotmail.com', 331789563)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (3, N'Aiman Haq', N'ah3@yahoo.com', 336780455)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (4, N'Bilal Qamar', N'bq4@gmail.com', 345679345)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (5, N'Bushra Munaf', N'bm5@outlook.com', 332787576)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (6, N'Danish Sohail', N'ds6@gmail.com', 346882924)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (7, N'Faraz Ahmad', N'fa7@yahoo.com', 321789574)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (8, N'Hamza Syed', N'hs8@gmail.com', 345768293)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (9, N'Jahanzaib Haider', N'jh9@hotmail,com', 314769655)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (10, N'Marium Munawwar', N'mm10@gmail.com', 322784759)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (11, N'Mustafa Altaf', N'ma11@yahoo.com', 321847585)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (12, N'Naveen Shariff', N'ns12@gmail.com', 322857585)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (13, N'Niha Faisal', N'nf13@hotmail.com', 334656979)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (14, N'Rehan Anwar', N'ra14@outlook.com', 346219198)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (15, N'Shiza Yameen', N'sy15@yahoo.com', 324578904)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (16, N'Umer Adam', N'ua16@gmail.com', 324679403)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (17, N'Werda Hussain', N'wh17@yahoo.com', 315487509)
INSERT [dbo].[Student] ([Student_ID], [Full_name], [Email_Address], [Contact_no#]) VALUES (18, N'Zubia Shamim', N'zs18@outlook.com', 325689957)
GO
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (1, 3, N'978-0-385-12167-5', N'The Shining', 447, 4, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (2, 3, N'978-0-553-21176-4', N'A Tale of Two Cities', 341, 6, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (3, 3, N'0-7475-3269-9', N'Harry Potter and the Philosopher''s Stone', 332, 2, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (4, 1, NULL, N'How to be a successful Ghostwriter', NULL, 7, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (5, 1, NULL, N'Are you a word nerd?', NULL, 4, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (6, 1, NULL, N'3 Secrets to great Storytelling', NULL, 10, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (7, 2, N'978-0-553-28796-4', N'Astronomy Letters', NULL, 28, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (8, 2, N'958-1-309-16485-5', N'Planetary and  Space Science', NULL, 3, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (9, 4, N'0-7475-3269-2', N'Age of Einstein', 82, 12, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (10, 2, N'1-4767-6589-8', N'Environmental Earth Sciences', NULL, 18, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (11, 2, N'467-2-466-79864-1', N'Stanford Journal of International Law', NULL, 9, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (12, 2, N'248-6-398-72845-9', N'The American Scholar', NULL, 8, NULL)
INSERT [dbo].[Title] ([Title_ID], [Category_idCategory], [ISBN], [Title_Name], [Pages], [Quantity], [Edition]) VALUES (13, 3, N'978-0-553-28339-5', N'The Shining 2', 80, 1, 80)
GO
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (1, 8, 3)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (2, 7, 3)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (3, 6, 3)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (4, 24, 1)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (5, 23, 1)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (6, 22, 1)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (7, 25, 2)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (8, 26, 2)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (9, 21, 4)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (10, 27, 2)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (11, 28, 2)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (12, 29, 2)
INSERT [dbo].[Title_has_Author] ([Title_ID], [Author_ID], [Title_Category_idCategory]) VALUES (13, 8, 3)
GO
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (1, 7, 3)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (2, 10, 3)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (3, 6, 3)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (7, 1, 2)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (8, 2, 2)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (9, 8, 4)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (10, 3, 2)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (11, 4, 2)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (12, 5, 2)
INSERT [dbo].[Title_has_Publisher] ([Title_ID], [Publisher_id], [Title_Category_idCategory]) VALUES (13, 7, 3)
GO
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (1, 24, 3)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (2, 23, 3)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (3, 22, 3)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (4, 8, 1)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (5, 7, 1)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (6, 8, 1)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (7, 13, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (8, 15, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (9, 13, 4)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (10, 10, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (10, 15, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (11, 16, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (12, 8, 2)
INSERT [dbo].[Title_has_Type] ([Title_ID], [Type_Type_id], [Title_Category_idCategory]) VALUES (13, 24, 3)
GO
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (1, N'Accounting')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (2, N'Arts')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (3, N'Biography')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (4, N'Business & Economics')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (5, N'Chemistry')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (6, N'Computer Science')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (7, N'English Language')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (8, N'English Literature')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (9, N'Finance')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (10, N'Geography')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (11, N'History')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (12, N'Mathematics')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (13, N'Physics')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (14, N'Psychology')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (15, N'Science')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (16, N'Sociology')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (17, N'Urdu')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (18, N'Zoology')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (19, N'Action and Adventure')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (20, N'Crime')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (21, N'Drama')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (22, N'Fantacy')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (23, N'Historical Fiction')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (24, N'Horror')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (25, N'Mystery')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (26, N'Romance')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (27, N'Sattire')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (28, N'Science Fiction')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (29, N'Short Story')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (30, N'Suspense')
INSERT [dbo].[Type_3] ([Type_id], [Type_name]) VALUES (31, N'Thriller')
GO
ALTER TABLE [dbo].[Book_Issue] ADD  DEFAULT ((0)) FOR [Issued]
GO
ALTER TABLE [dbo].[Book_Issue]  WITH CHECK ADD FOREIGN KEY([Issued_to])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Book_Issue]  WITH CHECK ADD FOREIGN KEY([Issued_by])
REFERENCES [dbo].[Staff] ([Staff_ID])
GO
ALTER TABLE [dbo].[Book_Issue]  WITH CHECK ADD  CONSTRAINT [FK__Book_Issue__403A8C7D] FOREIGN KEY([Title_ID], [Title_Category_idCategory])
REFERENCES [dbo].[Title] ([Title_ID], [Category_idCategory])
GO
ALTER TABLE [dbo].[Book_Issue] CHECK CONSTRAINT [FK__Book_Issue__403A8C7D]
GO
ALTER TABLE [dbo].[Title]  WITH CHECK ADD  CONSTRAINT [FK__Title__Category___48CFD27E] FOREIGN KEY([Category_idCategory])
REFERENCES [dbo].[Category] ([idCategory])
GO
ALTER TABLE [dbo].[Title] CHECK CONSTRAINT [FK__Title__Category___48CFD27E]
GO
ALTER TABLE [dbo].[Title_has_Author]  WITH CHECK ADD FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Author] ([Author_ID])
GO
ALTER TABLE [dbo].[Title_has_Author]  WITH CHECK ADD  CONSTRAINT [FK__Title_has_Author__3A81B327] FOREIGN KEY([Title_ID], [Title_Category_idCategory])
REFERENCES [dbo].[Title] ([Title_ID], [Category_idCategory])
GO
ALTER TABLE [dbo].[Title_has_Author] CHECK CONSTRAINT [FK__Title_has_Author__3A81B327]
GO
ALTER TABLE [dbo].[Title_has_Publisher]  WITH CHECK ADD FOREIGN KEY([Publisher_id])
REFERENCES [dbo].[Publisher] ([Publisher_id])
GO
ALTER TABLE [dbo].[Title_has_Publisher]  WITH CHECK ADD  CONSTRAINT [FK__Title_has_Publis__36B12243] FOREIGN KEY([Title_ID], [Title_Category_idCategory])
REFERENCES [dbo].[Title] ([Title_ID], [Category_idCategory])
GO
ALTER TABLE [dbo].[Title_has_Publisher] CHECK CONSTRAINT [FK__Title_has_Publis__36B12243]
GO
ALTER TABLE [dbo].[Title_has_Type]  WITH CHECK ADD FOREIGN KEY([Type_Type_id])
REFERENCES [dbo].[Type_3] ([Type_id])
GO
ALTER TABLE [dbo].[Title_has_Type]  WITH CHECK ADD  CONSTRAINT [FK__Title_has_Type__32E0915F] FOREIGN KEY([Title_ID], [Title_Category_idCategory])
REFERENCES [dbo].[Title] ([Title_ID], [Category_idCategory])
GO
ALTER TABLE [dbo].[Title_has_Type] CHECK CONSTRAINT [FK__Title_has_Type__32E0915F]
GO

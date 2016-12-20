
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/20/2016 14:06:43
-- Generated from EDMX file: C:\Users\Oguz\Documents\Visual Studio 2015\Projects\otel\Data\db.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserUserType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserUserType];
GO
IF OBJECT_ID(N'[dbo].[FK_PostCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostSet] DROP CONSTRAINT [FK_PostCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSetPost]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostSet] DROP CONSTRAINT [FK_UserSetPost];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSetPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_UserSetPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_AdsPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_AdsPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSetEvaluation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EvaluationSet] DROP CONSTRAINT [FK_UserSetEvaluation];
GO
IF OBJECT_ID(N'[dbo].[FK_AdsEvaluation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EvaluationSet] DROP CONSTRAINT [FK_AdsEvaluation];
GO
IF OBJECT_ID(N'[dbo].[FK_AdsAdsAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdsAccessSet] DROP CONSTRAINT [FK_AdsAdsAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSetAdsAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AdsAccessSet] DROP CONSTRAINT [FK_UserSetAdsAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_PaymentAdsAccess]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_PaymentAdsAccess];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSetCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_UserSetCart];
GO
IF OBJECT_ID(N'[dbo].[FK_AdsCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_AdsCart];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[PostSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostSet];
GO
IF OBJECT_ID(N'[dbo].[PaymentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentSet];
GO
IF OBJECT_ID(N'[dbo].[Ads]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ads];
GO
IF OBJECT_ID(N'[dbo].[EvaluationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EvaluationSet];
GO
IF OBJECT_ID(N'[dbo].[AdsAccessSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AdsAccessSet];
GO
IF OBJECT_ID(N'[dbo].[CartSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [baslik] nvarchar(max)  NOT NULL,
    [isim] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PostSet'
CREATE TABLE [dbo].[PostSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [baslik] nvarchar(max)  NOT NULL,
    [tarih] nvarchar(max)  NOT NULL,
    [icerik] nvarchar(max)  NOT NULL,
    [CategoryId] int  NOT NULL,
    [UserSetId] int  NOT NULL
);
GO

-- Creating table 'PaymentSet'
CREATE TABLE [dbo].[PaymentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserSetId] int  NOT NULL,
    [AdsId] int  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Date] datetime  NOT NULL,
    [AdsAccess_Id] int  NOT NULL
);
GO

-- Creating table 'Ads'
CREATE TABLE [dbo].[Ads] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Pay] nvarchar(max)  NOT NULL,
    [Contact] nvarchar(max)  NOT NULL,
    [Adress] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'EvaluationSet'
CREATE TABLE [dbo].[EvaluationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserSetId] int  NOT NULL,
    [AdsId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AdsAccessSet'
CREATE TABLE [dbo].[AdsAccessSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [AdsId] int  NOT NULL,
    [UserSetId] int  NOT NULL
);
GO

-- Creating table 'CartSet'
CREATE TABLE [dbo].[CartSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] int  NOT NULL,
    [Count] int  NOT NULL,
    [UserSetId] int  NOT NULL,
    [AdsId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [PK_PostSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [PK_PaymentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ads'
ALTER TABLE [dbo].[Ads]
ADD CONSTRAINT [PK_Ads]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EvaluationSet'
ALTER TABLE [dbo].[EvaluationSet]
ADD CONSTRAINT [PK_EvaluationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AdsAccessSet'
ALTER TABLE [dbo].[AdsAccessSet]
ADD CONSTRAINT [PK_AdsAccessSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [PK_CartSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserUserType]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserType'
CREATE INDEX [IX_FK_UserUserType]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [CategoryId] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [FK_PostCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PostCategory'
CREATE INDEX [IX_FK_PostCategory]
ON [dbo].[PostSet]
    ([CategoryId]);
GO

-- Creating foreign key on [UserSetId] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [FK_UserSetPost]
    FOREIGN KEY ([UserSetId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSetPost'
CREATE INDEX [IX_FK_UserSetPost]
ON [dbo].[PostSet]
    ([UserSetId]);
GO

-- Creating foreign key on [UserSetId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_UserSetPayment]
    FOREIGN KEY ([UserSetId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSetPayment'
CREATE INDEX [IX_FK_UserSetPayment]
ON [dbo].[PaymentSet]
    ([UserSetId]);
GO

-- Creating foreign key on [AdsId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_AdsPayment]
    FOREIGN KEY ([AdsId])
    REFERENCES [dbo].[Ads]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdsPayment'
CREATE INDEX [IX_FK_AdsPayment]
ON [dbo].[PaymentSet]
    ([AdsId]);
GO

-- Creating foreign key on [UserSetId] in table 'EvaluationSet'
ALTER TABLE [dbo].[EvaluationSet]
ADD CONSTRAINT [FK_UserSetEvaluation]
    FOREIGN KEY ([UserSetId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSetEvaluation'
CREATE INDEX [IX_FK_UserSetEvaluation]
ON [dbo].[EvaluationSet]
    ([UserSetId]);
GO

-- Creating foreign key on [AdsId] in table 'EvaluationSet'
ALTER TABLE [dbo].[EvaluationSet]
ADD CONSTRAINT [FK_AdsEvaluation]
    FOREIGN KEY ([AdsId])
    REFERENCES [dbo].[Ads]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdsEvaluation'
CREATE INDEX [IX_FK_AdsEvaluation]
ON [dbo].[EvaluationSet]
    ([AdsId]);
GO

-- Creating foreign key on [AdsId] in table 'AdsAccessSet'
ALTER TABLE [dbo].[AdsAccessSet]
ADD CONSTRAINT [FK_AdsAdsAccess]
    FOREIGN KEY ([AdsId])
    REFERENCES [dbo].[Ads]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdsAdsAccess'
CREATE INDEX [IX_FK_AdsAdsAccess]
ON [dbo].[AdsAccessSet]
    ([AdsId]);
GO

-- Creating foreign key on [UserSetId] in table 'AdsAccessSet'
ALTER TABLE [dbo].[AdsAccessSet]
ADD CONSTRAINT [FK_UserSetAdsAccess]
    FOREIGN KEY ([UserSetId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSetAdsAccess'
CREATE INDEX [IX_FK_UserSetAdsAccess]
ON [dbo].[AdsAccessSet]
    ([UserSetId]);
GO

-- Creating foreign key on [AdsAccess_Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_PaymentAdsAccess]
    FOREIGN KEY ([AdsAccess_Id])
    REFERENCES [dbo].[AdsAccessSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentAdsAccess'
CREATE INDEX [IX_FK_PaymentAdsAccess]
ON [dbo].[PaymentSet]
    ([AdsAccess_Id]);
GO

-- Creating foreign key on [UserSetId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_UserSetCart]
    FOREIGN KEY ([UserSetId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSetCart'
CREATE INDEX [IX_FK_UserSetCart]
ON [dbo].[CartSet]
    ([UserSetId]);
GO

-- Creating foreign key on [AdsId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_AdsCart]
    FOREIGN KEY ([AdsId])
    REFERENCES [dbo].[Ads]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdsCart'
CREATE INDEX [IX_FK_AdsCart]
ON [dbo].[CartSet]
    ([AdsId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
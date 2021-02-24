USE [master]
GO
SET NOCOUNT ON

--
-- Enable sp_configure to change advanced settings
PRINT '** Enable Show advanced options **'
EXEC sys.sp_configure N'Show advanced options', N'1'
GO
RECONFIGURE WITH OVERRIDE
GO

--
-- Enable backup compression 
PRINT '** Enable Backup Compression **';
EXEC sys.sp_configure N'backup compression default', N'1';
GO
RECONFIGURE WITH OVERRIDE;
GO

--
-- Enable optimize for ad hoc workloads.
PRINT '** Enable Optimize for Adhoc workloads';
EXEC sys.sp_configure N'optimize for ad hoc workloads', N'1';
GO
RECONFIGURE WITH OVERRIDE;
GO
--
-- Enable Agent XP
PRINT '** Enable Agent XP **';
EXEC sys.sp_configure N'Agent XPs', N'1';
RECONFIGURE WITH OVERRIDE;
GO 

-- Disable sp_configure to change advanced settings
PRINT '** Disable Advanced Options **';
EXEC sys.sp_configure N'show advanced options', N'0';
GO
RECONFIGURE WITH OVERRIDE;
GO


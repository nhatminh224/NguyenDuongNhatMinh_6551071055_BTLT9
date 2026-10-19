# Bai1_SoChiTieu

WinForms project for **QL_ChiTieu**. Target: .NET 8 Windows, SQL Server, EF Core 8.

## Setup

1. Open create-database.sql in SSMS and execute it. The script creates the database and sample rows.
2. Edit ppsettings.json connection string for your SQL Server.
3. From this folder run dotnet restore then dotnet run.
4. Scaffold EF Core Database First after creating the database:

`powershell
dotnet tool install --global dotnet-ef --version 8.0.11
dotnet ef dbcontext scaffold "YOUR_CONNECTION_STRING" Microsoft.EntityFrameworkCore.SqlServer --output-dir Models --context Context --context-dir Data --no-onconfiguring --force
`

5. Publish Framework-Dependent win-x64 with dotnet publish -c Release -r win-x64 --self-contained false; copy publish folder and edit its ppsettings.json on the target PC.

ppsettings.example.json has placeholder credentials. Keep real credentials out of source control. Logs are written beside the executable.

## Scope note

The project currently provides the Windows Forms shell, SQL connectivity check/list view and global error logging. Complete the form-specific editing and API/payment workflows against the scaffolded context as listed in the assignment; the database schema and sample data are ready.

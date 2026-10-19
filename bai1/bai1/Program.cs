using Microsoft.Extensions.Configuration;
using Serilog;
namespace SoChiTieu;
internal static class Program {
 [STAThread] static void Main() {
  ApplicationConfiguration.Initialize();
  var config = new ConfigurationBuilder().SetBasePath(AppContext.BaseDirectory).AddJsonFile("appsettings.json", false, true).Build();
  Log.Logger = new LoggerConfiguration().MinimumLevel.Information().WriteTo.File(Path.Combine(AppContext.BaseDirectory,"Logs","log-.txt"), rollingInterval: RollingInterval.Day).CreateLogger();
  Application.ThreadException += (_,e) => { Log.Error(e.Exception,"Unhandled UI error"); MessageBox.Show("Đã xảy ra lỗi, thông tin đã được ghi lại."); };
  AppDomain.CurrentDomain.UnhandledException += (_,e) => Log.Error(e.ExceptionObject as Exception,"Unhandled error");
  try { Application.Run(new MainForm(config["ConnectionStrings:Default"] ?? throw new InvalidOperationException("Thiếu connection string"))); }
  catch(Exception ex) { Log.Fatal(ex,"Startup failed"); MessageBox.Show("Không thể khởi động ứng dụng. Kiểm tra cấu hình và SQL Server."); }
  finally { Log.CloseAndFlush(); }
 }
}

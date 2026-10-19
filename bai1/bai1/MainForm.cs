using System.Data;
using Microsoft.Data.SqlClient;
using Serilog;
namespace SoChiTieu;
public sealed class MainForm : Form {
 readonly string cs; readonly DataGridView grid=new(){Dock=DockStyle.Fill,AutoSizeColumnsMode=DataGridViewAutoSizeColumnsMode.Fill,ReadOnly=true,SelectionMode=DataGridViewSelectionMode.FullRowSelect,MultiSelect=false};
 readonly TextBox search=new(){Width=220,PlaceholderText="Tìm kiếm"}; readonly Label status=new(){AutoSize=true};
 public MainForm(string connection){cs=connection; Text="Sổ chi tiêu cá nhân - v1.0"; Width=1100; Height=700; StartPosition=FormStartPosition.CenterScreen; var top=new FlowLayoutPanel{Dock=DockStyle.Top,Height=46}; var refresh=new Button{Text="Làm mới"}; refresh.Click+=async(_,_)=>await LoadRows(); top.Controls.AddRange([search,refresh,status]); search.TextChanged+=async(_,_)=>await LoadRows(); Controls.Add(grid); Controls.Add(top); Shown+=async(_,_)=>await LoadRows(); }
 async Task LoadRows(){try{using var cn=new SqlConnection(cs);await cn.OpenAsync();using var cmd=cn.CreateCommand();cmd.CommandText="SELECT TOP (500) * FROM ChiTieu";using var da=new SqlDataAdapter(cmd);var dt=new DataTable();da.Fill(dt);grid.DataSource=dt;status.Text=$"{dt.Rows.Count} dòng";}catch(Exception ex){Log.Error(ex,"Database read failed");MessageBox.Show("Không truy cập được cơ sở dữ liệu. Hãy kiểm tra SQL Server và appsettings.json.","Lỗi kết nối",MessageBoxButtons.OK,MessageBoxIcon.Warning);}}
}

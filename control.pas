unit control;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, odbcconn, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DBGrids;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    ODBCConnection1: TODBCConnection;
    Panel1: TPanel;
    SQL: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);


    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure idChange(Sender: TObject);
    procedure Panel1Click(Sender: TObject);



  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form5: TForm5;

implementation
uses
  running, kegiatan, admin, main, extend;
{$R *.lfm}

{ TForm5 }

procedure TForm5.Edit2Change(Sender: TObject);
var
  judul:String;
begin
   judul:=Edit2.Text;
  //Label1.Caption:=namamahasiswa;
  SQL.Close;
  SQL.SQL.Text:='select * from berita where judul like ''%'+judul+'%''';
  SQL.Open;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
   SQL.Close;
  SQL.SQL.Text:='select * from berita';
  SQL.Open;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
  isi:String;
  judul:String;
begin
  if (Edit2.Text<>'') or (Memo1.Text<>'') then begin
     SQL.SQL.Text:='INSERT INTO berita (judul,isi) VALUES (:judul, :isi)';
    SQL.Params.ParamByName('judul').AsString:=Edit2.Text;
    SQL.Params.ParamByName('isi').AsString:=Memo1.Text;
    SQL.ExecSQL;
    SQLTransaction1.Commit;


     ShowMessage('Query berhasil');
     //MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);




  end
  else begin
     ShowMessage('Isian tidak boleh kosong');
  end;





  Edit2.Text:='';
  Memo1.Text:='';

  SQL.Close;
  SQL.SQL.Text:='select * from berita';
  SQL.Open;

  Form1.SQLQuery2.Close;
    Form1.SQLQuery2.SQL.Text:='select * from berita order by rand()';
    Form1.SQLQuery2.Open;
    while not Form1.SQLQuery2.EOF do
    begin
         isi:=Form1.SQLQuery2.FieldByName('isi').AsString;
         judul:=Form1.SQLQuery2.FieldByName('judul').AsString;
         Form1.SQLQuery2.Next;
    end;
    Form1.Edit1.Text:=judul;
    Form1.Memo2.Caption:=isi;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin

end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
  Form5.Show;

end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Form6.Show;
  Form5.hide;
end;

procedure TForm5.BitBtn5Click(Sender: TObject);
begin
  Form7.Show;
  Form5.hide;
end;

procedure TForm5.BitBtn6Click(Sender: TObject);
begin
  Form8.Show;
  Form5.hide;
end;

procedure TForm5.Button2Click(Sender: TObject);
var
  idBer:String;
  jud:String;
  isi:String;
begin
  idBer:=DBGrid1.FirstColumn.Field.DisplayText;
  jud:=Edit2.Text;
  isi:=Memo1.Text;
  SQL.SQL.Text:='UPDATE berita SET judul= '''+jud+''', isi = '''+isi+''' where kd_berita='+idBer+'';
  //SQL.Params.ParamByName('id').AsString:=id.Text;
  //SQL.Params.ParamByName('judul').AsString:=Edit2.Text;
  //SQL.Params.ParamByName('isi').AsString:=Memo1.Text;
  SQL.ExecSQL;
  SQLTransaction1.Commit;

  if SQL.RowsAffected >0 then
  begin
     ShowMessage('Query berhasil');
     //    MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);
  end;



  Edit2.Text:='';
  Memo1.Text:='';
   SQL.Close;
  SQL.SQL.Text:='select * from berita';
  SQL.Open;


  Form1.SQLQuery2.Close;
    Form1.SQLQuery2.SQL.Text:='select * from berita order by rand() limit 0,1';
    Form1.SQLQuery2.Open;
    while not Form1.SQLQuery2.EOF do
    begin
         isi:=Form1.SQLQuery2.FieldByName('isi').AsString;
         jud:=Form1.SQLQuery2.FieldByName('judul').AsString;
         Form1.SQLQuery2.Next;
    end;
    Form1.Edit1.Text:=jud;
    Form1.Memo2.Caption:=isi;
end;

procedure TForm5.Button3Click(Sender: TObject);
var
  idBer:String;
begin
  idBer:=DBGrid1.FirstColumn.Field.DisplayText;
  SQL.SQL.Text:='DELETE FROM berita WHERE kd_berita ='+idBer+'';
  //SQL.Params.ParamByName('id').AsString:=id.Text;
  //SQL.Params.ParamByName('judul').AsString:=Edit2.Text;
  //SQL.Params.ParamByName('isi').AsString:=Memo1.Text;
  SQL.ExecSQL;
  SQLTransaction1.Commit;

  if SQL.RowsAffected > 0 then
  begin
     ShowMessage('Query berhasil');
//     MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);
  end;


  //id.Text:='';
  Edit2.Text:='';
  Memo1.Text:='';

   SQL.Close;
  SQL.SQL.Text:='select * from berita';
  SQL.Open;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  Form3.Show;
  Form5.Hide;
end;





procedure TForm5.idChange(Sender: TObject);
var
  idber:String;
begin
   idber:=DBGrid1.FirstColumn.Field.DisplayText;
  //Label1.Caption:=namamahasiswa;
  SQL.Close;
  SQL.SQL.Text:='select * from berita where kd_berita like ''%'+idber+'%''';
  SQL.Open;
end;

procedure TForm5.Panel1Click(Sender: TObject);
begin

end;







end.


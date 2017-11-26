unit admin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, odbcconn, sqldb, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons, DBGrids;

type

  { TForm8 }

  TForm8 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ODBCConnection1: TODBCConnection;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SQL: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form8: TForm8;

implementation
uses
  kegiatan, running, control, video, main;
{$R *.lfm}

{ TForm8 }

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
  if (Edit1.Text<>'') or (Edit2.Text<>'') then
  begin
      SQL.SQL.Text:='INSERT INTO admin (nama_admin,password) VALUES (:user, :pass)';
      SQL.Params.ParamByName('user').AsString:=Edit1.Text;
      SQL.Params.ParamByName('pass').AsString:=Edit2.Text;
      SQL.ExecSQL;
      SQLTransaction1.Commit;

      if SQL.RowsAffected > 0 then
      begin
         MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);
      end;



      Edit1.Text:='';
      Edit2.Text:='';


       SQL.Close;
      SQL.SQL.Text:='select * from admin';
      SQL.Open;
  end
  else begin
    ShowMessage('Form tidak boleh kosong');
  end;

end;

procedure TForm8.BitBtn2Click(Sender: TObject);
var
  idBer:String;
  jud:String;
  isi:String;
begin
   idBer:=DBGrid1.FirstColumn.Field.DisplayText;
  jud:=Edit1.Text;
  isi:=Edit2.Text;
  SQL.SQL.Text:='UPDATE admin SET nama_admin= '''+jud+''', password = '''+isi+''' where id_admin='+idBer+'';
  //SQL.Params.ParamByName('id').AsString:=id.Text;
  //SQL.Params.ParamByName('judul').AsString:=Edit2.Text;
  //SQL.Params.ParamByName('isi').AsString:=Memo1.Text;
  SQL.ExecSQL;
  SQLTransaction1.Commit;

  if SQL.RowsAffected > 0 then
  begin
     MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);
  end;



  Edit1.Text:='';
  Edit2.Text:='';
   SQL.Close;
  SQL.SQL.Text:='select * from admin';
  SQL.Open;
end;

procedure TForm8.BitBtn3Click(Sender: TObject);
begin
  Form6.Show;
  Form8.Hide;
end;

procedure TForm8.BitBtn4Click(Sender: TObject);
var
  idBer:String;
begin
     idBer:=DBGrid1.FirstColumn.Field.DisplayText;
  SQL.SQL.Text:='DELETE FROM admin WHERE id_admin ='+idBer+'';
  //SQL.Params.ParamByName('id').AsString:=id.Text;
  //SQL.Params.ParamByName('judul').AsString:=Edit2.Text;
  //SQL.Params.ParamByName('isi').AsString:=Memo1.Text;
  SQL.ExecSQL;
  SQLTransaction1.Commit;

  if SQL.RowsAffected > 0 then
  begin
     MessageDlg('Query berhasil',mtConfirmation, [mbOK], 0);
  end;


  //id.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';

   SQL.Close;
  SQL.SQL.Text:='select * from admin';
  SQL.Open;
end;

procedure TForm8.BitBtn7Click(Sender: TObject);
begin
  Form7.Show;
  Form8.hide;
end;

procedure TForm8.BitBtn8Click(Sender: TObject);
begin
  Form8.Show;

end;

procedure TForm8.BitBtn9Click(Sender: TObject);
begin
  Form9.Show;
  Form8.Hide;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
  Form3.show;
  Form8.Hide;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin

end;


end.


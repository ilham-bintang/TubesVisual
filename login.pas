unit login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, odbcconn, sqldb, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    DataSource3: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label6: TLabel;
    ODBCConnection3: TODBCConnection;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SQL: TSQLQuery;
    SQLTransaction4: TSQLTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  extend;
{$R *.lfm}

{ TForm2 }

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  uname:String;
  pass:String;
  unameA:String;
  passA:String;
  cek:Boolean;
begin
  unameA:=Edit1.Text;
  passA:=Edit2.Text;
  cek:=False;

  SQL.Close;
  SQL.SQL.Text:='select * from admin';
  SQL.Open;
    while not SQL.EOF do
    begin
         uname:=SQL.FieldByName('nama_admin').AsString;
         pass:=SQL.FieldByName('password').AsString;
         SQL.Next;
         if (unameA = uname ) and (passA = pass) then begin
            Form1.Show;
            Form2.Hide;
            cek:=True;
         end;
    end;
    if cek=false then begin
       ShowMessage('Username atau Password salah');
       Edit1.Text:='';
       Edit2.Text:='';
    end;

end;

procedure TForm2.Edit1Change(Sender: TObject);
begin

end;

procedure TForm2.Edit2Change(Sender: TObject);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.Panel1Click(Sender: TObject);
begin

end;

procedure TForm2.Panel2Click(Sender: TObject);
begin

end;

end.


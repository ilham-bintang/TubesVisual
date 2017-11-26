unit dosen;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, odbcconn, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, DBGrids, ExtCtrls, StdCtrls;

type

  { TForm10 }

  TForm10 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ODBCConnection1: TODBCConnection;
    Panel1: TPanel;
    SQL: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.lfm}

{ TForm10 }



procedure TForm10.Edit2Change(Sender: TObject);


begin
  with SQL do
  begin
    Close; // tutup query sebelumnya
    SQL.Clear; // clear query sebelumnya
    SQL.Add('Select * from dosen_staff where nama like ''%:nim%');
    Prepared;
       Params[0].AsString:=Edit2.Text; //memeriksa nim yang sama dengan yang di edit1teks ke param0 (nim di query)
    Open;
    //Edit2.Text:=Fields[1].AsString;
    Edit1.Text:=Fields[2].AsString;
    //Edit3.Text:=Fields[3].AsString;
    //Edit4.Text:=Fields[4].AsString;
    //ComboBox1.Text:=Fields[4].AsString;
  end;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin

end;

end.


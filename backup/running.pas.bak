unit running;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, odbcconn, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, DBGrids, ExtDlgs;

type

  { TForm7 }

  TForm7 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    DataSource: TDataSource;
    Edit1: TEdit;
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
    TrackBar1: TTrackBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form7: TForm7;

implementation
uses
  extend, kegiatan, admin, control, video, main;

{$R *.lfm}

{ TForm7 }


procedure TForm7.BitBtn7Click(Sender: TObject);
begin
  Form7.Show;

end;

procedure TForm7.BitBtn8Click(Sender: TObject);
begin
  Form8.Show;
  Form7.hide;
end;

procedure TForm7.BitBtn9Click(Sender: TObject);
begin
  Form9.Show;
  Form7.Hide;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  Form3.Show;
  Form7.Hide;
end;



procedure TForm7.BitBtn1Click(Sender: TObject);
var
  tulis:String;
  speed:Integer;
  speedT:String;
  idTeks:Integer;
  idTeksT:String;
begin
    tulis:=Edit1.Text;
   speed:=TrackBar1.Position*10;
   speedT:=IntToStr(speed);

   //idTeks:=1;
   //idTeksT:=IntToStr(idTeks);
   SQL.SQL.Text:='UPDATE text SET tulisan= '''+tulis+''', kec = '+speedT+' where id=1';
  SQL.ExecSQL;
  SQLTransaction1.Commit;
  ShowMessage('data berhasil di rubah');

  SQL.Close;
   SQL.SQL.Text:='select * from text where id=1';
   SQL.Open;
   tulis:=SQL.FieldByName('tulisan').AsString;
   speed:=SQL.FieldByName('kec').AsInteger;
   Form1.Label1.Caption:=tulis;
   Form1.Timer1.Interval:=speed;
  Form1.Show;
end;

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
  Form6.Show;
  Form7.hide;
end;

procedure TForm7.BitBtn3Click(Sender: TObject);
begin
  Form6.Show;
end;

procedure TForm7.BitBtn5Click(Sender: TObject);
begin

end;



end.


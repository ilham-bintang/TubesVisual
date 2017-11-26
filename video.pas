unit video;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, odbcconn, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls;

type

  { TForm9 }

  TForm9 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
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
    Label4: TLabel;
    ODBCConnection1: TODBCConnection;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SQL: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    TrackBar1: TTrackBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure TrackBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form9: TForm9;

implementation
uses
  kegiatan, running, admin, extend, main;
{$R *.lfm}

{ TForm9 }

procedure TForm9.FormCreate(Sender: TObject);
begin

end;



procedure TForm9.TrackBar1Change(Sender: TObject);
begin
  Form1.MPlayerControl1.Volume:=TrackBar1.Position;
end;

procedure TForm9.BitBtn5Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  Edit1.Text:=OpenDialog1.FileName;
end;

procedure TForm9.BitBtn6Click(Sender: TObject);
begin
  Form1.MPlayerControl1.Filename:=Edit1.Text;
  Form1.MPlayerControl1.Play;
  ShowMessage('Video Berhasil Digunakan');
  Form1.Show;
  Form1.MPlayerControl1.Play;
end;

procedure TForm9.BitBtn7Click(Sender: TObject);
begin
  Form7.Show;
  Form9.Hide;
end;

procedure TForm9.BitBtn8Click(Sender: TObject);
begin
  Form8.Show;
  Form9.Hide;
end;

procedure TForm9.BitBtn3Click(Sender: TObject);
begin
  Form6.Show;
  Form9.Hide;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
begin
  Form1.MPlayerControl1.Stop;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
  Form1.MPlayerControl1.Play;
  Form1.MPlayerControl1.Paused:=false;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
  Form1.MPlayerControl1.Paused:=true;
end;

procedure TForm9.BitBtn9Click(Sender: TObject);
begin
  Form9.Show;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
  Form3.Show;
  Form9.Hide;
end;

end.


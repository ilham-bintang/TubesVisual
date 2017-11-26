unit extend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, odbcconn, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls, ExtDlgs, Calendar, Buttons, MPlayerCtrl;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo2: TMemo;
    MPlayerControl1: TMPlayerControl;
    ODBCConnection1: TODBCConnection;
    ODBCConnection2: TODBCConnection;
    ODBCConnection3: TODBCConnection;
    ODBCConnection4: TODBCConnection;
    Panel1: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    slider: TImage;
    Memo1: TMemo;

    PanelA: TPanel;
    PanelB: TPanel;
    ImageA: TImage;
    LabelA: TLabel;


    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLQuery4: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    SQLTransaction3: TSQLTransaction;
    SQLTransaction4: TSQLTransaction;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer8: TTimer;
    Timer9: TTimer;



    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure MPlayerControl1Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel20Click(Sender: TObject);


    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);


    procedure Timer8Timer(Sender: TObject);



  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  main;

{$R *.lfm}

{ TForm1 }



procedure TForm1.Timer1Timer(Sender: TObject);
begin

  Label1.Left:=Label1.Left-3;
  if Label1.Left <(0-Label1.Width) then
  Label1.Left:=Panel20.Width;

end;



procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  form1.Close;
end;

procedure TForm1.FormActivate(Sender: TObject);


begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;



procedure TForm1.FormShow(Sender: TObject);
var
   jml: integer;
   path, par: string;
   baru: Boolean;
   tulis:String;
   speed:Integer;
   isi:String;
   judul:String;
begin
    Form3.Show;
   SQLQuery1.Close;
   SQLQuery1.SQL.Text:='select * from text where id=1';
   SQLQuery1.Open;
   tulis:=SQLQuery1.FieldByName('tulisan').AsString;
   speed:=SQLQuery1.FieldByName('kec').AsInteger;
   Label1.Caption:=tulis;
   Timer1.Interval:=speed;








    MPlayerControl1.Play;


  Panel13.Left:=0;
  Panel13.Top:=0;
  Panel14.Left:=0;
  Panel14.Top:=Panel13.Height;

  SQLQuery4.SQL.Text:='select * from dosen_staff';
  SQLQuery4.Open;
  jml:=SQLQuery4.RowsAffected-1;
  SQLQuery4.Close;

  if jml<=4 then
    Timer5.Enabled:=false
  else
    Timer5.Enabled:=true;

  repeat
    par:=IntToStr(jml);
    SQLQuery4.SQL.Text:='select * from dosen_staff limit '+par+',1';
    if 0<=jml then
    begin
        baru:=true;
        jml:=jml-1;
    end
    else
        baru:=false;

    if baru=true then
    begin
        SQLQuery4.Open;
        PanelA:=TPanel.Create(Form1);
        if Panel13.Height<Panel1.Height then
           PanelA.Parent:=Panel13
        else
           PanelA.Parent:=Panel14;
        PanelA.Height:=80;
        if PanelA.Parent=Panel13 then
           Panel13.Height:=Panel13.Height+PanelA.Height
        else if PanelA.Parent=Panel14 then
           Panel14.Height:=Panel14.Height+PanelA.Height;
        PanelA.Align:=alTop;
        if (jml mod 2)=0 then
            PanelA.Color:=clSilver
        else
            PanelA.Color:=clGradientInactiveCaption;
        PanelA.BevelInner:=bvNone;
        PanelA.BevelOuter:=bvNone;

        ImageA:=TImage.Create(Form1);
        ImageA.Parent:=PanelA;
        ImageA.Height:=70;
        ImageA.width:=58;
        ImageA.Stretch:=true;
        path:=SQLQuery4.FieldByName('gambar').AsString;
        ImageA.Picture.LoadFromFile(path);

        LabelA:=TLabel.Create(Form1);
        LabelA.Parent:=PanelA;
        LabelA.Top:=PanelA.Top+8;
        LabelA.Left:=ImageA.Left+ImageA.Width+5;
        LabelA.Caption:=SQLQuery4.FieldByName('nama').AsString;
        LabelA.Font.Name:='bebas';
        LabelA.Font.Size:=12;

        PanelB:=TPanel.Create(Form1);
        PanelB.Parent:=PanelA;
        PanelB.Left:=ImageA.Left+ImageA.Width+40;
        PanelB.Top:=LabelA.Top+LabelA.Height+5;
        PanelB.Width :=150;
        PanelB.Height:=30;
        PanelB.BevelInner:=bvNone;
        PanelB.BevelOuter:=bvNone;
        PanelB.Caption:=SQLQuery4.FieldByName('status').AsString;

        if PanelB.Caption='hadir' then
           PanelB.Color:=$00C08000
        else if PanelB.Caption='sibuk' then
           PanelB.Color:=clYellow
        else if PanelB.Caption='tidak hadir' then
           PanelB.Color:=$000000D5;
    SQLQuery4.Close;
    end;
  until baru=false ;
end;

procedure TForm1.MPlayerControl1Click(Sender: TObject);
begin
end;

procedure TForm1.Panel15Click(Sender: TObject);
begin

end;

procedure TForm1.Panel20Click(Sender: TObject);
begin

end;

procedure TForm1.Timer2Timer(Sender: TObject);
  var
  path:String;
begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Text:='select * from slideshow order by rand() limit 0,1';
  SQLQuery1.Open;
  while not SQLQuery1.EOF do
  begin
    path:=SQLQuery1.FieldByName('picture').AsString;
    SQLQuery1.Next;
  end;
  slider.Picture.LoadFromFile(path);
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
   ADate:TDateTime;
   hari:array[1..7] of String;
begin
     hari[1]:='Minggu';
     hari[2]:='Senin';
     hari[3]:='Selasa';
     hari[4]:='Rabu';
     hari[5]:='Kamis';
     hari[6]:='Jumat';
     hari[7]:='Sabtu';

     ADate:=date;
     Label3.Caption:=hari[DayOfWeek(ADate)];
     label4.Caption:=DateToStr(now);
     label5.Caption:=TimeToStr(now);
     Panel4.Caption:=hari[DayOfWeek(ADate)];

end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
   isi:String;
   judul:String;
begin
    SQLQuery2.Close;
    SQLQuery2.SQL.Text:='select * from berita order by rand()';
    SQLQuery2.Open;
    while not SQLQuery2.EOF do
    begin
         isi:=SQLQuery2.FieldByName('isi').AsString;
         judul:=SQLQuery2.FieldByName('judul').AsString;
         SQLQuery2.Next;
    end;
    Edit1.Text:=judul;
    Memo2.Caption:=isi;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
begin
  Panel13.Top:=Panel13.Top-1;
  Panel14.Top:=Panel14.Top-1;
  if Panel14.Top<0 then
    Panel13.Top:=Panel14.Top+Panel14.Height;
  if Panel13.Top<0 then
    Panel14.Top:=Panel13.Top+Panel13.Height;
end;


procedure TForm1.Timer8Timer(Sender: TObject);
var
   ADate:TDateTime;
   hari:array[1..7] of String;
   hariIni:String;
   path:String;
   h:String;
   r:String;
   n:String;
   j:String;
   k:String;
   m:String;

begin
     hari[1]:='Minggu';
     hari[2]:='Senin';
     hari[3]:='selasa';
     hari[4]:='Rabu';
     hari[5]:='Kamis';
     hari[6]:='Jumat';
     hari[7]:='Sabtu';
     hariIni:=hari[DayOfWeek(ADate)];

     SQLQuery2.Close;
     SQLQuery2.SQL.Text:='select * from jadwal natural join dosen_staff natural join mata_kuliah where hari='''+hariIni+''' order by rand() limit 0,1';
     SQLQuery2.Open;

  while not SQLQuery2.EOF do
  begin
    path:=SQLQuery2.FieldByName('gambar').AsString;
    h:=SQLQuery2.FieldByName('hari').AsString;
    r:=SQLQuery2.FieldByName('ruangan').AsString;
    n:=SQLQuery2.FieldByName('nama').AsString;
    m:=SQLQuery2.FieldByName('nama_mk').AsString;
    j:=SQLQuery2.FieldByName('jam').AsString;
    k:=SQLQuery2.FieldByName('kelas').AsString;
    SQLQuery2.Next;
  end;
  Panel4.Caption:=h;
  Label7.Caption:=r;
  Label9.Caption:=m;
  Label13.Caption:=j;
  Label23.Caption:=k;
  Image1.Picture.LoadFromFile(path);
end;



end.

unit UVD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ComCtrls, jpeg, DBCtrls;

type
  TRAVD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    GroupBox6: TGroupBox;
    BitBtn4: TBitBtn;
    GroupBox5: TGroupBox;
    BitBtn5: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Image4: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAVD: TRAVD;

implementation

uses UDM;

{$R *.dfm}





procedure TRAVD.BitBtn1Click(Sender: TObject);
begin

if Length(Trim(LabeledEdit3.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели ЦенуДобОборуд.',mtError,[mbOk],0);
    Exit     //Выход
  end;

if Length(Trim(LabeledEdit4.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели № Двигателя.',mtError,[mbOk],0);
    Exit     //Выход
  end;

if Length(Trim(LabeledEdit5.Text)) = 0 then
  begin
    MessageDlg('Вы не ввели № Кузова.',mtError,[mbOk],0);
    Exit     //Выход
  end;



RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@FIOPokup').Value:=(LabeledEdit1.Text);
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@AdresKlienta').Value:=(LabeledEdit2.Text);
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@Cena').Value:=StrToInt(LabeledEdit3.Text);
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@DataZakluch').Value:=DateToStr(DateTimePicker1.Date);
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@N_Dvig').Value:=StrToInt(LabeledEdit4.Text);
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@KodTovara').Value:=RADM.ADOQueryAVTO.FieldByName('KodTovara').AsString;;
RADM.ADOStoredProcVvod_Dog.Parameters.ParamByName('@N_kuzova').Value:=StrToInt(LabeledEdit5.Text);
RADM.ADOStoredProcVvod_Dog.ExecProc;



ShowMessage('Новый договор успешно добавлен.'); // Диалоговое окно.

RADM.ADOQueryDog.Close;
RADM.ADOQueryDog.Open;
end;


procedure TRAVD.BitBtn4Click(Sender: TObject);  // Диалоговое окно - Закрытие формы программы.
begin
if MessageDlg('Закончить работу программы ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAVD.BitBtn5Click(Sender: TObject);
begin
if MessageDlg('Вернуться в Главное меню ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAVD.Close;
end;
end;

procedure TRAVD.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
RADM.ADOQueryDog.Active:=True;
RADM.ADOQueryDog.Open;
DBGrid1.Columns.Items[0].Title.Caption :='№ Дог';
 DBGrid1.Columns.Items[1].Title.Caption :='ФИОПокупат';
  DBGrid1.Columns.Items[2].Title.Caption :='АдресКлиента';
   DBGrid1.Columns.Items[3].Title.Caption :='ЦенаДопОборуд.';
    DBGrid1.Columns.Items[4].Title.Caption :='ДатаЗаключ';
     DBGrid1.Columns.Items[5].Title.Caption :='№ Двигателя';
      DBGrid1.Columns.Items[6].Title.Caption :='КодТовара';
       DBGrid1.Columns.Items[7].Title.Caption :='№ Куова';
end;


end.

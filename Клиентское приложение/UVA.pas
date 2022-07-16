unit UVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, ComCtrls, jpeg, DBCtrls;

type
  TRAVA = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    GroupBox3: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    BitBtn1: TBitBtn;
    LabeledEdit3: TLabeledEdit;
    Image2: TImage;
    Image3: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAVA: TRAVA;

implementation

uses UDM, UVP;

{$R *.dfm}



procedure TRAVA.BitBtn1Click(Sender: TObject);
begin

if Length(Trim(LabeledEdit4.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� �������.',mtError,[mbOk],0);
    Exit     //�����
  end;

if Length(Trim(LabeledEdit5.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� ��������.',mtError,[mbOk],0);
    Exit     //�����
  end;

if Length(Trim(LabeledEdit3.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� � ������.',mtError,[mbOk],0);
    Exit     //�����
  end;

if Length(Trim(LabeledEdit9.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� �������������.',mtError,[mbOk],0);
    Exit     //�����
  end;

if Length(Trim(LabeledEdit6.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� �����.',mtError,[mbOk],0);
    Exit     //�����
  end;


RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@Marka').Value:=(LabeledEdit1.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@Model').Value:=(LabeledEdit2.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@DataPostav').Value:=DateToStr(DateTimePicker1.Date);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@N_sertif').Value:=StrToInt(LabeledEdit3.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@BazCena').Value:=(LabeledEdit4.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@Moshnost').Value:=StrToInt(LabeledEdit5.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@N_Post').Value:=RADM.ADOQueryPostavshik.FieldByName('N_Post').AsString;
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@RashodTopliva').Value:=StrToInt(LabeledEdit6.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@TipKorobki').Value:=ComboBox1.Text;
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@Proizvod').Value:=(LabeledEdit8.Text);
RADM.ADOStoredProcVvod_AVTO.Parameters.ParamByName('@Obem').Value:=StrToInt(LabeledEdit9.Text);
RADM.ADOStoredProcVvod_AVTO.ExecProc;

RADM.ADOQueryAVTO.ExecSQL;

ShowMessage('����� ���������� ������� ��������.'); // ���������� ����.

RADM.ADOQueryAVTO.Close;
RADM.ADOQueryAVTO.Open;
end;

procedure TRAVA.BitBtn4Click(Sender: TObject);   // ���������� ���� - �������� ����� ���������.
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAVA.BitBtn5Click(Sender: TObject); // ���������� ���� - ����� �� ���������.
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAVA.Close;
end;
end;

procedure TRAVA.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
RADM.ADOQueryAVTO.Active:=True;
RADM.ADOQueryAVTO.Open;
RADM.ADOQueryPostavshik.Open;
DBGrid1.Columns.Items[0].Title.Caption :='���������';
 DBGrid1.Columns.Items[1].Title.Caption :='�����';
  DBGrid1.Columns.Items[2].Title.Caption :='������';
   DBGrid1.Columns.Items[3].Title.Caption :='��������';
    DBGrid1.Columns.Items[4].Title.Caption :='� ������';
     DBGrid1.Columns.Items[5].Title.Caption :='�������';
      DBGrid1.Columns.Items[6].Title.Caption :='��������';
       DBGrid1.Columns.Items[7].Title.Caption :='� ����';
         DBGrid1.Columns.Items[8].Title.Caption :='�������������';
          DBGrid1.Columns.Items[9].Title.Caption :='����������';
           DBGrid1.Columns.Items[10].Title.Caption :='�������������';
            DBGrid1.Columns.Items[11].Title.Caption :='�����';
end;


end.

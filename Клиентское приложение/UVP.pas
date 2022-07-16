unit UVP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TRAVP = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
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
  RAVP: TRAVP;

implementation

uses UDM, UVA;

{$R *.dfm}




procedure TRAVP.BitBtn1Click(Sender: TObject);

begin
  if Length(Trim(LabeledEdit1.Text)) = 0 then
   begin
     MessageDlg('�� �� ������� ������������ ����������!',mtError,[mbOk],0);
     Exit     //�����
  end;


RADM.ADOStoredProcVvod_Postavshik.Parameters.ParamByName('@NaimPost').Value:=(LabeledEdit1.Text);
RADM.ADOStoredProcVvod_Postavshik.ExecProc;

ShowMessage('����� ��������� ������� ��������.'); // ���������� ����.

RADM.ADOQueryPostavshik.Close;
RADM.ADOQueryPostavshik.Open;

DBGrid1.Columns.Items[0].Title.Caption :='� ����';
DBGrid1.Columns.Items[1].Title.Caption :='��������';

Image2.Visible:=True;
end;

procedure TRAVP.BitBtn4Click(Sender: TObject); // ���������� ���� - �������� ����� ���������.
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAVP.BitBtn5Click(Sender: TObject);  // ���������� ���� - ����� �� ���������.
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAVP.Close;
end;
end;

procedure TRAVP.FormActivate(Sender: TObject);
begin
RADM.ADOQueryPostavshik.Active:=True;
RADM.ADOQueryPostavshik.Open;
DBGrid1.Columns.Items[0].Title.Caption :='� ����';
DBGrid1.Columns.Items[1].Title.Caption :='��������';
end;

end.

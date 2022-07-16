unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TRAmenu = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    LabeledEdit1: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAmenu: TRAmenu;

implementation

uses UDM, UJpa, UJpr, UKa, USo, UVA, UVD, UVP, UVR;

{$R *.dfm}

procedure TRAmenu.BitBtn10Click(Sender: TObject);
begin
RASo.ShowModal();
end;



procedure TRAmenu.BitBtn1Click(Sender: TObject);
begin
if Length(Trim(LabeledEdit1.Text)) = 0 then
  begin
    MessageDlg('�� �� ����� ������!',mtError,[mbOk],0);
    Exit     //�����
 end;

if (ComboBox1.ItemIndex=-1) then
begin
  MessageDlg('�� �� ������� ������������!',mtError,[mbOk],0);
end;

if (ComboBox1.ItemIndex=0)  and (LabeledEdit1.Text='000') then
begin
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  BitBtn5.Enabled:=False;
  BitBtn6.Enabled:=False;
  BitBtn7.Enabled:=False;
  BitBtn10.Enabled:=False;
  BitBtn8.Enabled:=True;
  BitBtn9.Enabled:=True;
  Image1.Visible:=False;
  Image3.Visible:=False;
  Image4.Visible:=False;
  Image5.Visible:=False;
  Image2.Visible:=True;

  MessageDlg('����������� �������� �������',mtInformation,[mbOK],0);
end;

if (ComboBox1.ItemIndex=1)  and (LabeledEdit1.Text='111') then
begin
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  BitBtn5.Enabled:=False;
  BitBtn6.Enabled:=False;
  BitBtn7.Enabled:=False;
  BitBtn8.Enabled:=False;
  BitBtn9.Enabled:=False;
  BitBtn10.Enabled:=True;
  Image1.Visible:=False;
  Image2.Visible:=False;
  Image4.Visible:=False;
  Image5.Visible:=False;
  Image3.Visible:=True;

  MessageDlg('����������� �������� �������',mtInformation,[mbOK],0)
end;
if (ComboBox1.ItemIndex=2)  and (LabeledEdit1.Text='222') then
begin
  BitBtn4.Enabled:=False;
  BitBtn5.Enabled:=False;
  BitBtn6.Enabled:=False;
  BitBtn7.Enabled:=False;
  BitBtn8.Enabled:=False;
  BitBtn9.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn10.Enabled:=True;
  Image1.Visible:=False;
  Image2.Visible:=False;
  Image3.Visible:=False;
  Image5.Visible:=False;
  Image4.Visible:=True;
  MessageDlg('����������� �������� �������',mtInformation,[mbOK],0)

end;
if (ComboBox1.ItemIndex=3)  and (LabeledEdit1.Text='333') then
begin
  BitBtn8.Enabled:=False;
  BitBtn9.Enabled:=False;
  BitBtn10.Enabled:=False;
  BitBtn3.Enabled:=True;
  BitBtn4.Enabled:=True;
  BitBtn5.Enabled:=True;
  BitBtn6.Enabled:=True;
  BitBtn7.Enabled:=True;
  Image1.Visible:=False;
  Image2.Visible:=False;
  Image3.Visible:=False;
  Image4.Visible:=False;
  Image5.Visible:=True;
  MessageDlg('����������� �������� �������',mtInformation,[mbOK],0)
end;
End;

procedure TRAmenu.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('��������� ������ ���������?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAmenu.BitBtn3Click(Sender: TObject);
begin
RAVP.ShowModal();
end;

procedure TRAmenu.BitBtn4Click(Sender: TObject);
begin
RAVA.ShowModal();
end;

procedure TRAmenu.BitBtn5Click(Sender: TObject);
begin
RAVD.ShowModal();
end;

procedure TRAmenu.BitBtn6Click(Sender: TObject);
begin
RAVR.ShowModal();
end;

procedure TRAmenu.BitBtn7Click(Sender: TObject);
begin
RAKa.ShowModal();
end;

procedure TRAmenu.BitBtn8Click(Sender: TObject);
begin
RAJpa.ShowModal();
end;

procedure TRAmenu.BitBtn9Click(Sender: TObject);
begin
RAJpr.ShowModal();
end;


procedure TRAmenu.FormActivate(Sender: TObject);
begin
 try
RADM.ADOConnection1.Connected:=true;
except
OpenDialog1.Execute();
RADM.ADOConnection1.ConnectionString:='FILE NAME='+OpenDialog1.FileName;
RADM.ADOConnection1.Connected:=True;
 end;
end;

end.

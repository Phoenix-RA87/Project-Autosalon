unit UKa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, ComCtrls, Buttons, DBCtrls, jpeg,
  ComObj, Excel2000, ShellApi, Mask;

type
  TRAKa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    GroupBox5: TGroupBox;
    CheckBox6: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    Edit3: TEdit;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    CheckBox4: TCheckBox;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    CheckBox5: TCheckBox;
    Label5: TLabel;
    Label7: TLabel;
    CheckBox7: TCheckBox;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    CheckBox8: TCheckBox;
    Label9: TLabel;
    CheckBox9: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    GroupBox2: TGroupBox;
    BitBtn2: TBitBtn;
    Edit10: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
//    Procedure vibor(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAKa: TRAKa;
   OE1, OList :Variant;
   istr:integer;
   f:textfile;
  i1,i:Integer;
  s1,q1:string;
  f1:textfile;
  help1,help2:String;

implementation

uses UDM, ADODB, DB;

{$R *.dfm}

//procedure TRAKa.vibor(Sender: TObject);  // �������� !!!  ��������� ������ ��� ���������� ������ � ������.
//begin
//q1:='select * from AVTO where 1=1 ';
//if CheckBox1.Checked then
//q1:=q1+' and Marka like  ' + QuotedStr('%'+ Edit1.Text + '%');
//if CheckBox2.Checked then
//q1:=q1+' and Model like  ' + QuotedStr('%'+ Edit2.Text + '%');
//if CheckBox4.Checked then
//q1:=q1+' and N_Sertif like  ' + QuotedStr('%'+ Edit3.Text + '%');
//if CheckBox5.Checked then
//q1:=q1+' and BazCena like  ' + QuotedStr('%'+ Edit4.Text + '%');
//if CheckBox6.Checked then
//q1:=q1+' and Moshnost like  ' + QuotedStr('%'+ Edit5.Text + '%');
//if CheckBox7.Checked then
//q1:=q1+' and N_Post like  ' + QuotedStr('%'+ Edit6.Text + '%');
//RADM.ADOQuery1.SQL.Add('SELECT * FROM AVTO LIKE ''%'+Edit1.Text+'%''');
//RADM.ADOQuery1.Open;
//end;

procedure TRAKa.BitBtn1Click(Sender: TObject);
begin
assignfile(f1,extractfiledir(Application.ExeName) + '\KatAVTO.html');
ReWrite(f1);

writeln(f1,'<html>');
writeln(f1,'<body>');
writeln(f1,'<p></p>');
writeln(f1,'<table>');

writeln(f1,'<th>'+'�����'+'</th>');
writeln(f1,'<th>'+'������'+'</th>');
writeln(f1,'<th>'+'��������'+'</th>');
writeln(f1,'<th>'+'�����'+'</th>');
writeln(f1,'<th>'+'�������������'+'</th>');
writeln(f1,'<th>'+'����������'+'</th>');
writeln(f1,'<th>'+'��������'+'</th>');
writeln(f1,'<th>'+'�������'+'</th>');
writeln(f1,'<th>'+'���-��'+'</th>');


RADM.ADOQueryOtch.First;
while not RADM.ADOQueryOtch.Eof do
begin
writeln(f1,'<tr>');

writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Marka').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Model').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Moshnost').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Obem').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('RashodTopliva').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('TipKorobki').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Proizvod').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('BazCena').AsString+'</td>');

writeln(f1,'</tr>');
RADM.ADOQueryOtch.Next;
  end;
writeln(f1,'</table>');
writeln(f1,'</body>');
writeln(f1,'</html>');
closefile(f1);

shellexecute(Handle,'open', Pchar(ExtractFileDir(Application.ExeName)+'\KatAVTO.html'), nil, nil, SW_SHOWNORMAL);

end;

procedure TRAKa.BitBtn2Click(Sender: TObject);
  // ������ ����������.
  begin
 RADM.ADOQuery1.Active:=True;
 DBGrid1.Columns.Items[0].Title.Caption :='���������';
  DBGrid1.Columns.Items[1].Title.Caption :='�����';
   DBGrid1.Columns.Items[2].Title.Caption :='������';
     DBGrid1.Columns.Items[3].Title.Caption :='������������';
      DBGrid1.Columns.Items[4].Title.Caption :='� ������';
       DBGrid1.Columns.Items[5].Title.Caption :='�������';
        DBGrid1.Columns.Items[6].Title.Caption :='��������';
         DBGrid1.Columns.Items[7].Title.Caption :='� ����';
          DBGrid1.Columns.Items[8].Title.Caption :='�������������';
           DBGrid1.Columns.Items[9].Title.Caption :='����������';
            DBGrid1.Columns.Items[10].Title.Caption :='�������������';
             DBGrid1.Columns.Items[11].Title.Caption :='�����';

//  if not DBGrid1.DataSource.DataSet.Locate('Marka', Edit1.Text, [loCaseInsensitive, loPartialKey]) then
//    ShowMessage('���� ������')
//  else ShowMessage('�����');
end;

procedure TRAKa.BitBtn3Click(Sender: TObject);
begin
OE1:=CreateOleObject('Excel.Application'); //�������OLE-������ Excel
OE1.WorkBooks.Add();                      // ������� ������� ����� Excel
OE1.Visible:=True;                         // ������� Excel �������
//������� � ������ ��������- ���������� ��������� ������
OE1.Cells[1,1].Value:='������� �����������'+
'�� ����'+' '+'����'+' '+DateToStr(DateTimePicker1.Date);
OE1.Cells[2,1].Value:='��� ������';
OE1.Cells[2,2].value:='�����';
OE1.Cells[2,3].Value:='������';
OE1.Cells[2,4].Value:='������������';
OE1.Cells[2,5].Value:='� ������';
OE1.Cells[2,6].Value:='�������';
OE1.Cells[2,7].Value:='��������';
OE1.Cells[2,8].Value:='� ����';
OE1.Cells[2,9].Value:='�������������';
OE1.Cells[2,10].Value:='����������';
OE1.Cells[2,11].Value:='�������������';
OE1.Cells[2,12].Value:='�����';


istr:=3;                           // �����
RADM.ADOQueryOtch.First;               //������� �� ������ ������
while not RADM.ADOQueryOtch.Eof do  // ���� �� ����� ��������� ����� �����
begin
//�������� � ������ Excel ���������� �����

OE1.Cells[istr,1].Value:= RADM.ADOQueryOtch.FieldByName('KodTovara').AsString;
OE1.Cells[istr,2].Value:=RADM.ADOQueryOtch.FieldByName('Marka').AsString;
OE1.Cells[istr,3].Value:=RADM.ADOQueryOtch.FieldByName('Model').AsString;
OE1.Cells[istr,4].Value:=RADM.ADOQueryOtch.FieldByName('DataPostav').AsString;
OE1.Cells[istr,5].Value:=RADM.ADOQueryOtch.FieldByName('N_sertif').AsString;
OE1.Cells[istr,6].Value:=RADM.ADOQueryOtch.FieldByName('BazCena').AsString;
OE1.Cells[istr,7].Value:=RADM.ADOQueryOtch.FieldByName('Moshnost').AsString;
OE1.Cells[istr,8].Value:=RADM.ADOQueryOtch.FieldByName('N_Post').AsString;
OE1.Cells[istr,9].Value:=RADM.ADOQueryOtch.FieldByName('RashodTopliva').AsString;
OE1.Cells[istr,10].Value:=RADM.ADOQueryOtch.FieldByName('TipKorobki').AsString;
OE1.Cells[istr,11].Value:=RADM.ADOQueryOtch.FieldByName('Proizvod').AsString;
OE1.Cells[istr,12].Value:=RADM.ADOQueryOtch.FieldByName('Obem').AsString;

//������� �� ��������� ������
RADM.ADOQueryOtch.Next;
////��������� ����� ������   � Excel
 istr:=istr+1;
//
end;
//begin
 //�������������� ������� ��� ��������������
OE1.Range['A3:L'+IntToStr(istr+1)].Select;   // �������� ������
//���������� �������� ������ ���� ���������� �����
     OE1.Selection.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeRight].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeTop].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlInsideVertical].LineStyle:=xlContinuous;
 OE1.Selection.Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
      OE1.Cells[istr,6].Value:='=SUM(F3:F'+IntToStr(istr-1)+')';



   // OE1.Selection.MergeCells:=True;
//OE1.Selection.HorizontalAlignment := xlLeft;
    /// OE1.Selection.VerticalAlignment := xlCenter;
     OE1.Range['A1:L'+inttostr(istr-1)].Select;
OE1.Selection.ColumnWidth:=30;// ������ �������

  // ��������� ������ - �������
        OE1.ActiveSheet.PageSetup.LeftMargin:= 0.39;
        OE1.ActiveSheet.PageSetup.RightMargin := 0.39;
        OE1.ActiveSheet.PageSetup.TopMargin := 2.78;
        OE1.ActiveSheet.PageSetup.BottomMargin := 0.78;
  // ��������� ������ - ����������
        OE1.ActiveSheet.PageSetup.Orientation := xlLandscape;
        OE1.ActiveSheet.PageSetup.Zoom := False ;
// ����������� �� 1 �������� �� ������        OE1.ActiveSheet.PageSetup.FitToPagesWide := 1
// ����������� �� 10 ��������� �� ������        OE1.ActiveSheet.PageSetup.FitToPagesTall := 10;
//������ ���������� �����
OE1.ActiveSheet.PageSetup.RightFooter := DateToStr(Date) ;
//��������������� ��������
OE1.ActiveSheet.PrintPreview;
end;


procedure TRAKa.BitBtn4Click(Sender: TObject);     // ���������� ���� - ����� �� ���������.
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAKa.BitBtn5Click(Sender: TObject);     // ���������� ���� - �������� ����� ���������.
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAKa.Close;
end;
end;

procedure TRAKa.CheckBox1Click(Sender: TObject);       // ���������� ��� ����������! �������� ������� ��� ������ -  "������",
                                                      //  ����� ��� ���� ����������� �������
begin
 if RAKa.CheckBox1.Checked = false then RADM.ADOQuery1.Filtered :=  false
 else
 RADM.ADOQuery1.SQL.Clear;
 RADM.ADOQuery1.SQL.Add('SELECT * FROM AVTO WHERE Marka LIKE ''%'+Edit1.Text+'%''');
 RADM.ADOQuery1.Active:=True;
 DBGrid1.Columns.Items[0].Title.Caption :='���������';
  DBGrid1.Columns.Items[1].Title.Caption :='�����';
   DBGrid1.Columns.Items[2].Title.Caption :='������';
     DBGrid1.Columns.Items[3].Title.Caption :='������������';
      DBGrid1.Columns.Items[4].Title.Caption :='� ������';
       DBGrid1.Columns.Items[5].Title.Caption :='�������';
        DBGrid1.Columns.Items[6].Title.Caption :='��������';
         DBGrid1.Columns.Items[7].Title.Caption :='� ����';
          DBGrid1.Columns.Items[8].Title.Caption :='�������������';
           DBGrid1.Columns.Items[9].Title.Caption :='����������';
            DBGrid1.Columns.Items[10].Title.Caption :='�������������';
             DBGrid1.Columns.Items[11].Title.Caption :='�����';
end;


procedure TRAKa.DateTimePicker1Change(Sender: TObject);
begin
RADM.ADOQuery1.SQL.Text:= 'exec  KatAVTO ' + QuotedStr(DateToStr(DateTimePicker1.date));
RADM.ADOQuery1.Open;

 DBGrid1.Columns.Items[0].Title.Caption :='���������';
  DBGrid1.Columns.Items[1].Title.Caption :='�����';
   DBGrid1.Columns.Items[2].Title.Caption :='������';
     DBGrid1.Columns.Items[3].Title.Caption :='������������';
      DBGrid1.Columns.Items[4].Title.Caption :='� ������';
       DBGrid1.Columns.Items[5].Title.Caption :='�������';
        DBGrid1.Columns.Items[6].Title.Caption :='��������';
         DBGrid1.Columns.Items[7].Title.Caption :='� ����';
          DBGrid1.Columns.Items[8].Title.Caption :='�������������';
           DBGrid1.Columns.Items[9].Title.Caption :='����������';
            DBGrid1.Columns.Items[10].Title.Caption :='�������������';
             DBGrid1.Columns.Items[11].Title.Caption :='�����';
end;


procedure TRAKa.Edit10Change(Sender: TObject);      // ����� �� ������� AVTO.

begin
   help1:='%'+RAKa.Edit10.Text+'%';
   help2:=QuotedStr(help1);
   with RADM.ADOQuery1 do
  begin
   Close;
   SQL.Clear;
   SQL.Add('Select * from AVTO where Marka like'+help2 +' or Model like'+help2+' or DataPostav like'+help2+' or N_Sertif like'+help2+' or BazCena like'+help2+' or Moshnost like'+help2+' or N_Post like'+help2+' or RashodTopliva like'+help2+' or TipKorobki like'+help2+' or Proizvod like'+help2+' or Obem like'+help2);
   Open;
   RADM.ADOQuery1.Active:=True;
   DBGrid1.Columns.Items[0].Title.Caption :='���������';
    DBGrid1.Columns.Items[1].Title.Caption :='�����';
     DBGrid1.Columns.Items[2].Title.Caption :='������';
      DBGrid1.Columns.Items[3].Title.Caption :='������������';
       DBGrid1.Columns.Items[4].Title.Caption :='� ������';
        DBGrid1.Columns.Items[5].Title.Caption :='�������';
         DBGrid1.Columns.Items[6].Title.Caption :='��������';
          DBGrid1.Columns.Items[7].Title.Caption :='� ����';
           DBGrid1.Columns.Items[8].Title.Caption :='�������������';
            DBGrid1.Columns.Items[9].Title.Caption :='����������';
              DBGrid1.Columns.Items[10].Title.Caption :='�������������';
               DBGrid1.Columns.Items[11].Title.Caption :='�����';
  end;
end;



procedure TRAKa.FormActivate(Sender: TObject);
begin
RADM.ADOQuery1.Open;
DateTimePicker1.Date:=date();
DateTimePicker1Change(self);
end;

end.

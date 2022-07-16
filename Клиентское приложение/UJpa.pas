unit UJpa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, jpeg, ComCtrls, Buttons, DBCtrls,
  ComObj, Excel2000, ShellApi;

type
  TRAJpa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RAJpa: TRAJpa;
  s1:string;
  f1:textfile;
   OE1, OList :Variant;
   istr:integer;
   f:textfile;
  i1,i:Integer;

  implementation

uses UDM;

{$R *.dfm}

procedure TRAJpa.BitBtn2Click(Sender: TObject);
begin

OE1:=CreateOleObject('Excel.Application'); //�������OLE-������ Excel
OE1.WorkBooks.Add();                      // ������� ������� ����� Excel
OE1.Visible:=True;                         // ������� Excel �������
//������� � ������ ��������- ���������� ��������� ������
OE1.Cells[1,1].Value:='������ ������ �����������'+
'�� ������'+' '+DateToStr(DateTimePicker1.Date)+' �� '+' '+DateToStr(DateTimePicker2.Date);
OE1.Cells[2,1].Value:='� ���';
OE1.Cells[2,2].value:='��������';
OE1.Cells[2,3].Value:='����P�����';
OE1.Cells[2,4].Value:='�����';
OE1.Cells[2,5].Value:='������';
OE1.Cells[2,6].Value:='�������';
OE1.Cells[2,7].Value:='� ���������';
OE1.Cells[2,8].Value:='� ������';;
OE1.Cells[2,9].Value:='��������� �� ����� �.';
OE1.Cells[2,10].Value:='�����';
OE1.Cells[2,11].Value:='���-��';


istr:=3;                           // �����
RADM.ADOQueryOtch.First;               //������� �� ������ ������
while not RADM.ADOQueryOtch.Eof do  // ���� �� ����� ��������� ����� �����
begin
//�������� � ������ Excel ���������� �����

OE1.Cells[istr,1].Value:= RADM.ADOQueryOtch.FieldByName('N_Dog').AsString;
OE1.Cells[istr,2].Value:=RADM.ADOQueryOtch.FieldByName('FIOPokup').AsString;
OE1.Cells[istr,3].Value:=RADM.ADOQueryOtch.FieldByName('DataZakluch').AsString;
OE1.Cells[istr,4].Value:=RADM.ADOQueryOtch.FieldByName('Marka').AsString;
OE1.Cells[istr,5].Value:=RADM.ADOQueryOtch.FieldByName('Model').AsString;
OE1.Cells[istr,6].Value:=RADM.ADOQueryOtch.FieldByName('BazCena').AsString;
OE1.Cells[istr,7].Value:=RADM.ADOQueryOtch.FieldByName('N_Dvig').AsString;
OE1.Cells[istr,8].Value:=RADM.ADOQueryOtch.FieldByName('N_kuzova').AsString;
OE1.Cells[istr,9].Value:=RADM.ADOQueryOtch.FieldByName('Cena').AsString;
OE1.Cells[istr,10].Value:=RADM.ADOQueryOtch.FieldByName('Summa').AsString;


//������� �� ��������� ������
RADM.ADOQueryOtch.Next;
////��������� ����� ������   � Excel
 istr:=istr+1;
//
end;
//begin
 //�������������� ������� ��� ��������������
OE1.Range['A3:K'+IntToStr(istr+1)].Select;   // �������� ������
//���������� �������� ������ ���� ���������� �����
     OE1.Selection.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeRight].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeTop].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlInsideVertical].LineStyle:=xlContinuous;
 OE1.Selection.Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
      OE1.Cells[istr,6].Value:='=SUM(K3:K'+IntToStr(istr-1)+')';



   // OE1.Selection.MergeCells:=True;
//OE1.Selection.HorizontalAlignment := xlLeft;
    /// OE1.Selection.VerticalAlignment := xlCenter;
     OE1.Range['A1:K'+inttostr(istr-1)].Select;
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

procedure TRAJpa.BitBtn3Click(Sender: TObject);
begin
assignfile(f1,extractfiledir(Application.ExeName) + '\JurProdAVTO.html');
ReWrite(f1);

writeln(f1,'<html>');
writeln(f1,'<body>');
writeln(f1,'<p></p>');

writeln(f1,'<table>');

writeln(f1,'<th>'+'� ���'+'</th>');
writeln(f1,'<th>'+'��������'+'</th>');
writeln(f1,'<th>'+'����������'+'</th>');
writeln(f1,'<th>'+'�����'+'</th>');
writeln(f1,'<th>'+'������'+'</th>');
writeln(f1,'<th>'+'�������'+'</th>');
writeln(f1,'<th>'+'� ���������'+'</th>');
writeln(f1,'<th>'+'� ������'+'</th>');
writeln(f1,'<th>'+'��������� �� ����� �.'+'</th>');
writeln(f1,'<th>'+'�����'+'</th>');

RADM.ADOQueryOtch.First;
while not RADM.ADOQueryOtch.Eof do
begin
  writeln(f1,'<tr>');

writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('N_Dog').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('FIOPokup').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('DataZakluch').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Marka').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Model').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('BazCena').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('N_Dvig').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('N_kuzova').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Cena').AsString+'</td>');
writeln(f1,'<td>'+RADM.ADOQueryOtch.FieldByName('Summa').AsString+'</td>');
writeln(f1,'</tr>');
RADM.ADOQueryOtch.Next;
end;
writeln(f1,'</table>');
writeln(f1,'</body>');
writeln(f1,'</html>');
closefile(f1);

shellexecute(Handle,'open', Pchar(ExtractFileDir(Application.ExeName)+'\JurProdAVTO.html'), nil, nil, SW_SHOWNORMAL);

end;

procedure TRAJpa.BitBtn4Click(Sender: TObject);  // ���������� ���� - ����� �� ���������.
begin
if MessageDlg('��������� ������ ��������� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TRAJpa.BitBtn5Click(Sender: TObject);  // ���������� ���� - �������� ����� ���������.
begin
if MessageDlg('��������� � ������� ���� ?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
RAJpa.Close;
end;
end;

procedure TRAJpa.DateTimePicker1Change(Sender: TObject);
begin
DateTimePicker2Change(Self);
end;

procedure TRAJpa.DateTimePicker2Change(Sender: TObject);
begin
RADM.ADOQueryOtch.SQL.Text:= 'exec JurProdAVTO '  + QuotedStr(DateToStr(DateTimePicker2.date))+ ',' +QuotedStr(DateToStr(DateTimePicker1.date));
RADM.ADOQueryOtch.Open;

 DBGrid1.Columns.Items[0].Title.Caption :='� ��� ';
  DBGrid1.Columns.Items[1].Title.Caption :='��������';
    DBGrid1.Columns.Items[2].Title.Caption :='����������';
     DBGrid1.Columns.Items[3].Title.Caption :='�����';
      DBGrid1.Columns.Items[4].Title.Caption :='������';
       DBGrid1.Columns.Items[5].Title.Caption :='�������';
        DBGrid1.Columns.Items[6].Title.Caption :='� ���������';
         DBGrid1.Columns.Items[7].Title.Caption :='� ������';
          DBGrid1.Columns.Items[8].Title.Caption :='��������� �� ����� �.';
           DBGrid1.Columns.Items[9].Title.Caption :='�����';
            DBGrid1.Columns.Items[10].Title.Caption :='���-��';

end;

procedure TRAJpa.FormActivate(Sender: TObject);
begin
DateTimePicker1.Date:=date();
DateTimePicker2.Date:=date();
DateTimePicker1Change(Self);
end;

end.

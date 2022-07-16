program Avtosalon;

uses
  Forms,
  UMenu in 'UMenu.pas' {RAmenu},
  UVP in 'UVP.pas' {RAVP},
  UVA in 'UVA.pas' {RAVA},
  UVD in 'UVD.pas' {RAVD},
  UVR in 'UVR.pas' {RAVR},
  UKa in 'UKa.pas' {RAKa},
  UJpa in 'UJpa.pas' {RAJpa},
  UJpr in 'UJpr.pas' {RAJpr},
  USo in 'USo.pas' {RASo},
  UDM in 'UDM.pas' {RADM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRAmenu, RAmenu);
  Application.CreateForm(TRAVP, RAVP);
  Application.CreateForm(TRAVA, RAVA);
  Application.CreateForm(TRAVD, RAVD);
  Application.CreateForm(TRAVR, RAVR);
  Application.CreateForm(TRAKa, RAKa);
  Application.CreateForm(TRAJpa, RAJpa);
  Application.CreateForm(TRAJpr, RAJpr);
  Application.CreateForm(TRASo, RASo);
  Application.CreateForm(TRADM, RADM);
  Application.Run;
end.

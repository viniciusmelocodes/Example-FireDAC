program FireDAC;

uses
  Vcl.Forms,
  untFrmMain in 'untFrmMain.pas' {frmMain},
  untDMMain in 'untDMMain.pas' {DMMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMMain, DMMain);
  Application.Run;
end.

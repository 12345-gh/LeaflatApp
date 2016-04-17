program V_2;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  ufmAddPushpin in 'ufmAddPushpin.pas' {fmAddPushpin},
  ufmAddRoute in 'ufmAddRoute.pas' {fmAddRoute};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfmAddPushpin, fmAddPushpin);
  Application.CreateForm(TfmAddRoute, fmAddRoute);
  Application.Run;
end.

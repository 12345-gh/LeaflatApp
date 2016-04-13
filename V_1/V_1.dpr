program V_1;

uses
  Vcl.Forms,
  LeaflatApp in 'LeaflatApp.pas' {MainForm},
  CommonUnit in 'Common\CommonUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

program V_2;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  ufmPushpinEdit in 'ufmPushpinEdit.pas' {fmPushpinEdit},
  ufmRouteAdd in 'ufmRouteAdd.pas' {fmRouteAdd},
  ufmRectangleAdd in 'ufmRectangleAdd.pas' {fmRectangleAdd},
  RCPopupMenu in 'Common\RCPopupMenu.pas',
  ufmPolygonAdd in 'ufmPolygonAdd.pas' {fmPolygonAdd},
  uListItemRecord in 'Common\uListItemRecord.pas',
  uMapItemCRUD in 'Common\uMapItemCRUD.pas',
  uListItemCRUD in 'Common\uListItemCRUD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TfmPushpinEdit, fmPushpinEdit);
  Application.CreateForm(TfmRouteAdd, fmRouteAdd);
  Application.CreateForm(TfmRectangleAdd, fmRectangleAdd);
  Application.CreateForm(TfmPolygonAdd, fmPolygonAdd);
  Application.Run;
end.

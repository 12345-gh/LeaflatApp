unit ufmAddPushpin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxTextEdit, cxLabel;

type
  TfmAddPushpin = class(TForm)
    cxlbName: TcxLabel;
    cxteName: TcxTextEdit;
    cxteType: TcxTextEdit;
    cxlbType: TcxLabel;
    pButtomPanel: TPanel;
    cxbtOK: TcxButton;
    cxbtCancel: TcxButton;
    procedure cxbtOKClick(Sender: TObject);
    procedure cxteNamePropertiesChange(Sender: TObject);
    procedure cxteTypePropertiesChange(Sender: TObject);
    procedure cxbtCancelClick(Sender: TObject);
  private
    { Private declarations }

    function CheckValid: boolean;
  public
    { Public declarations }
  end;

var
  fmAddPushpin: TfmAddPushpin;

implementation

{$R *.dfm}

function TfmAddPushpin.CheckValid: boolean;
var
  HintText: string;
begin
  HintText:='';
  if (cxteName.Text = '') then begin
    HintText:=HintText+cxlbName.Caption+'; ';
    cxteName.Style.Color:=clRed;
  end;

  if (cxteType.Text = '') then begin
    HintText:=HintText+cxlbType.Caption+'; ';
    cxteType.Style.Color:=clRed;
  end;

  if (HintText = '') then begin
    Result:= True;
  end else begin
    ShowMessage('Заполните поля: '+HintText);
    Result:= False;
  end;
end;

procedure TfmAddPushpin.cxbtCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmAddPushpin.cxbtOKClick(Sender: TObject);
begin
  if (not CheckValid) then Exit;
  ModalResult:=mrOk;
end;

procedure TfmAddPushpin.cxteNamePropertiesChange(Sender: TObject);
begin
  cxteName.Style.Color:=clWindow;
end;

procedure TfmAddPushpin.cxteTypePropertiesChange(Sender: TObject);
begin
  cxteType.Style.Color:=clWindow;
end;

end.

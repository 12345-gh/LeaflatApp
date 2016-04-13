unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxBar, cxClasses, dxRibbon,
  dxStatusBar, dxRibbonStatusBar, cxContainer, cxEdit, dxMapControlTypes,
  dxMapControl, cxSplitter, cxGroupBox, dxSkinscxPCPainter, dxBarBuiltInMenu,
  cxPC, Vcl.StdCtrls, cxCheckListBox,

  Generics.Collections, dxMapItem, dxCustomMapItemLayer, dxMapItemLayer,
  dxMapLayer, dxMapImageTileLayer, dxMapControlOpenStreetMapImageryDataProvider,
  System.Actions, Vcl.ActnList, cxGeometry, cxListBox, Vcl.Menus, cxCheckBox,
  dxCoreGraphics;

type
  RouteItem=record
    triLayerName: string;
    triLayer: TdxMapItemLayer;
    triRoutePushpin: TList<TdxMapPushpin>;
    triPolyline: TdxMapPolyline;
  end;

type
  TMainForm = class(TForm)
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxbmMainMenu: TdxBarManager;
    dxrtMain: TdxRibbonTab;
    dxrMainRibbon: TdxRibbon;
    dxrtMap: TdxRibbonTab;
    dxrtStyle: TdxRibbonTab;
    dxBarSubItem1: TdxBarSubItem;
    dxbmbCommon: TdxBar;
    dxbmbPrint: TdxBar;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    dxMapControl1: TdxMapControl;
    cxSplitter1: TcxSplitter;
    dxbmbRoute: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxMapControl1ImageTileLayer1: TdxMapImageTileLayer;
    ActionList1: TActionList;
    actAddFRoutes: TAction;
    actRemoveFRoutes: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarButton6: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxListBox1: TcxListBox;
    actAddPointToMap: TAction;
    PopupMenu1: TPopupMenu;
    actAddPointToMap1: TMenuItem;
    cxlbRoutes: TcxListBox;
    procedure actAddFRoutesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRemoveFRoutesExecute(Sender: TObject);
    procedure dxMapControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actAddPointToMapExecute(Sender: TObject);
    procedure cxlbRoutesClick(Sender: TObject);
  private
    { Private declarations }
    (* Array / List *)
    FRoutes: TList<RouteItem>; // Main list of all routes

    (*Global Variable*)
    FNumberRoutes: integer;
    FHotPushpin: TdxMapPushpin;
    FCurrentCursorPos: TPoint;

    function CreatePushpin: TdxMapPushpin;
    procedure CreatePolyline(AListPushpin: TList<TdxMapPushpin>; APolyline: TdxMapPolyline);

    procedure UpdateRoutesList;

    function GetSelectedRoute:integer;
    function GetCurrentCursorGeoPoint: TdxMapControlGeoPoint;
    function GetPushpinLetter(ANumber: Integer): string;

    procedure SetWaypointTexts(AItems: TList<TdxMapPushpin>);

    procedure VisibleLayerOn(AItem: Integer; AColor: TdxAlphaColor);
    procedure VisibleLayerOff(AItem: Integer);
    procedure VisibleLayerList;

  public
    { Public declarations }
    property CurrentCursorGeoPoint: TdxMapControlGeoPoint read GetCurrentCursorGeoPoint;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{$REGION 'Create function/procedure'}
  function TMainForm.CreatePushpin: TdxMapPushpin;
  begin
    Result := FRoutes[GetSelectedRoute].triLayer.MapItems.Add(TdxMapPushpin) as TdxMapPushpin;
  end;

  procedure TMainForm.cxlbRoutesClick(Sender: TObject);
begin
  VisibleLayerList();
  VisibleLayerOn(GetSelectedRoute, $9FFF0000); //Red
end;

procedure TMainForm.CreatePolyline(AListPushpin: TList<TdxMapPushpin>; APolyline: TdxMapPolyline);
  var
    I: Integer;
  begin
    APolyline.GeoPoints.Clear;

    for I := 0 to AListPushpin.Count - 1 do begin
       APolyline.GeoPoints.Add.GeoPoint:=AListPushpin[I].Location.GeoPoint;
    end;

  end;
{$ENDREGION}

{$REGION 'Update function/procedure'}
  procedure TMainForm.UpdateRoutesList;
  var
    I : Integer;
  begin
    if FRoutes <> nil then begin
      cxlbRoutes.Clear;
      for I := 0 to FRoutes.Count - 1 do begin
        cxlbRoutes.AddItem(FRoutes[i].triLayerName,FRoutes[i].triLayer);
      end;
    end;
  end;
{$ENDREGION}

//Delete

//Clear

{$REGION 'Get function/procedure'}
  function TMainForm.GetSelectedRoute:integer;
  var
    I : Integer;
  begin
    Result:=-1;
    for I := 0 to cxlbRoutes.Items.Count - 1 do begin
      if cxlbRoutes.Selected[I] then begin
        Result:= I;
      end;
    end;
  end;

  function TMainForm.GetCurrentCursorGeoPoint: TdxMapControlGeoPoint;
  begin
    Result := dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(FCurrentCursorPos));
  end;

  function TMainForm.GetPushpinLetter(ANumber: Integer): string;
  begin
    Result := Chr(Ord('A') + ANumber);
  end;
{$ENDREGION}

{$REGION 'Set function/procedure'}
  procedure TMainForm.SetWaypointTexts(AItems: TList<TdxMapPushpin>);
  var
    I: Integer;
  begin
    for I := 0 to AItems.Count - 1 do
      AItems[I].Text := GetPushpinLetter(I);
  end;
{$ENDREGION}


{$REGION 'Visible Layer function/procedure'}
  procedure TMainForm.VisibleLayerOn(AItem: Integer; AColor: TdxAlphaColor);
  var
    I: Integer;
  begin
    cxListBox1.Clear;
    if FRoutes <> nil then begin
      if FRoutes[AItem].triRoutePushpin <> nil then begin

        for I := 0 to FRoutes[AItem].triRoutePushpin.Count - 1 do
        begin
          cxListBox1.AddItem(FRoutes[AItem].triRoutePushpin[I].Location.GeoPoint.AsString, FRoutes[AItem].triRoutePushpin[I]);
        end;

        FRoutes[AItem].triLayer.MapItems.BeginUpdate;
        FRoutes[AItem].triPolyline.Style.BorderColor:=AColor;
        FRoutes[AItem].triPolyline.Style.BorderWidth := 4;
        FRoutes[AItem].triLayer.Visible:=True;
        FRoutes[AItem].triLayer.MapItems.EndUpdate;

      end;
    end;
  end;

  procedure TMainForm.VisibleLayerOff(AItem: Integer);
  var
    I: Integer;
  begin
    cxListBox1.Clear;
    if FRoutes <> nil then begin
      if FRoutes[AItem].triRoutePushpin <> nil then begin

        FRoutes[AItem].triLayer.MapItems.BeginUpdate;
        FRoutes[AItem].triLayer.Visible:=False;
        FRoutes[AItem].triLayer.MapItems.EndUpdate;

      end;
    end;
  end;

  procedure TMainForm.VisibleLayerList;
  var
    I: Integer;
  begin
    for I := 0 to cxlbRoutes.Items.Count - 1 do begin
      if I <> GetSelectedRoute then begin // Remove double repaint polyline
        VisibleLayerOn(I, $9F0000FF); // Blue
      end;
    end;
  end;
{$ENDREGION}

{$REGION 'Actions'}
  procedure TMainForm.actAddFRoutesExecute(Sender: TObject);
  var
    ARouteItem : RouteItem;
  begin
    ARouteItem.triLayer:=dxMapControl1.AddItemLayer as TdxMapItemLayer;
    ARouteItem.triRoutePushpin:=TList<TdxMapPushpin>.Create;
    ARouteItem.triPolyline:=ARouteItem.triLayer.AddItem(TdxMapPolyline) as TdxMapPolyline;
    ARouteItem.triLayerName:='Маршрут '+IntToStr(FNumberRoutes);

    FRoutes.Add(ARouteItem);
    FNumberRoutes:=FNumberRoutes+1;
  
    UpdateRoutesList();
    cxlbRoutes.Selected[cxlbRoutes.Count-1]:= True;
    VisibleLayerList();
  end;
  
  procedure TMainForm.actAddPointToMapExecute(Sender: TObject);
  var
    APushpin: TdxMapPushpin;
  begin
    APushpin := CreatePushpin;
    APushpin.Location.GeoPoint := CurrentCursorGeoPoint;
    FRoutes[GetSelectedRoute].triRoutePushpin.Add(APushpin);
    SetWaypointTexts(FRoutes[GetSelectedRoute].triRoutePushpin);
    CreatePolyline(FRoutes[GetSelectedRoute].triRoutePushpin, FRoutes[GetSelectedRoute].triPolyline);
    VisibleLayerList();
    VisibleLayerOn(GetSelectedRoute, $9FFF0000); //Red
  end;

  procedure TMainForm.actRemoveFRoutesExecute(Sender: TObject);
  begin
    if (GetSelectedRoute <> -1) then begin
      VisibleLayerOff(GetSelectedRoute); //Red
      FRoutes.Delete(GetSelectedRoute);
    end;

    UpdateRoutesList();

    VisibleLayerList();
    if (GetSelectedRoute <> -1) then begin
      VisibleLayerOn(GetSelectedRoute, $9FFF0000); //Red
    end;
  end;
{$ENDREGION}

procedure TMainForm.dxMapControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FCurrentCursorPos := Point(X, Y);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FRoutes:=TList<RouteItem>.Create;
  FNumberRoutes:=1;
end;

end.

unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics,
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
  dxCoreGraphics, Types, Math;

{$REGION 'Pushpin'}
type
  PushpinItem=record
    tppPushpinName: string;
    tppPushpinType: string;
    tppLayer: TdxMapItemLayer;
    tppPushpin: TdxMapPushpin;
  end;
{$ENDREGION}

{$REGION 'Route'}
type
  MapDotItem=record
    mdiMapDot: TdxMapDot;
    mdiBeforeDot: TdxMapDot;
    mdiAfterDot: TdxMapDot;
  end;

type
  RouteItem=record
    triRouteName: string;
    triRouteType: string;
    triLayer: TdxMapItemLayer;
    triMapDot: TList<TdxMapDot>;
    triMapDotBetween: TList<MapDotItem>;
    triPolyline: TdxMapPolyline;
    triPolylineColor: TdxAlphaColor;
    triCustomElement: TdxMapCustomElement;
  end;
{$ENDREGION}

{$REGION 'Rectangle'}
type
  RectangleItem=record
    trtRectangleName: string;
    trtRectangleType: string;
    trtLayer: TdxMapItemLayer;
    trtRectangle: TdxMapPolygon;
    trtRectangleColor: TdxAlphaColor;
    trtCustomElement: TdxMapCustomElement;
  end;
{$ENDREGION}

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
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxMapControl1ImageTileLayer1: TdxMapImageTileLayer;
    ActionList1: TActionList;
    dxBarButton6: TdxBarButton;
    cxListBox1: TcxListBox;
    PopupMenu1: TPopupMenu;
    cxlbRoutes: TcxListBox;
    dxbmShapes: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    actPushpinAdd: TAction;
    actPushpinMove: TAction;
    actPushpinDelete: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    actPushinMoveSave: TAction;
    actPushinMoveRollback: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    dxBarLargeButton4: TdxBarLargeButton;
    actRouteAdd: TAction;
    actRouteCreate: TAction;
    actRouteRemoveLastPoint: TAction;
    actRouteCreateCancel: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    dxBarLargeButton1: TdxBarLargeButton;
    actRectangleAdd: TAction;
    actRectangleCreate: TAction;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actPushpinAddExecute(Sender: TObject);
    procedure dxMapControl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actPushpinMoveExecute(Sender: TObject);
    procedure dxMapControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actPushinMoveSaveExecute(Sender: TObject);
    procedure actPushinMoveRollbackExecute(Sender: TObject);
    procedure actPushpinDeleteExecute(Sender: TObject);
    procedure actRouteAddExecute(Sender: TObject);
    procedure actRouteRemoveLastPointExecute(Sender: TObject);
    procedure actRouteCreateCancelExecute(Sender: TObject);
    procedure actRouteCreateExecute(Sender: TObject);
    procedure actRectangleAddExecute(Sender: TObject);
    procedure actRectangleCreateExecute(Sender: TObject);
  private
    { Private declarations }

    (*Variable*)
    FCurrentCursorPos : TPoint;

    {$REGION 'Pushpin'}
    FPushpin : TList<PushpinItem>;    // Main list of Pushpin
    FAddPushpin : Boolean;            // If press button on ribbon panel
    FSelectedPushpin : TdxMapPushpin; // Selected pushpin
    FIDMovePushpin : Integer;         // id Pushpin in FPushpin list
    FMovePushpinOldGeopoint : TdxMapControlGeoPoint; // Geopoint before 'move' used
    {$ENDREGION}

    {$REGION 'Route'}
    FRoutes : TList<RouteItem>;       // Main list of routes
    FAddRoute  : Boolean;             // If press button on ribbon panel

    FIDSelectedRoute : integer;
    FIDSelectedMapDot : integer;

    FSelectedMapDot : TdxMapDot;      // Selected MapDot
    {$ENDREGION}

    {$REGION 'Route'}
    FRectangles : TList<RectangleItem>; // Main list of rectangle
    FAddRectangle : Boolean;          // If press button on ribbon panel

    FIDSelectedRectangle : integer;

    {$ENDREGION}

    (*Procedure / Function*)
    function GetCurrentCursorGeoPoint : TdxMapControlGeoPoint;
    procedure SetAllActionsFalse;

    {$REGION 'Pushpin'}
    procedure AddPushpin;
    {$ENDREGION}

    {$REGION 'Route'}
    procedure AddRoute;
    {$ENDREGION}

    {$REGION 'Rectangle'}
    procedure AddRectangle;
    {$ENDREGION}

  public
    { Public declarations }
    property CurrentCursorGeoPoint: TdxMapControlGeoPoint read GetCurrentCursorGeoPoint;
  end;

var
  MainForm: TMainForm;

implementation

uses
  ufmAddPushpin, ufmAddRoute;

{$R *.dfm}

{$REGION 'Procedure / Function'}
function TMainForm.GetCurrentCursorGeoPoint: TdxMapControlGeoPoint;
begin
  Result := dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(FCurrentCursorPos));
end;

procedure TMainForm.SetAllActionsFalse;
begin
  FAddPushpin := False;
  FIDMovePushpin := -1;

  FAddRoute := False;
  FIDSelectedRoute := -1;
  FIDSelectedMapDot := -1;

  FAddRectangle := False;
  FIDSelectedRectangle := -1
end;
{$ENDREGION}

{$REGION 'Pushpin procedure / function'}
procedure TMainForm.AddPushpin;
var
  AfmAddPushin: TfmAddPushpin;
  APushpinItem : PushpinItem;
begin
  Application.CreateForm(TfmAddPushpin, AfmAddPushin);
  if AfmAddPushin.ShowModal=mrOk
    then begin
      APushpinItem.tppPushpinName:= AfmAddPushin.cxteName.Text;
      APushpinItem.tppPushpinType:= AfmAddPushin.cxteType.Text;
      APushpinItem.tppLayer:= dxMapControl1.AddItemLayer as TdxMapItemLayer;

      APushpinItem.tppLayer.MapItems.BeginUpdate;

      APushpinItem.tppPushpin:= APushpinItem.tppLayer.MapItems.Add(TdxMapPushpin) as TdxMapPushpin;
      APushpinItem.tppPushpin.Location.GeoPoint:= CurrentCursorGeoPoint;
      APushpinItem.tppPushpin.Text:= AfmAddPushin.cxteName.Text;

      APushpinItem.tppLayer.Visible:= True;
      APushpinItem.tppLayer.MapItems.EndUpdate;

      FPushpin.Add(APushpinItem);
    end;

  SetAllActionsFalse;
  AfmAddPushin.Destroy;
  AfmAddPushin:=nil;
end;

procedure TMainForm.actPushpinAddExecute(Sender: TObject);
begin
  SetAllActionsFalse;
  FAddPushpin := True;
end;

procedure TMainForm.actPushpinMoveExecute(Sender: TObject);
var
  I: Integer;
begin
  SetAllActionsFalse;
  for I := 0 to FPushpin.Count - 1 do begin
    if FPushpin[I].tppPushpin.Location.GeoPoint.IsEqual(FSelectedPushpin.Location.GeoPoint) then begin
      FIDMovePushpin:= I;
      FMovePushpinOldGeopoint:= FPushpin[I].tppPushpin.Location.GeoPoint;
      Break;
    end;
  end;
end;

procedure TMainForm.actPushinMoveSaveExecute(Sender: TObject);
begin
  FPushpin[FIDMovePushpin].tppPushpin.Location.GeoPoint:= CurrentCursorGeoPoint;
  SetAllActionsFalse;
end;

procedure TMainForm.actPushinMoveRollbackExecute(Sender: TObject);
begin
  FPushpin[FIDMovePushpin].tppPushpin.Location.GeoPoint:= FMovePushpinOldGeopoint;
  SetAllActionsFalse;
end;

procedure TMainForm.actPushpinDeleteExecute(Sender: TObject);
var
  I, J: Integer;
begin
  SetAllActionsFalse;
  for I := 0 to FPushpin.Count - 1 do begin
    if FPushpin[I].tppPushpin.Location.GeoPoint.IsEqual(FSelectedPushpin.Location.GeoPoint) then begin

      for J:=0 to dxMapControl1.Layers.Count-1 do begin
        if (dxMapControl1.Layers[J].Equals(FPushpin[I].tppLayer) = True) then begin
          dxMapControl1.Layers.Delete(J);
          Break;
        end;
      end;

      FPushpin.Delete(I);
      FPushpin.TrimExcess;
      Break;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Route procedure / function'}
procedure TMainForm.actRouteAddExecute(Sender: TObject);
begin
  SetAllActionsFalse;
  FAddRoute := True;
end;

procedure TMainForm.actRouteCreateExecute(Sender: TObject);
var
  AfmAddRoute: TfmAddRoute;
  ARouteItem: RouteItem;
  ACustomElementGeoPoint: TdxMapControlGeoPoint;
  I: integer;
begin
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedMapDot <> -1)) then begin
    Application.CreateForm(TfmAddRoute, AfmAddRoute);
    if AfmAddRoute.ShowModal=mrOk then begin

      ARouteItem:=FRoutes[FIDSelectedRoute];

      ARouteItem.triRouteName:= AfmAddRoute.cxteName.Text;
      ARouteItem.triRouteType:= AfmAddRoute.cxteType.Text;

      ARouteItem.triLayer.MapItems.BeginUpdate;

      ARouteItem.triCustomElement:= ARouteItem.triLayer.MapItems.Add(TdxMapCustomElement) as TdxMapCustomElement;
      ACustomElementGeoPoint.Latitude:= ARouteItem.triMapDot[0].Location.GeoPoint.Latitude;
      ACustomElementGeoPoint.Longitude:= ARouteItem.triMapDot[0].Location.GeoPoint.Longitude+0.025;
      ARouteItem.triCustomElement.Location.GeoPoint:= ACustomElementGeoPoint;
      ARouteItem.triCustomElement.Text:= ARouteItem.triRouteName;
      ARouteItem.triCustomElement.ImageVisible:= False;
      ARouteItem.triCustomElement.Visible:= True;

      for I:=0 to ARouteItem.triMapDot.Count-1 do begin
        ARouteItem.triMapDot[I].Hint:=ARouteItem.triRouteName;
        ARouteItem.triMapDot[I].Size:= 4;
        ARouteItem.triMapDot[I].Style.BorderColor:= $FFF20000;
        ARouteItem.triMapDot[I].Style.BorderWidth:= 2;
        ARouteItem.triMapDot[I].Style.Color:= $FFF2FF00;
        ARouteItem.triMapDot[I].Visible:= True;
      end;

      ARouteItem.triPolyline.Hint:=ARouteItem.triRouteName;
      ARouteItem.triPolylineColor:= dxColorToAlphaColor(AfmAddRoute.dxceColor.ColorValue);
      ARouteItem.triPolyline.Style.BorderColor:= ARouteItem.triPolylineColor;
      ARouteItem.triPolyline.Style.BorderWidth := 3;
      ARouteItem.triPolyline.StyleHot.BorderColor:= $FFFFFFFF;
      ARouteItem.triPolyline.StyleHot.BorderWidth := 3;
      ARouteItem.triPolyline.StyleSelected.BorderColor:= $FFFFFFFF;
      ARouteItem.triPolyline.StyleSelected.BorderWidth := 3;

      ARouteItem.triLayer.MapItems.EndUpdate;

      FRoutes[FIDSelectedRoute]:= ARouteItem;
    end;

    SetAllActionsFalse;
    AfmAddRoute.Destroy;
    AfmAddRoute:=nil;
  end;
end;

procedure TMainForm.actRouteCreateCancelExecute(Sender: TObject);
var
  I: integer;
begin
  for I:=0 to dxMapControl1.Layers.Count-1 do begin
    if (dxMapControl1.Layers[I].Equals(FRoutes[FIDSelectedRoute].triLayer) = True) then begin
      dxMapControl1.Layers.Delete(I);
      Break;
    end;
  end;

  FRoutes.Delete(FIDSelectedRoute);
  FRoutes.TrimExcess;
  SetAllActionsFalse;
end;

procedure TMainForm.actRouteRemoveLastPointExecute(Sender: TObject);
begin
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedMapDot <> -1))
  then begin
    FRoutes[FIDSelectedRoute].triLayer.MapItems.BeginUpdate;

    FRoutes[FIDSelectedRoute].triMapDot.Delete(FIDSelectedMapDot);
    FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Delete(FIDSelectedMapDot);
    FIDSelectedMapDot:= FIDSelectedMapDot - 1;
    FRoutes[FIDSelectedRoute].triMapDot.Delete(FIDSelectedMapDot);
    FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Delete(FIDSelectedMapDot);
    FIDSelectedMapDot:= FIDSelectedMapDot - 1;

    FRoutes[FIDSelectedRoute].triMapDot.TrimExcess;

    FRoutes[FIDSelectedRoute].triLayer.MapItems.EndUpdate;
  end;
end;

procedure TMainForm.AddRoute;
var
  ARouteItem : RouteItem;
  AMapDot: TdxMapDot;
begin
  if ((FIDSelectedRoute = -1) and (FIDSelectedMapDot = -1)) then begin
    {$REGION 'Init new route'}
    ARouteItem.triRouteName:= '';
    ARouteItem.triRouteType:= '';
    ARouteItem.triPolylineColor:= $8FFF0000; //Red

    ARouteItem.triLayer:= dxMapControl1.AddItemLayer as TdxMapItemLayer;
    ARouteItem.triLayer.MapItems.BeginUpdate;

    ARouteItem.triMapDotBetween:= TList<MapDotItem>.Create;
    ARouteItem.triMapDot:= TList<TdxMapDot>.Create;

    AMapDot:= ARouteItem.triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
    AMapDot.Location.GeoPoint:= CurrentCursorGeoPoint;
    AMapDot.Visible:= False;
    ARouteItem.triMapDot.Add(AMapDot);

    (* EndPoint, use for mouse cursor move *)
    AMapDot:= ARouteItem.triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
    AMapDot.Location.GeoPoint:= CurrentCursorGeoPoint;
    AMapDot.Visible:= False;
    ARouteItem.triMapDot.Add(AMapDot);

    ARouteItem.triPolyline:=ARouteItem.triLayer.AddItem(TdxMapPolyline) as TdxMapPolyline;
    ARouteItem.triPolyline.GeoPoints.Add.GeoPoint:=CurrentCursorGeoPoint;
    ARouteItem.triPolyline.GeoPoints.Add.GeoPoint:=CurrentCursorGeoPoint; //EndPoint, use for mouse cursor move
    ARouteItem.triPolyline.Style.BorderColor:= ARouteItem.triPolylineColor; //Red
    ARouteItem.triPolyline.Style.BorderWidth := 1;
    ARouteItem.triPolyline.StyleHot.BorderColor:= ARouteItem.triPolylineColor; //Red
    ARouteItem.triPolyline.StyleHot.BorderWidth := 1;
    ARouteItem.triPolyline.StyleSelected.BorderColor:= ARouteItem.triPolylineColor; //Red
    ARouteItem.triPolyline.StyleSelected.BorderWidth := 1;
    ARouteItem.triPolyline.Visible:= True;

    ARouteItem.triLayer.Visible:= True;
    ARouteItem.triLayer.MapItems.EndUpdate;

    FRoutes.Add(ARouteItem);

    FIDSelectedRoute := FRoutes.Count-1;
    FIDSelectedMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
    {$ENDREGION}
  end else begin
    if ((FIDSelectedRoute <> -1) and (FIDSelectedMapDot = -1)) then begin
      {$REGION 'Add new first MapDot to route if it was deleted'}
      FRoutes[FIDSelectedRoute].triLayer.MapItems.BeginUpdate;

      (*Add new end MapDot*)
      AMapDot:= FRoutes[FIDSelectedRoute].triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
      AMapDot.Location.GeoPoint:= CurrentCursorGeoPoint;
      AMapDot.Visible:= False;
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot);
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot); //EndPoint, use for mouse cursor move

      (*Add new MapDot to Polyline*)
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=CurrentCursorGeoPoint;
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=CurrentCursorGeoPoint; //EndPoint, use for mouse cursor move

      FRoutes[FIDSelectedRoute].triLayer.MapItems.EndUpdate;

      FIDSelectedMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
      {$ENDREGION}
    end else begin
      {$REGION 'Add new MapDot to route (not first)'}
      FRoutes[FIDSelectedRoute].triLayer.MapItems.BeginUpdate;

      (*Last MapDot which moved with cursor*)
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedMapDot].Location.GeoPoint:=CurrentCursorGeoPoint;

      (*Add new end MapDot*)
      AMapDot:= FRoutes[FIDSelectedRoute].triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
      AMapDot.Location.GeoPoint:= CurrentCursorGeoPoint;
      AMapDot.Visible:= False;
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot);

      (*Add new MapDot to Polyline*)
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedMapDot].GeoPoint:= CurrentCursorGeoPoint;
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=CurrentCursorGeoPoint;

      FRoutes[FIDSelectedRoute].triLayer.MapItems.EndUpdate;

      FIDSelectedMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
      {$ENDREGION}
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Rectangle'}
procedure TMainForm.actRectangleAddExecute(Sender: TObject);
begin
  SetAllActionsFalse;
  FAddRectangle := True;
end;

procedure TMainForm.actRectangleCreateExecute(Sender: TObject);
begin
  SetAllActionsFalse;
end;

procedure TMainForm.AddRectangle;
var
  ARectangleItem : RectangleItem;
begin
  if (FIDSelectedRectangle = -1) then begin
    ARectangleItem.trtRectangleName:= '';
    ARectangleItem.trtRectangleType:= '';
    ARectangleItem.trtRectangleColor:= $3F777700; //Green

    ARectangleItem.trtLayer:= dxMapControl1.AddItemLayer as TdxMapItemLayer;
    ARectangleItem.trtLayer.MapItems.BeginUpdate;

    ARectangleItem.trtRectangle:= ARectangleItem.trtLayer.MapItems.Add(TdxMapPolygon) as TdxMapPolygon;
    ARectangleItem.trtRectangle.GeoPoints.Add.GeoPoint:= CurrentCursorGeoPoint;
    ARectangleItem.trtRectangle.GeoPoints.Add.GeoPoint:= CurrentCursorGeoPoint;
    ARectangleItem.trtRectangle.GeoPoints.Add.GeoPoint:= CurrentCursorGeoPoint;
    ARectangleItem.trtRectangle.GeoPoints.Add.GeoPoint:= CurrentCursorGeoPoint;

    ARectangleItem.trtRectangle.Style.Color:= ARectangleItem.trtRectangleColor; //Green
    ARectangleItem.trtRectangle.Style.BorderColor:= ARectangleItem.trtRectangleColor; //Green
    ARectangleItem.trtRectangle.Style.BorderWidth := 1;
    ARectangleItem.trtRectangle.StyleHot.Color:= $3F007777; //
    ARectangleItem.trtRectangle.StyleHot.BorderColor:= $3F007777; //
    ARectangleItem.trtRectangle.StyleHot.BorderWidth := 1;
    ARectangleItem.trtRectangle.StyleSelected.Color:= $3F770077; //
    ARectangleItem.trtRectangle.StyleSelected.BorderColor:= $3F770077; //
    ARectangleItem.trtRectangle.StyleSelected.BorderWidth := 1;
    ARectangleItem.trtRectangle.Visible:= True;

    ARectangleItem.trtLayer.Visible:= True;
    ARectangleItem.trtLayer.MapItems.EndUpdate;

    FRectangles.Add(ARectangleItem);

    FIDSelectedRectangle := FRectangles.Count-1;
  end;
end;
{$ENDREGION}

procedure TMainForm.dxMapControl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FCurrentCursorPos := Point(X, Y);

  {$REGION 'Pushpin'}
  if FAddPushpin then begin
    AddPushpin;
  end;
  {$ENDREGION}

  {$REGION 'Route'}
  if FAddRoute then begin
    AddRoute;
  end;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  if FAddRectangle then begin
    AddRectangle;
  end;
  {$ENDREGION}
end;

procedure TMainForm.dxMapControl1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin

  {$REGION 'Pushpin'}
  if (FIDMovePushpin <> -1) then begin
    FCurrentCursorPos:= Point(X, Y);
    FPushpin[FIDMovePushpin].tppPushpin.Location.GeoPoint:= CurrentCursorGeoPoint;
  end;
  {$ENDREGION}

  {$REGION 'Route'}
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedMapDot <> -1))
  then begin
    FCurrentCursorPos:= Point(X, Y);
    FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedMapDot].GeoPoint:= CurrentCursorGeoPoint;
  end;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  if ((FAddRectangle) and (FIDSelectedRectangle <> -1))
  then begin
    FCurrentCursorPos:= Point(X, Y);

    //////HERE

    FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints[1].GeoPoint:=
      dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(Point(X,
        Trunc(dxMapControl1ImageTileLayer1.GeoPointToScreenPoint(FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints[0].GeoPoint).Y)
            )));
    FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints[2].GeoPoint:=
      dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(  FCurrentCursorPos  ));
    FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints[3].GeoPoint:=
      dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(  Point(
         Trunc(dxMapControl1ImageTileLayer1.GeoPointToScreenPoint(FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints[0].GeoPoint).X)
       , Y )  ));
  end;
  {$ENDREGION}
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  {$REGION 'Pushpin'}
  FPushpin := TList<PushpinItem>.Create;
  {$ENDREGION}

  {$REGION 'Route'}
  FRoutes:=TList<RouteItem>.Create;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  FRectangles:=TList<RectangleItem>.Create;
  {$ENDREGION}

  SetAllActionsFalse;
end;

procedure TMainForm.PopupMenu1Popup(Sender: TObject);
begin
  {$REGION 'Pushpin'}
  if dxMapControl1.HitTest.HitObject is TdxMapPushpinViewInfo then
    FSelectedPushpin := TdxMapPushpinViewInfo(dxMapControl1.HitTest.HitObject).Item as TdxMapPushpin
  else
    FSelectedPushpin := nil;

  actPushpinMove.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin = -1);
  actPushinMoveSave.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin <> -1);
  actPushinMoveRollback.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin <> -1);
  actPushpinDelete.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin = -1);
  {$ENDREGION}

  {$REGION 'Route'}
  if dxMapControl1.HitTest.HitObject is TdxMapDotViewInfo then
    FSelectedMapDot := TdxMapDotViewInfo(dxMapControl1.HitTest.HitObject).Item as TdxMapDot
  else
    FSelectedMapDot := nil;

  actRouteCreate.Visible := (FAddRoute) and (FRoutes[FIDSelectedRoute].triMapDot.Count-1 >= 1);
  actRouteRemoveLastPoint.Visible := (FAddRoute) and (FRoutes[FIDSelectedRoute].triMapDot.Count-1 >= 1);
  actRouteCreateCancel.Visible := (FAddRoute);
  {$ENDREGION}

  {$REGION 'Rectangle'}
  actRectangleCreate.Visible := (FAddRectangle) and (FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints.Count-1 >= 3);
  {$ENDREGION}
end;

end.

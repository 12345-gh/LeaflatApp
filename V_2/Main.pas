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
  dxStatusBar, dxRibbonStatusBar, cxContainer, cxEdit,
   cxSplitter, cxGroupBox, dxSkinscxPCPainter, dxBarBuiltInMenu,
  cxPC, Vcl.StdCtrls, cxCheckListBox,

  Generics.Collections, dxMapItem, dxCustomMapItemLayer, dxMapItemLayer,
  dxMapLayer, dxMapImageTileLayer, dxMapControlOpenStreetMapImageryDataProvider,
  System.Actions, Vcl.ActnList, cxGeometry, cxListBox, Vcl.Menus, cxCheckBox,
  dxCoreGraphics, Types, System.Math, dxMapControl, UITypes,
  RCPopupMenu,  dxMapControlTypes,
  (* DX *)
  (* Delphi *)
  (* User *)
  uListItemRecord, uMapItemCRUD, uListItemCRUD;

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
    ppmMapControl: TPopupMenu;
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
    actRectangleCreateCancel: TAction;
    N9: TMenuItem;
    dxBarLargeButton2: TdxBarLargeButton;
    actPolygonAdd: TAction;
    actPolygonCreate: TAction;
    N10: TMenuItem;
    actPolygonRemoveLastPoint: TAction;
    N11: TMenuItem;
    actPolygonCreateCancel: TAction;
    N12: TMenuItem;
    dxMapControl1ItemLayer1: TdxMapItemLayer;
    actRouteEdit: TAction;
    N13: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ppmMapControlPopup(Sender: TObject);
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
    procedure actRectangleCreateCancelExecute(Sender: TObject);
    procedure dxMapControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actPolygonAddExecute(Sender: TObject);
    procedure actPolygonCreateExecute(Sender: TObject);
    procedure actPolygonRemoveLastPointExecute(Sender: TObject);
    procedure actPolygonCreateCancelExecute(Sender: TObject);
    procedure actRouteEditExecute(Sender: TObject);
    procedure dxMapControl1Click(Sender: TObject);
  private
    { Private declarations }
    RCPopupMenuMapControl: TRCPopupMenu;

    (*Variable*)
    FMapControl: TdxMapControl;
    FImageTileLayer : TdxMapImageTileLayer;
    FCurrentCursorPos : TPoint;
    FMouseDown: Boolean;
    FMouseMoveWhenMouseDown: Boolean;

    {$REGION 'Pushpin Variable'}
    FPushpin : TList<PushpinItem>;    // Main list of Pushpin
    FAddPushpin : Boolean;            // If press button on ribbon panel
    FSelectedPushpin : TdxMapPushpin; // Selected pushpin
    FIDMovePushpin : Integer;         // id Pushpin in FPushpin list
    FMovePushpinOldGeopoint : TdxMapControlGeoPoint; // Geopoint before 'move' used
    {$ENDREGION}

    {$REGION 'Route Variable'}
    FRoutes : TList<RouteItem>;       // Main list of routes

    FAddRoute : Boolean;             // If press button on ribbon panel

    FEditRoute : Boolean;             // If select edit action
    FMiddleGeoPointItem : TList<TdxMapDot>;

    FIDSelectedRoute : integer;
    FIDSelectedRouteMapDot : integer;
    FIDSelectedMiddleGeoPointItemMapDot : integer;

    {$ENDREGION}

    {$REGION 'Rectangle Variable'}
    FRectangles : TList<RectangleItem>; // Main list of rectangle
    FAddRectangle : Boolean;            // If press button on ribbon panel

    FIDSelectedRectangle : integer;

    {$ENDREGION}

    {$REGION 'Polygone'}
    FPolygones : TList<PolygonItem>; // Main list of polygone
    FAddPolygon : Boolean;            // If press button on ribbon panel

    FIDSelectedPolygon : integer;

    FIDSelectedPolygonGeoPoint : integer;      // Selected MapDot
    {$ENDREGION}

    (*Procedure / Function*)
    procedure CheckAllActionsFalse;
    procedure SetAllActionsFalse;

    {$REGION 'Pushpin procedure / function'}
    procedure AddPushpinItemToList;
    {$ENDREGION}

    {$REGION 'Route procedure / function'}
    procedure AddRouteItemToList;
    {$ENDREGION}

    {$REGION 'Rectangle procedure / function'}
    procedure AddRectangle;
    {$ENDREGION}

    {$REGION 'Polygon procedure / function'}
    procedure AddPolygon;
    {$ENDREGION}

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  ufmPushpinEdit, ufmRouteAdd, ufmRectangleAdd, ufmPolygonAdd;

{$R *.dfm}

{$REGION 'Procedure / Function'}


procedure TMainForm.CheckAllActionsFalse;
const
  QAddPushpin = 'Сохранить изменение добавления булавки?';
  QAddRoute = 'Сохранить изменение добавления маршрута?';
  QAddRectangle = 'Сохранить изменение добавления прямоугольника?';
begin
  {$REGION 'Pushpin'}
  if ((FAddPushpin = True) and (FIDMovePushpin <> -1)) then begin
    if (MessageDlg(QAddPushpin,mtConfirmation, mbOKCancel, 0) = mrOk) then begin
      AddPushpinItemToList
    end else begin
      SetAllActionsFalse;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Route'}
  if ((FAddRoute = True) and (FIDSelectedRoute <> -1)) then begin
    if (FIDSelectedRouteMapDot <> -1) then begin
      if (MessageDlg(QAddRoute,mtConfirmation, mbOKCancel, 0) = mrOk) then begin
        AddRouteItemToList;
        actRouteCreateExecute(Self)
      end else begin
        actRouteCreateCancelExecute(Self);
      end;
    end else begin
      actRouteCreateCancelExecute(Self);
    end;
  end;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  if ((FAddRectangle = True) and (FIDSelectedRectangle <> -1)) then begin
    if (MessageDlg(QAddRectangle,mtConfirmation, mbOKCancel, 0) = mrOk) then begin
      actRectangleCreateExecute(Self)
    end else begin
      actRectangleCreateCancelExecute(Self);
    end;
  end;
  {$ENDREGION}

  SetAllActionsFalse;
end;

procedure TMainForm.SetAllActionsFalse;
begin
  FAddPushpin := False;
  FIDMovePushpin := -1;

  FAddRoute := False;
  FIDSelectedRoute := -1;
  FIDSelectedRouteMapDot := -1;
  FIDSelectedMiddleGeoPointItemMapDot := -1;

  FAddRectangle := False;
  FIDSelectedRectangle := -1;

  FAddPolygon := False;
  FIDSelectedPolygon := -1;
  FIDSelectedPolygonGeoPoint := -1;
end;
{$ENDREGION}

{$REGION 'Pushpin procedure / function'}
procedure TMainForm.AddPushpinItemToList;
var
  AfmPushinAdd: TfmPushpinEdit;
  APushpinItem : PushpinItem;
begin
  Application.CreateForm(TfmPushpinEdit, AfmPushinAdd);
  AfmPushinAdd.cxteName.Text := 'Pushpin ' + IntToStr(FPushpin.Count+1);
  AfmPushinAdd.cxteType.Text := 'Pushpin type ' + IntToStr(FPushpin.Count+1);
  if AfmPushinAdd.ShowModal=mrOk
    then begin
      APushpinItem.tppPushpinName:= AfmPushinAdd.cxteName.Text;
      APushpinItem.tppPushpinType:= AfmPushinAdd.cxteType.Text;
      APushpinItem.tppLayer:= CreateItemLayer(FMapControl);

      APushpinItem.tppLayer.MapItems.BeginUpdate;

      APushpinItem.tppPushpin:= CreatePushpin(APushpinItem.tppLayer);
      APushpinItem.tppPushpin.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      APushpinItem.tppPushpin.Text:= AfmPushinAdd.cxteName.Text;

      APushpinItem.tppLayer.Visible:= True;
      APushpinItem.tppLayer.MapItems.EndUpdate;

      FPushpin.Add(APushpinItem);
    end;

  SetAllActionsFalse;
  AfmPushinAdd.Destroy;
  AfmPushinAdd:=nil;
end;

procedure TMainForm.actPushpinAddExecute(Sender: TObject);
begin
  CheckAllActionsFalse;
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
  FPushpin[FIDMovePushpin].tppPushpin.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
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

      for J:=0 to FMapControl.Layers.Count-1 do begin
        if (FMapControl.Layers[J].Equals(FPushpin[I].tppLayer) = True) then begin
          FMapControl.Layers.Delete(J);
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
  CheckAllActionsFalse;
  SetAllActionsFalse;
  FAddRoute := True;
end;

procedure TMainForm.actRouteCreateExecute(Sender: TObject);
var
  AfmRouteAdd: TfmRouteAdd;
  ARouteItem: RouteItem;
  ACustomElementGeoPoint: TdxMapControlGeoPoint;
  I: integer;
begin
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedRouteMapDot <> -1)) then begin
    Application.CreateForm(TfmRouteAdd, AfmRouteAdd);
    AfmRouteAdd.cxteName.Text := 'Route ' + IntToStr(FRoutes.Count);
    AfmRouteAdd.cxteType.Text := 'Route type ' + IntToStr(FRoutes.Count);
    if AfmRouteAdd.ShowModal=mrOk then begin

      ARouteItem:=FRoutes[FIDSelectedRoute];

      with ARouteItem do begin
        triRouteName:= AfmRouteAdd.cxteName.Text;
        triRouteType:= AfmRouteAdd.cxteType.Text;

        triLayer.MapItems.BeginUpdate;

        triCustomElement:= triLayer.MapItems.Add(TdxMapCustomElement) as TdxMapCustomElement;
        ACustomElementGeoPoint.Latitude:= triMapDot[0].Location.GeoPoint.Latitude;
        ACustomElementGeoPoint.Longitude:= triMapDot[0].Location.GeoPoint.Longitude+0.025;
        triCustomElement.Location.GeoPoint:= ACustomElementGeoPoint;
        triCustomElement.Text:= triRouteName;
        triCustomElement.ImageVisible:= False;
        triCustomElement.Visible:= True;

        for I:=0 to triMapDot.Count-1 do begin
          triMapDot[I].Hint:=triRouteName;
          triMapDot[I].Size:= 4;
          triMapDot[I].Style.BorderColor:= $FFF20000;
          triMapDot[I].Style.BorderWidth:= 2;
          triMapDot[I].Style.Color:= $FFF2FF00;
          triMapDot[I].Visible:= True;
        end;

        triPolyline.Hint:=triRouteName;

        SetPolylineItemStyle(triPolyline, AfmRouteAdd.dxceColor.ColorValue, $FFFFFF, 3, False); // SET COLOR

        triPolylineColor:= AfmRouteAdd.dxceColor.ColorValue;

        triLayer.MapItems.EndUpdate;
      end;

      FRoutes[FIDSelectedRoute]:= ARouteItem;
    end else begin
      actRouteCreateCancelExecute(Self);
    end;

    SetAllActionsFalse;
    AfmRouteAdd.Destroy;
    AfmRouteAdd:=nil;
  end;
end;

procedure TMainForm.actRouteEditExecute(Sender: TObject);
var
  I : Integer;
  ARouteItem: RouteItem;
begin
  if (FIDSelectedRoute <> -1) then begin
    FEditRoute := True;

    ARouteItem:=FRoutes[FIDSelectedRoute];

    FMiddleGeoPointItem := TList<TdxMapDot>.Create;

    with ARouteItem do begin
      triLayer.MapItems.BeginUpdate;
      triCustomElement.Visible:= False;

      for I:=0 to triMapDot.Count-1 do begin
        SetMapDotItemStyle(triMapDot[I], $0000FF, $0000FF, 2, True); // RED COLOR
        triMapDot[I].Visible:= True;
      end;

      // Create middle geopoint list
      FMiddleGeoPointItem := CreateMiddleGeoPointItemList(triMapDot, triLayer);

      SetPolylineItemStyle(triPolyline, $0000FF, $0000FF, 1, True); // RED COLOR
      
      triLayer.MapItems.EndUpdate;
    end;
  end;
end;

procedure TMainForm.actRouteCreateCancelExecute(Sender: TObject);
var
  I: integer;
begin
  if ((FAddRoute) and (FIDSelectedRoute <> -1)) then begin
    for I:=0 to FMapControl.Layers.Count-1 do begin
      if (FMapControl.Layers[I].Equals(FRoutes[FIDSelectedRoute].triLayer) = True) then begin
        FMapControl.Layers.Delete(I);
        Break;
      end;
    end;

    FRoutes.Delete(FIDSelectedRoute);
    FRoutes.TrimExcess;
    SetAllActionsFalse;
  end else begin
    (* Work when only press to menu button 'Create Route' *)
    SetAllActionsFalse;
  end;
end;

procedure TMainForm.actRouteRemoveLastPointExecute(Sender: TObject);
begin
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedRouteMapDot <> -1))
  then begin
    DeleteRoutePoint(FRoutes, FIDSelectedRoute, FIDSelectedRouteMapDot);
    FIDSelectedRouteMapDot:= FIDSelectedRouteMapDot - 1;
  end;
end;

procedure TMainForm.AddRouteItemToList;
var
  ARouteItem : RouteItem;
  AMapDot: TdxMapDot;
begin
  if ((FIDSelectedRoute = -1) and (FIDSelectedRouteMapDot = -1)) then begin
    {$REGION 'Init new route'}
    with ARouteItem do begin
      triRouteName:= '';
      triRouteType:= '';
      triPolylineColor:= $0000FF; // RED COLOR

      triLayer:= CreateItemLayer(FMapControl);
      triLayer.MapItems.BeginUpdate;

      triMapDot:= TList<TdxMapDot>.Create;

      AMapDot:= CreateMapDot(triLayer);
      AMapDot.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      AMapDot.Visible:= False;
      triMapDot.Add(AMapDot);

      (* EndPoint, use for mouse cursor move *)
      AMapDot:= CreateMapDot(triLayer);
      AMapDot.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      AMapDot.Visible:= False;
      triMapDot.Add(AMapDot);

      triPolyline := CreateMapPolyline(triLayer);

      triPolyline.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      triPolyline.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos); //EndPoint, use for mouse cursor move

      SetPolylineItemStyle(triPolyline, triPolylineColor, triPolylineColor, 1, False); // RED COLOR

      triPolyline.Visible:= True;

      triLayer.Visible:= True;
      triLayer.MapItems.EndUpdate;
    end;
    FRoutes.Add(ARouteItem);

    FIDSelectedRoute := FRoutes.Count-1;
    FIDSelectedRouteMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
    {$ENDREGION}
  end else begin
    if ((FIDSelectedRoute <> -1) and (FIDSelectedRouteMapDot = -1)) then begin
      {$REGION 'Add new first MapDot to route if it was deleted'}
      FRoutes[FIDSelectedRoute].triLayer.MapItems.BeginUpdate;

      (*Add new end MapDot*)
      AMapDot:= FRoutes[FIDSelectedRoute].triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
      AMapDot.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      AMapDot.Visible:= False;
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot);
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot); //EndPoint, use for mouse cursor move

      (*Add new MapDot to Polyline*)
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos); //EndPoint, use for mouse cursor move

      FRoutes[FIDSelectedRoute].triLayer.MapItems.EndUpdate;

      FIDSelectedRouteMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
      {$ENDREGION}
    end else begin
      {$REGION 'Add new MapDot to route (not first)'}
      FRoutes[FIDSelectedRoute].triLayer.MapItems.BeginUpdate;

      (*Last MapDot which moved with cursor*)
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      (*Add new end MapDot*)
      AMapDot:= FRoutes[FIDSelectedRoute].triLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
      AMapDot.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      AMapDot.Visible:= False;
      FRoutes[FIDSelectedRoute].triMapDot.Add(AMapDot);

      (*Add new MapDot to Polyline*)
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedRouteMapDot].GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      FRoutes[FIDSelectedRoute].triLayer.MapItems.EndUpdate;

      FIDSelectedRouteMapDot:= FRoutes[FIDSelectedRoute].triMapDot.Count-1;
      {$ENDREGION}
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Rectangle procedure / function'}
procedure TMainForm.actRectangleAddExecute(Sender: TObject);
begin
  CheckAllActionsFalse;
  SetAllActionsFalse;
  FAddRectangle := True;
end;

procedure TMainForm.actRectangleCreateCancelExecute(Sender: TObject);
var
  I: integer;
begin
  if ((FAddRectangle) and (FIDSelectedRectangle <> -1))
  then begin
    for I:=0 to FMapControl.Layers.Count-1 do begin
      if (FMapControl.Layers[I].Equals(FRectangles[FIDSelectedRectangle].trtLayer) = True) then begin
        FMapControl.Layers.Delete(I);
        Break;
      end;
    end;

    FRectangles.Delete(FIDSelectedRectangle);
    FRectangles.TrimExcess;

    SetAllActionsFalse;
  end;
end;

procedure TMainForm.actRectangleCreateExecute(Sender: TObject);
var
  AfmRectangleAdd: TfmRectangleAdd;
  ARectangleItem : RectangleItem;
  ACustomElementGeoPoint: TdxMapControlGeoPoint;
begin
  if ((FAddRectangle) and (FIDSelectedRectangle <> -1)) then begin
    Application.CreateForm(TfmRectangleAdd, AfmRectangleAdd);
    if AfmRectangleAdd.ShowModal=mrOk then begin

      ARectangleItem:=FRectangles[FIDSelectedRectangle];

      with ARectangleItem do begin
        trtRectangleName:= AfmRectangleAdd.cxteName.Text;;
        trtRectangleType:= AfmRectangleAdd.cxteType.Text;
        trtRectangleColor:= dxColorToAlphaColor(AfmRectangleAdd.dxceColor.ColorValue, AlphaChannelTransparent);

        trtLayer.MapItems.BeginUpdate;

        trtCustomElement:= trtLayer.MapItems.Add(TdxMapCustomElement) as TdxMapCustomElement;
        ACustomElementGeoPoint.Latitude:= trtRectangle.GeoPoints.Items[0].GeoPoint.Latitude;
        ACustomElementGeoPoint.Longitude:= trtRectangle.GeoPoints.Items[0].GeoPoint.Longitude+0.025;
        trtCustomElement.Location.GeoPoint:= ACustomElementGeoPoint;
        trtCustomElement.Text:= trtRectangleName;
        trtCustomElement.ImageVisible:= False;
        trtCustomElement.Visible:= True;

        trtRectangle.Style.Color:= trtRectangleColor; // SelectedColor
        trtRectangle.Style.BorderColor:= trtRectangleColor;
        trtRectangle.Style.BorderWidth := 1;
        trtRectangle.StyleHot.Color:= trtRectangleColor; // SelectedColor
        trtRectangle.StyleHot.BorderColor:= trtRectangleColor;
        trtRectangle.StyleHot.BorderWidth := 1;
        trtRectangle.StyleSelected.Color:= trtRectangleColor; // SelectedColor
        trtRectangle.StyleSelected.BorderColor:= trtRectangleColor;
        trtRectangle.StyleSelected.BorderWidth := 1;
        trtRectangle.Visible:= True;

        trtLayer.MapItems.EndUpdate;
      end;

      FRectangles[FIDSelectedRectangle]:= ARectangleItem;
    end else begin
      actRectangleCreateCancelExecute(Self);
    end;

    SetAllActionsFalse;
    AfmRectangleAdd.Destroy;
    AfmRectangleAdd:=nil;
  end;
end;

procedure TMainForm.AddRectangle;
var
  ARectangleItem : RectangleItem;
begin
  if (FIDSelectedRectangle = -1) then begin
    with ARectangleItem do begin
      trtRectangleName:= '';
      trtRectangleType:= '';
      trtRectangleColor:= $3F770000; //Red

      trtLayer:= CreateItemLayer(FMapControl);
      trtLayer.MapItems.BeginUpdate;

      trtRectangle:= trtLayer.MapItems.Add(TdxMapPolygon) as TdxMapPolygon;
      trtRectangle.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      trtRectangle.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      trtRectangle.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      trtRectangle.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      trtRectangle.Style.Color:= trtRectangleColor; //Red
      trtRectangle.Style.BorderColor:= trtRectangleColor; //Red
      trtRectangle.Style.BorderWidth := 1;
      trtRectangle.StyleHot.Color:= trtRectangleColor; //Red
      trtRectangle.StyleHot.BorderColor:= trtRectangleColor; //Red
      trtRectangle.StyleHot.BorderWidth := 1;
      trtRectangle.StyleSelected.Color:= trtRectangleColor; //Red
      trtRectangle.StyleSelected.BorderColor:= trtRectangleColor; //Red
      trtRectangle.StyleSelected.BorderWidth := 1;
      trtRectangle.Visible:= True;

      trtLayer.Visible:= True;
      trtLayer.MapItems.EndUpdate;
    end;

    FRectangles.Add(ARectangleItem);

    FIDSelectedRectangle := FRectangles.Count-1;
  end;

end;
{$ENDREGION}


{$REGION 'Polygone procedure / function'}
procedure TMainForm.actPolygonAddExecute(Sender: TObject);
begin
  CheckAllActionsFalse;
  SetAllActionsFalse;
  FAddPolygon := True;
end;

procedure TMainForm.AddPolygon;
var
  APolygonItem : PolygonItem;
begin
  if ((FIDSelectedPolygon = -1) and (FIDSelectedPolygonGeoPoint = -1)) then begin
    {$REGION 'Init new polygon'}
    with APolygonItem do begin
      tpgPolygoneName:= '';
      tpgPolygoneType:= '';
      tpgPolygoneColor:= $3F770000; //Red

      tpgLayer:= CreateItemLayer(FMapControl);
      tpgLayer.MapItems.BeginUpdate;

      tpgPolygone:= tpgLayer.MapItems.Add(TdxMapPolygon) as TdxMapPolygon;
      tpgPolygone.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      tpgPolygone.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      tpgPolygone.Style.Color:= tpgPolygoneColor; //Red
      tpgPolygone.Style.BorderColor:= tpgPolygoneColor; //Red
      tpgPolygone.Style.BorderWidth := 1;
      tpgPolygone.StyleHot.Color:= tpgPolygoneColor; //Red
      tpgPolygone.StyleHot.BorderColor:= tpgPolygoneColor; //Red
      tpgPolygone.StyleHot.BorderWidth := 1;
      tpgPolygone.StyleSelected.Color:= tpgPolygoneColor; //Red
      tpgPolygone.StyleSelected.BorderColor:= tpgPolygoneColor; //Red
      tpgPolygone.StyleSelected.BorderWidth := 1;
      tpgPolygone.Visible:= True;

      tpgLayer.Visible:= True;
      tpgLayer.MapItems.EndUpdate;
    end;

    FPolygones.Add(APolygonItem);

    FIDSelectedPolygon := FPolygones.Count-1;
    FIDSelectedPolygonGeoPoint := FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Count-1;
    {$ENDREGION}
  end else begin
    if ((FIDSelectedPolygon <> -1) and (FIDSelectedPolygonGeoPoint = -1)) then begin
      {$REGION 'Add new first dot to polygon if it was deleted'}
      FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.BeginUpdate;

      (*Add new end dot*)
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos); //EndPoint, use for mouse cursor move

      (*Add new dot to Polyline*)
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Add.GeoPoint:=GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos); //EndPoint, use for mouse cursor move

      FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.EndUpdate;

      FIDSelectedPolygonGeoPoint:= FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Count-1;
      {$ENDREGION}
    end else begin
      {$REGION 'Add new dot to polygon (not first)'}
      FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.BeginUpdate;

      (*Last dot which moved with cursor*)
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints[FIDSelectedPolygonGeoPoint].GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      (*Add new end dot*)
      FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Add.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.EndUpdate;

      FIDSelectedPolygonGeoPoint:= FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Count-1;
      {$ENDREGION}
    end;
  end;

end;

procedure TMainForm.actPolygonCreateExecute(Sender: TObject);
const
  AlphaChannel = 100;
var
  AfmPolygonAdd: TfmPolygonAdd;
  APolygonItem: PolygonItem;
  ACustomElementGeoPoint: TdxMapControlGeoPoint;
//  I: integer;
begin
  if ((FAddPolygon) and (FIDSelectedPolygon <> -1) and (FIDSelectedPolygonGeoPoint <> -1)) then begin
    Application.CreateForm(TfmPolygonAdd, AfmPolygonAdd);
    if AfmPolygonAdd.ShowModal=mrOk then begin

      APolygonItem:=FPolygones[FIDSelectedPolygon];

      with APolygonItem do begin
        tpgPolygoneName:= AfmPolygonAdd.cxteName.Text;
        tpgPolygoneType:= AfmPolygonAdd.cxteType.Text;

        tpgLayer.MapItems.BeginUpdate;

        tpgCustomElement:= tpgLayer.MapItems.Add(TdxMapCustomElement) as TdxMapCustomElement;
        ACustomElementGeoPoint.Latitude:= tpgPolygone.GeoPoints[0].GeoPoint.Latitude;
        ACustomElementGeoPoint.Longitude:= tpgPolygone.GeoPoints[0].GeoPoint.Longitude+0.025;
        tpgCustomElement.Location.GeoPoint:= ACustomElementGeoPoint;
        tpgCustomElement.Text:= tpgPolygoneName;
        tpgCustomElement.ImageVisible:= False;
        tpgCustomElement.Visible:= True;

//        for I:=0 to triMapDot.Count-1 do begin
//          triMapDot[I].Hint:=triRouteName;
//          triMapDot[I].Size:= 4;
//          triMapDot[I].Style.BorderColor:= $FFF20000;
//          triMapDot[I].Style.BorderWidth:= 2;
//          triMapDot[I].Style.Color:= $FFF2FF00;
//          triMapDot[I].Visible:= True;
//        end;

        tpgPolygone.Hint:=tpgPolygoneName;
        tpgPolygoneColor:= dxColorToAlphaColor(AfmPolygonAdd.dxceColor.ColorValue, AlphaChannel);
        tpgPolygone.Style.Color:= tpgPolygoneColor; // SelectedColor
        tpgPolygone.Style.BorderColor:= tpgPolygoneColor;
        tpgPolygone.Style.BorderWidth := 3;
        tpgPolygone.StyleHot.BorderColor:= $FFFFFFFF;
        tpgPolygone.StyleHot.BorderWidth := 3;
        tpgPolygone.StyleSelected.BorderColor:= $FFFFFFFF;
        tpgPolygone.StyleSelected.BorderWidth := 3;

        tpgLayer.MapItems.EndUpdate;
      end;

      FPolygones[FIDSelectedPolygon]:= APolygonItem;
    end else begin
      actPolygonCreateCancelExecute(Self);
    end;

    SetAllActionsFalse;
    AfmPolygonAdd.Destroy;
    AfmPolygonAdd:=nil;
  end;

end;

procedure TMainForm.actPolygonRemoveLastPointExecute(Sender: TObject);
begin
  if ((FAddPolygon) and (FIDSelectedPolygon <> -1) and (FIDSelectedPolygonGeoPoint <> -1))
  then begin
    FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.BeginUpdate;

    FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Delete(FIDSelectedPolygonGeoPoint);
    FIDSelectedPolygonGeoPoint:= FIDSelectedPolygonGeoPoint - 1;

    FPolygones[FIDSelectedPolygon].tpgLayer.MapItems.EndUpdate;
  end;
end;

procedure TMainForm.actPolygonCreateCancelExecute(Sender: TObject);
var
  I: integer;
begin
  if ((FAddPolygon) and (FIDSelectedPolygon <> -1)) then begin
    for I:=0 to FMapControl.Layers.Count-1 do begin
      if (FMapControl.Layers[I].Equals(FPolygones[FIDSelectedPolygon].tpgLayer) = True) then begin
        FMapControl.Layers.Delete(I);
        Break;
      end;
    end;

    FPolygones.Delete(FIDSelectedPolygon);
    FPolygones.TrimExcess;
    SetAllActionsFalse;
  end else begin
    (* Work when only press to menu button 'Create Route' *)
    SetAllActionsFalse;
  end;
end;
{$ENDREGION}

procedure TMainForm.dxMapControl1Click(Sender: TObject);
var
  I : Integer;
  FSelectedMapDot : TdxMapDot;
begin

  {$REGION 'Route'}
  if (FEditRoute)
      and ((FIDSelectedRouteMapDot = -1) or (FIDSelectedMiddleGeoPointItemMapDot = -1))
      and (FMouseMoveWhenMouseDown = False)
      and (FRoutes[FIDSelectedRoute].triMapDot.Count > 2)
      then begin

    // If selected MapDot which located above Polyline
    if (FMapControl.HitTest.HitObject is TdxMapDotViewInfo) then begin
      FSelectedMapDot := TdxMapDotViewInfo(FMapControl.HitTest.HitObject).Item as TdxMapDot;

      // If EditRoute enable - find MapDot in edit Route
      if (FIDSelectedRoute <> -1) then begin

        // Try find selected MapDot in Polyline list
        for I:=0 to FRoutes[FIDSelectedRoute].triMapDot.Count-1 do begin
          if FRoutes[FIDSelectedRoute].triMapDot[I].Equals(FSelectedMapDot) then begin
            FIDSelectedRouteMapDot := -1;
            DeleteRoutePoint(FRoutes, FIDSelectedRoute, I);



            {$REGION 'Recalculate MiddleGeoPointItem loacation'}
            // For first point in FRoutes[I] (not in FMiddleGeoPointItem)
            if (I = 0) then begin
              DeleteGeoPointItemMapDot(FRoutes[FIDSelectedRoute].triLayer,
                FMiddleGeoPointItem, I);
              FMiddleGeoPointItem[I].Location.GeoPoint:=GetMiddleGeoPoint(
                FRoutes[FIDSelectedRoute].triMapDot[I].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I].Location.GeoPoint.Longitude,
                FRoutes[FIDSelectedRoute].triMapDot[I+1].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I+1].Location.GeoPoint.Longitude
              );
            end;
            // Any middle point in FRoutes[I] (not in FMiddleGeoPointItem)
            if (I > 0)
                and (I < FRoutes[FIDSelectedRoute].triMapDot.Count) then begin
              DeleteGeoPointItemMapDot(FRoutes[FIDSelectedRoute].triLayer,
                FMiddleGeoPointItem, I);
              FMiddleGeoPointItem[I-1].Location.GeoPoint:=GetMiddleGeoPoint(
                FRoutes[FIDSelectedRoute].triMapDot[I-1].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I-1].Location.GeoPoint.Longitude,
                FRoutes[FIDSelectedRoute].triMapDot[I].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I].Location.GeoPoint.Longitude
              );
            end;
            // For last point in FRoutes[I] (not in FMiddleGeoPointItem)
            if (I = FRoutes[FIDSelectedRoute].triMapDot.Count) then begin
              DeleteGeoPointItemMapDot(FRoutes[FIDSelectedRoute].triLayer,
                FMiddleGeoPointItem, I-1);
              FMiddleGeoPointItem[I-2].Location.GeoPoint:=GetMiddleGeoPoint(
                FRoutes[FIDSelectedRoute].triMapDot[I-2].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I-2].Location.GeoPoint.Longitude,
                FRoutes[FIDSelectedRoute].triMapDot[I-1].Location.GeoPoint.Latitude,
                FRoutes[FIDSelectedRoute].triMapDot[I-1].Location.GeoPoint.Longitude
              );

            end;
            {$ENDREGION}


            Break;


          end;
        end;

//        // Try find selected MapDot in FMiddleGeoPointItem list
//        for I:=0 to FMiddleGeoPointItem.Count-1 do begin
//          if FMiddleGeoPointItem[I].Equals(FSelectedMapDot) then begin
//            FIDSelectedMiddleGeoPointItemMapDot := I;
//            FMapControl.OptionsBehavior.Scrolling:=False;
//          end;
//        end;

      end;

    end;
  end;
  {$ENDREGION}

end;

procedure TMainForm.dxMapControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I : Integer;
  FSelectedMapDot : TdxMapDot;
begin
  FMouseDown:= True;

  {$REGION 'Route'}
  if (FEditRoute) and ((FIDSelectedRouteMapDot = -1) or (FIDSelectedMiddleGeoPointItemMapDot = -1)) then begin

    // If selected MapDot which located above Polyline
    if (FMapControl.HitTest.HitObject is TdxMapDotViewInfo) then begin
      FSelectedMapDot := TdxMapDotViewInfo(FMapControl.HitTest.HitObject).Item as TdxMapDot;

      // If EditRoute enable - find MapDot in edit Route
      if (FIDSelectedRoute <> -1) then begin

        // Try find selected MapDot in Polyline list
        for I:=0 to FRoutes[FIDSelectedRoute].triMapDot.Count-1 do begin
          if FRoutes[FIDSelectedRoute].triMapDot[I].Equals(FSelectedMapDot) then begin
            FIDSelectedRouteMapDot := I;
            FMapControl.OptionsBehavior.Scrolling:=False;
          end;
        end;

        // Try find selected MapDot in FMiddleGeoPointItem list
        for I:=0 to FMiddleGeoPointItem.Count-1 do begin
          if FMiddleGeoPointItem[I].Equals(FSelectedMapDot) then begin
            FIDSelectedMiddleGeoPointItemMapDot := I;
            FMapControl.OptionsBehavior.Scrolling:=False;
          end;
        end;

      end;

    end;
  end;
  {$ENDREGION}

end;

procedure TMainForm.dxMapControl1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown:= False;
  FCurrentCursorPos := Point(X, Y);

  {$REGION 'Pushpin'}
  if ((FAddPushpin) and (FMouseMoveWhenMouseDown = False) and (Button <> TMouseButton.mbRight)) then begin
    AddPushpinItemToList;
  end;
  {$ENDREGION}

  {$REGION 'Route'}
  if ((FAddRoute) and (FMouseMoveWhenMouseDown = False) and (Button <> TMouseButton.mbRight)) then begin
    AddRouteItemToList;
  end;

  if (FEditRoute) then begin
    if ((FIDSelectedRoute <> -1) and (FIDSelectedRouteMapDot <> -1)) then begin
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Selected:=False;
    end;

    FMapControl.OptionsBehavior.Scrolling:=True;
    FIDSelectedRouteMapDot := -1;
    FIDSelectedMiddleGeoPointItemMapDot := -1;
  end;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  if ((FAddRectangle) and (FMouseMoveWhenMouseDown = False) and (Button <> TMouseButton.mbRight)) then begin
    AddRectangle;
  end;
  {$ENDREGION}

  {$REGION 'Polygon'}
  if ((FAddPolygon) and (FMouseMoveWhenMouseDown = False) and (Button <> TMouseButton.mbRight)) then begin
    AddPolygon;
  end;
  {$ENDREGION}

  FMouseMoveWhenMouseDown:= False;
end;

procedure TMainForm.dxMapControl1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FMouseDown = True then begin
    FMouseMoveWhenMouseDown:= True;
  end;

  {$REGION 'Pushpin'}
  if (FIDMovePushpin <> -1) then begin
    FCurrentCursorPos:= Point(X, Y);
    FPushpin[FIDMovePushpin].tppPushpin.Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
  end;
  {$ENDREGION}

  {$REGION 'Route'}
  if ((FAddRoute) and (FIDSelectedRoute <> -1) and (FIDSelectedRouteMapDot <> -1))
  then begin
    FCurrentCursorPos:= Point(X, Y);
    FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedRouteMapDot].GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
    FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
  end;

  if ((FEditRoute) and (FIDSelectedRoute <> -1))
  then begin
    if (FIDSelectedRouteMapDot <> -1) then begin
      FCurrentCursorPos:= Point(X, Y);
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedRouteMapDot].GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      {$REGION 'Recalculate MiddleGeoPointItem loacation'}
      // For first point in FRoutes[I] (not in FMiddleGeoPointItem)
      if (FIDSelectedRouteMapDot = 0) then begin
        FMiddleGeoPointItem[FIDSelectedRouteMapDot].Location.GeoPoint:=GetMiddleGeoPoint(
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Longitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot+1].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot+1].Location.GeoPoint.Longitude
        );
      end;
      // Any middle point in FRoutes[I] (not in FMiddleGeoPointItem)
      if (FIDSelectedRouteMapDot > 0)
          and (FIDSelectedRouteMapDot < FRoutes[FIDSelectedRoute].triMapDot.Count-1) then begin
        FMiddleGeoPointItem[FIDSelectedRouteMapDot-1].Location.GeoPoint:=GetMiddleGeoPoint(
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot-1].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot-1].Location.GeoPoint.Longitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Longitude
        );
        FMiddleGeoPointItem[FIDSelectedRouteMapDot].Location.GeoPoint:=GetMiddleGeoPoint(
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Longitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot+1].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot+1].Location.GeoPoint.Longitude
        );
      end;
      // For last point in FRoutes[I] (not in FMiddleGeoPointItem)
      if (FIDSelectedRouteMapDot = FRoutes[FIDSelectedRoute].triMapDot.Count-1) then begin
        FMiddleGeoPointItem[FIDSelectedRouteMapDot-1].Location.GeoPoint:=GetMiddleGeoPoint(
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot-1].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot-1].Location.GeoPoint.Longitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Latitude,
          FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint.Longitude
        );
      end;
      {$ENDREGION}
    end;

    if (FIDSelectedMiddleGeoPointItemMapDot <> -1) then begin
      // ADD new FIDSelectedRouteMapDot
      // and DELETE FIDSelectedMiddleGeoPointItemMapDot
      // This code must be execute one times.
      FIDSelectedRouteMapDot := FIDSelectedMiddleGeoPointItemMapDot+1;
      FIDSelectedMiddleGeoPointItemMapDot := -1;

      FCurrentCursorPos:= Point(X, Y);

      // Add new Polyline.GeoPoints
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints.Insert(FIDSelectedRouteMapDot);
      FRoutes[FIDSelectedRoute].triPolyline.GeoPoints[FIDSelectedRouteMapDot].GeoPoint:=
        GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

      // Add new MapDot
      FRoutes[FIDSelectedRoute].triMapDot.Insert(FIDSelectedRouteMapDot,
        CreateMapDot(FRoutes[FIDSelectedRoute].triLayer));
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].Location.GeoPoint:=
        GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);
      FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot].ShapeKind:=mcskCircle;
      SetMapDotItemStyle(FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot], $0000FF, $0000FF, 2, True); // RED COLOR

      // Add new MiddleGeoPointItem
      FMiddleGeoPointItem.Insert(FIDSelectedRouteMapDot-1,
        CreateMiddleGeoPointItem(FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot-1],
                                 FRoutes[FIDSelectedRoute].triMapDot[FIDSelectedRouteMapDot],
                                 FRoutes[FIDSelectedRoute].triLayer));
      FMiddleGeoPointItem[FIDSelectedRouteMapDot].Selected:=False;
      SetMapDotItemStyle(FMiddleGeoPointItem[FIDSelectedRouteMapDot], $0000FF, $0000FF, 2, True); // RED COLOR
    end;
  end;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  if ((FAddRectangle) and (FIDSelectedRectangle <> -1))
  then begin
    FCurrentCursorPos:= Point(X, Y);

    //0   1
    //3   2
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

  {$REGION 'Polygon'}
  if ((FAddPolygon) and (FIDSelectedPolygon <> -1) and (FIDSelectedPolygonGeoPoint <> -1))
  then begin
    FCurrentCursorPos:= Point(X, Y);
    FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints[FIDSelectedPolygonGeoPoint].GeoPoint:= GetCurrentCursorGeoPoint(FImageTileLayer, FCurrentCursorPos);

  end;
  {$ENDREGION}
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  I: integer;
  PopupMenuItem : TMenuItem;
begin
  FMapControl:= dxMapControl1;
  FImageTileLayer:= dxMapControl1ImageTileLayer1;

  {$REGION 'Right Click PopupMenu'}
  (* This block make full copy ppmMapControl PopupMenu.
     It is need for disable Right Mouse Click,
     because TPopupMenu can not do this by default,
     so we create new component which can do this.

     ALL CHANGES NEED TO DO IN ppmMapControl, but
     if not in ActionList1 it must be write here for copy properties
  *)
  RCPopupMenuMapControl:=TRCPopupMenu.Create(Self);

  for I:=0 to ppmMapControl.Items.Count-1 do begin
    PopupMenuItem:=TMenuItem.Create(RCPopupMenuMapControl);
    PopupMenuItem.Action:=ppmMapControl.Items[I].Action;
    RCPopupMenuMapControl.Items.Add(PopupMenuItem);
  end;

  RCPopupMenuMapControl.OnPopup:= ppmMapControlPopup;

  FMapControl.PopupMenu:= RCPopupMenuMapControl;
  {$ENDREGION}


  {$REGION 'Pushpin'}
  FPushpin := TList<PushpinItem>.Create;
  {$ENDREGION}

  {$REGION 'Route'}
  FRoutes:=TList<RouteItem>.Create;
  {$ENDREGION}

  {$REGION 'Rectangle'}
  FRectangles:=TList<RectangleItem>.Create;
  {$ENDREGION}

  {$REGION 'Polygone'}
  FPolygones:=TList<PolygonItem>.Create;
  {$ENDREGION}

  SetAllActionsFalse;
end;

procedure TMainForm.ppmMapControlPopup(Sender: TObject);
var
  i, j : Integer;
  FSelectedMapDot : TdxMapDot;
  FSelectedPolyline : TdxMapPolyline;
begin
  {$REGION 'Pushpin'}
  if FMapControl.HitTest.HitObject is TdxMapPushpinViewInfo then
    FSelectedPushpin := TdxMapPushpinViewInfo(FMapControl.HitTest.HitObject).Item as TdxMapPushpin
  else
    FSelectedPushpin := nil;

  actPushpinMove.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin = -1);
  actPushinMoveSave.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin <> -1);
  actPushinMoveRollback.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin <> -1);
  actPushpinDelete.Visible := (FSelectedPushpin <> nil) and (FIDMovePushpin = -1);
  {$ENDREGION}

  {$REGION 'Route'}
  if ((FAddRoute) and (FIDSelectedRoute <> -1)) then begin
    actRouteCreate.Visible := (FAddRoute) and (FRoutes[FIDSelectedRoute].triMapDot.Count-1 >= 1);
    actRouteRemoveLastPoint.Visible := (FAddRoute) and (FRoutes[FIDSelectedRoute].triMapDot.Count-1 >= 1);
  end else begin
    actRouteCreate.Visible := False;
    actRouteRemoveLastPoint.Visible := False;
  end;
  actRouteCreateCancel.Visible := (FAddRoute);


  actRouteEdit.Visible := False; //Set false before click

  // If selected MapDot which located above Polyline
  if (FMapControl.HitTest.HitObject is TdxMapDotViewInfo) then begin
    FSelectedMapDot := TdxMapDotViewInfo(FMapControl.HitTest.HitObject).Item as TdxMapDot;

    if ((not FAddRoute) and (not FEditRoute)) then begin
      for i:=0 to FRoutes.Count-1 do begin
        for j:=0 to FRoutes[i].triMapDot.Count-1 do begin
          if FRoutes[i].triMapDot[j].Equals(FSelectedMapDot) then begin
            FIDSelectedRoute := i;
            actRouteEdit.Visible := True;
          end;
        end;
      end
    end;

    // this is code work just like menu
//    // If EditRoute enable - find MapDot in edit Route
//    if ((FEditRoute) and (FIDSelectedRoute <> -1)) then begin
//
//      // Try find selected MapDot in Polyline list
//      for I:=0 to FRoutes[FIDSelectedRoute].triMapDot.Count-1 do begin
//        if FRoutes[FIDSelectedRoute].triMapDot[I].Equals(FSelectedMapDot) then begin
//          FIDSelectedRouteMapDot := I;
//          //actRouteEdit.Visible := True;
//        end;
//      end;
//
//      // Try find selected MapDot in FMiddleGeoPointItem list
//      for I:=0 to FMiddleGeoPointItem.Count-1 do begin
//        if FMiddleGeoPointItem[I].mgiMapDot.Equals(FSelectedMapDot) then begin
//          FIDSelectedMiddleGeoPointItemMapDot := I;
//          //actRouteEdit.Visible := True;
//        end;
//      end;
//
//    end;

  end;

  // If selected Polyline
  if (FMapControl.HitTest.HitObject is TdxMapPolylineViewInfo) then begin
    FSelectedPolyline := TdxMapPolylineViewInfo(FMapControl.HitTest.HitObject).Item as TdxMapPolyline;

    if ((not FAddRoute) and (not FEditRoute)) then begin
      for i:=0 to FRoutes.Count-1 do begin
        if FRoutes[i].triPolyline.Equals(FSelectedPolyline) then begin
          FIDSelectedRoute := i;
          actRouteEdit.Visible := True;
        end;
      end;
    end;

  end;



  {$ENDREGION}

  {$REGION 'Rectangle'}
  actRectangleCreate.Visible := (FAddRectangle) and (FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints.Count-1 >= 3);
  actRectangleCreateCancel.Visible := (FAddRectangle) and (FRectangles[FIDSelectedRectangle].trtRectangle.GeoPoints.Count-1 >= 3);
  {$ENDREGION}

  {$REGION 'Polygone'}
  if ((FAddPolygon) and (FIDSelectedPolygon <> -1)) then begin
    actPolygonCreate.Visible :=
      (FAddPolygon) and (FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Count-1 >= 2);
    actPolygonRemoveLastPoint.Visible :=
      (FAddPolygon) and (FPolygones[FIDSelectedPolygon].tpgPolygone.GeoPoints.Count-1 >= 1);
  end else begin
    actPolygonCreate.Visible := False;
    actPolygonRemoveLastPoint.Visible := False;
  end;
  actPolygonCreateCancel.Visible := (FAddPolygon);
  {$ENDREGION}
end;

end.

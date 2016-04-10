unit LeaflatApp;

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
  dxSkinXmas2008Blue, dxMapControlTypes, dxMapControl,
  dxBingMapLocationDataService, dxBingMapRouteDataService,
  dxMapControlBingMapInformationProviders, dxMapControlInformationProvider,
  dxCustomMapItemLayer, dxMapItemLayer, cxClasses, dxMapLayer,
  dxMapImageTileLayer, dxMapControlBingMapImageryDataProvider,
  dxMapControlOpenStreetMapImageryDataProvider,

  Types, Math,
   Menus, Generics.Collections,

   ActnList,  StrUtils,
  dxMapItem, cxGeometry,  dxRestService,
  dxBingMapRESTService, dxBingMapRESTServiceStrs,
  ExtCtrls, dxScreenTip, dxCustomHint, cxHint, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, cxGroupBox, cxListBox, dxCore,
  cxButtons,
  dxCoreGraphics, cxSplitter, cxCheckListBox, dxGDIPlusClasses, cxImage,
  System.Actions;
type
  TMainForm = class(TForm)
    dxMapControl1: TdxMapControl;
    dxMapControl1ImageTileLayer1: TdxMapImageTileLayer;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    cxSplitter1: TcxSplitter;
    cxTextEdit1: TcxTextEdit;
    cxComboBox1: TcxComboBox;
    cxListBox1: TcxListBox;
    ActionList1: TActionList;
    actAddStartPoint: TAction;
    actDeletePoint: TAction;
    actChangeStartPoint: TAction;
    actClearAllPoint: TAction;
    actSetAsStartPoint: TAction;
    actSetAsEndPoint: TAction;
    dxMapControl1ItemLayer1: TdxMapItemLayer;
    PopupMenu1: TPopupMenu;
    AddEndPoint1: TMenuItem;
    actAddNextPoint: TAction;
    dxMapControl1BingMapReverseGeoCodingDataProvider1: TdxMapControlBingMapReverseGeoCodingDataProvider;
    ChangeStartPoint1: TMenuItem;
    dxMapControl1BingMapGeoCodingDataProvider1: TdxMapControlBingMapGeoCodingDataProvider;
    dxMapControl1BingMapRouteDataProvider1: TdxMapControlBingMapRouteDataProvider;
    AddMiddlePoint1: TMenuItem;
    DeletePoint1: TMenuItem;
    Clear1: TMenuItem;
    SetAsEndPoint1: TMenuItem;
    SetAsEndPoint2: TMenuItem;
    dxMapControl1BingMapMajorRoadRouteDataProvider1: TdxMapControlBingMapMajorRoadRouteDataProvider;
    procedure FormCreate(Sender: TObject);
    procedure actAddStartPointExecute(Sender: TObject);
    procedure dxMapControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure actAddNextPointExecute(Sender: TObject);
    procedure dxMapControl1BingMapReverseGeoCodingDataProvider1Response(
      Sender: TObject; AResponse: TdxBingMapLocationDataServiceResponse;
      var ADestroyResponse: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actChangeStartPointExecute(Sender: TObject);
    procedure dxMapControl1BingMapRouteDataProvider1Response(Sender: TObject;
      AResponse: TdxBingMapRouteDataServiceResponse;
      var ADestroyResponse: Boolean);
    procedure actDeletePointExecute(Sender: TObject);
    procedure actClearAllPointExecute(Sender: TObject);
    procedure actSetAsStartPointExecute(Sender: TObject);
    procedure actSetAsEndPointExecute(Sender: TObject);
    procedure dxMapControl1BingMapGeoCodingDataProvider1Response(
      Sender: TObject; AResponse: TdxBingMapLocationDataServiceResponse;
      var ADestroyResponse: Boolean);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);

    procedure cxComboBox1PropertiesEditValueChanged(Sender: TObject);
private
    { Private declarations }
    (* Array / List *)
    FRoutePins: TList<TdxMapPushpin>;
    FMajorRoadPins: TList<TdxMapPushpin>;
    FRoutes: TList<TdxMapPolyline>;
    FMapDot: TList<TdxMapDot>;
    FSearchPins: TList<TdxMapPushpin>;

    (* Global variable *)
    FHotPushpin: TdxMapPushpin;
    FCurrentCursorPos: TPoint;
    FAddedItemAddress: string;
    FIsMajorRoadMode: Boolean; // If we want find way from highway

    FSearchText: string;

    FRouteDataServiceResponse: TdxBingMapRouteDataServiceResponse;
    FRouteFromMajorRoadsDataServiceResponse: TdxBingMapRouteDataServiceResponse;

    function CreatePushpin: TdxMapPushpin;
//    function CreateMapDot: TdxMapDot;
    procedure CreateBingRouteLine(ARoute: TdxBingMapRouteInfo);

    procedure StopRouteProviders;

    function GetCurrentCursorGeoPoint: TdxMapControlGeoPoint;
    function GetPinLetter(ANumber: Integer): string;
    procedure CheckWaypointTexts(AItems: TList<TdxMapPushpin>);
    function GetTravelDistanceStr(ADistanceInKilometers: Double): string;
    function GetTravelDurationStr(ATimeInSeconds: Double): string;
    function CheckResponse(AResponse: TdxBingMapResponse): Boolean;

    procedure ClearMapItems<T:TdxMapItem>(AItems: TList<T>);
    procedure ClearAllRouteInfo;
    procedure ClearAllPins;
    procedure ClearRoutePath;

    procedure CalculateRoute;

  public
    { Public declarations }
    property CurrentCursorGeoPoint: TdxMapControlGeoPoint read GetCurrentCursorGeoPoint;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses CommonUnit;

{$REGION 'Create (procedure and function)'}
  function TMainForm.CreatePushpin: TdxMapPushpin;
  begin
    Result := dxMapControl1ItemLayer1.MapItems.Add(TdxMapPushpin) as TdxMapPushpin;
  end;

  procedure TMainForm.cxTextEdit1PropertiesChange(Sender: TObject);
  begin
    if FSearchText <> cxTextEdit1.EditingText then
    begin
      FSearchText := cxTextEdit1.EditingText;
      dxMapControl1BingMapGeoCodingDataProvider1.CancelRequests;
      ClearMapItems<TdxMapPushpin>(FSearchPins);
      if FSearchText <> '' then
        dxMapControl1BingMapGeoCodingDataProvider1.SearchAsync(FSearchText);
    end;
  end;

//  function TMainForm.CreateMapDot: TdxMapDot;
//  begin
//    Result := dxMapControl1ItemLayer1.MapItems.Add(TdxMapDot) as TdxMapDot;
//  end;

  procedure TMainForm.CreateBingRouteLine(ARoute: TdxBingMapRouteInfo);
  var
    APolyline: TdxMapPolyline;
  begin
    APolyline := dxMapControl1ItemLayer1.AddItem(TdxMapPolyline) as TdxMapPolyline;
    APolyline.GeoPoints.AddRange(ARoute.Path);
    APolyline.Style.BorderColor := $9F0000FF;
    APolyline.Style.BorderWidth := 4;
    APolyline.Hint := Format('Дистанция: %s, Продолжительность: %s', [GetTravelDistanceStr(ARoute.TravelDistance),
      GetTravelDurationStr(ARoute.TravelDuration)]);
    APolyline.Tag := TdxNativeInt(ARoute);
    FRoutes.Add(APolyline);
  end;
{$ENDREGION}

{$REGION 'Change (procedure and function)'}
  procedure TMainForm.StopRouteProviders;
  begin
    dxMapControl1BingMapRouteDataProvider1.CancelRequests;
    dxMapControl1BingMapMajorRoadRouteDataProvider1.CancelRequests;
  end;

  procedure TMainForm.cxComboBox1PropertiesEditValueChanged(Sender: TObject);
  var
    I, J: Integer;
    ARoute: TdxBingMapRouteInfo;
    AItineraryItem: TdxBingMapItineraryItem;
    //AMapDot: TdxMapDot;
  begin
    if cxComboBox1.ItemIndex = -1 then
      Exit;
    ARoute := cxComboBox1.ItemObject as TdxBingMapRouteInfo;
    cxListBox1.Clear;
    if ARoute <> nil then
    begin
      for I := 0 to ARoute.RouteLegs.Count - 1 do
      begin
        for J := 0 to ARoute.RouteLegs[I].ItineraryItems.Count - 1 do
        begin
          AItineraryItem := ARoute.RouteLegs[I].ItineraryItems[J];
          cxListBox1.AddItem(AItineraryItem.Instruction.Description, AItineraryItem);
        end;
      end;

      dxMapControl1ItemLayer1.MapItems.BeginUpdate;
      for I := 0 to FRoutes.Count - 1 do begin
        FRoutes[I].Visible := FRoutes[I].Tag = TdxNativeInt(ARoute);

  //      if FRoutes[I].Visible then begin
  //
  //        ClearMapItems<TdxMapDot>(FMapDot);
  //
  //        if ARoute <> nil then
  //          begin
  //            for J := 0 to Length(ARoute.Path) - 1 do
  //            begin
  //              AMapDot := dxMapControl1ItemLayer1.AddItem(TdxMapDot) as TdxMapDot;
  //              AMapDot.Location.GeoPoint := ARoute.Path[J];
  //              AMapDot.Visible:=True;
  //              FMapDot.Add(AMapDot);
  //            end;
  //          end;
  //      end

      end;
      dxMapControl1ItemLayer1.MapItems.EndUpdate;

    end;
  end;
{$ENDREGION}

{$REGION 'Getter/Setter (procedure and function)'}
  function TMainForm.GetCurrentCursorGeoPoint: TdxMapControlGeoPoint;
  begin
    Result := dxMapControl1ImageTileLayer1.ScreenPointToGeoPoint(dxPointDouble(FCurrentCursorPos));
  end;

  function TMainForm.GetPinLetter(ANumber: Integer): string;
  begin
    Result := Chr(Ord('A') + ANumber);
  end;

  procedure TMainForm.CheckWaypointTexts(AItems: TList<TdxMapPushpin>);
  var
    I: Integer;
  begin
    for I := 0 to AItems.Count - 1 do
      AItems[I].Text := GetPinLetter(I);
  end;

  function TMainForm.GetTravelDistanceStr(ADistanceInKilometers: Double): string;
  begin
    Result := Format('%f km', [ADistanceInKilometers]);
  end;

  function TMainForm.GetTravelDurationStr(ATimeInSeconds: Double): string;
  var
    ATimeInt: Cardinal;
    AHour: Cardinal;
    AMinute: Word;
  begin
    Result := '';
    ATimeInt := Round(ATimeInSeconds);
    AHour := ATimeInt div 3600;
    AMinute := (ATimeInt mod 3600) div 60;
    Result := IfThen(AHour > 0, IntToStr(AHour) + ' h ');
    if AMinute > 0 then
      Result := Result + IntToStr(AMinute) + ' min'
    else
      if AHour = 0 then
        Result := Result + '< 1' + ' min';
  end;

  function TMainForm.CheckResponse(AResponse: TdxBingMapResponse): Boolean;
  begin
    Result := False;
    if AResponse <> nil then
      if AResponse.IsSuccess then
        Result := True
      else
        if AResponse.ErrorInfo <> nil then
          ShowMessage(AResponse.ErrorInfo.ErrorDetails);
  end;
{$ENDREGION}

{$REGION 'Clear (procedures and functions)'}
  procedure TMainForm.ClearMapItems<T>(AItems: TList<T>);
  var
    I: Integer;
    AMapItem: T;
  begin
    for I := AItems.Count - 1 downto 0 do
    begin
      AMapItem := AItems[I];
      AItems.Delete(I);
      dxMapControl1ItemLayer1.MapItems.Remove(AMapItem);
    end;
  end;

  procedure TMainForm.ClearAllPins;
  begin
    ClearMapItems<TdxMapPushpin>(FRoutePins);
    ClearMapItems<TdxMapPushpin>(FSearchPins);
    ClearMapItems<TdxMapPushpin>(FMajorRoadPins);
  end;

  procedure TMainForm.ClearRoutePath;
  begin
    ClearMapItems<TdxMapDot>(FMapDot);
    ClearMapItems<TdxMapPolyline>(FRoutes);
    cxListBox1.Clear;
    cxComboBox1.Properties.Items.Clear;
    //FreeAndNil(FRouteDataServiceResponse);
    //FreeAndNil(FRouteFromMajorRoadsDataServiceResponse);
  end;

  procedure TMainForm.ClearAllRouteInfo;
  begin
    ClearAllPins;
    ClearRoutePath;
  end;
{$ENDREGION}

{$REGION 'Calculate Route - Activate BingMapRouteDataProvider with our points'}
  procedure TMainForm.CalculateRoute;
  var
    ARouteWaypoints: TdxBingMapRouteWaypoints;
    I: Integer;
  begin
    FIsMajorRoadMode := False;
    ClearRoutePath;
    if FRoutePins.Count > 1 then
    begin
      ARouteWaypoints := TdxBingMapRouteWaypoints.Create;
      try
        for I := 0 to FRoutePins.Count - 1 do
          ARouteWaypoints.Add(FRoutePins[I].Location.GeoPoint);

        dxMapControl1BingMapRouteDataProvider1.CalculateAsync(ARouteWaypoints);
      finally
        ARouteWaypoints.Free;
      end;
    end;
  end;
{$ENDREGION}

{$REGION 'BingMapRouteDataProvider - Find all path from point A to point B'}
  procedure TMainForm.dxMapControl1BingMapRouteDataProvider1Response(
    Sender: TObject; AResponse: TdxBingMapRouteDataServiceResponse;
    var ADestroyResponse: Boolean);
  var
    ARoute: TdxBingMapRouteInfo;
    ARouteIndex: Integer;
    I: Integer;
  begin
    if CheckResponse(AResponse) then
    begin
      cxComboBox1.Properties.Items.Clear;
      cxListBox1.Clear;
      FreeAndNil(FRouteDataServiceResponse);
      FRouteDataServiceResponse := AResponse;
      for ARouteIndex := 0 to AResponse.Routes.Count - 1 do
      begin
        ARoute := AResponse.Routes[ARouteIndex];
  
        CreateBingRouteLine(ARoute);
  
        cxComboBox1.Properties.Items.AddObject('Route ' + IntToStr(ARouteIndex + 1), ARoute);
        for I := 0 to ARoute.RouteLegs.Count - 1 do
          FRoutePins[I].Location.GeoPoint := ARoute.RouteLegs[I].ActualStart;
        FRoutePins.Last.Location.GeoPoint := ARoute.RouteLegs.Last.ActualEnd;
      end;
      cxComboBox1.ItemIndex := -1;
      if cxComboBox1.Properties.Items.Count > 0 then
        cxComboBox1.ItemIndex := 0;
      ADestroyResponse := False;
    end;
  end;
{$ENDREGION}

{$REGION 'Resive point location adress, like: Ukraine, Kriviy Rih, Pushkina 10'}
procedure TMainForm.dxMapControl1BingMapReverseGeoCodingDataProvider1Response(
    Sender: TObject; AResponse: TdxBingMapLocationDataServiceResponse;
    var ADestroyResponse: Boolean);
  begin
    if CheckResponse(AResponse) and (AResponse.Locations.Count > 0) then
      FAddedItemAddress := AResponse.Locations[0].GetDisplayText
    else
      FAddedItemAddress := '';
  end;
{$ENDREGION}

{$REGION 'Find any location by name'}
  procedure TMainForm.dxMapControl1BingMapGeoCodingDataProvider1Response(
  Sender: TObject; AResponse: TdxBingMapLocationDataServiceResponse;
  var ADestroyResponse: Boolean);
  var
    APushpin: TdxMapPushpin;
    ALocationInfo: TdxBingMapLocationInfo;
  begin
    if CheckResponse(AResponse) and (AResponse.Locations.Count > 0) then
    begin
      ALocationInfo := nil;
      for ALocationInfo in AResponse.Locations do
      begin
        APushpin := CreatePushpin;
        APushpin.Location.GeoPoint := ALocationInfo.Point;
        APushpin.Hint := ALocationInfo.GetDisplayText;
        FSearchPins.Add(APushpin);
      end;
      dxMapControl1.CenterPoint.GeoPoint := AResponse.Locations[0].Point;
      dxMapControl1.ZoomToGeoRect(ALocationInfo.BoundingBox);
    end;
  end;
{$ENDREGION}


procedure TMainForm.FormCreate(Sender: TObject);
begin
  (dxMapControl1ImageTileLayer1.Provider as TdxMapControlBingMapImageryDataProvider).BingKey := DXBingKey;

  FMajorRoadPins := TList<TdxMapPushpin>.Create;
  FRoutePins := TList<TdxMapPushpin>.Create;
  FSearchPins := TList<TdxMapPushpin>.Create;
  FRoutes := TList<TdxMapPolyline>.Create;
  FMapDot := TList<TdxMapDot>.Create;

  dxMapControl1BingMapGeoCodingDataProvider1.BingKey := DXBingKey;
  dxMapControl1BingMapReverseGeoCodingDataProvider1.BingKey := DXBingKey;
  dxMapControl1BingMapRouteDataProvider1.BingKey := DXBingKey;
  dxMapControl1BingMapMajorRoadRouteDataProvider1.BingKey := DXBingKey;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FRouteDataServiceResponse);
  FreeAndNil(FRouteFromMajorRoadsDataServiceResponse);

  FreeAndNil(FRoutes);
  FreeAndNil(FMapDot);
  FreeAndNil(FSearchPins);
  FreeAndNil(FRoutePins);
  FreeAndNil(FMajorRoadPins);
end;

procedure TMainForm.dxMapControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FCurrentCursorPos := Point(X, Y);
end;

procedure TMainForm.actAddStartPointExecute(Sender: TObject);
var
  APushpin: TdxMapPushpin;
begin
  {$REGION 'Add start point to map'}
    ClearAllRouteInfo;
    APushpin := CreatePushpin;
    APushpin.Location.GeoPoint := CurrentCursorGeoPoint;
    FRoutePins.Insert(0, APushpin);
    CheckWaypointTexts(FRoutePins);
    dxMapControl1BingMapReverseGeoCodingDataProvider1.Search(APushpin.Location.GeoPoint);
    APushpin.Hint := FAddedItemAddress;
  {$ENDREGION}
end;

procedure TMainForm.actChangeStartPointExecute(Sender: TObject);
begin
  StopRouteProviders;
  FRoutePins[0].Location.GeoPoint := CurrentCursorGeoPoint;
  dxMapControl1BingMapReverseGeoCodingDataProvider1.SearchAsync(FRoutePins[0].Location.GeoPoint);
  FRoutePins[0].Hint := FAddedItemAddress;
  CalculateRoute;
end;

procedure TMainForm.actClearAllPointExecute(Sender: TObject);
begin
  ClearAllRouteInfo;
end;

procedure TMainForm.actDeletePointExecute(Sender: TObject);
begin
  if FHotPushpin <> nil then begin
    StopRouteProviders;
    FMajorRoadPins.Remove(FHotPushpin);
    FRoutePins.Remove(FHotPushpin);
    FSearchPins.Remove(FHotPushpin);
    dxMapControl1ItemLayer1.MapItems.Remove(FHotPushpin);
    CheckWaypointTexts(FRoutePins);
    CalculateRoute;
  end;
end;

procedure TMainForm.actSetAsEndPointExecute(Sender: TObject);
begin
  if FHotPushpin <> nil then
  begin
    StopRouteProviders;
    FSearchPins.Remove(FHotPushpin);
    FRoutePins.Remove(FHotPushpin);
    FRoutePins.Add(FHotPushpin);
    CheckWaypointTexts(FRoutePins);
    CalculateRoute;
  end;
end;

procedure TMainForm.actSetAsStartPointExecute(Sender: TObject);
begin
  if FHotPushpin <> nil then begin
    StopRouteProviders;
    FSearchPins.Remove(FHotPushpin);
    FMajorRoadPins.Remove(FHotPushpin);
    FRoutePins.Remove(FHotPushpin);
    FRoutePins.Insert(0, FHotPushpin);
    ClearMapItems<TdxMapPushpin>(FMajorRoadPins);
    CheckWaypointTexts(FRoutePins);
    CalculateRoute;
  end;
end;

procedure TMainForm.actAddNextPointExecute(Sender: TObject);
var
//  AMapDot: TdxMapDot;
  APushpin: TdxMapPushpin;
begin
//  AMapDot := CreateMapDot;
//  AMapDot.ShapeKind:=mcskRectangle;
//  AMapDot.Size:=10;
//  AMapDot.Style.Color:=tdxAlphaColors.FromArgb(255,153,000);
//  AMapDot.Location.GeoPoint := CurrentCursorGeoPoint;
//  FMapDot.Add(AMapDot);
  StopRouteProviders;
  APushpin := CreatePushpin;
  APushpin.Location.GeoPoint := CurrentCursorGeoPoint;
  FRoutePins.Add(APushpin);
  CheckWaypointTexts(FRoutePins);
  dxMapControl1BingMapReverseGeoCodingDataProvider1.Search(APushpin.Location.GeoPoint);
  APushpin.Hint := FAddedItemAddress;
  CalculateRoute;
end;

procedure TMainForm.PopupMenu1Popup(Sender: TObject);
begin
  if dxMapControl1.HitTest.HitObject is TdxMapPointerViewInfo then
    FHotPushpin := TdxMapPointerViewInfo(dxMapControl1.HitTest.HitObject).Item as TdxMapPushpin
  else
    FHotPushpin := nil;

  actAddStartPoint.Visible := (FHotPushpin = nil) and (FRoutePins.Count = 0);
  actChangeStartPoint.Visible := (FHotPushpin = nil) and (FRoutePins.Count > 0);
  actAddNextPoint.Visible := (FHotPushpin = nil) and (FRoutePins.Count > 0);
  actDeletePoint.Enabled := (FHotPushpin <> nil) and (FMajorRoadPins.IndexOf(FHotPushpin) = -1);
  actDeletePoint.Visible := (FHotPushpin <> nil) and (FRoutePins.Count > 0);
  actClearAllPoint.Visible := (FHotPushpin = nil) and (FRoutePins.Count > 0);
  actSetAsStartPoint.Visible := (FHotPushpin <> nil) and
   ((FRoutePins.Count = 0) or (FRoutePins[0] <> FHotPushpin));
  actSetAsEndPoint.Visible := (FHotPushpin <> nil) and (FRoutePins.Count > 0) and
   (FRoutePins[FRoutePins.Count - 1] <> FHotPushpin);
end;

end.

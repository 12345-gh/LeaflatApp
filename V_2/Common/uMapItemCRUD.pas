unit uMapItemCRUD;

interface

uses
  (* DX *)
  dxMapControl,
  dxMapImageTileLayer,
  dxMapItemLayer,
  dxMapItem,
  cxGeometry,
  dxMapControlTypes,
  (* Delphi *)
  Types,
  System.Math,
  (* User *)
  uListItemRecord;

  (* GET *)
  function GetCurrentCursorGeoPoint(dxmcImageTileLayer: TdxMapImageTileLayer;
                                    cursorPos : TPoint): TdxMapControlGeoPoint;
  function GetMiddleGeoPoint(LatB,LonB,LatE,LonE: Double): TdxMapControlGeoPoint;


  (* CREATE *)
  function CreateItemLayer(dxMapControl: TdxMapControl): TdxMapItemLayer;
  function CreatePushpin(dxmcItemLayer: TdxMapItemLayer): TdxMapPushpin;
  function CreateMapDot(dxmcItemLayer: TdxMapItemLayer): TdxMapDot;
  function CreateMapPolyline(dxmcItemLayer: TdxMapItemLayer): TdxMapPolyline;

implementation

{$REGION 'GetCurrentCursorGeoPoint'}
function GetCurrentCursorGeoPoint(dxmcImageTileLayer: TdxMapImageTileLayer;
                                  cursorPos : TPoint): TdxMapControlGeoPoint;
begin
  Result := dxmcImageTileLayer.ScreenPointToGeoPoint(dxPointDouble(CursorPos));
end;
{$ENDREGION}

{$REGION 'GetMiddleGeoPoint'}
function GetMiddleGeoPoint(LatB,LonB,LatE,LonE: Double): TdxMapControlGeoPoint;
var
  AGeoPoint: TdxMapControlGeoPoint;
  dLon, LatRes, LonRes, Bx, By: Double;
begin
  dLon := DegToRad(LonE - LonB);

  //convert to radians
  LatB := DegToRad(LatB);
  LatE := DegToRad(LatE);
  LonB := DegToRad(LonB);

  Bx := Cos(LatE) * Cos(dLon);
  By := Cos(LatE) * Sin(dLon);
  LatRes := ArcTan2(Sin(LatB) + Sin(LatE), Sqrt((Cos(LatB) + Bx) * (Cos(LatB) + Bx) + By * By));
  LonRes := LonB + ArcTan2(By, Cos(LatB) + Bx);

  AGeoPoint.Latitude := RadToDeg(LatRes);
  AGeoPoint.Longitude := RadToDeg(LonRes);

  Result := AGeoPoint;
end;

{$ENDREGION}

{$REGION 'CreateItemLayer'}
function CreateItemLayer(dxMapControl: TdxMapControl): TdxMapItemLayer;
begin
  Result := dxMapControl.AddItemLayer as TdxMapItemLayer;
end;
{$ENDREGION}

{$REGION 'CreatePushpin'}
function CreatePushpin(dxmcItemLayer: TdxMapItemLayer): TdxMapPushpin;
begin
  Result := dxmcItemLayer.MapItems.Add(TdxMapPushpin) as TdxMapPushpin;
end;
{$ENDREGION}

{$REGION 'CreateMapDot'}
function CreateMapDot(dxmcItemLayer: TdxMapItemLayer): TdxMapDot;
begin
  Result := dxmcItemLayer.MapItems.Add(TdxMapDot) as TdxMapDot;
end;
{$ENDREGION}

{$REGION 'CreatePolyline'}
function CreateMapPolyline(dxmcItemLayer: TdxMapItemLayer): TdxMapPolyline;
begin
  Result := dxmcItemLayer.MapItems.Add(TdxMapPolyline) as TdxMapPolyline;
end;
{$ENDREGION}

end.

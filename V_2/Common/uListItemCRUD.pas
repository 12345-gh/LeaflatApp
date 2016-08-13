unit uListItemCRUD;

interface

uses
   (* DX *)
  dxMapControl,
  dxMapImageTileLayer,
  dxMapItemLayer,
  dxMapItem,
  cxGeometry,
  dxMapControlTypes,
  dxCoreGraphics,
  (* Delphi *)
  Generics.Collections,
  Types,
  (* User *)
  uListItemRecord,
  uMapItemCRUD;

const
  AlphaChannelZero = 0;
  AlphaChannelTransparent = 150;
  AlphaChannel255 = 255;

function CreateMiddleGeoPointItem(AMapDotBegin, AMapDotEnd: TdxMapDot;
  ALayer: TdxMapItemLayer) : TdxMapDot;
function CreateMiddleGeoPointItemList(AMapDotList: TList<TdxMapDot>;
  ALayer: TdxMapItemLayer) : TList<TdxMapDot>;

procedure DeleteRoutePoint(ARoutes: TList<RouteItem>; AIDSelectedRoute,
  AIDSelectedRouteMapDot: Integer);
procedure DeleteGeoPointItemMapDot(ALayer: TdxMapItemLayer;
  AMiddleGeoPointItem: TList<TdxMapDot>; AIDSelectedItemMapDot: Integer);

procedure SetMapDotItemStyle(AMapDot: TdxMapDot; Color, BorderColor: Integer; Width: Integer; isEdit: Boolean);
procedure SetPolylineItemStyle(APolyline: TdxMapPolyline; Color, SelectColor: Integer; Width: Integer; isEdit: Boolean);

implementation

{$REGION 'CreateMiddleGeoPointItem'}
function CreateMiddleGeoPointItem(AMapDotBegin, AMapDotEnd: TdxMapDot;
  ALayer: TdxMapItemLayer) : TdxMapDot;
begin
  Result := CreateMapDot(ALayer);

  Result.Location.GeoPoint:=GetMiddleGeoPoint(
      AMapDotBegin.Location.GeoPoint.Latitude,
      AMapDotBegin.Location.GeoPoint.Longitude,
      AMapDotEnd.Location.GeoPoint.Latitude,
      AMapDotEnd.Location.GeoPoint.Longitude
    );

  Result.ShapeKind := mcskRectangle;

  SetMapDotItemStyle(Result, $0000FF, $0000FF, 2, True); // RED COLOR

  Result.Visible := True;
end;
{$ENDREGION}

{$REGION 'CreateMiddleGeoPointItemList'}
function CreateMiddleGeoPointItemList(AMapDotList: TList<TdxMapDot>;
  ALayer: TdxMapItemLayer) : TList<TdxMapDot>;
var
  I : Integer;
begin
  Result := TList<TdxMapDot>.Create;

  for I:=0 to AMapDotList.Count-1 do begin
    // Create middle geopoint list
    if (I <> 0) then begin
      Result.Add(CreateMiddleGeoPointItem(AMapDotList[I-1],AMapDotList[I],ALayer));
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DeleteRoutePoint'}
procedure DeleteRoutePoint(ARoutes: TList<RouteItem>; AIDSelectedRoute,
  AIDSelectedRouteMapDot: Integer);
begin
  ARoutes[AIDSelectedRoute].triLayer.MapItems.BeginUpdate;

  ARoutes[AIDSelectedRoute].triLayer.MapItems.Remove(ARoutes[AIDSelectedRoute].triMapDot[AIDSelectedRouteMapDot]);
  ARoutes[AIDSelectedRoute].triMapDot.Delete(AIDSelectedRouteMapDot);
  ARoutes[AIDSelectedRoute].triPolyline.GeoPoints.Delete(AIDSelectedRouteMapDot);

  ARoutes[AIDSelectedRoute].triMapDot.TrimExcess;

  ARoutes[AIDSelectedRoute].triLayer.MapItems.EndUpdate;
end;
{$ENDREGION}

{$REGION 'DeleteGeoPointItemMapDot'}
procedure DeleteGeoPointItemMapDot(ALayer: TdxMapItemLayer;
  AMiddleGeoPointItem: TList<TdxMapDot>; AIDSelectedItemMapDot: Integer);
begin
  ALayer.MapItems.BeginUpdate;

  ALayer.MapItems.Remove(AMiddleGeoPointItem[AIDSelectedItemMapDot]);
  AMiddleGeoPointItem.Delete(AIDSelectedItemMapDot);

  AMiddleGeoPointItem.TrimExcess;

  ALayer.MapItems.EndUpdate;
end;
{$ENDREGION}

{$REGION 'SetMapDotItemStyle'}
procedure SetMapDotItemStyle(AMapDot: TdxMapDot; Color, BorderColor: Integer;
  Width: Integer; isEdit: Boolean);
begin
  if isEdit then begin
    AMapDot.Style.Color := dxColorToAlphaColor(Color, AlphaChannelTransparent);
    AMapDot.Size := Width+2;
    AMapDot.Style.BorderColor := dxColorToAlphaColor(BorderColor, AlphaChannel255);
    AMapDot.Style.BorderWidth := Width;
  end else begin
    AMapDot.Style.Color := dxColorToAlphaColor(Color, AlphaChannelTransparent);
    AMapDot.Size := Width+2;
    AMapDot.Style.BorderColor := dxColorToAlphaColor(BorderColor, AlphaChannelTransparent);
    AMapDot.Style.BorderWidth := Width;
  end;
end;
{$ENDREGION}

{$REGION 'SetPolylineItemStyle'}
procedure SetPolylineItemStyle(APolyline: TdxMapPolyline; Color, SelectColor: Integer;
  Width: Integer; isEdit: Boolean);
begin
  if isEdit then begin
    APolyline.Style.BorderColor:= dxColorToAlphaColor(Color, AlphaChannel255);
    APolyline.Style.BorderWidth := Width;
    APolyline.StyleHot.BorderColor:= dxColorToAlphaColor(SelectColor, AlphaChannel255);
    APolyline.StyleHot.BorderWidth := Width;
    APolyline.StyleSelected.BorderColor:= dxColorToAlphaColor(SelectColor, AlphaChannel255);
    APolyline.StyleSelected.BorderWidth := Width;
  end else begin
    APolyline.Style.BorderColor:= dxColorToAlphaColor(Color, AlphaChannelTransparent);
    APolyline.Style.BorderWidth := Width;
    APolyline.StyleHot.BorderColor:= dxColorToAlphaColor(SelectColor, AlphaChannelTransparent);
    APolyline.StyleHot.BorderWidth := Width;
    APolyline.StyleSelected.BorderColor:= dxColorToAlphaColor(SelectColor, AlphaChannelTransparent);
    APolyline.StyleSelected.BorderWidth := Width;
  end;
end;
{$ENDREGION}

end.

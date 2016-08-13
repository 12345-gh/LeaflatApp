unit uListItemRecord;

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
  Types;
  (* User *)

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
  RouteItem=record
    triRouteName: string;
    triRouteType: string;
    triLayer: TdxMapItemLayer;
    triMapDot: TList<TdxMapDot>;
    triPolyline: TdxMapPolyline;
    triPolylineColor: Integer;//TdxAlphaColor;
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

{$REGION 'Polygone'}
type
  PolygonItem=record
    tpgPolygoneName: string;
    tpgPolygoneType: string;
    tpgLayer: TdxMapItemLayer;
    tpgPolygone: TdxMapPolygon;
    tpgPolygoneColor: TdxAlphaColor;
    tpgCustomElement: TdxMapCustomElement;
  end;
{$ENDREGION}

implementation

end.

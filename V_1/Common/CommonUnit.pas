unit CommonUnit;

interface

uses Windows;

function DXBingKey: string;

implementation

{$REGION 'Set BingKey for resive map from internet'}
  {$R LeaflatApp.res}
  function DXBingKey: string;
//  var
//    Buffer: array [0..255] of Char;
  begin
//    SetString(Result, Buffer, LoadString(FindResourceHInstance(HInstance), 102, Buffer, Length(Buffer)));
   Result := 'As-f9-XcO4xGtzuS1d5Uiq-j61OZqRwDwRsw1o-q7ANxPTqiObVgeJKOSch0KioI';
  end;
{$ENDREGION}

end.

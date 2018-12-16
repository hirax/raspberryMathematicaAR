#!/usr/bin/env wolframscript

arg=$ScriptCommandLine;
aLon=ToExpression[ arg[[2]] ]; aLat=ToExpression[ arg[[3]] ];
aSize=ToExpression[ arg[[4]] ]; step=ToExpression[ arg[[5]] ];
(* ２次元領域の気象データ取得関数 *)
dataTable[f_] := Table[ QuantityMagnitude@f[{lat, lon}], 
{lon, aLon-3, aLon+3, step}, {lat, aLat-3, aLat+3, step} ];
(* 風速ベクトル・気圧・気温取得 *)
v = dataTable[(Reverse@(WindVectorData[#] /. Missing[_]->0))&];
(*　p=dataTable[(AirPressureData[#])&]; *) (* 気圧取得の場合 *)
t = dataTable[(AirTemperatureData[#])&];
(* 取得情報を描画した上で画像に変換する *)
img=Image@Show[
 ListDensityPlot[t, ColorFunction->"TemperatureMap",
    PlotRange->{0, 40}, Frame->False, ImageSize->aSize],
 ListStreamPlot[v, StreamStyle->{White, Opacity[0.1]}, 
    VectorPoints->Fine, VectorColorFunction->"Rainbow"] ];
(* 画像投影法を変換する関数を定義する *)
img2Equirectangular[imgdata_, cxy_] := Image[ParallelTable[
   r = cxy lon/90; t = 2 Pi (lat + 180)/360;
   x = Round[r Cos[t] + cxy]; y = Round[r Sin[t] + cxy];
   If[lon < 180/2, Cos[Pi lon/180] imgdata[[y]][[x]], {0,0,0}],
 {lon, 0, 180, 1/4}, {lat, 0, 360, 1/4}], ColorSpace->"RGB"]
(* 気象情報をテクスチャ用の投影画像に変換した上で画像保存する *)
Export["texture000.png",
 img2Equirectangular[ImageData@RemoveAlphaChannel@img,aSize/2]]



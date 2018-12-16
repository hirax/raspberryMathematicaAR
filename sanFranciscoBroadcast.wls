bs = GeoNearest["BroadcastStation",
   GeoPosition[{37.7, -122}],
   {All, Quantity[100, "Kilometers"]}];
img=Image@GeoRegionValuePlot[bs->"AllPower",
  GeoLabels->({Opacity[.05],
    Disk[#3, .01 Sqrt@QuantityMagnitude[#4]]} &),
  ColorFunction->"Rainbow", PlotLegends->False,
  GeoBackground->Automatic,
  GeoRange->{{37.67, 37.82},{-122.52, -122.37}}]


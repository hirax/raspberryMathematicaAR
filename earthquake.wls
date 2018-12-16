earthquake={#["Magnitude"]/6,#["Position"]} & /@
Values@EarthquakeData[GeoDisk[{35, 140},
  Quantity[200, "Kilometers"]], 1];
img = Image@GeoGraphics[{Hue[#1], Opacity[0.3],
  PointSize[0.02 #1], Point[#2]} & @@@ earthquake,
  GeoRange->{{35, 35}, {140, 140}} ]



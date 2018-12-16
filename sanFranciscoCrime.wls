data=({#[[8]], #[[9]]}) & /@
    Import["/train.csv"];
img = Image[DensityHistogram[data,
{{-122.52, -122.37, (122.52 - 122.37)/50},
{37.67, 37.82, (37.82 - 37.67)/50}},
Frame->False, ColorFunction->"DarkRainbow",
BaseStyle->Opacity[0.5]]];



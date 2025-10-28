{
  lib,
  buildPythonApplication,
  hatchling,
  xcffib,
  cffi,
  click,
  i3ipc,
  marshmallow,
  pyyaml,
  xpybutil,
  ...
}:
buildPythonApplication {
  pname = "flashfocus";
  version = "2.4.2";

  src = ./.; # your repo source
  pyproject = true;
  build-system = [hatchling];

  propagatedBuildInputs = [
    xcffib
    cffi
    click
    i3ipc
    marshmallow
    pyyaml
    xpybutil
  ];

  meta = with lib; {
    description = "Focus animation daemon for X11/Sway/i3/tiling WMs";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
}

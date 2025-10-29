{
  description = "Flashfocus devShell with latest cffi and xcffib";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    defaultPkg = pkgs.python3Packages.callPackage ./. {};
  in {
    packages.${system} = {
      default = defaultPkg;
      flashfocus = defaultPkg;
    };
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.uv
        pkgs.git
        pkgs.python313Packages.pip
        pkgs.python313Packages.cffi
        pkgs.python313Packages.xcffib
      ];

      shellHook = ''
        echo "Flashfocus dev shell with latest cffi and xcffib ready!"
        export PYTHONPATH=$PWD/src:$PYTHONPATH
        python -c "import cffi; print('cffi version:', cffi.__version__)"
        python -c "import xcffib; print('xcffib version:', xcffib.__version__)"
      '';
    };
  };
}

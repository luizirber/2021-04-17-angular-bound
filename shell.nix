let
  sources = import ./nix/sources.nix;
  jupyter = import sources.jupyterWith {};

  iPython = jupyter.kernels.iPythonWith {
    name = "mach-nix-jupyter";
    packages = p: with p; [ numpy pandas scipy matplotlib hypothesis pytest ];
  };

  jupyterEnvironment = jupyter.jupyterlabWith {
    kernels = [ iPython ];
  };
in
  jupyterEnvironment.env

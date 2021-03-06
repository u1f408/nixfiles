{ inputs, pkgs, lib ? pkgs.lib, config, root, ... }:

with lib;

{
  options.home-manager.users = mkOption {
    type = types.attrsOf (types.submoduleWith {
      modules = singleton (root + "/config/modules/home");
      specialArgs = {
        inherit inputs pkgs;
        superConfig = config;
      };
    });
  };

  config.home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}

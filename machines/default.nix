# Hosts will be defined with the following standard

# PCs - Generic tree names
# Laptop - Bonsai tree species prefixed with 'bonsai-'
# Servers - Fruit trees species since they bare services (fruit)

{ nixpkgs, home-manager, nixos-wsl inputs, ... }: {

  oak = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./oak
      ./configuration.nix
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager
    ];
  };
}
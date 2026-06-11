{
  description = "NixOS setup for tomaustindev.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
	home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... }: {
    nixosConfigurations.tomthinkcentre = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit zen-browser; };
      modules = [
        ./tomthinkcentre/configuration.nix
	home-manager.nixosModules.home-manager
	{
          home-manager = {
            useGlobalPkgs = true;
	    useUserPackages = true;
	    users.thomas = import ./tomthinkcentre/thomas/home.nix;
	    backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}


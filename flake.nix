{
  description = "NixOS setup for tomaustindev.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.tomthinkcentre = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./tomthinkcentre/configuration.nix
	home-manager.nixosModules.home-manager
	{
          home-manager = {
            useGlobalPkgs = true;
	    useUserPackages = true;
	    users.thomas = import ./tomthinkcentre/thomas.nix;
	    backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}


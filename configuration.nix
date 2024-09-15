# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Pacific/Auckland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_NZ.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "nz";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."user" = {
    isNormalUser = true;
    description = "User";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDX/w0E9gal4O16DKC+NfTKObqx9cwjLXkH5vctPOPdQpuwmezbJ233HfhhQQ8a0ZdTbS15LgitIENRAarnhaWo7/WbVpJHUEC3fTOyxbETf+vEuhzO3jqcbKYhtSwhpBlvi5bos9EAHa/UL1nTrqFZM2Etoen7DuTU5MmEwUSCaaFv/GVLDvMZ8FGOFZx8u9Ihp/K53wMTjYTIftvThg+9drfRgzV+DK4U7rQYkQ8Kt6IBNlgKqdutjb0JEd+TQ1wuVFsgtgfytuZ50TYo8By+KoEdnOtkauyF1dltaWzsxibTRmF0n7YZN9BV4gH3aOY8FE7wl6wvGvYkDN6QLLspY8FDHVMwUyRn731J7DFZhUlrE5Mxt8S28b3UC852fA82un1dfP4nVwn1ILWZQOLP5zcn5/XQ2kEeL/p5VmVU0hAlRHz2FHTCtGGOOSnb0DJ2oD8WzWeKhMlCNoTSsh4Z9xY0kST9Z+g8mSp4cwPM+Koghzdi+ypJqBr1Lwn3Hs8= tobys@TobysPc"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh = {
  enable = true;
  # require public key authentication for better security
  settings.PasswordAuthentication = false;
  settings.KbdInteractiveAuthentication = false;
  #settings.PermitRootLogin = "yes";
};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

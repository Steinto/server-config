{
    pkgs,
    lib,
    config,...
}: {
    imports = [
        ./adguard-home.nix
        ./flaresolver.nix
        ./homarr.nix
    ];
}

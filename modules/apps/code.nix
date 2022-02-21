{ pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        ms-vsliveshare.vsliveshare
    ];
  };
}

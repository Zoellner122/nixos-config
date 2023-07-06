{ pkgs, ...}:

with pkgs;
let 
  chezmoiCmd = ${chezmoi}/bin/chezmoi;
in
mkShell {
  buildInputs = [ chezmoi ];
  shellHook = ''
  if [ ! -d $HOME/.chezmoi ]; then
    ${chezmoiCmd} init --apply zoellner122/dot-files
    fi
    ${chezmoiCmd} apply
    '';
}
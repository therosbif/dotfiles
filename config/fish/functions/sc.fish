# Defined in - @ line 1
function sc --wraps='cd ~/Scripts' --wraps='cd ~/Scripts && ls' --description 'alias sc cd ~/Scripts && ls'
  cd ~/.local/bin/ && ls $argv;
end

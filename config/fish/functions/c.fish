# Defined via `source`
function c --wraps='code . --disable-gpu' --description 'alias c=code . --disable-gpu'
  code . --disable-gpu $argv; 
end

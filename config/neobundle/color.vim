syntax on

set background=dark

if (&ft=='ruby')
  colorscheme Tomorrow-Night
else
  " hydrid config
  "" https://gist.github.com/w0ng/3278077
  let g:hybrid_use_Xresources = 1
  colorscheme hybrid
endif

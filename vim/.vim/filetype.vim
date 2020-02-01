augroup filetypedetect
  au BufRead, BufNewFile *.rs setfiletype rust
  au BufRead, BufNewFile *.cpp *.hpp setfiletype cpp
  au BufRead, BufNewFile *.go setfiletype golang
augroup END

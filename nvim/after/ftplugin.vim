" Set formatoptions
au FileType * setlocal formatoptions-=cro

" Set filetypes
au BufNewFile,BufRead *.ejs,*.hbs set filetype=html
au BufNewFile,BufRead .prettierrc,.eslintrc,tsconfig.json set filetype=jsonc
au BufNewFile,BufRead *.svx,*.mdx set ft=markdown
au BufNewFile,BufRead *.svelte set ft=svelte
au BufNewFile,BufRead *.fish set ft=sh
au BufNewFile,BufRead *.zsh set ft=sh
au BufNewFile,BufRead jst setlocal filetype=html


" Set github text field to markdown (firenvim stuff)
au BufEnter github.com_*.txt set filetype=markdown


" Remove trailing whitespace on save
au BufWritePre * %s/\s\+$//e

" automatically go to insert mode on terminal buffer
autocmd BufEnter term://* startinsert

" enable/disable wordwrap
augroup Goyo
  au!
  au User GoyoEnter setlocal linebreak wrap
  au User GoyoLeave setlocal nolinebreak nowrap
augroup END

" disable nvim-compe inside telescope
augroup Compe
  au!
  au WinLeave,FileType TelescopePrompt let g:compe_enabled = v:true
  au WinEnter,FileType TelescopePrompt let g:compe_enabled = v:false
augroup END

" " hide the cursor if we're inside NvimTree
" augroup HideCursor
"   au!
"   au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
"   au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
" augroup END
" au FileType NvimTree hi Cursor blend=100
"=============================================================
"%%' @doc 自定义快捷键和配置
"=============================================================
lcd $HOME/data/golang
nmap ;lt :NERDTree       $HOME/data<CR>
nmap ;lg :NERDTree       $HOME/data/golang<CR>
nmap ;ln :NERDTreeMirror<CR>
nmap ;vim :e ~/.vimrc<CR>
nmap ;tn :tabn<CR>
nmap ;tp :tabp<CR>
nmap ;tl :tabl<CR>
nmap ;te :tabe<CR>
nmap ;tc :tabc<CR>
nmap ;tf :tabfir<CR>
nmap ;bs :buffers<CR>
nmap ;bn :bn<CR>
nmap ;bp :bp<CR>
nmap ;bd :bd<CR>
nmap ;bq :q<CR>
nmap ;no :nohl<CR>
" nmap ;tag :TlistToggle<CR>
nmap ;sv :source ~/.vimrc<CR>
" nmap ;go :TbStart<CR>
" nmap ;gc :TbStop<CR>
" nmap ;gt :TbToggle<CR>
" nmap ;gn :Tbbn<CR>
" nmap ;gp :Tbbp<CR>
" nmap ;ma :Matrix<CR>
nmap ;wo <c-W>=
nmap ;wa <c-W>+
nmap ;wm <c-W>-
nmap ;wb <c-W>>
nmap ;ws <c-W><
nmap ;wl <c-W>L
nmap ;wh <c-W>H
nmap ;wk <c-W>K
nmap ;wj <c-W>J

" ;16  十六进制格式查看
" ;r16 返回普通格式
nmap ;16 :%!xxd<CR>
nmap ;r16 :%!xxd -r<CR>

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 将tab替换为空格
nmap tt :%s/\t/    /g<CR>
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

" 返回当前时间
func! GetTimeInfo()
    return strftime('%Y-%m-%d %H:%M:%S')
endfunction

" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>

"let g:ctrlp_map = '<c-f>'
let g:ctrlp_map = '<c-p>'
nnoremap <C-f> <PageDown>
nnoremap <C-b> <PageUp>

"=============================================================
"%%. @end 自定义快捷键和配置
"=============================================================

"=============================================================
"%%' @doc 基础配置
"=============================================================
"color solarized
colorscheme molokai " murphy

set autochdir                   " 自动目录
set list                        " 显示特殊字符,其中Tab使用高亮竖线代替,尾部空白使用高亮点号代替
set listchars=tab:\|\ ,trail:.  " 显示特殊字符,其中Tab使用高亮竖线代替,尾部空白使用高亮点号代替
set clipboard+=unnamed          " 共享剪贴板
set iskeyword+=_,$,@,%,#,-      " 带有如下符号的单词不要被换行分割
set foldenable                  " 开启折叠
set foldmethod=manual           " 手动折叠 manual | indent | marker

" 启用每行超过77-80列的字符提示(字体变蓝并加下划线)
au BufWinEnter * let w:m1=matchadd('Underlined', '\%<81v.\%>77v', -1)

"=============================================================
"%%. @end 基础配置
"=============================================================

"=============================================================
"%%' @doc 插件配置
"=============================================================

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" erlang
" 'vim-erlang/vim-erlang-skeletons'
let g:erl_author="piaohua"
" let g:erl_company="Me Gusta Inc"
let g:erl_replace_buffer=1
" let g:erl_tpl_dir="/home/herp/erlang/templates"

" 'vim-erlang/vim-erlang-omnicomplete'
set runtimepath^=~/.vim_runtime/my_plugins/vim-erlang-omnicomplete

" 'vim-erlang/vim-erlang-runtime'
set runtimepath^=~/.vim_runtime/my_plugins/vim-erlang-runtime

" 'racer-rust/vim-racer'
"开启rust的自动reformat的功能
let g:rustfmt_autosave = 1
"手动补全和定义跳转
set hidden
let g:racer_cmd = "~/.cargo/bin"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

" 'rust-lang/rust.vim'
let g:rust_clip_command = 'pbcopy'

"=============================================================
"%%. @end 插件配置
"=============================================================

" vim: set foldmethod=marker foldmarker=%%',%%.:

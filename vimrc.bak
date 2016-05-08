set nocompatible
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""" PLUG THEM PLUGINS IN "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-projectionist'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" GIT INTEGRATION "
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" CUSTOM TEXT OBJECTS "
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'whatyouhide/vim-textobj-erb'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" CUSTOM VIM COMMANDS "
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-sort-motion'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'christoomey/vim-titlecase'
Plugin 'ecomba/vim-ruby-refactoring'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" SYNTAX HIGHLIGHTING "
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'chrisbra/Colorizer'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NAVIGATION "
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" TYPING AIDS "
Plugin 'Townk/vim-autoclose'
Plugin 'ambirdsall/emmet-vim'
Plugin 'christoomey/vim-system-copy'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/closetag.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" SEARCHING "
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" COLORS "
Plugin 'altercation/vim-colors-solarized'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" VARIABLES "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fold together all hits from same file in ack results when not under cursor.
let g:ack_autofold_results = 1
let g:colorizer_auto_filetype='css,scss,sass,html'
" Treat <li> and <p> tags like the block tags they are.
let g:html_indent_tags = 'li\|p'
let g:netrw_banner=0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:solarized_termtrans = 1
" no thanks. It's the default, but explicitness is a virtue.
let g:syntastic_check_on_open=0
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["ruby"],
                                            \ "passive_filetypes": ["javascript"] }
" vim-titlecase's default mapping is `gt`, but I use tabs
let g:titlecase_map_keys = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""" MAKE VIM PRETTY AND FORMATTED NICE "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark
colorscheme solarized
filetype indent plugin on
" hybrid linenumbers
set number
set relativenumber
set numberwidth=5 " gutter column bigger for readability
set ruler " redundant with powerline installed; left in b/c Wu-Tang is for the
set laststatus=2 " always display status line, even in single buffer
set noswapfile " that's git's job
set lazyredraw " don't redraw during macros "
set showcmd
" don't treat 0-padded numbers as octal. 008 comes after 007, not 010.
set nrformats=
set incsearch
set hlsearch
" it is okay to change files without saving every damn thing
set hidden
set encoding=utf-8
highlight ColorColumn ctermbg=0
highlight Folded ctermbg=NONE
" just because you shouldn't use the mouse doesn't mean you shouldn't be able to
set mouse=a
" ditto deleting shit in insert mode
set backspace=indent,eol,start
" default register is the system clipboard, because vim ain't the only program.
" set clipboard=unnamed
" 2-space indents; <</>> shifting goes to nearest multiple of 2, even from odds.
set softtabstop=2 shiftwidth=2 shiftround expandtab
" 450ms is enough to finish typing combos even on a bad day, but not toooo long.
set timeoutlen=450
" split panes spawn to the right and bottom, b/c Principle of Least Surprise.
set splitbelow
set splitright
set nowrap " <leader>r toggles wrap for when it's needed
set diffopt+=vertical " always compare diffs with vertical splits.
" Speed up viewport scrolling {{{
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


" powerline is the best line I know.
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""" THE LAND OF AUTOCOMMAND "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  augroup CursorLine
    au!
    " cursorline messes with hex color highlighting
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorline
    au WinLeave * setlocal nocursorcolumn
  augroup END

  " automatically rebalance splits on resize
  autocmd VimResized * :wincmd =

  " cron jobs, tho
  autocmd filetype crontab setlocal nobackup nowritebackup

  " nice line formatting for free in markdown
  autocmd bufreadpre *.md setlocal textwidth=80
  autocmd bufreadpre *.markdown setlocal textwidth=80

  " [Plug] github-flavored markdown highlighting for all markdown files
  augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END

  " automatically save files on focus lost. Theoretically.
  au FocusLost * silent! wa

  " Automatically source vimrc when saving changes to it.
  autocmd! BufWritePost vimrc source $MYVIMRC

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" FUNCTIONS "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=81
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""  _  _ ___ ___ ___   _____ _  _ ___ ___ ___   ___ ___  "
"""""""""""""""""""""""" | || | __| _ \ __| |_   _| || | __| _ \ __| | _ ) __| "
"""""""""""""""""""""""" | __ | _||   / _|    | | | __ | _||   / _|  | _ \ _|  "
"""""""""""""""""""""""" |_||_|___|_|_\___|   |_| |_||_|___|_|_\___| |___/___| "
""""""""""""""""""""""""                                                       "
""""""""""""""""""""""""  __  __   _   ___ ___ ___ _  _  ___ ___               "
"""""""""""""""""""""""" |  \/  | /_\ | _ \ _ \_ _| \| |/ __/ __|              "
"""""""""""""""""""""""" | |\/| |/ _ \|  _/  _/| || .` | (_ \__ \              "
"""""""""""""""""""""""" |_|  |_/_/ \_\_| |_| |___|_|\_|\___|___/              "
""""""""""""""""""""""""                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scroll browser-style
noremap <up> <c-y>
noremap <down> <c-e>
nnoremap <left> zh
nnoremap <right> zl
" because life is too short to hit shift that often.
nnoremap ; :
nnoremap : ;
" wizard party!!!!! very magic by default
" :nnoremap / /\v
" :cnoremap %s/ %s/\v
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
" `Y` yanks from current cursor position to EOL instead of acting like `yy`.
nnoremap Y y$
" smash escape            CURSOR POSITION AFTER:
"                       |F| | |J| | <= backwards like esc <=
inoremap jf <esc>
inoremap fj <esc>
vnoremap jf <esc>
vnoremap fj <esc>
"                       | | | |J|K| => doesn't move =>
inoremap jk <esc>l
inoremap kj <esc>l
" quickly insert new line above...
inoremap jj <c-o>o
" ...or below the current one in insert mode.
inoremap uu <c-o>O
" quickly jump to end of current line in insert mode.
inoremap kk <Esc>A
"   or beginning
inoremap hh <Esc>I
" move around without arrow keys in insert mode.
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
" typing `//` in visual mode searches for the selection
vnoremap // y/<C-R>"<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" jump to previous quickfix item
nmap [q :cprev<cr>
" jump to next quickfix item
nmap ]q :cnext<cr>
" jump to first quickfix item
nmap [Q :cfirst<cr>
" jump to last quickfix item
nmap ]Q :clast<cr>

nmap tit <Plug>Titlecase
vmap tit <Plug>Titlecase
nmap tiT <Plug>TitlecaseLine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""" TAKE ME TO YOUR LEADER "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" RAW DANG VIM:
let mapleader=" "

nnoremap <leader><leader><leader> <c-^>
nnoremap <leader>O O<esc>
nnoremap <leader>P "*P
nnoremap <leader>b :buffer
nnoremap <leader>ev :tabe ~/.vim/vimrc<cr>
nnoremap <leader>f ^
nnoremap <leader>gf <c-w>f<bar><c-w>L
nnoremap <leader>h :noh<cr>
" quickly jump to inside an empty matched pair (e.g. '()', '""')
nnoremap <leader>in ?\%<c-r>=line('.')<Return>l\({}\\|\[]\\|<>\\|><\\|()\\|""\\|''\\|><lt>\)?s+1<Return>
nnoremap <leader>ind gq}
nnoremap <leader>o o<esc>
nnoremap <leader>p "*p
nnoremap <leader>r :set wrap!<cr>
nnoremap <leader>tts :%s/\t/  /g<cr>
nnoremap <leader>w :w<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" FUNCTIONS:
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" PLUGINS AND WHATNOT:

" vim-fugitive
nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>bl :Gblame<cr>
nnoremap <leader>ci :Gcommit
nnoremap <leader>di :Gdiff

" vim-rspec
nnoremap <leader>t :call RunCurrentSpecFile()<cr>
nnoremap <leader>n :call RunNearestSpec()<cr>
nnoremap <leader>l :call RunLastSpec()<cr>
" nnoremap <leader>a :call RunAllSpecs()<cr>

" ag.vim
" The terminal whitespace is on purpose here
nnoremap <leader>ag :Ag! 
nnoremap <leader>ack :Ack! 
" I never want to automatically jump to the first match. That's silly.
cnoreabbrev Ack Ack!

" vim-commentary
nmap <leader>c gcc
" ctags
nnoremap <leader>. :TagbarToggle<cr>
" vim-better-whitespace
nnoremap <leader>sw :StripWhitespace<cr>
" vim-nerdtree-tabs
" nnoremap <leader>d :NERDTreeTabsToggle<cr>
" easymotion
nmap <leader>a <Plug>(easymotion-s2)

set omnifunc=syntaxcomplete#Complete

" stop that autocomment noise
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" insert evaluated code output into buffer
" http://blog.joncairns.com/2014/10/evaluate-ruby-or-any-command-and-insert-into-vim-buffers/
function! InsertCommand(command)
  redir => output
  silent execute a:command
  redir END
  call feedkeys('i'.substitute(output, '^[\n]*\(.\{-}\)[\n]*$', '\1', 'gm'))
endfunction

command! -nargs=+ I call InsertCommand(<q-args>)

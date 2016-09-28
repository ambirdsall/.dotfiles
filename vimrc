set nocompatible
filetype plugin indent on
syntax enable
set runtimepath+=~/.vim/bundle/Vundle.vim,$VIMRUNTIME
runtime macros/matchit.vim
let mapleader=" "

" {{{ Plugins
" {{{ Vundle set up
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" }}}
" {{{ Custom text objects
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'whatyouhide/vim-textobj-erb'
" }}}
" {{{ Custom commands
Plugin 'tpope/vim-repeat'
Plugin 'christoomey/vim-sort-motion'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'christoomey/vim-titlecase'
Plugin 'ecomba/vim-ruby-refactoring'
" }}}
" {{{ Testing
Plugin 'thoughtbot/vim-rspec'
" }}}
" {{{ Navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
" }}}
" {{{ Tmux
Plugin 'christoomey/vim-tmux-navigator'
" }}}
" {{{ Man Pages
Plugin 'vim-utils/vim-man'
" }}}
" {{{ git + vim
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" }}}
" {{{ Rails / Ruby Navigation
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
" }}}
" {{{ Languages
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'chrisbra/Colorizer'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'briancollins/vim-jst'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'bumaociyuan/vim-swift'
" }}}
" {{{ language-specific tagging
" Plugin 'ternjs/tern_for_vim'
Plugin 'ramitos/jsctags'
" }}}
" {{{ Typing aids
Plugin 'Townk/vim-autoclose'
Plugin 'ambirdsall/emmet-vim'
Plugin 'christoomey/vim-system-copy'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'vim-scripts/closetag.vim'
" }}}
" {{{ Configuration
Plugin 'tpope/vim-projectionist'
" }}}
" {{{ Searching
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
" }}}
" {{{ Colors
Plugin 'altercation/vim-colors-solarized'
" }}}
call vundle#end()
filetype on
" }}}
" {{{ Plugin customization
" {{{ Ack.vim
" fold together all hits from same file in ack results when not under cursor.
let g:ack_autofold_results = 1
" }}}
" {{{ Colorizer
let g:colorizer_auto_filetype='css,scss,sass,html'
" }}}
" {{{ Ctrl-p
let g:ctrlp_custom_ignore = 'node_modules'
" }}}
" {{{ Solarized
let g:solarized_termtrans = 1
" }}}
" {{{ Syntastic
let g:syntastic_check_on_open=0
" let g:syntastic_javascript_checkers = ['~/job/rio/node_modules/.bin/eslint']
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["ruby"],
                                            \ "passive_filetypes": ["javascript"] }
" }}}
" {{{ Titlecase
" vim-titlecase's default mapping is `gt`, but I use tabs
let g:titlecase_map_keys = 0
nmap tit <Plug>Titlecase
vmap tit <Plug>Titlecase
nmap tiT <Plug>TitlecaseLine
" }}}
" {{{ VimTmuxNavigator
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif
"}}}
" }}}
" {{{ Folding
set foldopen=
set foldclose=
set foldlevel=0
" }}}
" {{{ Shell and file settings
set shell=zsh
set noswapfile " that's git's job
" it is okay to change files without saving every damn thing
set hidden
set encoding=utf-8
" }}}
" {{{ UI settings (typing and mouse)
" just because you shouldn't use the mouse doesn't mean you shouldn't be able to
set mouse=a
" ditto deleting shit in insert mode
set backspace=indent,eol,start
" 350ms is enough to finish typing combos even on a bad day, but not toooo long.
set timeoutlen=350
set omnifunc=syntaxcomplete#Complete
" }}}
" {{{ Sessions
nnoremap <leader>ms :mksession!<cr>
nnoremap <leader>sms :source %:p:h/Session.vim<cr>
" }}}
" {{{ Search
set incsearch
set hlsearch
" <leader>h to clear highlighting when it gets annoying
nnoremap <leader>h :noh<cr>
" }}}
" {{{ (js)?Ctags
set tags+=./.git/jstags
" }}}
" {{{ Navigation
" `gf` should work with js require/import directives
set suffixesadd+=.js,.ts
" }}}
" {{{ The Land Of Autocommand
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

  autocmd filetype gitcommit setlocal textwidth=72

  " [Plug] github-flavored markdown highlighting for all markdown files
  augroup markdown
    au!
    " nice line formatting for free in markdown
    autocmd bufreadpre *.md setlocal textwidth=80
    autocmd bufreadpre *.markdown setlocal textwidth=80
    " au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END

  " Middleman navigation with slim templating. Useful settings for reference,
  " though the selector is obsolete since I'm not at Flock anymore.
  autocmd BufReadPre,BufNewFile */flock-landing/* set sua+=.html.slim
  autocmd BufReadPre,BufNewFile */flock-landing/* set inex=substitute(v:fname,'partials/','partials/_','')

  " automatically save files on focus lost. Theoretically.
  au FocusLost * silent! wa

  " stop that autocomment noise
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
" }}}
" {{{ Functions
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=81
  endif
endfunction
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<cr>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/|'), '|n', '||n', 'g')
  let @s = temp
endfunction

function! g:AlignAssignments()
  " locate assignment operators
  let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
  let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

  " locate block of code to be considered (same indentation, no blanks)
  " TODO: also match a previous line that is indented one less level if
  "   1) the current line starts with ','
  "   2) said previous line starts with 'var', 'const', or 'let'
  let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
  let firstline  = search('^\%(' . indent_pat . '\)\@!', 'bnW') + 1
  let lastline   = search('^\%(' . indent_pat . '\)\@!',  'nW') - 1
  if lastline < 0 " i.e. EOF reached before non-matching line
    let lastline = line('$')
  endif

  " find the column at which the operators should be aligned
  let max_align_col = 0
  let max_op_width  = 0
  for linetext in getline(firstline, lastline)
    " is there an assignment?
    let left_width = match(linetext, '\s*' . ASSIGN_OP)

    " if so, track the max assignment column and operator width
    if left_width >= 0
      let max_align_col = max([max_align_col, left_width])

      let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
      let max_op_width  = max([max_op_width, op_width + 1])
    endif
  endfor

  " git 'er done
  let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
                                     \ max_op_width,  submatch(2))'

  for linenum in range(firstline, lastline)
    let oldline = getline(linenum)
    let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
    call setline(linenum, newline)
  endfor
endfunction
nnoremap <silent> <leader>= :call g:AlignAssignments()<cr>

" function! g:TagJavascript()
"   execute '! find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
" endfunction

" insert evaluated code output into buffer
" http://blog.joncairns.com/2014/10/evaluate-ruby-or-any-command-and-insert-into-vim-buffers/
function! InsertCommand(command)
  redir => output
  silent execute a:command
  redir END
  call feedkeys('i'.substitute(output, '^[\n]*\(.\{-}\)[\n]*$', '\1', 'gm'))
endfunction

command! -nargs=+ I call InsertCommand(<q-args>)
" }}}
" {{{ Commands
" Hideous and shitty hack, burn with fire ASAP
" But it brings back colors
command! Wtf source $MYVIMRC <bar> source $MYVIMRC
command! Q mksession! <bar> quitall
" }}}
" {{{ Variables
" Treat <li> and <p> tags like the block tags they are.
let g:html_indent_tags = 'li\|p'
let g:netrw_banner=0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" }}}
" {{{ Vanilla mappings
" {{{ Scrolling
" scroll browser-style
noremap <up> <c-y>
noremap <down> <c-e>
" Actually using <c-e> and <c-y> is a sped-up version
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <left> zh
nnoremap <right> zl
" }}}
" {{{ Yanking
" `Y` yanks from current cursor position to EOL instead of acting like `yy`.
nnoremap Y y$
" }}}
" {{{ Smash Escape
"                         CURSOR POSITION AFTER:
"                       |F| | |J| | <= backwards like esc <=
inoremap jf <esc>
inoremap fj <esc>
vnoremap jf <esc>
vnoremap fj <esc>
"                       | | | |J|K| => doesn't move =>
inoremap jk <esc>l
inoremap kj <esc>l
" }}}
" {{{ Insert mode
" {{{ Insert new lines
" quickly insert new line above...
inoremap jj <c-o>o
" ...or below the current one in insert mode.
inoremap uu <c-o>O
" }}}
" }}}
" {{{ Visual mode
" use `*` or `#` in visual mode to search for the selection
xnoremap * :<c-u>call <SID>VSetSearch()<cr>/<c-r>=@/<cr><cr>
xnoremap # :<c-u>call <SID>VSetSearch()<cr>?<c-r>=@/<cr><cr>
" }}}
" {{{ Command mode
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" }}}
" }}}
" {{{ <leader> mappings
" {{{ Moving around
nnoremap <leader><leader><leader> <c-^>
nnoremap <leader>f ^
nnoremap <leader>b :buffer
nnoremap <leader>ev :tabe ~/.dotfiles/vimrc<cr>
nnoremap <leader>gf <c-w>f<bar><c-w>L
" quickly jump to inside an empty matched pair (e.g. '()', '""')
nnoremap <leader>in ?\%<c-r>=line('.')<Return>l\({}\\|\[]\\|<>\\|><\\|()\\|""\\|''\\|``\\|><lt>\)?s+1<Return>
" }}}
" {{{ Inserting stuff
nnoremap <leader>O O<esc>
nnoremap <leader>o o<esc>
nnoremap <leader>P "*P
nnoremap <leader>p "*p
" }}}
" {{{ Formatting
nnoremap <leader>gq gq}
nnoremap <leader>lint :!node_modules/.bin/eslint -c .eslintrc.js %<cr>
nnoremap <leader>r :set wrap!<cr>
nnoremap <leader>tts :%s/\t/  /g<cr>
nnoremap <leader>w :w<cr>
" }}}
" {{{ Folding
" toggle fold under cursor
nnoremap <leader>z za
" }}}
" {{{ Plugins
" {{{ ReplaceWithRegister
nnoremap <leader>gr "*gr
" }}}
" {{{ Vim-fugitive
nnoremap <leader>s :Gstatus<cr>
nnoremap <leader>bl :Gblame<cr>
nnoremap <leader>di :Gdiff
" }}}
" {{{ Vim-rspec
nnoremap <leader>t :call RunCurrentSpecFile()<cr>
nnoremap <leader>n :call RunNearestSpec()<cr>
nnoremap <leader>l :call RunLastSpec()<cr>
" nnoremap <leader>a :call RunAllSpecs()<cr>
" }}}
" {{{ Ag.vim
" The terminal whitespace is on purpose here:
nnoremap <leader>ag :Ag! 
nnoremap <leader>ack :Ack! 
" Don't automatically jump to the first match.
cnoreabbrev Ack Ack!
" }}}
" {{{ AutoClose
nnoremap <leader>ct :AutoCloseToggle<cr>
" }}}
" {{{ Vim-commentary
nmap <leader>c gcc
" }}}
" {{{ Ctags
nnoremap <leader>. :TagbarToggle<cr>
" }}}
" {{{ vim-better-whitespace
nnoremap <leader>sw :StripWhitespace<cr>
" }}}
" {{{ easymotion
nmap <leader>a <Plug>(easymotion-s2)
" }}}
" }}}
" }}}
" {{{ Visual settings: highlighting, linenumbers, indents, splits
set background=dark
colorscheme solarized
" hybrid linenumbers
set number
set relativenumber
set numberwidth=5 " gutter column bigger for readability
set ruler " redundant with powerline installed; left in b/c Wu-Tang is for the
set laststatus=2 " always display status line, even in single buffer
set lazyredraw " don't redraw during macros "
set showcmd
set wildmenu
" 008 comes after 007, not 010.
set nrformats-=octal
set list
set listchars=eol:␤,tab:→·
highlight ColorColumn ctermbg=236
highlight CursorLine ctermbg=236
highlight CursorColumn ctermbg=236
highlight SignColumn ctermbg=236 " the gutter behind the numbers; where gitgutter signs are missing
highlight LineNr ctermbg=236 " the line numbers themselves
highlight NonText ctermfg=237
highlight SpecialKey ctermfg=237
highlight Folded ctermbg=NONE
" 2-space indents; <</>> shifting goes to nearest multiple of 2, even from odds.
set softtabstop=2 shiftwidth=2 shiftround expandtab
" split panes spawn below the current pane, b/c Principle of Least Surprise.
set splitbelow
set nowrap " <leader>r toggles wrap for when it's needed
set diffopt+=vertical " always compare diffs with vertical splits.
" powerline is the best line I know.
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" }}}

" vim:foldmethod=marker:foldlevel=0

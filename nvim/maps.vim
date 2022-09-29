" Description: Keymaps

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
" nnoremap dbw hvb"_d
imap <C-Bs> <ESC>

" Save
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Clear search highlighting
nmap <silent> <C-n> :noh<CR>

" Open Tree-sitter info
nmap <silent> <F1> :TSHighlightCapturesUnderCursor<CR>

" Text wrap toggling
let g:isTextWrapped = 0
function! TextWrapToggle()
  if g:isTextWrapped
    let g:isTextWrapped = 0
    set nowrap
  else
    let g:isTextWrapped = 1
    set wrap
  endif
endfunction

nmap <silent> <A-z> :call TextWrapToggle()<CR>

"-----------------------------
" Tabs

nmap te :tabedit
nmap tn :tabnew<CR> 

" Tab movement
nmap <silent> <S-Tab> :tabprev<CR>
nmap <silent> <Tab> :tabnext<CR>

" Close current tab
nmap <silent> <S-q> :q!<CR>

" Close vim
nmap <silent> <C-q> :%bd!<CR>:q!<CR>

" Save session then close vim
nmap <silent> <A-S-q> :mks!<CR>:%bd!<CR>:q!<CR>

" Show all tabs
nmap <silent> \p :tabs<CR>

" change tab in nvimtree
autocmd FileType NvimTree nmap <buffer> <Tab> gt
"------------------------------
" Windows

" open File explorer
nmap <silent> \e :NvimTreeToggle<CR>

" open terminal
autocmd TermEnter term://*term#* tnoremap <silent><F12> <Cmd>exe v:count1 . "ToggleTerm"<CR>
autocmd TermEnter term://*term#* tnoremap <silent><ESC> <C-\><C-n>
nnoremap <silent><F12> <Cmd>exe v:count1 . "ToggleTerm size=10 direction=horizontal"<CR>
inoremap <silent><F12> <Esc><Cmd>exe v:count1 . "ToggleTerm size=10 direction=horizontal"<CR>

" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window
nmap <C-left> <C-w><
nmap <C-right> <C-w>>
nmap <C-up> <C-w>+
nmap <C-down> <C-w>-



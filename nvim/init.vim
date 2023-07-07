lua require("basic")
lua require("plugins")
lua require("keybindings")
lua require("colorscheme")


" 插件配置
lua require("plugin-config.lualine")
lua require("plugin-config.nvim-tree")
" lua require("plugin-config.nvim-treesitter")


call plug#begin()
Plug 'lfv89/vim-interestingwords'
Plug 'Yggdroot/indentLine'
" Plug 'ConradIrwin/vim-bracketed-paste'    
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-fugitive'


Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'Exafunction/codeium.vim'

call plug#end()


autocmd BufNewFile,BufRead *.xml let g:isRust=1

" vim-interestingwords {
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsGUIColors = ['#e98585', '#ffcc66', '#97df8b', '#72d8dd', '#74a1ef', '#f7a0da']
nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
nnoremap <silent> <leader>M :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"}


" coc {
let g:coc_global_extensions = [
            \ 'coc-highlight',
            \ 'coc-explorer',
            \ 'coc-tsserver',
            \ 'coc-fzf-preview',
            \ 'coc-rust-analyzer',
            \ 'coc-json',
            \ 'coc-translator',
            \ 'coc-snippets',
            \  ]

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> fr :CocCommand fzf-preview.CocReferences<cr> 
nmap <silent> fc :CocCommand fzf-preview.CocDiagnostics<cr> 
" nmap <silent> fc :CocCommand fzf-preview.CocCurrentDiagnostics<cr> 
nmap <silent> fd :CocCommand fzf-preview.CocDefinition<cr> 
nmap <silent> ft :CocCommand fzf-preview.CocTypeDefinition<cr> 
nmap <silent> fi :CocCommand fzf-preview.CocImplementations<cr> 
nmap <silent> fo :CocCommand fzf-preview.CocOutline<cr> 
nmap <silent> fv :Vista<cr> 


noremap f, <C-O>
noremap f. <C-I>

nmap <silent> ff :CocCommand explorer<cr> 
" nmap <silent> ff :CocCommand fzf-preview.ProjectFiles<cr> 
nmap <silent> fm :CocCommand fzf-preview.Bookmarks<cr> 
nmap <silent> fb :CocCommand fzf-preview.Buffers<cr> 
nmap <silent> fs :CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=expand('<cword>')<CR>"<CR>
" nmap <silent> fb :CocCommand fzf-preview.VistaBufferCtags<cr> 
" nmap <silent> fb :CocCommand fzf-preview.ProjectGrep 

nmap <silent> f/ :CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>

" rust special
nmap <silent> rp <Plug>(coc-diagnostic-prev)
nmap <silent> rn <Plug>(coc-diagnostic-next)
nmap <silent> rr :CocCommand rust-analyzer.run<CR>
"}

" fugitive git {
nmap <silent> gs :Git status<CR>
nmap <silent> gs :Gvdiffsplit<CR>

"}

" indtent line {
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
"}

" commentary{
" gcc to toggle this line, 
" gc3j to toggle this line and the 3 below it, 
" gcip to toggle the paragraph. 
" gc} to toggle to the next blank line, etc. 
" gcu to uncomment an entire,
" }

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" gaip=
" = Around the 1st occurrences
" 2= Around the 2nd occurrences
" *= Around all occurrences
" **= Left/Right alternating alignment around all occurrences
" <Enter> Switching between left/right/center alignment modes

" vipga=
" }


"vim-bookmarks {
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_auto_close = 1
"}

"rainbow {
let g:rainbow_active = 1
" }

"fzf-preview{
let g:fzf_preview_use_dev_icons = 1
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox-dark'

"}

"fzf{
function! GtagsFzf(query, fullscreen)
    let command_fmt = ' global -x -- %s | awk ''{printf  $3 ":" $2 "\t"}{$1=$2=$3=""; print $0}'' '
    let command = printf(command_fmt, a:query)
    call fzf#vim#grep(command, 0, fzf#vim#with_preview(), a:fullscreen)
endfunction

command! -nargs=* -bang Gtfzf call GtagsFzf(<q-args>, <bang>0)
"}


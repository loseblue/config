
lua require("basic")
lua require("plugins")
lua require("keybindings")
lua require("colorscheme")


" 插件配置
lua require("plugin-config.lualine")
lua require("plugin-config.nvim-tree")
lua require("plugin-config.nvim-treesitter")


call plug#begin()
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Yggdroot/LeaderF-marks'
Plug 'liuchengxu/vista.vim'
Plug 'lfv89/vim-interestingwords'

Plug 'rbgrouleff/bclose.vim'
Plug 'iberianpig/tig-explorer.vim'

Plug 'MattesGroeger/vim-bookmarks'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'


call plug#end()


" leaderF {
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupWidth = 0.9
let g:Lf_PopupHeight = 0.9
let g:Lf_PopupShowStatusline = 0

let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_RootMarkers = ['.project', '.git', '.hg', '.svn']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WildIgnore = {
	    \ 'dir': ['.svn','.git'],
	    \ 'file': ['*.bak','*.exe','*.[oad]','*.so','*.py[co]']
	    \}
let g:Lf_MruMaxFiles=50
let g:Lf_GtagsAutoGenerate = 1 "或者手动Leaderf gtags --update

noremap ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap ft :<C-U><C-R>=printf("Leaderf mru")<CR><CR>

noremap fl :LeaderfFunction!<CR>
noremap fo :<C-U><C-R>=printf("Leaderf! --recall")<CR><CR>
noremap fn :<C-U><C-R>=printf("Leaderf! --next")<CR><CR>
noremap fp :<C-U><C-R>=printf("Leaderf! --previous")<CR><CR>
noremap f, <C-O>
noremap f. <C-I>

noremap fu :Leaderf! gtags --update --skip-unreadable<CR><CR>

noremap fr :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --result ctags-mod -r %s", expand("<cword>"))<CR><CR>
noremap fd :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --result ctags-mod -d %s", expand("<cword>"))<CR><CR>
noremap fs :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --result ctags-mod -s %s", expand("<cword>"))<CR><CR>
noremap fg :<C-U><C-R>=printf("Leaderf! rg -F -w --nameOnly %s ", expand("<cword>"))<CR><CR>

noremap fR :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --append --result ctags-mod -r %s", expand("<cword>"))<CR><CR>
noremap fD :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --append --result ctags-mod -d %s", expand("<cword>"))<CR><CR>
noremap fS :<C-U><C-R>=printf("Leaderf! gtags --auto-jump --append --result ctags-mod -s %s", expand("<cword>"))<CR><CR>
noremap fG :<C-U><C-R>=printf("Leaderf! rg -F -w --nameOnly --append %s ", expand("<cword>"))<CR><CR>

noremap fa :Leaderf! gtags -s 

noremap <F3> :Leaderf! rg -F 
noremap <C-F3> :<C-U><C-R>=printf("Leaderf! rg -F -w %s ", expand("<cword>"))<CR>
noremap <S-F3> :<C-U><C-R>=printf("Leaderf! rg -F -w %s ", expand("<cword>"))<CR>
"}

" vim-interestingwords {
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsGUIColors = ['#e98585', '#ffcc66', '#97df8b', '#72d8dd', '#74a1ef', '#f7a0da']
nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
vnoremap <silent> <leader>m :call InterestingWords('v')<cr>
nnoremap <silent> <leader>M :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"}

" vista {
let g:vista_sidebar_open_cmd = '50vsplit'

function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista#renderer#ctags = '--list-kinds=c++'
let g:vista_ctags_cmd = {
	    \ 'haskell': 'hasktags -x -o - -c',
	    \ }
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
	    \   "function": "\uf794",
	    \   "variable": "\uf71b",
	    \  }
" }

" vim-bookmarks {
let g:bookmark_auto_close = 1
"}

let g:deoplete#enable_at_startup = 1

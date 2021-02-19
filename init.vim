" +++++++++++++++++++++++++++++++ Start of Vim-Plug auto-download +++++++++++++++++++++++++++++++
" Original code borrowed from: https://www.rosipov.com/blog/cross-platform-vim-plug-setup/
" Original code borrowed from: https://www.amazon.ca/Mastering-Vim-software-development-environment-ebook/dp/B07HHD55H2/ref=sr_1_1?dchild=1&keywords=mastering+vim+build+a+software&qid=1613709804&sr=8-1
"
" On Windows the NeoVim configuration file init.vim goes to %USERPROFILE%/AppData/Local/nvim/init.vim
" On Windows the Vim configuration file init.vim goes to %USERPROFILE%/vimfiles/vimrc
let g:xdg_config_home = $XDG_CONFIG_HOME
let g:xdg_data_home = $XDG_DATA_HOME
let g:plug_github_url = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
let g:autoload_plug = '/autoload/plug.vim'

" Figure out where the plug-vim and plugin files go
" Note that $HOME is a somewhat magic variable that is fixed up on Windows for
" us
if g:is_vim
    if has('win32')
        let g:plug_location = $HOME . '/vimfiles'
        let g:plugin_location=''
    else
        let g:plug_location = $HOME . '/.vim'
        let g:plugin_location = ''
    endif
else
    " For Neovim here, we also take the XDG locations into account if they are
    " defined
    if has('win32')
        let g:plug_location = $HOME . '/AppData/Local/nvim/vimfiles'
        let g:plugin_location = ''
    else
        if len(g:xdg_data_home) == 0
            let g:plug_location = $HOME . '/.local/share/nvim/site'
        else
            let g:plug_location= g:xdg_data_home . '/nvim/site'
        endif
        if len(g:xdg_data_home) == 0
            let g:plugin_location = $HOME . '/.local/shared/nvim/plugged'
        else
            let g:plugin_location = g:xdg_data_home . '/nvim/plugged'
        endif
    endif
endif

" Download Plug plugin for (Neo)vim
if empty(glob(g:plug_location . g:autoload_plug))
    execute '!curl -fLo ' . g:plug_location . g:autoload_plug . ' --create-dirs ' . g:plug_github_url
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" If our plugin location is defined, then call plug#begin with it
if len(g:plugin_location) == 0
    call plug#begin()
else
    call plug#begin(g:plugin_location)
endif

Plug 'junegunn/vim-plug'
" ========== Put your plugins here ==========

" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-speeddating'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-abolish'


" ========== Put your plugins here ==========
" Use the below to finish your plugins (uncomment)
call plug#end()
" +++++++++++++++++++++++++++++++ End of Vim-Plug auto-download +++++++++++++++++++++++++++++++

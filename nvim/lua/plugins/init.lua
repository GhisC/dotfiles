local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install Packer if it's not already
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" 

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- LSP
        -- use {"neovim/nvim-lspconfig", opt = true}
        -- use {"glepnir/lspsaga.nvim", opt = true}
        -- use {"kabouzeid/nvim-lspinstall", opt = true}

        -- Fuzzy finder
--         use {"nvim-lua/popup.nvim", opt = true}
        use {"nvim-lua/plenary.nvim", opt = true}
--         use {"nvim-telescope/telescope.nvim", opt = true}
--         use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
        use {"junegunn/fzf", opt = true, run = "fzf#install()"}
        use {"junegunn/fzf.vim", opt = true}

        -- Autocomplete
        -- use {"hrsh7th/nvim-compe", opt = true}
        -- use {"hrsh7th/vim-vsnip", opt = true}
        -- use {"rafamadriz/friendly-snippets", opt = true}
        use {"neoclide/coc.nvim", branch = "release", opt = true}

        -- Tags
        use {"ludovicchabant/vim-gutentags", opt = true}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        -- Explorer
        -- use {"kyazdani42/nvim-tree.lua", opt = true}
        -- TODO remove when open on dir is supported by nvimtree
        -- use "kevinhwang91/rnvimr"

        -- Misc
        use {"lewis6991/gitsigns.nvim", opt = true}
        use {"terrortylor/nvim-comment", opt = true}
        -- use {"folke/which-key.nvim", opt = true}

        -- Theme
        use {"morhetz/gruvbox", opt = true}

        -- Icons
        use {"kyazdani42/nvim-web-devicons", opt = true}

        -- Status line and buffer line
        use {"glepnir/galaxyline.nvim", branch = "main", opt = true}
        use {"romgrk/barbar.nvim", opt = true}

        -- require_plugin("nvim-lspconfig")
        -- require_plugin("lspsaga.nvim")
        -- require_plugin("nvim-lspinstall")
        -- require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        -- require_plugin("telescope.nvim")
        -- require_plugin("nvim-compe")
        -- require_plugin("vim-vsnip")
        -- require_plugin("friendly-snippets")
        require_plugin("fzf")
        require_plugin("fzf.vim")
        require_plugin("coc.nvim")
        require_plugin("vim-gutentags")
        require_plugin("nvim-treesitter")
        -- require_plugin("nvim-tree.lua")
        require_plugin("gitsigns.nvim")
        require_plugin("nvim-comment")
        -- require_plugin("which-key.nvim")
        require_plugin("gruvbox")
        require_plugin("nvim-web-devicons")
        require_plugin("galaxyline.nvim")
        require_plugin("barbar.nvim")
    end
)

-- " File explorer
-- " Plugin 'vifm/vifm.vim'
-- " vimlf
-- " ranger
-- 
-- " Misc
-- Plugin 'google/vim-searchindex'
-- Plugin 'sheerun/vim-polyglot'

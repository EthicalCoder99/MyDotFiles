-- Specifies python and node provider path to make startup faster
vim.g.python3_host_prog = '/usr/bin/python3'
-- vim.g.node_host_prog = os.getenv("HOME") .. '/.local/npm/bin/neovim-node-host'
vim.g.node_host_prog = '/usr/local/bin/neovim-node-host'

-- disable git messenger default mappings
vim.g.git_messenger_no_default_mappings = true

-- highlight yanked text for 250ms
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank{ timeout = 250 }")

-- highlight bg according to hex/rgb/rgba text
vim.cmd [[packadd nvim-colorizer.lua]]
require"colorizer".setup {
    ["*"] = {css = true, css_fn = true, mode = 'background'}
}

vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char_highlight = "NonText"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype_exclude = {"help"}

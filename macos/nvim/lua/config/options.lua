-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})

vim.g.augment_workspace_folders = {
  "/var/www/html/coding/PERSONAL/projects/aiom-system/be-service",
  "/var/www/html/coding/PERSONAL/projects/aiom-system/fe-dashboard",
  "/var/www/html/coding/PERSONAL/projects/micro-products",
  "/var/www/html/coding/PERSONAL",
}

--
-- local opt = vim.opt

-- opt.clipboard = "unnamedplus"
-- opt.linebreak = true
-- opt.wrap = true

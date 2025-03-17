-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.augment_workspace_folders = {
  "/var/www/html/coding/PERSONAL/projects/aiom-system/be-service",
  "/var/www/html/coding/PERSONAL/projects/aiom-system/fe-dashboard",
  "/var/www/html/coding/PERSONAL/projects/micro-products",
  "/var/www/html/coding/PERSONAL",
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- vim.cmd([[colorscheme everforest]])
-- vim.o.background = "dark" -- or "light" for light mode

-- require("lualine").setup({
--   sections = {
--     lualine_x = {
--       {
--         -- require("noice").api.statusline.mode.get,
--         -- cond = require("noice").api.statusline.mode.has,
--         color = { fg = "#ff9e64" },
--       },
--     },
--   },
-- })

require("deno-nvim").setup({
  server = {
    settings = {
      deno = {
        inlayHints = {
          parameterNames = {
            enabled = true,
          },
          parameterTypes = {
            enabled = true,
          },
          variableTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          enumMemberValues = {
            enabled = true,
          },
        },
        enable = true,
        suggest = {
          imports = {
            hosts = {
              ["https://crux.land"] = true,
              ["https://deno.land"] = true,
              ["https://x.nest.land"] = true,
              ["https://esm.sh"] = true,
              ["https://registry.npmjs.org"] = true,
            },
          },
        },
      },
    },
  },
})

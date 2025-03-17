return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = false,
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Finder Under"] = "<C-n>",
    }
  end,
}

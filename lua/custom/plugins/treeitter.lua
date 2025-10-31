-- lua/custom/plugin/folding.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- pick what you actually use
      ensure_installed = {
        "lua","vim","vimdoc","bash","python","javascript","typescript","tsx","json","yaml","html","css","markdown","markdown_inline", "php"
      },
      sync_install = false,   -- async to avoid file-descriptor spikes
      auto_install = false,   -- no surprise installs while editing
      highlight = { enable = true },
      indent = { enable = true },
    })

    -- Treesitter folding
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldenable = true
    vim.o.foldlevel = 99
    vim.o.foldnestmax = 3
  end,
}

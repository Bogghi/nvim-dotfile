return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require('neo-tree').setup({
        window = {
          -- Setting max_width to false disables truncation completely.
          -- When false, filenames will display in full without ellipses.
          max_width = 0,
	  trailing_slash = false,
	  truncate = false,
        },
      })

      -- Keybinding to toggle Neo-tree
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
    end,
  },
}

-- lua/custom/plugin/telescope.lua
--
-- Minimal and fast Telescope setup with fuzzy search from current folder downward

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      defaults = {
        prompt_prefix = '🔍 ',
        selection_caret = ' ',
        path_display = { 'smart' },
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
        file_ignore_patterns = { 'node_modules', '.git/' },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { '--hidden' }
          end,
        },
      },
    }

    -- Enable the fzf-native sorter
    pcall(telescope.load_extension, 'fzf')

    -- Keymaps for common Telescope actions
    local map = vim.keymap.set
    map('n', '<leader>ff', builtin.find_files, { desc = 'Find files in current folder' })
    map('n', '<leader>fg', builtin.live_grep, { desc = 'Search text recursively' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Find open buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
  end,
}

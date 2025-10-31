return {
  'dracula/vim',
  name = 'dracula',
  config = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme 'dracula'
  end,
}

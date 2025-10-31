-- lua/custom/plugins/tabby.lua
return {
  "nanozuki/tabby.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("tabby").setup({
      line = function(line)
        return {
          { { "  " } },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and "TabLineSel" or "TabLine"
            return {
              { " " .. tab.number() .. " " .. tab.name() .. " ", hl = hl },
              { "│", hl = "TabLine" },
            }
          end),
          { { "  " } },
        }
      end,
    })
  end,
}

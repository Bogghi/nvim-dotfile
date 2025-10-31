return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,  -- disable auto-format
  },
  keys = {
    { "<leader>f", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format file manually",
    },
  },
}


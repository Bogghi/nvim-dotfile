return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "intelephense", "lua_ls" },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end

      -- Robust “go to definition”: if no LSP provides it, fallback to Vim's gd
      map("gd", function()
        local has = #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/definition" }) > 0
        if has then vim.lsp.buf.definition() else vim.cmd.normal({ "gd", bang = true }) end
      end, "Go to definition")

      map("gr", vim.lsp.buf.references, "References")
      map("K",  vim.lsp.buf.hover,      "Hover")
      map("<leader>rn", vim.lsp.buf.rename, "Rename")
      map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    end

    local lspconfig = require("lspconfig")

    -- PHP
    lspconfig.intelephense.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      -- Tame the workspace so it doesn’t crawl your DB or vendor tarpit
      settings = {
        intelephense = {
          files = {
            maxSize = 1000000, -- 1MB (match the warnings you saw)
            exclude = {
              "**/.git/**",
              "**/node_modules/**",
              "**/vendor/**",
              "data/postgres/**",
            },
          },
          -- optional: speed up indexing by declaring your project root markers
          environment = { phpVersion = "8.2" },
        },
      },
      root_dir = function(fname)
        return lspconfig.util.root_pattern("composer.json", ".git")(fname)
          or lspconfig.util.path.dirname(fname)
      end,
      filetypes = { "php", "phtml" },
    })

    -- Example: Lua LSP (harmless, just here as a sample)
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = { Lua = { diagnostics = { globals = { "vim" } } } },
    })
  end,
}


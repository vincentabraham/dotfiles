return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
     require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          -- "clangd",
        }
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      -- lspconfig.clangd.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- displays documentation
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- go to def
      vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, {}) -- code action
    end
  }
}

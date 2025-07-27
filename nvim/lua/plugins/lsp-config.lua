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
          "clangd",
          "basedpyright",
        }
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_dir = lspconfig.util.root_pattern(
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt"
        ),
        capabilities = {
          offsetEncoding = { "utf-8", "utf-16" },
          textDocument = {
            completion = {
              editsNearCursor = true,
            }
          }
        },
      })
      lspconfig.basedpyright.setup({
        cmd = { "basedpyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern(
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git"
        ),
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
            },
            reportMissingSuperCall = false,
            typeCheckingMode = "standard",
          }
        },
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- displays documentation
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- go to def
      vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, {}) -- code action
    end
  }
}

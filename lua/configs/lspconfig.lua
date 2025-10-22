require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "rust_analyzer", "jsonls" }

vim.lsp.config.ts_ls = vim.tbl_deep_extend("force", vim.lsp.config.ts_ls or {}, {
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsForImportStatements = true,
        importModuleSpecifier = "non-relative",
        -- importModuleSpecifierEnding = "js",
        autoImportFileExcludePatterns = {
          "build/**/*.js",
          "build/**/*.d.ts",
        },
      },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

return {
  "jose-elias-alvarez/null-ls.nvim",
  priority = 999,

  -- "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    local b = null_ls.builtins
    -- local cspell = require("cspell")
    -- local b = none_ls.builtins
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {

      -- cspell
      b.diagnostics.cspell.with {
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity["HINT"]
          -- change diagnostic error to hint
        end,
      },

      b.code_actions.cspell, -- Set a formatter
      b.formatting.black,
      b.formatting.stylua,
      b.formatting.prettier,
      b.formatting.clang_format,
      -- cspell.code_actions,
      -- Markdown
      -- b.diagnostics.markdownlint,
    }
    config.debounce = 150
    config.debug = true
    return config -- return final config table
  end,
}

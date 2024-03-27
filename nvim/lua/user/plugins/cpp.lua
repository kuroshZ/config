local utils = require "astronvim.utils"
return {
  {
    "p00f/clangd_extensions.nvim",
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            vim.api.nvim_del_augroup_by_id(augroup)
          end
        end,
      })
    end,
  },
  -- {
  --   "Civitasv/cmake-tools.nvim",
  --   ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  --   dependencies = {
  --     {
  --       "jay-babu/mason-nvim-dap.nvim",
  --       opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "codelldb") end,
  --     },
  --   },
  --   opts = {},
  -- },
}

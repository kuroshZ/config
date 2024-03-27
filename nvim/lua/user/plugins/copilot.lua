-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup { suggestion = { enabled = false, auto_trigger = true, debounce = 150 } }
--   end,
-- }

return {
  -- Disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    keys = function() return {} end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup { suggestion = { enabled = false, auto_trigger = true, debounce = 150 } }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = { "InsertEnter", "LspAttach" },
    config = function() require("copilot_cmp").setup() end,
  },

  --------------------------------------------------------
  -- {
  --   "github/copilot.vim",
  --   name = "copilot",
  --   event = "VeryLazy",
  --   config = function(_, opts)
  --     -- For copilot.vim
  --     -- enable copilot for specific filetypes
  --     --
  --     -- require("copilot").setup {
  --     --   suggestion = { enabled = false, auto_trigger = true, debounce = 150 },
  --     -- }
  --     vim.g.copilot_filetypes = {
  --       ["TelescopePrompt"] = false,
  --     }
  --
  --     vim.cmd [[
  --       let g:copilot_assume_mapped = v:true
  --     ]]
  --
  --     local keymap = vim.keymap.set
  --     local opts = { silent = true }
  --     keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
  --     keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
  --     keymap("i", "<C-l>", "<Plug>(copilot-suggest)", opts)
  --   end,
  -- },

  ----------------------------------------------------------------------
  -- Add status line icon for copilot {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     local Util = require("lazyvim.util")
  --     table.insert(opts.sections.lualine_x, 2, {
  --       function()
  --         local icon = require("lazyvim.config").icons.kinds.Copilot
  --         return icon
  --       end,
  --       cond = function()
  --         local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
  --         return ok and #clients > 0
  --       end,
  --       color = function()
  --         return Util.ui.fg("Special")
  --       end,
  --     })
  --   end,
  -- },
}

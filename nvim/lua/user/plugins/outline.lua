return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  config = function(_, opts) require("outline").setup {} end,
}

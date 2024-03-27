return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      {
        "<leader>ler",
        function() require("telescope").extensions.refactoring.refactors() end,
        mode = { "v" },
        desc = "Refactoring menu",
      },
      -- Debug variable
      {
        "<leader>lev",
        function()
          require("refactoring").debug.print_var {
            below = true,
          }
        end,
        mode = { "n", "x" },
        desc = "Print variables",
      },
      -- Clean up debugging
      {
        "<leader>lec",
        function()
          require("refactoring").debug.cleanup {
            force = true,
          }
        end,
        desc = "Clear debugging",
      },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,

        cpp = true,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,

        cpp = true,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
    },
    config = function(_, options)
      require("refactoring").setup(options)
      require("telescope").load_extension "refactoring"
    end,
  },
}

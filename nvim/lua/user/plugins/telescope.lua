local utils = require "user.utils"
local function find_files_from_project_git_root()
  local opts = {}
  if utils.is_git_repo() then opts = {
    cwd = utils.get_git_root(),
  } end
  require("telescope.builtin").find_files(opts)
end

local function live_grep_from_project_git_root()
  local opts = {}

  if utils.is_git_repo() then opts = {
    cwd = utils.get_git_root(),
  } end

  require("telescope.builtin").live_grep(opts)
end

return {
  "telescope.nvim",
  keys = {
    -- add <leader>fa to find all, including hidden files
    {
      "<leader>fa",
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      desc = "Find All Files (including hidden)",
    },

    {
      "<leader>fl",
      function() live_grep_from_project_git_root() end,
      desc = "Live Grep From Project Git Root",
    },
  },
}

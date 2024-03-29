M = {}

function M.set_telescope()
  require("which-key").register({
    ['/'] = {
      name = "+search",
      ['/'] = { require("telescope.builtin").live_grep, "Working Directory" },
      b = { function() require("telescope.builtin").live_grep({grep_open_files = true}) end, "Open Buffers" },
      c = {
        name = "+under cursor",
        ['/'] = { require("telescope.builtin").grep_string, "Working Directory" },
        b = {
          function() require("telescope.builtin").grep_string({ grep_open_files = true }) end,
          "Open Buffers"
        },
      },
      f = { require("telescope.builtin").current_buffer_fuzzy_find, "Current Buffer (fuzzy)" },
      [':'] = { require("telescope.builtin").command_history, "Commands" },
    },
    f = {
      name = "+files",
      f = { require("telescope.builtin").find_files, "Find" },
      g = { require("telescope.builtin").git_files, "Find Git" },
      a = {
        function()
          require("telescope.builtin").find_files(
            { hidden = true, no_ignore = true, no_ignore_parent = true }
          )
        end,
        "Find All"
      },
      p = { require("telescope.builtin").old_files, "Find Previous" },
      b = { require("telescope.builtin").buffers, "Find Buffers" },

      z = { require("telescope").extensions.zoxide.list, "Zoxide" },
    },
  },
  { prefix = '<leader>' })
end

return M

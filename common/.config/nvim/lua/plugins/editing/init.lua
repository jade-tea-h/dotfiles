local config = require("plugins.editing.config")

return {
  {
    "numToStr/Comment.nvim",
    name = "comment",
    opts = {
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = '<leader>c',
        block = '<leader>b',
      },
      extra = {
        above = '<leader>c0',
        below = '<leader>co',
        eol = '<leader>cA',
      },

      ignore = '^$',  -- ignore empty lines
    },
    config = true,
    version = "*",
    keys = config.comment_keys,
    event = "VeryLazy",
    dependencies = { "treesitter" },
  },

  {
    "gbprod/yanky.nvim",
    name = "yanky",
    opts = {
      picker = {
        telescope = {
          use_default_mappings = false,
        },
      },
    },
    config = config.yanky_config_function,
    dependencies = { "telescope" },
    event = "VeryLazy",
  },

  {
    "gbprod/substitute.nvim",
    opts = function()
      return {
        on_substitute = require("yanky.integration").substitute(),
      }
    end,
    dependencies = { "yanky" },
  },

  {
    "Wansmer/sibling-swap.nvim",
    config = config.swap_config_function,
    dependencies = { "Wansmer/binary-swap.nvim", "treesitter" },
    keys = config.swap_keys,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    opts = {
      keymaps = {
        normal = "<leader>s",
        normal_cur = "<leader>ss",
        normal_line = "<leader>S",
        normal_cur_line = "<leader>SS",
        visual = "s",
        visual_line = "S",
        delete = "<leader>sd",
        change = "<leader>sc",
        change_line = "<leader>Sc",
      },
    },
    config = true,
    dependencies = { "treesitter", "ts-textobjects" },
    keys = config.swap_keys,
  },

  {
    "s1n7ax/nvim-search-and-replace",
    config = true,
  },
}

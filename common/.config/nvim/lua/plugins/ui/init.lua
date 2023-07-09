return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 100,
    version = "*",
    opts = {
      options = {
        transparent = false,
        dim_inactive = true,
      },
    },
    config = function(_, opts)
      require('nightfox').setup(opts)
      vim.cmd("colorscheme carbonfox")
    end,
    build = ":NightfoxCompile",
    dependencies = { "treesitter", "ts-playground" },
  },

  {
    "freddiehaddad/feline.nvim",
    name = "feline",
    config = function()
      require('plugins.ui.feline')
    end,
    dependencies = "devicons",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "sitiom/nvim-numbertoggle",
    name = "numbertoggle",
    init = function()
      vim.opt.number = true
    end,
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent",
    main = "indent_blankline",
    version = "*",
    opts = {
      show_current_context = true,
      -- char = '⎸',
      -- context_char = '⎸',
    },
    event = { "BufReadPost", "BufNewFile" },
  },
}

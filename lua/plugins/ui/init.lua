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
      -- require("plugins.ui.feline")
    end,
    build = ":NightfoxCompile",
    dependencies = { "treesitter", "ts-playground" },
  },

  {
    "freddiehaddad/feline.nvim",
    name = "feline",
    dependencies = "devicons",
    event = { "BufReadPre", "BufNewFile" },
  },
}

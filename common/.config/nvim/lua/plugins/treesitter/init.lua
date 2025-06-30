local utils = require("plugins.treesitter.utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      require("nvim-treesitter").install(utils.languages)
    end,
    branch = "main",
    lazy = false,
    cmd = {
      "TSInstall",
      "TSUpdate",
      "TSUpdateSync",
    },
  },

  {
    "RRethy/nvim-treesitter-endwise",
    enabled = false,  -- doesn't support nvim-treesitter main branch yet
    ft = { "ruby", "lua", "vim", "bash", "elixir", "fish", "julia", "markdown" },
  },

  {
    "brianhuster/treesitter-endwise.nvim",  -- temporary replacement for above plugin
    lazy = false,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
      languages = {
        kdl = "// %s",
      },
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}

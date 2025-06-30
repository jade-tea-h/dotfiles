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
    "luckasRanarison/tree-sitter-hyprlang",
    build = ":TSInstall hyprlang",
    init = function()
      vim.filetype.add(
        {
          pattern = {
            [".*/hypr/.*%.conf"] = "hyprlang",
          },
        }
      )
    end,
    ft = "hyprlang",
  },

  {
    "Fymyte/rasi.vim",
    build = ":TSInstall rasi",
    dependencies = { "treesitter" },
    ft = "rasi",
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

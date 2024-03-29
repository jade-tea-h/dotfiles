local utils = require("plugins.whichkey.utils")

return {
  "folke/which-key.nvim",
  opts = {
    key_labels = {
      ['<space>'] = "␣",
      ['<cr>'] = "↵ ",
      ['<tab>'] = "⇥ ",
    },
    presets = {
      operators = false,
    },
  },
  config = function(_, opts)
    vim.tbl_deep_extend("keep", utils.operators, opts.operators or {})
    opts.operators = utils.operators
    require("which-key").setup(opts)

    for _, keymap in pairs(utils.to_register) do
      require("which-key").register(unpack(keymap))
    end
  end,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  event = "VeryLazy",
}

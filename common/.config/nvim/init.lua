require("config.options").setup()
require("config.autocmds").setup()
require("config.keymaps").setup()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    version = false,
    lazy = true,
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  custom_keys = false,
  diff = { cmd = "diffview.nvim" },
  checker = {
    enabled = true,
    notify = false,
    concurrency = 1,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

require("lazy").setup("plugins", opts)

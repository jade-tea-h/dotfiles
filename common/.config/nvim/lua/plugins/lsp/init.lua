local servers = require("plugins.lsp.language_servers")
local map = require("plugins.lsp.keymaps")

return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    config = servers.setup,
    init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(env)
          require("which-key").add({ buffer = env.buf, map.on_attach })
        end,
      })
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = { automatic_installation = true },
        config = true,
        dependencies = { "mason" },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "williamboman/mason.nvim",
    name = "mason",
    build = ":MasonUpdate",
    config = true,
    cmd = { "Mason", "MasonUpdate", "MasonInstall", "MasonUninstall" },
  },

  {
    "hinell/lsp-timeout.nvim",
    event = "LspAttach",
  },

  {
    "rmagatti/goto-preview",
    name = "goto-preview",
    -- opts = function()
    --   local ok, module = pcall(require, "plugins.lsp.local")
    --   if ok then return module.goto_preview_opts else return {} end
    -- end,
    config = true,
  },

  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true,
      hint_enable = false,
      select_signature_key = '<c-j>',
    },
    config = function(_, opts) require("lsp_signature").on_attach(opts) end,
    event = "LspAttach",
  },

  {
    "nvimdev/lspsaga.nvim",
    opts = {
      symbol_in_winbar = { enable = true },
      implement = { enable = false },
      diagnostic = {
        extend_relatedInformation = true,
        show_layout = "normal",
        -- show_code_action = false,
      },
      lightbulb = { enable = false },
    },
    config = true,
    dependencies = { "devicons" },
    event = "LspAttach",
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
  },
}

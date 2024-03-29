vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function(env)
    vim.api.nvim_buf_create_user_command(
      env.buf,
      "Preview",
      function()
        vim.system({"typst", "watch", "--open", "zathura", env.file, "temp.pdf"})
      end, {}
    )
  end,
})

return {
  {
    "MrPicklePinosaur/typst-conceal.vim",
    init = function()
      require("utils").set_ft_window_option("typst", { conceallevel = 2 })
    end,
    ft = "typst",
  },

  {
    "kaarmu/typst.vim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "typst",
        command = 'let b:did_plugin = 1 | let b:current_syntax = "typst" | let current_compiler=""'
      })
    end,
    ft = "typst",
  },
}

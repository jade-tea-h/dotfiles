return {
  {
    "lervag/vimtex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexrun"
      vim.opt.conceallevel = 1
      vim.g.tex_conceal = "abdmg"
      vim.g:vimtex_toc_config = {
        name = 'TOC',
        layers = {'content', 'todo', 'include'},
        resize = 1,
        split_width = 50,
        todo_sorted = 0,
        show_help = 1,
        show_numbers = 1,
        mode = 2,
      }
    end,
  },
}

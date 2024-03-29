local M = {}

function M.setup()
  -- Use true tabs for makefiles
  vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = "make",
      callback = function()
        vim.bo.expandtab = false
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 0
      end,
    }
  )

  vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = "help",
      callback = function()
        vim.keymap.set('n', 'gd', function() vim.cmd.tag(vim.fn.expand("<cword>")) end, {buffer=true})
      end
    }
  )

  -- Set wrap for typst, latex and markdown
  require("utils").set_ft_window_option(
    {"markdown", "typst", "tex", "latex"},
    { wrap = true, linebreak = true, breakindent = true, breakindentopt = "list:-1,shift:2,min:20" }
  )

  -- identify `- [ ]` as a list expression so indentation happens at the beginning of text when soft wrapping
  vim.api.nvim_create_autocmd(
    "FileType",
    {
      pattern = "markdown",
      callback = function() vim.opt.formatlistpat:prepend("^\\s*- \\[[x ]\\]\\s\\+\\|") end,
    }
  )

  vim.api.nvim_create_user_command(
    "Tcd",
    function(opts)
      for _, arg in pairs(opts.fargs) do
        local writeable = vim.fn.filewritable(vim.fn.expand(arg))
        if writeable == 2 or vim.fn.filereadable(vim.fn.expand(arg)) then
          vim.cmd.tabnew(arg)
          vim.cmd.tchdir("%:h")
        elseif writeable == 1 then
          vim.cmd.tabnew()
          vim.cmd.tchdir(arg)
        end
      end
    end,
    { nargs = '+', complete = "file" })
end

return M

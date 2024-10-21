-- Language specific changes

return {
  {
    -- Latex
    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        ["tex"] = { "latexindent" },
        -- can add more here for different languages
      },
    },
  },

  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_compiler_latexmk = {
        ["build_dir"] = "output",
        ["options"] = {
          "-auxdir=aux",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- Using Zathura
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}

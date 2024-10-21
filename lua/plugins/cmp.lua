return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Disable menu from appearing unless prompted
      opts.completion = {
        autocomplete = false,
      }

      -- Set up better mapping
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-Space>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end, { "i", "c" }),

        ["<C-e>"] = cmp.mapping.abort(),

        -- Do not make <CR> enter if menu not open
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.mapping.confirm({ select = true })
          end
          fallback()
        end, { "i", "c" }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          else
            cmp.complete()
            cmp.select_prev_item()
          end
        end, { "i", "c" }),

        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
            cmp.select_next_item()
          end
        end, { "i", "c" }),

        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil,
      })
    end,
  },
}

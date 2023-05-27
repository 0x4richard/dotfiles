return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "jcdickinson/codeium.nvim" },
  },
  opts = function(_, opts)
    local cmp = require("cmp")
    local default_format_fn = opts.formatting.format
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
    opts.formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        item = default_format_fn(entry, item)
        if entry.source.name == "codeium" then
          item.kind = ""
        end
        return item
      end,
    }
    vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#6CC644" })
  end,
}

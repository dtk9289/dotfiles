local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

-- custom function: priorities sort
  local lspkind_comparator = function(conf)
    local lsp_types = require('cmp.types').lsp
    return function(entry1, entry2)
      if entry1.source.name ~= 'nvim_lsp' then
        if entry2.source.name == 'nvim_lsp' then
          return false
        else
          return nil
        end
      end
      local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
      local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

      local priority1 = conf.kind_priority[kind1] or 0
      local priority2 = conf.kind_priority[kind2] or 0
      if priority1 == priority2 then
        return nil
      end
      return priority2 < priority1
    end
  end

  local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label > entry2.completion_item.label
  end
-- custom function end

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
      ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'luasnip' },
    }),
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    --set priorities bases on value
    -- sorting = {
    --   comparators = {
    --     lspkind_comparator({
    --       kind_priority = {
    --         Field = 11,
    --         Property = 11,
    --         Constant = 10,
    --         Enum = 10,
    --         EnumMember = 10,
    --         Event = 10,
    --         Function = 10,
    --         Method = 10,
    --         Operator = 10,
    --         Reference = 10,
    --         Struct = 10,
    --         Variable = 9,
    --         File = 8,
    --         Folder = 8,
    --         Class = 5,
    --         Color = 5,
    --         Module = 5,
    --         Keyword = 10,
    --         Constructor = 1,
    --         Interface = 1,
    --         Snippet = 0,
    --         Text = 1,
    --         TypeParameter = 1,
    --         Unit = 1,
    --         Value = 1,
    --       },
    --     }),
    --     label_comparator,
    --   },
    -- }
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]


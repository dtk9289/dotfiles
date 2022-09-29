  vim.g.indent_blankline_show_current_context = true;
  vim.g.indent_blankline_context_patterns = {
    'class',
    'function',
    'method',
    '^if',
    '^while',
    '^for',
    '^object',
    '^table',
    '^begin',
    'block',
    'arguments'
  }

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
  }

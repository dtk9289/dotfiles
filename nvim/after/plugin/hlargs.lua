require('hlargs').setup{
  color = '#d19a66',
  disable = function(lang, bufnr)
    return vim.api.nvim_buf_line_count(bufnr)>1000
  end,
  paint_arg_declarations = true,
  paint_arg_usages = true,
  paint_catch_blocks = {
    declarations = true,
    usages = true
  },
  performance = {
    parse_delay = 1,
    slow_parse_delay = 50,
    max_iterations = 400,
    max_concurrent_partial_parses = 30,
    debounce = {
      partial_parse = 3,
      partial_insert_mode = 100,
      total_parse = 700,
      slow_parse = 5000
    }
  }
}

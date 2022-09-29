local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      return vim.api.nvim_buf_line_count(bufnr)>1000
    end,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "tsx",
    "fish",
    "json",
    "yaml",
    "html",
    "scss",
    "lua"
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = false,
    extended_mode = false,
    max_file_lines = nil
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

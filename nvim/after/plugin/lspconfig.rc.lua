local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require'vim.lsp.protocol'
local configs = require'lspconfig.configs'
-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

--protocol.SymbolKind = { }
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

nvim_lsp.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  capabilities = capabilities,
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
-- setup for html snippet 
-- if not configs.ls_emmet then
--   configs.ls_emmet = {
--     default_config = {
--       cmd = { 'ls_emmet', '--stdio' };
--       filetypes = {
--         'html',
--         'css',
--         'scss',
--         'javascript',
--         'javascriptreact',
--         'typescriptreact',
--         'haml',
--         'xml',
--         'xsl',
--         'pug',
--         'slim',
--         'sass',
--         'stylus',
--         'less',
--         'sss',
--         'hbs',
--         'handlebars',
--       };
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
--
-- -- html autocomplete
-- nvim_lsp.ls_emmet.setup { capabilities = capabilities }

-- json autocomplete
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'http://json.schemastore.org/tsconfig',
        },
        {
          fileMatch = { '.eslintrc.json', '.eslintrc' },
          url = 'http://json.schemastore.org/eslintrc',
        },
        {
          fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
          url = 'http://json.schemastore.org/prettierrc',
        },
        {
          fileMatch = { 'deno.json' },
          url = 'https://raw.githubusercontent.com/denoland/deno/main/cli/schemas/config-file.v1.json',
        },
      },
    },
  },
}

-- css autocomplete
nvim_lsp.cssls.setup {
  capabilities = capabilities,
}

-- javascript linting
nvim_lsp.eslint.setup {
  capabilities = capabilities,
  cmd = {"vscode-eslint-language-server", "--stdio"}
}

nvim_lsp.pyright.setup{}

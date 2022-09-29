-- check if value inside table exists
local function contains(table, val)
   for i=1,#table do
      if table[i] == val then 
         return true
      end
   end
   return false
end

-- filetypes supports context commenting
local filetypes = {
  "javascriptreact",
  "typescriptreact"
}

require('nvim_comment').setup({
  -- Normal mode mapping left hand side
  line_mapping = "",
  -- Visual/Operator mapping left hand side
  operator_mapping = "",
  hook = function()
    if contains(filetypes, vim.api.nvim_buf_get_option(0, "filetype")) then
      require("ts_context_commentstring.internal").update_commentstring()
    end
  end
})

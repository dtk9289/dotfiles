-- custom function
local function open_file_in_bg_tab(node)
  vim.cmd("tabe " .. node.absolute_path .. " | tabprev")
end
-- custom function end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        {key = {"\\e"}, action = "close"},
        {key = {"<S-t>"}, action = "bg_tab", action_cb = open_file_in_bg_tab },
        {key = {"t"}, action = "tabnew"},
        {key = {"e"}, action = "preview"},
        {key = {"<Tab>"}, action = ""},
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

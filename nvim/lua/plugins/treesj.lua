return {
  "Wansmer/treesj",
  keys = {
    { "<space>m", ":TSJToggle<CR>", desc = "Toggle Treesj" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 120,
      cursor_behavior = "hold",
      notify = true,
      dot_repeat = true,
      on_error = nil,
    })
  end,
}

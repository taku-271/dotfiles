return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      shell = "bash",
      on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", [[<C-\><C-n>]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<C-n>", [[i]], { noremap = true, silent = true })
      end,
    })
  end,
  keys = {
    { "<C-@>", "<cmd>1ToggleTerm direction=horizontal<cr>", mode = { "n", "t" } },
    { "<C-S-@>", "<cmd>1ToggleTerm direction=float<cr>", mode = { "n", "t" } }
  }
}


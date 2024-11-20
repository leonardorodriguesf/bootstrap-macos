return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy Find files' })
      vim.keymap.set('n', '<leader>fF', ":Telescope find_files no_ignore=true hidden=true<CR>", { desc = 'Fuzzy Find files' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy Find recent files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live grep text inside files' })

      function Live_grep_include_ignored_and_hidden()
        builtin.live_grep({
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore',  -- Include .gitignore files in the search
            '--hidden', -- Include hidden files in the search
          }
        })
      end

      vim.keymap.set('n', '<leader>sG','<cmd>lua Live_grep_include_ignored_and_hidden()<CR>', { desc = 'Live grep text inside files' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })

      require("telescope").load_extension("ui-select")
    end
  }
}

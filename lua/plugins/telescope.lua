return  {{
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    local M = {}
    M.find_files = function()
    builtin.find_files {
      find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
    }
    end
    vim.keymap.set('n', '<leader>ff', M.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  end
},
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}

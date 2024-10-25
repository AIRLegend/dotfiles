
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },


      config = function()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")
	local telescope = require("telescope")

	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

	telescope.setup{
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close
				},
			},
		}
	}

      end,

    }


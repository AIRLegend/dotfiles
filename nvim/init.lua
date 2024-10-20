vim.g.mapleader = "-"
vim.g.maplocalleader = " "
vim.g.encoding = "utf-8"
vim.g.ruler = true
vim.go.clipboard = "unnamedplus"
vim.g.number = true
-- vim.o.mouse=""

vim.g.noswapfile = true
vim.g.nobackup = true
vim.g.nowb = true

-- text wrap
vim.g.wrap = true
vim.g.textwidth = 90

-- scrolling
vim.g.scrolloff = 10
vim.g.sidescreolloff = 15
vim.g.sidescroll = 1

-- lines
vim.wo.number = true -- Make line numbers default (default: false)
vim.wo.relativenumber = true
vim.o.wrap = false -- Display lines as one long line (default: true)
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)

-- vim.o.showtabline = 2 -- Always show tabs (default: 1)

vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.breakindent = true -- Enable break indent (default: false)
vim.o.updatetime = 1000 -- Decrease update time (default: 4000)
-- vim.o.timeoutlen = 600 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
vim.o.backup = false -- Creates a backup file (default: false)
vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.o.undofile = true -- Save undo history (default: false)


-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>')
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', 'vv', '<C-v>', { desc = 'Visual Block' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', ' ', 'za', { desc = 'Unfold / fold' })
vim.keymap.set('n', '<C-S-Right>', '5<c-w>>', { desc = 'Resize panel right' })
vim.keymap.set('n', '<C-S-Left>', '5<c-w><', { desc = 'Resize panel left' })

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('trim_whitespaces', { clear = true }),
  desc = 'Trim trailing white spaces',
  pattern = 'bash,c,cpp,lua,java,go,php,javascript,make,python,rust,perl,sql,markdown',
  callback = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '<buffer>',
      -- Trim trailing whitespaces
      callback = function()
        -- Save cursor position to restore later
        local curpos = vim.api.nvim_win_get_cursor(0)
        -- Search and replace trailing whitespaces
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, curpos)
      end,
    })
  end,
})


require('config.lazy')


vim.cmd('colorscheme github_dark_tritanopia')



local opts = {
    noremap = true,
    silent = true,
}

--[[
-- Function that does context aware things
-- Diagnostic + Code Action if there are diagnostics. Else open buffers
--]]
function contextAwareAction() 
    vim.diagnostic.open_float()
    local diag = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1})
    if #diag > 0 then
        vim.lsp.buf.code_action()
    else
        require('telescope.builtin').buffers()
    end
end

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Base64 decode selected text
vim.keymap.set('v', '<leader>b', 'c<c-r>=system("base64 --decode", @\")<cr><esc>', {desc = 'Base64 decode selected text'})

-- Enable multiple indentations in a row
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = 'Search Files'})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc = 'Search Grep'})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {desc = 'Search Buffer'})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {desc = 'Search Word'})
vim.keymap.set('n', '<leader>sc', builtin.current_buffer_fuzzy_find, {desc = 'Search current buffer'})

vim.keymap.set('n', '<leader>i', builtin.lsp_definitions, {desc = 'Goto definition'})
vim.keymap.set('n', '<leader>u', builtin.lsp_incoming_calls, {desc = 'Find usages'})
vim.keymap.set('n', '<leader>h', ':lua vim.diagnostic.open_float()<CR>', {desc = 'Help'})
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', {desc = 'Code Action'})
vim.keymap.set('n', '<leader><leader>', contextAwareAction, {desc = 'Do things'})
vim.keymap.set('n', '<leader>e', ':Lexplore<CR>', {desc = 'Open filetree'})


vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.smartindent = true

if vim.fn.executable("bun") == 1 then
	vim.keymap.set("n", "<leader>rr", ":!bun run %<CR>")
elseif vim.fn.executable("npx") == 1 then
	vim.keymap.set("n", "<leader>rr", ":!npx ts-node %<CR>")
else
	print("Could not find bun or node. Install one to use <leader>rr")
end

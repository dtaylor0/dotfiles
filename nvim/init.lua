vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.undofile = true
vim.g.mapleader = " "
vim.o.winborder = "rounded"
-- vim.cmd("set completeopt=menuone,noselect,fuzzy,nosort")
vim.o.background = vim.fn
	.system({
		"defaults",
		"read",
		"-g",
		"AppleInterfaceStyle",
	})
	:match("Dark") and "dark" or "light"

local diagnostic_signs = {
	[vim.diagnostic.severity.ERROR] = "E",
	[vim.diagnostic.severity.WARN] = "W",
	[vim.diagnostic.severity.INFO] = "I",
	[vim.diagnostic.severity.HINT] = "H",
}

vim.diagnostic.config({
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	virtual_text = false,
	signs = { text = diagnostic_signs },
	float = {
		border = "rounded",
		source = "if_many",
		focusable = false,
	},
})

vim.env.SDKMAN_DIR = vim.env.HOME .. "/.sdkman"
vim.env.JAVA_HOME = vim.env.HOME .. "/.sdkman/candidates/java/current"
vim.env.PATH = vim.env.JAVA_HOME .. "/bin:" .. vim.env.PATH

vim.pack.add({
	{ src = "https://github.com/ribru17/bamboo.nvim" },
	{ src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-mini/mini.visits" },
	{ src = "https://github.com/nvim-mini/mini.completion" },
	{ src = "https://github.com/nvim-mini/mini.snippets" },
	{ src = "https://github.com/nvim-mini/mini.extra" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		start = true,
		build = ":TSUpdate",
	},
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/dmmulroy/ts-error-translator.nvim" },
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/mfussenegger/nvim-jdtls", start = true },
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		start = true,
	},
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
require("toggleterm").setup({
	open_mapping = "<leader>tt",
	insert_mappings = false,
	direction = "float",
})
require("mini.pick").setup()
require("mini.visits").setup()
require("mini.extra").setup()
require("mini.snippets").setup()
require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local opts = { buffer = bufnr }
		vim.keymap.set("n", "]c", function()
			gs.nav_hunk("next")
		end, opts)
		vim.keymap.set("n", "[c", function()
			gs.nav_hunk("prev")
		end, opts)
		vim.keymap.set("n", "<leader>gb", gs.blame_line, opts)
		vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
		vim.keymap.set("n", "<leader>gs", gs.stage_hunk, opts)
		vim.keymap.set("n", "<leader>gr", gs.reset_hunk, opts)
	end,
})
require("lazydev").setup()
require("ts-error-translator").setup()
require("which-key").setup()
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		swift = { "swiftformat", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		htmlangular = { "prettierd", "prettier", stop_after_first = true },
		xml = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "ruff_format" },
		elixir = { "mix" },
		ocaml = { "ocamlformat" },
		java = { "google-java-format" },
		kotlin = { "ktfmt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"angularls",
		"eslint",
		"elixirls",
		"rust_analyzer",
		"gopls",
		"pyright",
		"jdtls",
		"kotlin_language_server",
	},
})
vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			suggest = {
				completeFunctionCalls = true,
			},
			preferences = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
				includePackageJsonAutoImports = "off",
				importModuleSpecifierPreference = "non-relative",
			},
			inlayHints = {
				includeInlayParameterNameHints = "literals",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			suggest = {
				completeFunctionCalls = true,
			},
			preferences = {
				includePackageJsonAutoImports = "off",
				importModuleSpecifierPreference = "non-relative",
			},
			inlayHints = {
				includeInlayParameterNameHints = "literals",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
local function file_contains(path, needle)
	local ok, lines = pcall(vim.fn.readfile, path)
	if not ok then
		return false
	end
	return table.concat(lines, "\n"):find(needle, 1, true) ~= nil
end

vim.lsp.config("angularls", {
	filetypes = { "typescript", "html", "htmlangular" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local angular_root = vim.fs.root(fname, { "angular.json" })
		if angular_root then
			on_dir(angular_root)
			return
		end

		local project_json = vim.fs.find("project.json", { path = vim.fs.dirname(fname), upward = true })[1]
		if project_json then
			local is_angular_project = file_contains(project_json, "@nx/angular")
				or file_contains(project_json, "@angular-devkit/build-angular")
			if is_angular_project then
				local nx_root = vim.fs.root(vim.fs.dirname(project_json), { "nx.json" })
				on_dir(nx_root or vim.fs.dirname(project_json))
			end
			return
		end

		local package_json = vim.fs.find("package.json", { path = vim.fs.dirname(fname), upward = true })[1]
		if package_json and file_contains(package_json, '"@angular/core"') then
			on_dir(vim.fs.dirname(package_json))
		end
	end,
})

vim.lsp.config("eslint", {
	settings = {
		workingDirectory = { mode = "auto" },
		format = false,
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
	},
})
-- kotlin_language_server config must come BEFORE enable so before_init is in place at server start
vim.lsp.config("kotlin_language_server", {
	root_markers = { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", "pom.xml" },
	before_init = function(params, config)
		-- kotlin-language-server 1.3.13 crashes in getStoragePath() if
		-- initializationOptions is missing or an array. Provide storagePath explicitly.
		params.initializationOptions = {
			storagePath = params.rootPath or vim.env.HOME,
		}
	end,
	settings = {
		kotlin = {
			compiler = { jvm = { target = "21" } },
		},
	},
})
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"angularls",
	"eslint",
	"elixirls",
	"rust_analyzer",
	"gopls",
	"pyright",
	"kotlin_language_server",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	max_width = 100,
	max_height = 28,
	focusable = false,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	max_width = 100,
	max_height = 20,
	focusable = false,
})

vim.lsp.config("sourcekit", {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
	root_markers = {
		"Package.swift",
		".git",
		"*.xcodeproj",
		"*.xcworkspace",
	},
})
vim.lsp.enable("sourcekit")

vim.lsp.config("ocamllsp", {
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_markers = { "dune-project", ".git", "dune-workspace", "*.opam" },
})
vim.lsp.enable("ocamllsp")

-- jdtls (Java) — needs special setup via nvim-jdtls
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
		local launcher = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
		local config_dir = mason_path .. "/config_mac_arm"
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = vim.env.HOME .. "/.cache/jdtls-workspace/" .. project_name

		require("jdtls").start_or_attach({
			cmd = {
				vim.env.JAVA_HOME .. "/bin/java",
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xmx1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				launcher,
				"-configuration",
				config_dir,
				"-data",
				workspace_dir,
			},
			root_dir = require("jdtls.setup").find_root({
				".git",
				"mvnw",
				"gradlew",
				"pom.xml",
				"build.gradle",
				"build.gradle.kts",
			}),
			settings = {
				java = {
					signatureHelp = { enabled = true },
					completion = {
						favoriteStaticMembers = {
							"org.junit.Assert.*",
							"org.junit.jupiter.api.Assertions.*",
							"java.util.Objects.requireNonNull",
							"java.util.Objects.requireNonNullElse",
						},
					},
					sources = {
						organizeImports = {
							starThreshold = 9999,
							staticStarThreshold = 9999,
						},
					},
				},
			},
		})
	end,
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"elixir",
		"lua",
		"typescript",
		"javascript",
		"rust",
		"swift",
		"ocaml",
		"go",
		"python",
		"java",
		"kotlin",
		"angular",
		"json",
		"html",
		"css",
		"bash",
		"toml",
		"yaml",
		"markdown",
	},
	highlight = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ia"] = "@parameter.inner",
				["aa"] = "@parameter.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
			},
		},
	},
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		pcall(vim.treesitter.start, args.buf)
	end,
})
require("solarized-osaka").setup({
	transparent = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})
require("tokyonight").setup({
	transparent = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})
require("kanagawa").setup({
	transparent = true,
	commentStyle = { italic = false },
	keywordStyle = { italic = false },
	statementStyle = { italic = false },
})
require("gruvbox").setup({
	transparent_mode = true,
	italic = {
		comments = false,
		strings = false,
		operators = false,
		folds = false,
	},
})
require("nightfox").setup({
	options = {
		transparent = true,
		styles = {
			comments = "NONE",
			keywords = "NONE",
		},
	},
})
require("onedark").setup({
	style = "dark",
	transparent = true,
	code_style = {
		comments = "none",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},
})
require("github-theme").setup({
	options = {
		transparent = true,
		styles = {
			comments = "NONE",
			keywords = "NONE",
		},
	},
})
require("catppuccin").setup({
	-- flavour = "frappe",
	transparent_background = true,
	styles = {
		comments = {},
		conditionals = {},
	},
})
require("bamboo").setup({
	-- style = "multiplex",
	transparent = true,
	code_style = {
		comments = { italic = false },
		conditionals = { italic = false },
		keywords = {},
		functions = {},
		namespaces = { italic = false },
		parameters = { italic = false },
		strings = {},
		variables = {},
	},
})
require("rose-pine").setup({
	variant = "auto",
	dark_variant = "moon",
	styles = {
		italic = false,
		-- transparency = true,
	},
})

local themes = {
	"rose-pine",
	"catppuccin",
	"tokyonight",
	"kanagawa-wave",
	"nightfox",
	"onedark",
	"github_dark",
	"gruvbox",
	"solarized-osaka",
	"bamboo",
}

local theme_state_path = vim.fn.stdpath("state") .. "/colorscheme.txt"

local function save_theme(name)
	vim.fn.writefile({ name }, theme_state_path)
end

local function load_theme()
	local ok, lines = pcall(vim.fn.readfile, theme_state_path)
	if ok and lines[1] and lines[1] ~= "" then
		return lines[1]
	end
	return "rose-pine"
end

local function apply_theme(name, opts)
	opts = opts or {}
	local silent = opts.silent == true

	if not vim.tbl_contains(themes, name) then
		vim.notify("Unknown colorscheme: " .. name, vim.log.levels.ERROR)
		return
	end

	local ok, err = pcall(vim.cmd.colorscheme, name)
	if not ok then
		vim.notify("Failed to load colorscheme " .. name .. ": " .. err, vim.log.levels.ERROR)
		return
	end

	save_theme(name)
	if not silent then
		vim.notify("Theme: " .. name)
	end
end

local function cycle_theme(step)
	local current = vim.g.colors_name or load_theme()
	local index = vim.fn.index(themes, current)
	if index < 0 then
		index = 0
	end
	apply_theme(themes[(index + step) % #themes + 1])
end

apply_theme(load_theme(), { silent = true })

vim.keymap.set("n", "<leader>o", ":update<CR> :source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set("n", "<leader>sf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>sg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>s.", ":Pick visit_paths<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>f", conform.format)
vim.keymap.set("n", "<leader>sd", ":Pick diagnostic<CR>")
vim.keymap.set("n", "<leader>st", function()
	vim.ui.select(themes, {
		prompt = "Select theme",
		format_item = function(item)
			if item == vim.g.colors_name then
				return item .. " (current)"
			end
			return item
		end,
	}, function(choice)
		if choice then
			apply_theme(choice)
		end
	end)
end)
vim.keymap.set("n", "<leader>tn", function()
	cycle_theme(1)
end)
vim.keymap.set("n", "<leader>tp", function()
	cycle_theme(-1)
end)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>sq", function()
	vim.diagnostic.setqflist({ open = true })
end)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "-", ":Oil<CR>")

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

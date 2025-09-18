-- Basic vim settings
vim.opt.compatible = false
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.background = 'dark'
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

-- Tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Color settings
vim.opt.termguicolors = true
--
-- Enable syntax highlighting
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- Set leader key
vim.g.mapleader = ' '

-- Lazy.nvim setup
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end
	lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- Plugin configuration
lazy.setup({
	-- LSP and completion (from second file)
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'L3MON4D3/LuaSnip'},
	--{'tpope/vim-sensible'},
	{'nvim-lua/plenary.nvim'},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function()
			-- Telescope keymaps
			vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
			vim.keymap.set('n', '<leader>/', '<cmd>Telescope live_grep<cr>')
			vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
			vim.keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<cr>')
		end
	},
	{'vim-scripts/paredit.vim'},
	{'tpope/vim-surround'},
	{
		'luochen1990/rainbow',
		config = function()
			vim.g.rainbow_active = 1
		end
	},
	{'ervandew/supertab'},
	{'wellle/targets.vim'},
	{'scrooloose/nerdcommenter'},
	{
		'itchyny/lightline.vim',
		config = function()
			-- Lightline configuration can be added here if needed
		end
	},
	{'ap/vim-buftabline'},
	{ 'connorholyday/vim-snazzy',
	},
	{
		'joshdick/onedark.vim',
		config = function()
		 vim.cmd [[colorscheme onedark]]
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
			})
		end
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {'nvim-tree/nvim-web-devicons'},
		config = function()
			require('nvim-tree').setup({
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},

				-- Configuration for nvim-tree
			})
			-- NERDTree replacement keybind
			vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
		end
	},
	{
		'echasnovski/mini.clue',
		version = false,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "gw", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			--{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			--{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			--{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			--{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	}
})

-- Autocommands
local augroup = vim.api.nvim_create_augroup('UserConfig', {clear = true})

-- File type settings
--vim.api.nvim_create_autocmd({'BufReadPost'}, {
	--group = augroup,
	--pattern = {'*.rkt', '*.rktl'},
	--callback = function()
		--vim.bo.filetype = 'scheme'
		--end
		--})

		--vim.api.nvim_create_autocmd('FileType', {
			--group = augroup,
			--pattern = 'python',
			--callback = function()
				--vim.bo.autoindent = true
				--vim.bo.tabstop = 4
				--vim.bo.softtabstop = 4
				--vim.bo.shiftwidth = 4
				--vim.bo.expandtab = true
				--end
				--})

				-- Highlight trailing whitespace
				vim.api.nvim_create_autocmd('ColorScheme', {
					group = augroup,
					callback = function()
						vim.api.nvim_set_hl(0, 'ExtraWhitespace', {ctermbg = 'red', bg = 'red'})
					end
				})

				vim.api.nvim_create_autocmd('InsertEnter', {
					group = augroup,
					callback = function()
						vim.fn.matchadd('ExtraWhitespace', [[\s\+\%#\@<!$]])
					end
				})

				vim.api.nvim_create_autocmd('InsertLeave', {
					group = augroup,
					callback = function()
						vim.fn.matchadd('ExtraWhitespace', [[\s\+$]])
					end
				})

				-- Key mappings
				-- Buffer navigation
				vim.keymap.set('n', '<Leader>k', ':bprev<CR>')
				vim.keymap.set('n', '<Leader>j', ':bnext<CR>')
				vim.keymap.set('n', '<Leader>w', ':w<CR>')
				vim.keymap.set('n', '<Leader>q', ':q<CR>')
				vim.keymap.set('n', '<Leader>d', ':bd<CR>')

				-- Repeat last macro
				vim.keymap.set('n', ',', '@@')

				-- Copy/paste
				vim.keymap.set('v', '<Leader>y', '"+y')
				vim.keymap.set('n', '<Leader>yy', '"+yy')
				vim.keymap.set('n', '<Leader>y', ':let @+ = expand("%")<CR>')
				vim.keymap.set('n', '<Leader>p', '"+p')

				-- Faster scrolling
				vim.keymap.set('n', '<C-H>', '^')
				vim.keymap.set('n', '<C-L>', '$')
				vim.keymap.set('n', '<C-e>', '10<C-e>')
				vim.keymap.set('n', '<C-y>', '10<C-y>')
				vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>')
				vim.keymap.set('n', '<C-s>', ':w<CR>')

				-- LSP and completion setup (from second file)
				local cmp = require('cmp')
				local luasnip = require('luasnip')

				cmp.setup({
					sources = {
						{name = 'nvim_lsp'},
					},
					mapping = cmp.mapping.preset.insert({
						['<C-Space>'] = cmp.mapping.complete(),
						['<C-u>'] = cmp.mapping.scroll_docs(-4),
						['<C-d>'] = cmp.mapping.scroll_docs(4),
					}),
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end
					},
				})

				local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

				vim.api.nvim_create_autocmd('LspAttach', {
					group = lsp_cmds,
					desc = 'LSP actions',
					callback = function()
						local bufmap = function(mode, lhs, rhs)
							vim.keymap.set(mode, lhs, rhs, {buffer = true})
						end
						bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
						bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
						bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
						bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
						bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
						bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
						bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
						bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
						bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
						bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
						bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
						bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
						bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
					end
				})

				local lspconfig = require('lspconfig')
				local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

				require('mason').setup({})
				require('mason-lspconfig').setup({
					ensure_installed = {
						'ts_ls',
						'eslint',
						'html',
						'cssls'
					},
					handlers = {
						function(server)
							lspconfig[server].setup({
								capabilities = lsp_capabilities,
							})
						end,
						['ts_ls'] = function()
							lspconfig.ts_ls.setup({
								capabilities = lsp_capabilities,
								settings = {
									completions = {
										completeFunctionCalls = true
									}
								}
							})
						end
					}
				})

				local miniclue = require('mini.clue')
				miniclue.setup({
					triggers = {
						-- Leader triggers
						{ mode = 'n', keys = '<Leader>' },
						{ mode = 'x', keys = '<Leader>' },

						-- Built-in completion
						{ mode = 'i', keys = '<C-x>' },

						-- g prefix
						{ mode = 'n', keys = 'g' },
						{ mode = 'x', keys = 'g' },

						-- Marks
						{ mode = 'n', keys = "'" },
						{ mode = 'n', keys = '`' },
						{ mode = 'x', keys = "'" },
						{ mode = 'x', keys = '`' },

						-- Registers
						{ mode = 'n', keys = '"' },
						{ mode = 'x', keys = '"' },
						{ mode = 'i', keys = '<C-r>' },
						{ mode = 'c', keys = '<C-r>' },

						-- Window commands
						{ mode = 'n', keys = '<C-w>' },

						-- z prefix
						{ mode = 'n', keys = 'z' },
						{ mode = 'x', keys = 'z' },

						-- Brackets
						{ mode = 'n', keys = '[' },
						{ mode = 'n', keys = ']' },
					},

					clues = {
						-- Enhance this by adding descriptions
						{ mode = 'n', keys = '<Leader>f', desc = "+Files" },
						miniclue.gen_clues.builtin_completion(),
						miniclue.gen_clues.g(),
						miniclue.gen_clues.marks(),
						miniclue.gen_clues.registers(),
						miniclue.gen_clues.windows(),
						miniclue.gen_clues.z(),
					},

					window = {
						delay = 10,
						config = {
							width = 'auto',
						},
					},
				})

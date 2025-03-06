return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		lazy = true,
		config = false,
	},
	-- Autocompletion
	{
		'saghen/blink.cmp',
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = 'rafamadriz/friendly-snippets',

		-- use a release tag to download pre-built binaries
		version = 'v0.*',
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- On musl libc based systems you need to add this flag
		-- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',

		opts = {
			-- for keymap, all values may be string | string[]
			-- use an empty table to disable a keymap
			keymap = {
				preset = 'none',

				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },

				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },

				['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

				['<C-b>'] = { 'snippet_backward', 'fallback' },
				['<C-f>'] = { 'snippet_forward', 'fallback' },
			},
			-- Move cmdline out of keymap and to the same level
			cmdline = {
				keymap = { -- Changed from cmdline to keymap
					preset = 'none',

					['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
					['<C-e>'] = { 'hide', 'fallback' },
					['<CR>'] = { 'accept', 'fallback' },

					['<C-k>'] = { 'select_prev', 'fallback' },
					['<C-j>'] = { 'select_next', 'fallback' },

					['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
					['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

					['<Tab>'] = { 'select_next' },
					['<S-Tab>'] = { 'select_prev' },
				}
			},
			completion = {
				keyword = {
					range = 'full',
				},

				list = {
					selection = {
						preselect = false,
						auto_insert = function(ctx)
							return ctx.mode == 'cmdline'
						end
					}
				},

				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					border = 'rounded',
					scrollbar = false,
					draw = {
						columns = { { 'label', 'label_description', gap = 1 }, { 'kind', 'kind_icon', gap = 1 } }
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
					window = {
						border = 'rounded',
					}
				},
			},
			signature = {
				enabled = true,
				window = {
					border = 'rounded',
					scrollbar = false,
				}
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				per_filetype = {
					lua = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', },
					sql = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod' },
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100
					},
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
			},

			-- allows extending the enabled_providers array elsewhere in your config
			-- without having to redefine it
			-- opts_extend = { "sources.completion.enabled_providers" }
		},
	},
	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'stevearc/conform.nvim' },
		},
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓ ",
						package_pending = "➜ ",
						package_uninstalled = "✗ "
					},
				},
				registries = {
					-- 'github:nvim-java/mason-registry', -- til þess að fá fyrir nvim-java
					'github:mason-org/mason-registry',
				},
			})

			require("conform").setup({
				formatters = {
					alejandra = {
						command = "/etc/profiles/per-user/saumavel/bin/alejandra", -- Use the full path to your system-installed binary
						-- Or you can use the relative path if it's in your PATH
						-- command = "alejandra",
					},
				},
				formatters_by_ft = {
					nix = { "alejandra" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			local lsp_zero = require('lsp-zero')

			lsp_zero.ui({ float_border = 'rounded', })

			require('lspconfig.ui.windows').default_options.border = "rounded"

			-- lsp_attach is where you enable features that only work
			-- if there is a language server active in the file
			local lsp_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set('n', 'æ', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				vim.keymap.set('n', 'Æ', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
				vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
				vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
				vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				vim.keymap.set({ 'n', 'x' }, '<F3>', function()
					require("conform").format({ async = true })
				end, opts)
				vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
			end

			lsp_zero.extend_lspconfig({
				lsp_attach = lsp_attach,
				-- capabilities = require('cmp_nvim_lsp').default_capabilities()
				capabilities = require('blink.cmp').get_lsp_capabilities()
			})

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,
				}
			})
		end
	},
	-- Add nil_ls (Nix LSP) to ensure proper Nix language support
	{
		"oxalica/nil",
		ft = "nix",
		opts = {},
	}
}

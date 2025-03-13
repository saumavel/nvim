return { -- LSP
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
				'github:mason-org/mason-registry',
			},
		})

		require("conform").setup({
			formatters = {
				alejandra = {
					command = "/etc/profiles/per-user/saumavel/bin/alejandra",
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
				-- Add custom handler for lua_ls
				["lua_ls"] = function()
					require('lspconfig').lua_ls.setup({
						on_init = function(client)
							if client.workspace_folders then
								local path = client.workspace_folders[1].name
								if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
									return
								end
							end

							client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua or {}, {
								runtime = {
									-- Tell the language server which version of Lua you're using
									version = 'LuaJIT'
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME
										-- Uncomment below if you need additional paths
										-- "${3rd}/luv/library"
									}
								}
							})
						end,
						settings = {
							Lua = {}
						}
					})
				end,
			}
		})
	end
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		-- local on_attach = function(client, bufnr)
		-- 	opts.buffer = bufnr
		--
		-- 	keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
		-- 	keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
		-- 	keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
		-- 	keymap.set("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
		-- 	keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
		-- 	keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
		-- 	keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format{ async = true }<CR>", opts)
		-- 	keymap.set("n", "<leader>li", ":LspInfo<CR>", opts)
		-- 	keymap.set("n", "<leader>lI", ":LspInstallInfo<CR>", opts)
		-- 	keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
		-- 	keymap.set("n", "<leader>lj", ":lua vim.diagnostic.goto_next({buffer=0})<CR>", opts)
		-- 	keymap.set("n", "<leader>lk", ":lua vim.diagnostic.goto_prev({buffer=0})<CR>", opts)
		-- 	keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
		-- 	keymap.set("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
		-- 	keymap.set("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
		--
		-- 	-- set keybinds
		-- 	-- opts.desc = "Show LSP references"
		-- 	-- keymap.set("n", "gR", ":Telescope lsp_references<CR>", opts) -- show definition, references
		-- 	--
		-- 	-- opts.desc = "Go to declaration"
		-- 	-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
		-- 	--
		-- 	-- opts.desc = "Show LSP definitions"
		-- 	-- keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions
		-- 	--
		-- 	-- opts.desc = "Show LSP implementations"
		-- 	-- keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations
		-- 	--
		-- 	-- opts.desc = "Show LSP type definitions"
		-- 	-- keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
		-- 	--
		-- 	-- opts.desc = "See available code actions"
		-- 	-- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
		-- 	--
		-- 	-- opts.desc = "Smart rename"
		-- 	-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
		-- 	--
		-- 	--
		-- 	-- keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
		-- 	--
		-- 	-- opts.desc = "Show line diagnostics"
		-- 	-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
		-- 	--
		-- 	-- opts.desc = "Go to previous diagnostic"
		-- 	-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
		-- 	--
		-- 	--    opts.desc = "Go to next diagnostic"
		-- 	-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
		-- 	--
		-- 	-- opts.desc = "Show documentation for what is under cursor"
		-- 	-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		-- 	--
		-- 	-- opts.desc = "Restart LSP"
		-- 	-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		-- end
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			local opts = { noremap = true, silent = true }

			buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
			buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
			buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
			buf_set_keymap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
			buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
			buf_set_keymap("n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
			buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts)
			buf_set_keymap("n", "<leader>li", ":LspInfo<CR>", opts)
			buf_set_keymap("n", "<leader>lI", ":LspInstallInfo<CR>", opts)
			buf_set_keymap("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
			buf_set_keymap(
				"n",
				"<leader>lj",
				':lua vim.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>',
				opts
			)
			buf_set_keymap(
				"n",
				"<leader>lk",
				':lua vim.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>',
				opts
			)
			buf_set_keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", opts)
			buf_set_keymap("n", "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", opts)
			buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)

			-- Enable completion triggered by <c-x><c-o>
			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

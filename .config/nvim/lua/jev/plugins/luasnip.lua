local plugin = {
	"L3MON4D3/LuaSnip",
	lazy = true,
}

plugin.config = function()
	local ls = require("luasnip")

	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
	})

	-- vim.keymap.set({ "i", "s" }, "<right>", function()
	--     if ls.expand_or_jumpable() then
	--         ls.expand_or_jump()
	--     end
	-- end, { silent = true })

	vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })

	vim.keymap.set("i", "<C-l>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { silent = true })

	ls.add_snippets("norg", {
		ls.parser.parse_snippet("code", "@code $1\n@end"),
	})

	ls.add_snippets("python", {
		ls.parser.parse_snippet("log", "print(f'\\n{$1=}\\n')"),
	})

	ls.add_snippets("python", {
		ls.parser.parse_snippet("def", 'def $1($2) -> None$3:\n\t"""$4"""\n\tpass$0'),
	})
end

return plugin

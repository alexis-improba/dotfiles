local add = MiniDeps.add

--
-- mini.files
--
add("echasnovski/mini.files")
require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
	},
})

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

event.autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "<C-s>", "belowright horizontal")
		map_split(buf_id, "<C-v>", "belowright vertical")
	end,
})

-- Add default bookmarks
event.autocmd("User", {
	pattern = "MiniFilesExplorerOpen",
	callback = function()
		local set_mark = function(id, path, desc)
			MiniFiles.set_bookmark(id, path, { desc = desc })
		end

		set_mark("c", vim.fn.stdpath("config"), "Config")
		set_mark("w", vim.fn.getcwd, "Working directory")
		set_mark("~", "~", "Home directory")
	end,
})

-- Mappings
keys.map("n", "-", function()
	MiniFiles.open(vim.fn.expand("%"))
end, "Open file explorer")

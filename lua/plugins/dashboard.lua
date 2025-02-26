local db = require("dashboard")

local bookmarks = {
	{ name = "Launchpad", path = "/data/onlinesales/launchpad/" },
	{ name = "Revx", path = "/data/onlinesales/revx/" },
	{ name = "Infrastructure", path = "/data/onlinesales/infrastructure/" },
	{ name = "Shared", path = "/data/onlinesales/shared/" },
	{ name = "brandAdServer", path = "/data/onlinesales/revx/apps/brandAdServerV2/mainline_3.0/" },
	{ name = "plaAdServer", path = "/data/onlinesales/revx/apps/plaAdServer/mainline/" },
	{ name = "revxAdServer", path = "/data/onlinesales/revx/apps/revXAdServerNodeV2/mainline_5.0/" },
	{ name = "revxAdServer", path = "/data/onlinesales/revx/apps/revXAdServerNodeV2/mainline_5.0/" },
	{
		name = "marketingCampaignServiceV2",
		path = "/data/onlinesales/launchpad/apps/marketingCampaignServiceV2/mainline_1.0/",
		path = "/data/onlinesales/launchpad/shared/marketingCampaignServiceObjectsV2/mainline_1.0/",
	},
	{
		name = "osAdsService",
		path = "/data/onlinesales/revx/apps/osAdsService/mainline_4.0/",
		path = "/data/onlinesales/revx/shared/osAdsServiceObjects/mainline_4.0/",
	},
	{
		name = "revxScripts",
		path = "/data/onlinesales/revx/apps/revxScripts/mainline_2.0/",
	},
	{
		name = "puppetMaster",
		path = "/data/onlinesales/infrastructure/apps/puppetMaster/mainline_4.0/",
	},
	{
		name = "deployer",
		path = "/data/onlinesales/infrastructure/tools/deployer/mainline/",
	},
}

-- Function to open the Telescope picker with bookmarks
local function open_bookmarks()
	local telescope = require("telescope") -- Require Telescope here
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local finders = require("telescope.finders")
	local pickers = require("telescope.pickers")
	local sorters = require("telescope.sorters")

	local entries = {}
	for _, bookmark in ipairs(bookmarks) do
		table.insert(entries, { display = bookmark.name, paths = bookmark.paths or { bookmark.path } })
	end

	-- Use Telescope to display bookmarks
	pickers
		.new({}, {
			prompt_title = "Bookmarks",
			finder = finders.new_table({
				results = entries,
				entry_maker = function(entry)
					return {
						value = entry.paths,
						display = entry.display,
						ordinal = entry.display,
					}
				end,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry(prompt_bufnr)
					actions.close(prompt_bufnr)

					-- If multiple paths are defined, open them in tmux splits
					if #selection.value > 1 then
						-- Tmux command to open in splits
						local cmd = string.format(
							"tmux new-window -c %s \\; split-window -v -c %s",
							selection.value[1],
							selection.value[2]
						)
						os.execute(cmd)
					else
						-- Change directory for single path
						vim.cmd("cd " .. vim.fn.expand(selection.value[1]))
					end
				end)
				return true
			end,
		})
		:find()
end

db.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = open_bookmarks,
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
})

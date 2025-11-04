
local gitlinker = require("gitlinker")
local actions = require("gitlinker.actions")

gitlinker.setup({
  opts = {
    -- By default, copy the generated link to the clipboard
    action_callback = actions.copy_to_clipboard,
    print_url = true, -- echo the URL in the command line
  },
  callbacks = {
    ["github.com"] = require("gitlinker.hosts").get_github_type_url,
    ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url,
  },
})

local map = vim.keymap.set

-- 🔗 Copy link to the latest commit that modified the current line
map("n", "<leader>gb", function()
  local gitsigns = require("gitsigns")
  local blame_info = gitsigns.get_blame_text()

  if not blame_info or not blame_info.commit then
    vim.notify("❌ No commit found for this line (file not tracked?)", vim.log.levels.WARN)
    return
  end

  local commit_hash = blame_info.commit
  if commit_hash == "00000000" then
    vim.notify("🚫 This line is uncommitted", vim.log.levels.INFO)
    return
  end

  -- Build the commit URL via gitlinker
  local repo_data = gitlinker.get_repo_data()
  local host_cb = require("gitlinker.hosts").get_github_type_url
  local url = host_cb({
    repo = repo_data,
    type = "commit",
    rev = commit_hash,
  })

  if url then
    vim.fn.setreg("+", url)
    vim.notify("🔗 Commit link copied: " .. url)
  else
    vim.notify("❌ Could not generate Git link", vim.log.levels.ERROR)
  end
end, { desc = "Copy Git commit link (from blame)" })


return {
    renderer = {
        highlight_git = true,
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "✔",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "✗",
                    ignored = "◌",
                },
            },
            show = {
                git = true,
                file = true,
                folder = true,
                folder_arrow = true,
            },
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
}

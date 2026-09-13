require("lualine").setup({
    options =
    {
        icons_enabled = true,
        theme = "tomorrow_night"
    },
    sections =
    {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"filename"}
    },
    refresh =
    {
        refresh_time = 16,
        events =
        {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged"
        }
    }
})

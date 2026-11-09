-- ABOUTME: Custom lualine statusline configuration for clock format
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Customize the time format to show AM/PM (12-hour format)
    -- Default LazyVim shows 24-hour format
    local function custom_time()
      return os.date("%I:%M %p") -- %I = 12-hour, %M = minutes, %p = AM/PM
    end

    -- Replace the entire section_z with just our custom time
    opts.sections = opts.sections or {}
    opts.sections.lualine_z = { custom_time }

    return opts
  end,
}

--[[require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "night", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.8, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
    on_highlights = function(hl, c) end,
})
--]]
--
require("cyberdream").setup({
    -- Enable transparent background
    transparent = true, -- Default: false

    -- Enable italics comments
    italic_comments = false, -- Default: false

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = true, -- Default: false

    -- Modern borderless telescope theme
    borderless_telescope = false, -- Default: true

    -- Set terminal colors used in `:terminal`
    terminal_colors = false, -- Default: true
    theme = {
        variant = "default", -- use "light" for the light variant
        highlights = {
            -- Highlight groups to override, adding new groups is also possible
            -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

            -- Example:
            Comment = { fg = "#696969", bg = "NONE", italic = true },

            -- Complete list can be found in `lua/cyberdream/theme.lua`
        },

        -- Override a color entirely
        colors = {
            -- For a list of colors see `lua/cyberdream/colours.lua`
            -- Example:
            bg = "#000000",
            green = "#00ff00",
            magenta = "#ff00ff",
        },
    },
})

function ColorMyPencils(color)
    color = color or "cyberdream"
    vim.o.background = "dark"
    vim.cmd.colorscheme(color)

    -- transparent background
    --[[ vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"}) ]]
                                                            --

    --[[ vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='none'})
    vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='none'})
    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {bg='none'})
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {bg='none'})
    vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {bg='none'})
    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {bg='none'})]]
                                                                   --
end

ColorMyPencils()

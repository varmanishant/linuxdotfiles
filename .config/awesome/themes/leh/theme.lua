-- vim: filetype=lua:textwidth=158

local string = string
local os = os

local awful = require('awful')
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local lain = require('lain')
local naughty = require('naughty')
local wibox = require('wibox')

local table = awful.util.table

local name = 'leh'

local home = os.getenv('HOME')
local configdir = home .. '/.config/awesome'
local themedir = configdir .. '/themes'
local lehdir = themedir .. '/' .. name
local lehicons = lehdir .. '/icons'

-- Exceeds 79 characters because the internal variable names are too long.

local theme = {
    name                                            = name,
    wallpaper                                       = lehdir .. '/gradient-blue.png',
    font                                            = 'Roboto 10',
    medium_font                                     = 'Roboto Medium 10',
    hotkeys_font                                    = 'Roboto Mono 10',
    hotkeys_description_font                        = 'Roboto Mono 9',
    fg_normal                                       = '#ffffff',
    fg_focus                                        = '#ffffff',
    fg_urgent                                       = '#ffffff',
    bg_focus                                        = '#202020',
    bg_normal                                       = '#000000',
    bg_raise                                        = '#101010',
    bg_urgent                                       = '#006b8e',
    border_width                                    = dpi(1),
    border_normal                                   = '#121212',
    border_focus                                    = '#121212',
    menu_font                                       = 'Roboto 10',
    menu_height                                     = dpi(24),
    menu_width                                      = dpi(192),
    launcher_icon                                   = lehicons .. '/awesome.png',
    layout_tile                                     = lehicons .. '/tile.png',
    layout_max                                      = lehicons .. '/max.png',
    layout_floating                                 = lehicons .. '/floating.png',
    layout_magnifier                                = lehicons .. '/magnifier.png',
    tasklist_plain_task_name                        = true,
    tasklist_disable_icon                           = false,
    taglist_fg_focus                                = '#ffffff',
    tasklist_bg_normal                              = '#000000',
    tasklist_fg_focus                               = '#ffffff',
    titlebar_close_button_normal                    = lehicons .. '/close-normal.png',
    titlebar_close_button_normal_hover              = lehicons .. '/close-normal-hover.png',
    titlebar_close_button_focus                     = lehicons .. '/close-focus.png',
    titlebar_close_button_focus_hover               = lehicons .. '/close-focus-hover.png',
    titlebar_minimize_button_normal                 = lehicons .. '/min-normal.png',
    titlebar_minimize_button_normal_hover           = lehicons .. '/min-normal-hover.png',
    titlebar_minimize_button_focus                  = lehicons .. '/min-focus.png',
    titlebar_minimize_button_focus_hover            = lehicons .. '/min-focus-hover.png',
    titlebar_floating_button_normal_inactive        = lehicons .. '/tile-normal.png',
    titlebar_floating_button_focus_inactive         = lehicons .. '/tile-focus.png',
    titlebar_floating_button_normal_active          = lehicons .. '/floating-normal.png',
    titlebar_floating_button_focus_active           = lehicons .. '/floating-focus.png',
    titlebar_maximized_button_normal_inactive       = lehicons .. '/max-normal.png',
    titlebar_maximized_button_normal_inactive_hover = lehicons .. '/max-normal-hover.png',
    titlebar_maximized_button_focus_inactive        = lehicons .. '/max-focus.png',
    titlebar_maximized_button_focus_inactive_hover  = lehicons .. '/max-focus-hover.png',
    titlebar_maximized_button_normal_active         = lehicons .. '/restore-normal.png',
    titlebar_maximized_button_normal_active_hover   = lehicons .. '/restore-normal-hover.png',
    titlebar_maximized_button_focus_active          = lehicons .. '/restore-focus.png',
    titlebar_maximized_button_focus_active_hover    = lehicons .. '/restore-focus-hover.png',
    useless_gap                                     = dpi(0),
    terminal_icon                                   = lehicons .. '/terminal.png',
    file_manager_icon                               = lehicons .. '/file-manager.png',
    text_editor_icon                                = lehicons .. '/text-editor.png',
    visual_studio_code_icon                         = lehicons .. '/visual-studio-code.png',
    sublime_text_icon                               = lehicons .. '/sublime-text.png',
    sublime_merge_icon                              = lehicons .. '/sublime-merge.png',
    word_icon                                       = lehicons .. '/word.png',
    excel_icon                                      = lehicons .. '/excel.png',
    powerpoint_icon                                 = lehicons .. '/powerpoint.png',
    hexchat_icon                                    = lehicons .. '/hexchat.png',
    google_chrome_icon                              = lehicons .. '/google-chrome.png',
    hotkey_icon                                     = lehicons .. '/hotkey.png',
    restart_icon                                    = lehicons .. '/restart.png',
    quit_icon                                       = lehicons .. '/quit.png'
}

function theme.at_screen_connect(s)

    -- If wallpaper is a function, call it with 'Screen'.

    local wallpaper = theme.wallpaper
    if type(wallpaper) == 'function' then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Panel

    local markup = lain.util.markup
    local space = wibox.widget.textbox('<span font="Roboto 24"> </span>')

    s.panel = awful.wibar({
        screen = s,
        position = 'bottom',
        height = dpi(32),
        border_width = dpi(0)
    })

    -- Launcher

    local launcher = awful.widget.button({image = theme.launcher_icon})
    launcher:connect_signal('button::press', function()
        awful.util.main_menu:toggle(
            {
                coords = {
                    x = 0,
                    y = awful.screen.focused().geometry.height
                }
            }
        )
    end)

    -- Promptbox

    s.promptbox = awful.widget.prompt()

    -- Tasklist

    s.tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        style = {
            bg_normal = theme.bg_raise,
            shape_border_width = 4,
            shape_border_color = theme.tasklist_bg_normal,
            shape = gears.shape.rectangle,
            align = 'center'
        },
        layout = {
            spacing = 2,
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 8,
                        widget = wibox.container.margin,
                    },
                    {
                        id = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
    }

    -- Tags a.k.a Workspaces

    awful.tag(awful.util.tagnames, s, awful.layout.layouts)
    s.tag = wibox.container.margin(
        wibox.container.background(
            awful.widget.taglist(
                s,
                awful.widget.taglist.filter.all,
                awful.util.taglist_buttons
            ),
            theme.bg_raise,
            gears.shape.rectangle
        ),
        dpi(0),
        dpi(0),
        dpi(5),
        dpi(5)
    )

    -- Layoutbox

    s.layoutbox = awful.widget.layoutbox(s)
    s.layoutbox:buttons(table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end)
    ))

    -- Battery

    local battery = lain.widget.bat({
        settings = function()
            title = 'Battery'
            percent = bat_now.perc
            if bat_now.ac_status == 1 then
                status = 'C'
            else
                status = 'D'
            end
            widget:set_markup(markup.fontcolor(
                theme.font,
                theme.fg_normal,
                theme.bg_normal,
                string.format('%s %s %s', title, percent, status)
            ))
        end
    })

    -- Clock

    local clock = wibox.container.margin(
        wibox.container.background(
            wibox.widget.textclock(markup('#ffffff', '%d %b %H:%M')),
            theme.bg_normal,
            gears.shape.rectangle
        ),
        dpi(0),
        dpi(0),
        dpi(5),
        dpi(5)
    )

    -- Panel Layout (Left, Middle, Right Widgets)

    s.panel:setup {
        layout = wibox.layout.align.horizontal,
        {   
            layout = wibox.layout.fixed.horizontal,
            launcher,
            s.promptbox,
        },
        s.tasklist,
        {
            s.tag,
            space,
            s.layoutbox,
            layout = wibox.layout.fixed.horizontal,
            space,
            battery.widget,
            space,
            clock,
            space
        }
    }
end

return theme

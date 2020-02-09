-- vim: filetype=lua:textwidth=158

-- TODO

-- 1. Feature: Drag and Drop Tabs.
-- 2. Feature: Show Desktop.
-- 3. Bug: Windows shouldn't overlap the Panel in Floating mode.
-- 4. Bug: Menu shouldn't be clicked immediately after restart.
-- 5. Style: Single or Double Quotes
-- 6. Style: Re-think about variable names.

local type = type
local string = string
local tostring = tostring
local tonumber = tonumber
local ipairs = ipairs
local os = os

local autofocus = require('awful.autofocus')
local awful = require('awful')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local hotkeys_popup = require('awful.hotkeys_popup').widget
local lain = require('lain')
local naughty = require('naughty')
local table = awful.util.table
local wibox = require('wibox')

local awesome = awesome
local client = client
local mouse = mouse
local screen = screen
local tag = tag

local home = os.getenv('HOME')
local config = home .. '/.config/awesome'
local themes = config .. '/themes'

-- Utils

local function pad(string)
    local space4 = '    '
    return space4 .. string .. space4
end

-- Naughty

naughty.config.defaults.border_width = 1
naughty.config.defaults['icon_size'] = 32
naughty.config.defaults.border_color = '#ffffff'
naughty.config.defaults.position = 'bottom_right'
naughty.config.presets.low.bg = '#363636'
naughty.config.presets.low.border_color = '#555555'
naughty.config.presets.normal.bg = '#363636'
naughty.config.presets.normal.border_color = '#555555'
naughty.config.presets.critical.bg = '#cc3333'
naughty.config.presets.critical.border_color = '#d32f2f'

-- Startup error handler.

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'Oops, there were errors during startup!',
        text = awesome.startup_errors
    })
end

-- Daemons

local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format(
            'pgrep -u $USER -fx '%s' > /dev/null || (%s)',
            cmd,
            cmd))
    end
end

-- Runtime error handler.

do
    local in_error = false
    awesome.connect_signal('debug::error', function(err)
        if in_error then return end
        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = 'Oops, an error happened!',
            text = tostring(err)
        })
        in_error = false
    end)
end

run_once({}) 

-- Configuration

local modkey = 'Mod4'
local altkey = 'Mod1'

-- TODO: Re-think.

beautiful.init(themes .. '/leh/theme.lua')

-- TODO: Re-think.

-- Exceeds 79 characters because there are function definitions.

local menu = {
    {pad('Terminal'), 'start-kitty', beautiful.terminal_icon},
    {pad('File Manager'), 'start-thunar', beautiful.file_manager_icon},
    {pad('Text Editor'), 'featherpad', beautiful.text_editor_icon},
    {pad('Visual Studio Code'), 'start-visual-studio-code', beautiful.visual_studio_code_icon},
    {pad('Sublime Text'), 'start-sublime-text', beautiful.sublime_text_icon},
    {pad('Sublime Merge'), 'start-sublime-merge', beautiful.sublime_merge_icon},
    {pad('Word'), 'start-word', beautiful.word_icon},
    {pad('Excel'), 'start-excel', beautiful.excel_icon},
    {pad('Powerpoint'), 'start-powerpoint', beautiful.powerpoint_icon},
    {pad('Hexchat'), 'hexchat', beautiful.hexchat_icon},
    {pad('Google Chrome'), 'start-google-chrome', beautiful.google_chrome_icon},
    {pad('Hotkeys'), function() return false, hotkeys_popup.show_help end, beautiful.hotkey_icon},
    {pad('Restart'), awesome.restart, beautiful.restart_icon},
    {pad('Quit'), function() awesome.quit() end, beautiful.quit_icon}
}

awful.util.main_menu = awful.menu(menu)

awful.util.main_menu.wibox:connect_signal("mouse::leave", function() end)

-- Tags a.k.a Workspaces

awful.util.terminal = terminal

-- TODO: Re-think.

awful.util.tagnames = {
    pad('1'),
    pad('2'), 
    pad('3'),
    pad('4')
}

awful.layout.layouts = {
    awful.layout.suit.max,
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.magnifier
}

-- Tasklist Buttons

awful.util.tasklist_buttons = table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            client.focus = c
            c:raise()
        end
    end),
    awful.button({}, 2, function(c) c:kill() end),
    awful.button({}, 3, function()
        local instance = nil

        return function()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)

-- Taglist

awful.util.taglist_buttons = table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({modkey}, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({modkey}, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Reset wallpaper when a screen's geometry changes.

screen.connect_signal('property::geometry', function(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- Create a wibox for each screen and add it.

awful.screen.connect_for_each_screen(
    function(s) beautiful.at_screen_connect(s) end
)

-- Global Key Bindings

globalkeys = table.join(

    -- Launchers

    awful.key({altkey, 'Control'}, 'l', function() os.execute('slock') end,
        {description = 'lock screen', group = 'launcher'}),
    awful.key({modkey}, 'i', function() os.execute('set-x-icons') end,
        {description = 'lock screen', group = 'launcher'}),
    awful.key({modkey}, 'w', function() os.execute('select-wallpaper') end,
        {description = 'select wallpaper', group = 'launcher'}),

    -- Tags a.k.a Workspaces

    awful.key({modkey}, 'Left', awful.tag.viewprev,
        {description = 'view previous', group = 'tag'}),
    awful.key({modkey}, 'Right', awful.tag.viewnext,
        {description = 'view next', group = 'tag'}),

    awful.key({altkey, 'Control'}, 'Left', awful.tag.viewprev,
        {description = 'view previous', group = 'tag'}),
    awful.key({altkey, 'Control'}, 'Right', awful.tag.viewnext,
        {description = 'view next', group = 'tag'}),

    awful.key({modkey}, 'Tab', awful.tag.history.restore,
        {description = 'go back', group = 'tag'}),

    -- Windows

    awful.key({altkey}, 'j',
        function() awful.client.focus.byidx(1) end,
        {description = 'focus next by index', group = 'client'}
    ),
    awful.key({altkey}, 'k',
        function() awful.client.focus.byidx(-1) end,
        {description = 'focus previous by index', group = 'client'}
    ),

    -- Client Focus

    awful.key({modkey}, 'j',
        function()
            awful.client.focus.global_bydirection('down')
            if client.focus then client.focus:raise() end
        end,
        {description = 'focus down', group = 'client'}),
    awful.key({modkey}, 'k',
        function()
            awful.client.focus.global_bydirection('up')
            if client.focus then client.focus:raise() end
        end,
        {description = 'focus up', group = 'client'}),
    awful.key({modkey}, 'h',
        function()
            awful.client.focus.global_bydirection('left')
            if client.focus then client.focus:raise() end
        end,
        {description = 'focus left', group = 'client'}),
    awful.key({modkey}, 'l',
        function()
            awful.client.focus.global_bydirection('right')
            if client.focus then client.focus:raise() end
        end,
        {description = 'focus right', group = 'client'}),
    awful.key({ "Mod1",}, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = 'focus alt', group = 'client'}),

    -- Menu

    awful.key({modkey}, 'z',
        function()
            s = awful.screen.focused()
            awful.util.main_menu:show(
                {
                    coords = {
                        x = 0,
                        y = awful.screen.focused().geometry.height
                    }
                }
            )
        end,
        {description = 'show main menu', group = 'awesome'}),

    -- Layout

    awful.key({modkey, 'Shift'}, 'j',
        function() awful.client.swap.byidx(1) end,
        {description = 'swap with next client by index', group = 'client'}),
    awful.key({modkey, 'Shift'}, 'k',
        function() awful.client.swap.byidx(-1) end,
        {description = 'swap with previous client by index',
         group = 'client'}),
    awful.key({modkey, 'Control'}, 'j',
        function() awful.screen.focus_relative(1) end,
        {description = 'focus the next screen', group = 'screen'}),
    awful.key({modkey, 'Control'}, 'k',
        function() awful.screen.focus_relative(-1) end,
        {description = 'focus the previous screen', group = 'screen'}),

    awful.key({modkey}, 'Page_Down',
        function() awful.client.swap.byidx(1) end,
        {description = 'swap with next client by index', group = 'client'}),
    awful.key({modkey}, 'Page_Up',
        function() awful.client.swap.byidx(-1) end,
        {description = 'swap with previous client by index', group = 'client'}),

    awful.key({modkey}, 'u', awful.client.urgent.jumpto,
        {description = 'jump to urgent client', group = 'client'}),

    awful.key({altkey}, 'Escape',
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = 'go back', group = 'client'}),

    -- Show/Hide Panel

    awful.key({modkey}, 'p',
        function ()
            for s in screen do
                if s.panel then
                    s.panel.visible = not s.panel.visible
                end
            end
        end,
        {description = 'toggle wibox', group = 'awesome'}
    ),

    -- Dynamic Tagging

    awful.key({modkey, 'Shift'}, 'n',
        function() lain.util.add_tag() end,
        {description = 'add new tag', group = 'tag'}),
    awful.key({modkey, 'Shift'}, 'r',
        function() lain.util.rename_tag() end,
        {description = 'rename tag', group = 'tag'}),
    awful.key({modkey, 'Shift'}, 'Left',
        function() lain.util.move_tag(-1) end,
        {description = 'move tag to the left', group = 'tag'}),
    awful.key({modkey, 'Shift'}, 'Right',
        function() lain.util.move_tag(1) end,
        {description = 'move tag to the right', group = 'tag'}),
    awful.key({modkey, 'Shift'}, 'd',
        function() lain.util.delete_tag() end,
        {description = 'delete tag', group = 'tag'}),

    -- Awesome

    awful.key({modkey}, 's', hotkeys_popup.show_help,
        {description = 'show help', group='awesome'}),
    awful.key({modkey}, 'r', awesome.restart,
        {description = 'reload awesome', group = 'awesome'}),
    awful.key({modkey, 'Shift'}, 'q', awesome.quit,
        {description = 'quit awesome', group = 'awesome'}),
    awful.key({modkey}, 'space', function () awful.layout.inc( 1) end,
        {description = 'select next', group = 'layout'}),
    awful.key({modkey, 'Shift'   }, 'space',
        function() awful.layout.inc(-1) end,
        {description = 'select previous', group = 'layout'}),
    awful.key({modkey}, 'a',
        function()
            local c = awful.client.restore()
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = 'restore minimized', group = 'client'}),
    awful.key({modkey}, 'Return', function () awful.spawn('start-kitty') end,
        {description = 'open a terminal', group = 'launcher'}),

    -- Prompt

    awful.key({modkey}, 'x',
        function() awful.screen.focused().promptbox:run() end,
        {description = 'run prompt', group = 'launcher'}),
    awful.key({modkey}, 'c',
        function()
            awful.prompt.run {
              prompt = 'Run Lua code: ',
              textbox = awful.screen.focused().promptbox.widget,
              exe_callback = awful.util.eval,
              history_path = awful.util.get_cache_dir() .. '/history_eval'
            }
        end,
        {description = 'lua execute prompt', group = 'awesome'})
)

-- Client Key Bindings

clientkeys = table.join(

    awful.key({altkey, 'Shift'}, 'm', lain.util.magnify_client,
        {description = 'magnify client', group = 'client'}),
    awful.key({modkey}, 'f',
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = 'toggle fullscreen', group = 'client'}),
    awful.key({modkey, 'Shift'}, 'c', function(c) c:kill() end,
        {description = 'close', group = 'client'}),
    awful.key({modkey, 'Control'}, 'space',  awful.client.floating.toggle,
        {description = 'toggle floating', group = 'client'}),
    awful.key({ modkey, 'Control' }, 'Return',
        function(c) c:swap(awful.client.getmaster()) end,
        {description = 'move to master', group = 'client'}),
    awful.key({modkey}, 'o', function(c) c:move_to_screen() end,
        {description = 'move to screen', group = 'client'}),
    awful.key({modkey}, 't', function(c) c.ontop = not c.ontop end,
        {description = 'toggle keep on top', group = 'client'}),
    awful.key({modkey}, 'n',
        function(c)
            c.minimized = true
        end ,
        {description = 'minimize', group = 'client'}),
    awful.key({modkey}, 'm',
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = 'maximize', group = 'client'})
)

for i = 1, 9 do

    -- Hack to only show tags from 1 and 9 in the shortcut window (Mod+s).

    local descr_view, descr_toggle, descr_move, descr_toggle_focus

    if i == 1 or i == 9 then
        descr_view = {
            description = 'view tag #',
            group = 'tag'
        }
        descr_toggle = {
            description = 'toggle tag #',
            group = 'tag'}
        descr_move = {
            description = 'move focused client to tag #',
            group = 'tag'
        }
        descr_toggle_focus = {
            description = 'toggle focused client on tag #',
            group = 'tag'
        }
    end

    globalkeys = table.join(globalkeys,

        -- View Tag

        awful.key({modkey}, '#' .. i + 9,
          function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   tag:view_only()
                end
          end,
          descr_view),

        -- Multiselect Tags

        awful.key({modkey, 'Control'}, '#' .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                   awful.tag.viewtoggle(tag)
                end
            end,
            descr_toggle),

        -- Shift Client

        awful.key({modkey, 'Shift'}, '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
            end,
            descr_move)
    )
end

root.keys(globalkeys)

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
    end),
    awful.button({modkey}, 1, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({modkey}, 3, function(c)
        c:emit_signal('request::activate', 'mouse_click', {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Exceeds 79 characters because the internal variable names are too long.

-- Rules

awful.rules.rules = {

    -- All clients will match this rule.

    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            size_hints_honor = false
    }
    },

    -- "Dialog" and "Normal" clients will match this rule.

    {
        rule_any = {type = {'dialog', 'normal'}},
        properties = {titlebars_enabled = true},
        callback = function(c)
            awful.placement.centered(c, nil)
        end
    },

    -- "Popup" clients will match this rule.

    {
        rule_any = {role = {'pop-up'}},
        properties = {floating = true}
    },
    
    -- Explict non-floating, non-maximized windows.

    {
        rule_any = {
            name = {
                'WPS Writer',
                'WPS Spreadsheets',
                'WPS Presentation'
            }
            },
            properties = {
                floating = false,
                maximized = false
            }
    }

}

-- Signals

-- Signal function to execute when a new client appears.

client.connect_signal('manage', function(c)

    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position and
      not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    local layout = awful.layout.getname(awful.layout.get(c.screen))
    if layout == 'floating' then
        c.floating = true
        awful.placement.centered(c, nil)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.

client.connect_signal('request::titlebars', function(c)

    -- Default

    -- Buttons for the titlebar.

    local buttons = table.join(
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({}, 2, function() c:kill() end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    -- Titlebar (Left, Middle, Right]

    awful.titlebar.enable_tooltip = false

    awful.titlebar(c, {size = dpi(20)}) : setup {
        {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        { 
            {
                font = beautiful.medium_font,
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        {
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal('property::transient_for', function(c)
    awful.placement.centered(c, nil)
end)

-- Automatically focusing on windows is helpful with dual monitors. However it
-- is not desirable with single monitor or max mode with floating windows!

local sloppy_focus = false

if sloppy_focus then
  client.connect_signal('mouse::enter', function(c)
      c:emit_signal('request::activate', 'mouse_enter', {raise = true})
  end)
end

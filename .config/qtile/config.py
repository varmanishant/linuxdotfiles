# vim: set textwidth=158:

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget

from typing import List

# Monkey Patching Starts

from libqtile.layout.base import _SimpleLayoutBase

__init__ = _SimpleLayoutBase.__init__


def patch(self, **config):
    self.toggleclient = True
    __init__(self, **config)


_SimpleLayoutBase.__init__ = patch


def toggle(self):
    if self.toggleclient:
        self.next()
    else:
        self.previous()
    self.toggleclient = not(self.toggleclient)


_SimpleLayoutBase.toggle = toggle

layout.Max.cmd_toggle = _SimpleLayoutBase.toggle

# Monkey Patching Ends

mod = "mod1"

keys = [
    Key([mod], "Return", lazy.spawn("start-terminal")),
    Key([mod], "c", lazy.spawn("set-icons")),
    Key([mod], "w", lazy.spawn("set-wallpaper")),
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "m", lazy.window.toggle_fullscreen()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "r", lazy.restart()),
    Key([mod], "x", lazy.spawncmd()),
    Key([mod], "z", lazy.spawn("select-window")),
    Key(["control"], "Tab", lazy.layout.toggle()),
    Key(["control"], "q", lazy.window.kill()),
    Key(["control"], "space", lazy.screen.toggle_group()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    Key(["control", "mod1"], "Right", lazy.screen.next_group()),
    Key(["control", "mod1"], "Left", lazy.screen.prev_group()),
]

groups = [Group(i) for i in "asdfuiop"]

# Exceeds 79 characters for readability.

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
    ])

layouts = [
    layout.Max(
        name="maximize"
    ),
    layout.Stack(
        name="stack",
        num_stacks=2
    ),
    layout.MonadTall(
        name="monad",
        border_focus="#50c878",
        border_normal="#000000"
    )
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.TextBox("default config", name="default"),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                widget.QuickExit(),
            ],
            24
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'ssh-askpass'},
    {'wmclass': 'toolbar'},
    {'wname': 'pinentry'},
])

auto_fullscreen = True
focus_on_window_activation = "smart"

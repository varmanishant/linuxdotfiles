-- Functions
-- =========

function string.split(input, separator)
  if separator == nil then separator = "%s" end
  local output = {}
  for match in string.gmatch(input, "([^"..separator.."]+)") do
    table.insert(output, match)
  end
  return output
end

function io.git_files()
  local path = io.get_project_root()
  lfs.chdir(path)
  local handle = io.popen('git ls-tree -r --name-only HEAD')
  local files = string.split(handle:read("*a"))
  local options = {
    title = _L['Open'], columns = _L['File'], items = files,
    button1 = _L['_OK'], button2 = _L['_Cancel'], select_multiple = true,
    string_output = true, width = CURSES and ui.size[1] - 2 or nil
  }
  local button, selection = ui.dialogs.filteredlist(options)
  if button ~= _L['_OK'] or not files then return end
  io.open_file(selection)
end

-- Keyboard Shotcuts
-- =================

-- Ctrl + Tab       = Toggle Last Buffer
-- Ctrl + Page Up   = Next Tab
-- Ctrl + Page Down = Previous Tab
-- Ctrl + G         = Goto Line
-- Ctrl + P         = Open Git Files

local keys = keys

-- Buffers
-- =======

local previous

events.connect(events.BUFFER_BEFORE_SWITCH, function()
  previous = buffer
end)

keys['c\t'] = function()
  if (previous ~= nil) then
    view.goto_buffer(_VIEWS[1], previous)
  end
end

keys['cpgup'] = function()
  view.goto_buffer(_VIEWS[1], -1)
end

keys['cpgdn'] = function()
  view.goto_buffer(_VIEWS[1], 1)
end

-- Code Navigation
-- ===============

keys['cg'] = textadept.editing.goto_line

-- Files
-- =====

keys['cp'] = io.git_files

-- General
-- =======

keys['f5'] = function()
  io.save_file()
  reset()
end

-- Theme
-- =====

if not CURSES then
  buffer:set_theme("light", {
    font = "Liberation Mono",
    fontsize = 11
  })
end

-- References

-- https://notabug.org/reback00/

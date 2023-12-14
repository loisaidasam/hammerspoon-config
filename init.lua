
-- References:
-- https://www.ocf.berkeley.edu/~kmarwaha/init.lua (via http://kunalmarwaha.com/mac)
-- http://www.hammerspoon.org/docs/

-- If console gets nil errors on `focusedWindow()` calls on OSX, go to:
--
-- System Preferences > Security & Privacy > Privacy tab > Accessibility
--
-- and then check the box to allow Hammerspoon to control your computer
-- via https://stackoverflow.com/questions/34743870/lua-hammerspoon-hs-window-focusedwindow-is-nil-when-assigned-to-a-variable

-- List of allowed keycodes here:
-- https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/keycodes/init.lua


local MASH = {"cmd", "alt", "ctrl"}

local MOVE_DELTA = 100
local EXPAND_DELTA = 50

-- Hello world
hs.hotkey.bind(MASH, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- Reload config
hs.hotkey.bind(MASH, "R", function()
  hs.reload()
end)

-- TODO: Show the console
hs.hotkey.bind(MASH, "C", function()
  hs.console.hswindow():focus()
end)

-- Utility
function getWindow()
  return hs.window.focusedWindow()
  -- return win = hs.window.frontMostWindow()
end
function moveWindow(xDelta, yDelta)
  local win = getWindow()
  local frame = win:frame()

  frame.x = frame.x + xDelta
  frame.y = frame.y + yDelta
  win:setFrame(frame)
end
function fitToScreen(win)
  local frame = win:frame()
  local max = win:screen():frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  win:setFrame(frame)
end
function fullscreen(win)
  win:setFullScreen(true)
  -- win:toggleFullScreen()
end

-- Move windows around
-- Left
hs.hotkey.bind(MASH, "J", function()
  moveWindow(-1 * MOVE_DELTA, 0)
end)
-- Right
hs.hotkey.bind(MASH, "L", function()
  moveWindow(MOVE_DELTA, 0)
end)
-- Up
hs.hotkey.bind(MASH, "I", function()
  moveWindow(0, -1 * MOVE_DELTA)
end)
-- Down
hs.hotkey.bind(MASH, "K", function()
  moveWindow(0, MOVE_DELTA)
end)

-- Do window grid stuff
hs.hotkey.bind(MASH, "Left", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  -- Left
  frame.x = max.x
  -- Half width
  frame.w = max.w / 2
  win:setFrame(frame)
end)
hs.hotkey.bind(MASH, "Right", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  -- Middle
  frame.x = max.x + (max.w / 2)
  -- Half width
  frame.w = max.w / 2
  win:setFrame(frame)
end)
hs.hotkey.bind(MASH, "Up", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  -- Top
  frame.y = max.y
  -- Half width
  frame.h = max.h / 2
  win:setFrame(frame)
end)
hs.hotkey.bind(MASH, "Down", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  -- Bottom
  frame.y = max.y + (max.h / 2)
  frame.h = max.h / 2
  win:setFrame(frame)
end)

-- Expand
hs.hotkey.bind(MASH, "=", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  frame.x = frame.x - EXPAND_DELTA
  frame.y = frame.y - EXPAND_DELTA
  frame.w = frame.w + (2 * EXPAND_DELTA)
  frame.h = frame.h + (2 * EXPAND_DELTA)
  win:setFrame(frame)
end)

-- Contract
hs.hotkey.bind(MASH, "-", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  frame.x = frame.x + EXPAND_DELTA
  frame.y = frame.y + EXPAND_DELTA
  frame.w = frame.w - (2 * EXPAND_DELTA)
  frame.h = frame.h - (2 * EXPAND_DELTA)
  win:setFrame(frame)
end)

-- Full screen
hs.hotkey.bind(MASH, "Space", function()
  local win = getWindow()

  fitToScreen(win)
  -- fullscreen(win)
end)

-- Middle of screen
hs.hotkey.bind(MASH, "M", function()
  local win = getWindow()
  local frame = win:frame()
  local max = win:screen():frame()

  frame.x = max.x + (max.w / 4)
  frame.w = max.w / 2
  frame.y = max.y + (max.h / 4)
  frame.h = max.h / 2
  win:setFrame(frame)
end)

-- Move to right screen
hs.hotkey.bind(MASH, "]", function()
  local win = getWindow()
  local screen = win:screen()

  -- win = win:moveToScreen(screen:next())
  win = win:moveToScreen(screen:previous())
end)

-- Move to left scdreen
hs.hotkey.bind(MASH, "[", function()
  local win = getWindow()
  local screen = win:screen()

  -- win = win:moveToScreen(screen:previous())
  win = win:moveToScreen(screen:next())
end)

hs.alert.show("Config loaded")

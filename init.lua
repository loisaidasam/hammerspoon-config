
-- References:
-- https://www.ocf.berkeley.edu/~kmarwaha/init.lua (via http://kunalmarwaha.com/mac)
-- http://www.hammerspoon.org/docs/

-- If console gets nil errors on `focusedWindow()` calls on OSX, go to:
--
-- System Preferences > Security & Privacy > Privacy tab > Accessibility
--
-- and then check the box to allow Hammerspoon to control your computer
-- via https://stackoverflow.com/questions/34743870/lua-hammerspoon-hs-window-focusedwindow-is-nil-when-assigned-to-a-variable


local mash = {"cmd", "alt", "ctrl"}

-- Hello world
hs.hotkey.bind(mash, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- Reload config
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

-- Utility
function getWindow()
  return hs.window.focusedWindow()
  -- return win = hs.window.frontMostWindow()
end
function moveWindow(xDelta, yDelta)
  local win = getWindow()
  local f = win:frame()
  f.x = f.x + xDelta
  f.y = f.y + yDelta
  win:setFrame(f)
end

-- Move windows around
hs.hotkey.bind(mash, "J", function()
  moveWindow(-100, 0)
end)
hs.hotkey.bind(mash, "I", function()
  moveWindow(0, -100)
end)
hs.hotkey.bind(mash, "L", function()
  moveWindow(100, 0)
end)

-- Do window grid stuff
-- TODO: Simplify this
hs.hotkey.bind(mash, "Left", function()
  local win = getWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Put screen in top left
  f.x = max.x
  f.y = max.y
  -- Half width
  f.w = max.w / 2
  -- Full height
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Right", function()
  local win = getWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Put screen at top/middle
  f.x = max.x + (max.w / 2)
  f.y = max.y
  -- Half width
  f.w = max.w / 2
  -- Full height
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Up", function()
  local win = getWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Full screen
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Down", function()
  local win = getWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  -- Half height
  f.h = max.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "K", function()
  local win = getWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = max.h / 2
  f.y = max.y + (max.h / 2)
  win:setFrame(f)
end)

hs.alert.show("Config loaded")

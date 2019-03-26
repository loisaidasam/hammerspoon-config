
-- via https://www.ocf.berkeley.edu/~kmarwaha/init.lua

local mash = {"cmd", "alt", "ctrl"}

--hello world
hs.hotkey.bind(mash, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)


--moving windows around
hs.hotkey.bind(mash, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x - 100
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "I", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.y = f.y - 100
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  f.x = f.x + 100
  win:setFrame(f)
end)

--do window grid stuff
hs.hotkey.bind(mash, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = max.h / 2
  win:setFrame(f)
end)
hs.hotkey.bind(mash, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.h = max.h / 2
  f.y = max.y + (max.h / 2)
  win:setFrame(f)
end)

--reloading config
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")

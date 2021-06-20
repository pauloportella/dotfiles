-- ------------------------------------------------------------------------------------
-- 🔨🥄 HammerSpoon Configuration file
-- ------------------------------------------------------------------------------------

-- require('custom-scroll-mode')


local function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"
}):send()

require("hs.ipc")

hs.loadSpoon("SpoonInstall")
-- spoon.SpoonInstall.repos.skrypka = {
--     url = "https://github.com/skrypka/Spoons",
--     desc = "Skrypka's spoon repository",
--   }
spoon.SpoonInstall.use_syncinstall = true

hs.grid.setGrid('3x1')
hs.grid.ui.showExtraKeys = true
hs.hotkey.bind({"alt", "cmd"}, "G", function() hs.grid.show() end)

hs.hints.style = "vimperator"
hs.window.animationDuration = 0


spoon.SpoonInstall:andUse("TextClipboardHistory", {
    start = true,
    config = { show_in_menubar = false, paste_on_select = true },
})
spoon.SpoonInstall:andUse("PopupTranslateSelection")

hs.caffeinate.set("displayIdle", true, true)
spoon.SpoonInstall:andUse("Caffeine", { start = true })


spoon.SpoonInstall:andUse("EasySuperGenPass", {
repo = 'skrypka',
svn = true,
hotkeys = {
    paste_password = {{"alt", "cmd"}, 'P' },
},
config = {
    save_master_password = true,
    master_passwords_hashes = {["048f"] = true}
}
})

-- Zoom PushToTalk
spoon.SpoonInstall:andUse("PushToTalk", {
    start = true,
    config = {
      app_switcher = { ['zoom.us'] = 'push-to-talk' }
    }
})
--

-- Clean attributes from downloads folder
xattrTimer = hs.timer.doEvery(60 * 60 * 8, function() hs.execute("xattr -c -r ~/Downloads") end)
-- 

-- Hyper Modal
spoon.SpoonInstall:andUse("RecursiveBinder")
singleKey = spoon.RecursiveBinder.singleKey

-- Spec of keymap:
-- Every key is of format {{modifers}, key, (optional) description}
-- The first two element is what you usually pass into a hs.hotkey.bind() function.
--
-- Each value of key can be in two form:
-- 1. A function. Then pressing the key invokes the function
-- 2. A table. Then pressing the key bring to another layer of keybindings.
-- And the table have the same format of top table: keys to keys, value to table or function

myMapWithName = {
    [singleKey('space', 'Hints')] = hs.hints.windowHints,
    [singleKey('g', 'Google Chrome')] = function() hs.application.launchOrFocus('Google Chrome') end,
    [singleKey('c', 'Visual Code Studio')] = function() hs.application.launchOrFocusByBundleID('com.microsoft.VSCode') end,
    [singleKey('i', 'iTerm')] = function() hs.application.launchOrFocus('iTerm.app') end,
    [singleKey('d', 'Zeplin')] = function() hs.application.launchOrFocus('Zeplin') end,
    [singleKey(',', 'System Preferences')] = function() hs.application.launchOrFocus('System Preferences') end,
    [singleKey('s', 'Spotify')] = function() hs.application.launchOrFocus('Spotify') end,
    [singleKey('z', 'Zoom')] = function() hs.application.launchOrFocus('zoom.us') end,
    [singleKey('n', 'Notion')] = function() hs.application.launchOrFocus('Notion') end,
    [singleKey('h', 'hammerspoon+')] = {
        [singleKey('c', 'Console')] = function() hs.console.hswindow():focus() end,
        [singleKey('r', 'Reload config')] = hs.reload,
        [singleKey('v', 'ClipboardHistory')] = function() spoon.TextClipboardHistory:toggleClipboard() end,
        [singleKey('m', 'Replay Macro')] = function() spoon.MacroS.manyReplayRecording() end,
     }
}

spoon.RecursiveBinder.helperFormat = {atScreenEdge=0, strokeColor={ white = 0, alpha = 2 }, textSize=32}
hs.hotkey.bind({}, 'F18', spoon.RecursiveBinder.recursiveBind(myMapWithName))





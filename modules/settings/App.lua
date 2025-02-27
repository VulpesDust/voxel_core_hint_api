local Style = require('settings/Style')
local Header = require('settings/components/Header')
local Button = require('settings/components/Button')
local LeftBarButtons = require('settings/components/LeftBarButtons')
local StyleSettings = require('settings/components/Tab/StyleSettings')
local PositionSettings = require('settings/components/Tab/PositionSettings')
local OffsetSettings = require('settings/components/Tab/OffsetSettings')

local App = {}

function App.draw(gui)
    gui.style = Style

    local width = 600
    local left_bar_width = 200
    local height = 400

    local id = gui.draw(gui, gui.root, {
        tag = 'container',
        atr = {
            size = width .. ', ' .. height,
            color = gui.style.body_bg .. '88',
            gravity = 'center-center',
            orientation = 'horizontal',
            -- padding = '8'
        }
    })

    
    local tab_width = width - left_bar_width - 16 - 8
    
    local tabs = {
        style = StyleSettings.draw(gui, id, {
            width = tab_width
        }),
        position = PositionSettings.draw(gui, id, {
            width = tab_width
        }),
        offset = OffsetSettings.draw(gui, id, {
            width = tab_width
        })
    }
    tabs.style.visible = false
    tabs.position.visible = false
    tabs.offset.visible = false


    
    local bar = LeftBarButtons.draw(gui, id, {
        width = left_bar_width,
        tabs = tabs
    })
    
    

end

return App

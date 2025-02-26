local Style = require('settings/Style')
local Header = require('settings/components/Header')
local Button = require('settings/components/Button')

local App = {}

function App.draw(gui)
    gui.style = Style

    local id = gui.draw(gui, gui.root, {
        tag = 'panel',
        atr = {
            size = '600',
            color = gui.style.body_bg,
            gravity = 'center-center',
            orientation = 'horizontal'
        }
    })

    -- Header.draw(gui, panel_id)

    local buttons_panel = gui.draw(gui, id, {
        tag = 'panel',
        atr = {
            size = '250',
            color = '#00000000',
            margin = '8'
        }
    })

    Button.draw(gui, buttons_panel, {
        label = 'asdf \n asdf2',
        click = 'b(\'asdf, asdf2\')'
    })
    Button.draw(gui, buttons_panel, {
        label = 'asdf3',
        click = "b('asdf3', 'asdf4', 'asdf5', 'asdf6')"
    })

end

return App

local Button = require('settings/components/Button')
local SelectTabButton = require('settings/components/Tab/SelectTabButton')

local this = {}

function this.draw(gui, parent_id, args)
    local width = args.width

    local id = gui.draw(gui, parent_id, {
        tag = 'container',
        atr = {
            gravity = 'top-left',
            size = string.format('%s, %s', width, gui.document[parent_id].size[2] - 16),
            color = '#00000000',
            margin = '8'
        }
    })

    local panel = gui.draw(gui, id, {
        tag = 'panel',
        atr = {
            size = width,
            color = '#00000000',
            gravity = 'top-left'
        }
    })


    


    SelectTabButton.draw(gui, panel, {
        label = 'TODO style',
        tabs = args.tabs,
        tab = args.tabs.style
    })
    SelectTabButton.draw(gui, panel, {
        label = 'TODO position',
        tabs = args.tabs,
        tab = args.tabs.position
    })
    SelectTabButton.draw(gui, panel, {
        label = 'TODO offset',
        tabs = args.tabs,
        tab = args.tabs.offset
    })


    local down_panel = gui.draw(gui, id, {
        tag = 'panel',
        atr = {
            size = width,
            color = '#00000000',
            gravity = 'bottom-left'
        }
    })

    Button.draw(gui, down_panel, {
        label = 'save',
    })
    Button.draw(gui, down_panel, {
        label = 'close',
        click = "close()"
    })
    return gui.document[id]
end

return this

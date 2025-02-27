local Button = require('settings/components/Button')

local this = {}

function this.draw(gui, parent_id, args)
    local width = args.width
    local height = gui.document[parent_id].size[2] - 16

    local id = gui.draw(gui, parent_id, {
        tag = 'container',
        atr = {
            gravity = 'top-right',
            size = string.format('%s, %s', width, height),
            color = '#00000000',
            margin = '8'
        }
    })

    local top_panel = gui.draw(gui, id, {
        tag = 'panel',
        atr = {
            size = width,
            color = '#00000000',
            gravity = 'top-left',
            
            scrollable = true,
            ['max-length'] = height
        }
    })

    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })
    Button.draw(gui, top_panel, {
        label = 'TODO position'
    })

    return gui.document[id]
end

return this

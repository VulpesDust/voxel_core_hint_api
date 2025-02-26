local this = {}

function this.draw(gui, parent_id, args)
    local id = gui.draw(gui, parent_id, {
        tag = 'label',
        label = 'header label',
        atr = ''
    })
    return id
end

return this

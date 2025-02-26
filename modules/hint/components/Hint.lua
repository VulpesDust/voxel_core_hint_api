local this = {}

function this.draw(gui, parent_id, args)

    local label = ''
    if args.button then
        label = label .. ' ' .. args.button
    end
    if args.label then
        label = label .. ' ' .. args.label
    end

    local id = gui.draw(gui, parent_id, {
        tag = 'label',
        label = label
    })
    return id
end

return this

local this = {
    tag = 'label',
    label = nil,
    attributes = ''
}

function this.draw(info, parent_id, args)

    local label = ''
    if args.button then
        label = label .. ' ' .. args.button
    end
    if args.label then
        label = label .. ' ' .. args.label
    end

    local id = info.document_util.draw_component(info, parent_id, {
        tag = this.tag,
        label = label,
        attributes = this.attributes
    })
    return id
end

return this

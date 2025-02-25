local this = {
    tag = 'label',
    label = 'header label',
    attributes = ''
}

function this.draw(info, parent_id, args)
    info.document_util.draw_component(info, parent_id, this)
end

return this

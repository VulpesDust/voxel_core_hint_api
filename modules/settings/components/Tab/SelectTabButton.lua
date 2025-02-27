local Button = require('settings/components/Button')

local this = {}

function this.draw(gui, parent_id, args)

    local onclick = '(function()'
    for _, tab in pairs(args.tabs) do
        -- onclick = onclick .. string.format(" document[\'%s\'].visible = %s; print(\'asdfasdfasdf\'');", tab.id, args.tab == tab) 
        -- onclick = onclick .. string.format(" print('asdfasdfasdf');", tab.id, args.tab == tab) 
        onclick = onclick .. string.format(" document['%s'].visible = %s;", tab.id, args.tab == tab) 
    end
    local onclick = onclick .. ' end)()'

    print(onclick)

    local id = Button.draw(gui, parent_id, {
        label = args.label,
        click = onclick
    })

    return gui.document[id]
end

return this

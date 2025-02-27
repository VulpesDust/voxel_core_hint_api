local this = {}

function this.draw(gui, parent_id, args)
    local id = gui.draw(gui, parent_id, {
        tag = 'panel',
        atr = {
            color = gui.style.btn_bg,
            ["hover-color"] = gui.style.btn_hover_bg,
            ["pressed-color"] = gui.style.btn_active_bg,
            padding = 6,

            onclick = args.click
        }
    })

    local lines = {}
    for line in string.gmatch(args.label, "[^\n]+") do
        table.insert(lines, line)
    end
    for i, line in ipairs(lines) do
        local label = gui.draw(gui, id, {
            tag = 'label',
            label = line,
            atr = {
                valign = 'center',
                align = 'center',
                margin = 2
            }
        })
    end

    return id
end

return this

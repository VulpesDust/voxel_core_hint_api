local this = {}

function this.draw(gui, parent_id, args)
    local id = gui.draw(gui, parent_id, {
        tag = 'panel',
        atr = {
            color = gui.style.btn_bg,
            ["hover-color"] = gui.style.btn_hover_bg,
            ["pressed-color"] = gui.style.btn_active_bg,
            onclick = args.click
        }
    })

    local lines = {}
    for line in string.gmatch(args.label, "[^\n]+") do
        table.insert(lines, line)
    end
    for i, line in ipairs(lines) do
        local margin_top = (i == 1) and 8 or 2
        local margin_bottom = (i == #lines) and 8 or 2
        local margin = string.format('8, %s, 8, %s', margin_top, margin_bottom)
        local label = gui.draw(gui, id, {
            tag = 'label',
            label = line,
            atr = {
                -- size = '250, 150',
                valign = 'center',
                align = 'center',
                -- autoresize = 'true',
                -- multiline = 'true',
                -- ["text-wrap"] = 'true',
                margin = margin
            }
        })
    end

    return id
end

return this

local react = require('vcr_0_1_0:react')
local App = require('hint_api:hint/r/App')

local Doc = {
    draw = function() print('[WARN] Doc not exists') end
}

local hints_offcet = {16, 16}

function size_func() -- xml
    local size = gui.get_viewport()
    return -hints_offcet[1] + size[1] / 2, -hints_offcet[2] + size[2] / 2
end 

function position_func() -- xml
    local size = gui.get_viewport()
    return hints_offcet[1] + size[1] / 2, hints_offcet[2] + size[2] / 2
end

events.on('hint_api:hint.xml__redraw()', function ()
    -- print('get event with id', id, item.name(id))
    Doc.draw()
end)

local inited = false

function on_open()
    if not inited then
        Doc = react.init('hint_api:hint/r/', document, App)
        inited = true

    end
    if inited then
        Doc.draw()
    end
end -- override

function on_close() end -- override


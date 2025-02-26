local doc_util = require('gui_util:doc')
local App = require('hint/App')

local hints_offcet = {16, 16}

function size_func() -- xml
    local size = gui.get_viewport()
    return -hints_offcet[1] + size[1] / 2, -hints_offcet[2] + size[2] / 2
end 

function position_func() -- xml
    local size = gui.get_viewport()
    return hints_offcet[1] + size[1] / 2, hints_offcet[2] + size[2] / 2
end

local function redraw()
    doc_util.draw_app({
        document = document,
        package_id = 'hint_api',
        src_path = 'hint',
        App = App
    })
end

events.on('hint_api:hint.xml__redraw()', function() redraw() end)

function on_open() redraw() end -- override

function on_close() end -- override


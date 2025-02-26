
local doc_util = require('gui_util:doc')
local App = require('settings/App')

function b(button_name, ...) -- xml
    print('button_name', button_name)
    local args = {...}
    for i, v in ipairs(args) do
        print(i, v)
    end
end


function on_open() -- override
    doc_util.draw_app({
        document = document,
        package_id = 'hint_api',
        src_path = 'settings',
        App = App
    })
end

function close() -- xml
    hud.close_inventory()
end

function on_close()  end -- override

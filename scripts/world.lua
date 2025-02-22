
local inventory_util = require('hint_api:utils/inventory')

local last_item = -1
function on_world_tick()
    local id = inventory_util.getSelectedId()
    if id ~= last_item then
        last_item = id
        events.emit('hint_api:hint.xml__redraw()')
    end
end
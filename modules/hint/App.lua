local inventory_util = require('hint_api:utils/inventory')

local Hint = require('hint/components/Hint')

local App = {}

--  Таблица подсказок
--  hints = [item_name] {
--      [] { button = string, label = string }
--  }
local hints = {}

--  Обработчик события добавления подсказок.
--  @param items (table) Таблица подсказок, где ключ — имя элемента, а значение — таблица подсказок.
events.on('hint_api:hint.add_hint_items()', function(items)
    for item_name, hint in pairs(items) do
        hints[item_name] = hint
    end
end)

local function get_selected_properties_hints()
    local item_id = inventory_util.getSelectedId()
    local properties = item.properties[item_id]
    if properties and properties['hint_api:hint'] then
        return properties['hint_api:hint']
    end

    local item_name = inventory_util.getSelectedName()
    if not item_name then
        return
    end
    if not string.find(item_name, '.item$') then
        return
    end
    local block_name = string.gsub(item_name, '.item$', '')
    local block_id = block.index(block_name)
    local properties = block.properties[block_id]
    if properties then
        return properties['hint_api:hint']
    end
end

local function get_selected_item_hints()
    local item_name = inventory_util.getSelectedName()
    local item_hints = hints[item_name]

    if item_hints then
        return item_hints
    end

    return get_selected_properties_hints()
end

function App.draw(info)
    local item_hints = get_selected_item_hints()

    if not item_hints then
        return
    end

    for _, v in pairs(item_hints) do
        Hint.draw(info, info.root, v)
    end
end

return App

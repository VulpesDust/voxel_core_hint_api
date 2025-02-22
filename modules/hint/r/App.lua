local inventory_util = require('hint_api:utils/inventory')

--[[
    Таблица подсказок (hints), где каждая подсказка представлена в виде:
    hints = {
        [item_name] = {
            { button = string, label = string },
            ...
        },
        ...
    }
]]
local hints = {}

--[[
    Обработчик события добавления подсказок.
    @param items (table) Таблица подсказок, где ключ — имя элемента, а значение — таблица подсказок.
]]
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



local this = {}

this.global_css = './style.css'

-- this.children_components = {
    -- Header = 'Header/Header',
    -- Footer = 'Footer/Footer'
-- }

this.rx = function()
    local item_hints = get_selected_item_hints()

    if not item_hints then
        return ''
    end

    local xml = ''
    for _, v in pairs(item_hints) do
        xml = xml .. '<label>'
        if v.button then
            xml = xml .. ' ' .. v.button
        end
        if v.label then
            xml = xml .. ' ' .. v.label
        end
        xml = xml .. '</label>'
    end

    return '<panel color="#00000000">' .. xml .. '</panel>'
    -- return [[
    --     <panel>
    --         <Header/>
    --         <label>label</label>
    --         <Footer/>
    --     </panel>
    -- ]]
end

return this

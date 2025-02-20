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

local this = {}

this.global_css = './style.css'

-- this.children_components = {
    -- Header = 'Header/Header',
    -- Footer = 'Footer/Footer'
-- }

this.rx = function()
    local item_name = inventory_util.getSelectedName()
    local hint = hints[item_name]

    if not hint then
        return ''
    end

    local xml = ''
    for _, v in pairs(hint) do
        -- xml = xml .. '<panel>'
        -- xml = xml .. '<container color="#000000ff">'
        -- xml = xml .. '<label autoresize="true" multiline="true" text-wrap="true">' .. v.button .. ' ' .. v.label .. '</label>'
        xml = xml .. '<label>'
        if v.button then
            xml = xml .. ' ' .. v.button
        end
        if v.label then
            xml = xml .. ' ' .. v.label
        end
        xml = xml .. '</label>'
        -- xml = xml .. '</container>'
        -- xml = xml .. '</panel>'
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

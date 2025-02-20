local this = {}

function this.getSelectedId(playerid)
    local inv_id, active_slot = player.get_inventory(playerid) -- Получаем ID инвентаря и активный слот
    local item_id, item_count = inventory.get(inv_id, active_slot) -- Получаем ID предмета и его количество
    return item_id
end

function this.getSelectedName(playerid)
    local item_id = this.getSelectedId(playerid)
    if item_id ~= 0 then
        return item.name(item_id)
    end
    return nil
end

function this.isItemSelected(playerid, item_name)
    local selected = this.getSelectedName(playerid)
    if selected ~= nil and selected == item_name then
        return true
    end
    return false
end

function this.isSelectedItemInList(playerid, item_names)
    local selected = this.getSelectedName(playerid)
    if not selected then
        return
    end
    for key, item_name in pairs(item_names) do
        if selected ~= nil and selected == item_name then
            return true
        end
    end
    return false
end

return this


local function on_open_settings()
    hud.show_overlay('hint_api:settings')
end

function on_use()
    on_open_settings()
    return true
end

function on_use_on_block()
    on_open_settings()
    return true
end

function on_block_break_by()
    on_open_settings()
    return true
end

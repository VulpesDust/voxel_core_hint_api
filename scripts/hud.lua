function on_hud_open() -- override 
    hud.open_permanent('hint_api:hint')
end

function on_hud_close(playerid) -- override 
    events.remove_by_prefix('hint_pai')
end


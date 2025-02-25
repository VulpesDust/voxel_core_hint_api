local Header = require('settings/components/Header')

local App = {}

function App.draw(info)
    Header.draw(info, info.root)
end

return App

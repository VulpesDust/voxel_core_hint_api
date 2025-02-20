<img src="icon.png" width="128" height="128" style="image-rendering: pixelated;">

# Мод для движка VoxelCore

Этот мод добавляет функциональность отображения подсказок для предметов в руках в движке VoxelCore. Вы можете указать кнопку и текст подсказки как вместе, так и по отдельности.

**Версия движка:** v0.26.2

## Установка

1. Убедитесь, что у вас установлен движок VoxelCore ([github/MihailRis/VoxelEngine-Cpp](https://github.com/MihailRis/VoxelEngine-Cpp)).
2. Скопируйте файлы мода в соответствующую директорию вашего проекта (`./res/content`).
3. Скачайте и установите зависимости:
   - [voxel_core_react v0.1.0](https://github.com/VulpesDust/voxel_core_react)

## Использование

Для добавления подсказок к предметам используйте следующий код:

```lua
local items = {}
items['mod_id:item_name'] = {
    {
        button = 'LMB',
        label = 'left mouse button'
    }, {
        button = 'RMB',
        label = 'right mouse button'
    }, {
        button = 'A',
    }, {
        label = 'B - button B'
    }
}

events.emit('hint_api:hint.add_hint_items()', items)

## Лицензия
Этот мод распространяется под лицензией MIT. Подробнее см. в файле [LICENSE](LICENSE).

# checks if the item frame in @s has a map in it
# if it does, then we stop because converting it will be bad as maps don't render in item displays
# otherwise, we convert

execute unless items entity @s container.0 minecraft:filled_map run execute if items entity @s container.0 * run function displayframes:internal/to_item_display_not_map
# parameters: @s: the item display to convert to item frame
# it's expected to have been made with to_item_display() so that it has the necessary tags on it
# we also expect to be running `at @s`

# item frame orientations:
# 0 = down
# 1 = up
# 2 = north
# 3 = south
# 4 = west
# 5 = east

execute if entity @s[tag=displayframes_glow] run function displayframes:internal/from_item_display_glow
execute unless entity @s[tag=displayframes_glow] run function displayframes:internal/from_item_display_non_glow

kill @s
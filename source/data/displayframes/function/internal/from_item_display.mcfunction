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

execute if entity @s[tag=displayframes_rot1] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 1b
execute if entity @s[tag=displayframes_rot2] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 2b
execute if entity @s[tag=displayframes_rot3] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 3b
execute if entity @s[tag=displayframes_rot4] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 4b
execute if entity @s[tag=displayframes_rot5] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 5b
execute if entity @s[tag=displayframes_rot6] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 6b
execute if entity @s[tag=displayframes_rot7] run data modify entity @n[tag=displayframes_inprogress] ItemRotation set value 7b

tag @n[tag=displayframes_inprogress] remove displayframes_inprogress

kill @s
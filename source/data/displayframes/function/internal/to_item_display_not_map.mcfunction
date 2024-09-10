# Parameters: @s: the item frame or glow item frame being converted
# we also expect to be running `at @s`

# summon a base item display
execute at @s run summon minecraft:item_display ~ ~ ~ {"Tags": ["displayframes_inprogress"],item_display:"fixed"}

# copy the item in from the item frame
data modify entity @n[tag=displayframes_inprogress] item set from entity @s Item

# copy the item's name in from the item frame
execute if data entity @s Item.components."minecraft:custom_name" run function displayframes:internal/copy_and_show_custom_name

# scale the item display to match the item frame size
data modify entity @n[tag=displayframes_inprogress] transformation.scale set value [.5f,.5f,.5f]

# if the source is a glow item frame, add illumination
execute if entity @s[type=minecraft:glow_item_frame] run data modify entity @n[tag=displayframes_inprogress] brightness set value {block: 15, sky: 15}

# item frame orientations:
# 0 = down
# 1 = up
# 2 = north
# 3 = south
# 4 = west
# 5 = east

# Rotate to match the item frame orientation. Rotation angles are in radians along a specified vector.
# also translate as appropriate so it sits in very very very almost the same place
# packaged into functions for convenience as they do multiple commands

# these functions also handle matching item rotation and refer to the source item frame as @s and the target entity as @n[type=minecraft:item_display,tag=displayframes_inprogress]

execute if entity @s[nbt={Facing:0b}] run function displayframes:internal/configure_downwards_facing
execute if entity @s[nbt={Facing:1b}] run function displayframes:internal/configure_upwards_facing
execute if entity @s[nbt={Facing:2b}] run function displayframes:internal/configure_north_facing
execute if entity @s[nbt={Facing:3b}] run function displayframes:internal/configure_south_facing
execute if entity @s[nbt={Facing:4b}] run function displayframes:internal/configure_west_facing
execute if entity @s[nbt={Facing:5b}] run function displayframes:internal/configure_east_facing

# item frame rotations:
# ItemRotation: 0 - 7
# 0 = 0 radians
# 1 = 0.785 radians
# 2 = 1.571 radians
# 3 = 2.356 radians
# 4 = 3.142 radians
# 5 = 3.927 radians
# 6 = 4.712 radians
# 7 = 5.498 radians

# tag it as finished and with the original orientation and glowiness for reconstruction purposes
execute if entity @s[nbt={Facing:0b}] run tag @n[tag=displayframes_inprogress] add displayframes_down
execute if entity @s[nbt={Facing:1b}] run tag @n[tag=displayframes_inprogress] add displayframes_up
execute if entity @s[nbt={Facing:2b}] run tag @n[tag=displayframes_inprogress] add displayframes_north
execute if entity @s[nbt={Facing:3b}] run tag @n[tag=displayframes_inprogress] add displayframes_south
execute if entity @s[nbt={Facing:4b}] run tag @n[tag=displayframes_inprogress] add displayframes_west
execute if entity @s[nbt={Facing:5b}] run tag @n[tag=displayframes_inprogress] add displayframes_east
execute if entity @s[type=minecraft:glow_item_frame] run tag @n[tag=displayframes_inprogress] add displayframes_glow
execute if entity @s[nbt={ItemRotation:0b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot0
execute if entity @s[nbt={ItemRotation:1b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot1
execute if entity @s[nbt={ItemRotation:2b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot2
execute if entity @s[nbt={ItemRotation:3b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot3
execute if entity @s[nbt={ItemRotation:4b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot4
execute if entity @s[nbt={ItemRotation:5b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot5
execute if entity @s[nbt={ItemRotation:6b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot6
execute if entity @s[nbt={ItemRotation:7b}] run tag @n[tag=displayframes_inprogress] add displayframes_rot7

tag @n[tag=displayframes_inprogress] add displayframes_entity
tag @n[tag=displayframes_inprogress] remove displayframes_inprogress

# play a nice sound
execute at @p as @p run playsound entity.item_frame.break block @s ~ ~ ~

# remove the item frame
kill @s
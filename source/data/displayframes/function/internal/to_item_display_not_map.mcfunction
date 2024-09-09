# Parameters: @s: the item frame or glow item frame being converted
# we also expect to be running `at @s`

# summon a base item display
execute at @s run summon minecraft:item_display ~ ~ ~ {"Tags": ["displayframes_inprogress"],item_display:"fixed"}

# copy the item in from the item frame
data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] item set from entity @s Item

# copy the item's name in from the item frame
execute if data entity @s Item.components."minecraft:custom_name" run function displayframes:internal/copy_and_show_custom_name

# scale the item display to match the item frame size
data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] transformation.scale set value [.5f,.5f,.5f]

# if the source is a glow item frame, add illumination
execute if entity @s[type=minecraft:glow_item_frame] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] brightness set value {block: 15, sky: 15}

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

execute if entity @s[nbt={Facing:0b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_downwards_facing
execute if entity @s[nbt={Facing:1b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_upwards_facing
execute if entity @s[nbt={Facing:2b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_north_facing
execute if entity @s[nbt={Facing:3b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_south_facing
execute if entity @s[nbt={Facing:4b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_west_facing
execute if entity @s[nbt={Facing:5b}] as @n[type=minecraft:item_display,tag=displayframes_inprogress] run function displayframes:internal/configure_east_facing

# item frame rotations:
# ItemRotation: 0 - 7
# 0 = 0 degrees
# 1 = 45 degrees
# 2 = 90 degrees
# 3 = 135
# 4 = 180
# 5 = 225
# 6 = 270
# 7 = 315
# we do not support rotated items at this time, but we want to
# TODO support rotated items

# tag it as finished and with the original orientation and glowiness for reconstruction purposes
execute if entity @s[type=minecraft:item_frame,nbt={Facing:0b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_down"]
execute if entity @s[type=minecraft:item_frame,nbt={Facing:1b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_up"]
execute if entity @s[type=minecraft:item_frame,nbt={Facing:2b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_north"]
execute if entity @s[type=minecraft:item_frame,nbt={Facing:3b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_south"]
execute if entity @s[type=minecraft:item_frame,nbt={Facing:4b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_west"]
execute if entity @s[type=minecraft:item_frame,nbt={Facing:5b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_east"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:0b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_down","displayframes_glow"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:1b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_up","displayframes_glow"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:2b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_north","displayframes_glow"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:3b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_south","displayframes_glow"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:4b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_west","displayframes_glow"]
execute if entity @s[type=minecraft:glow_item_frame,nbt={Facing:5b}] run data modify entity @n[type=minecraft:item_display,tag=displayframes_inprogress] Tags set value ["displayframes_entity","displayframes_east","displayframes_glow"]

# play a nice sound
execute at @p as @p run playsound entity.item_frame.break block @s ~ ~ ~

# remove the item frame
kill @s
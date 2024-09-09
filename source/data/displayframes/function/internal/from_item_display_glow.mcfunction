# item frame orientations:
# 0 = down
# 1 = up
# 2 = north
# 3 = south
# 4 = west
# 5 = east

execute if entity @s[tag=displayframes_down] run summon glow_item_frame ~ ~ ~ {Facing:0b}
execute if entity @s[tag=displayframes_up] run summon glow_item_frame ~ ~ ~ {Facing:1b}
execute if entity @s[tag=displayframes_north] run summon glow_item_frame ~ ~ ~ {Facing:2b}
execute if entity @s[tag=displayframes_south] run summon glow_item_frame ~ ~ ~ {Facing:3b}
execute if entity @s[tag=displayframes_west] run summon glow_item_frame ~ ~ ~ {Facing:4b}
execute if entity @s[tag=displayframes_east] run summon glow_item_frame ~ ~ ~ {Facing:5b}

item replace entity @n[type=glow_item_frame] container.0 from entity @s container.0
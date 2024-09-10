# adjusts an item display to match a upward-facing item frame
# parameters: @s: the source item frame
# @n[tag=displayframes_inprogress] the item display to adjust

data modify entity @n[tag=displayframes_inprogress] transformation.right_rotation set value {angle:4.713f,axis:[1f,0f,0f]}
data modify entity @n[tag=displayframes_inprogress] transformation.translation set value [0f, 0.03f, 0.0f]

# now match item rotation
execute if entity @s[nbt={ItemRotation:1b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:5.498f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:2b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:4.712f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:3b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:3.927f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:4b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:3.142f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:5b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:2.356f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:6b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:1.571f,axis:[0f,1f,0f]}
execute if entity @s[nbt={ItemRotation:7b}] run data modify entity @n[tag=displayframes_inprogress] transformation.left_rotation set value {angle:0.785f,axis:[0f,1f,0f]}
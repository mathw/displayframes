# adjusts an item display to match a downward-facing item frame
# parameters: @s: the item display to adjust

data modify entity @s transformation.right_rotation set value {angle:1.571f,axis:[1f,0f,0f]}
data modify entity @s transformation.translation set value [0f, -0.03f, 0.0f]
# execute with @s being the source item frame
# only run this if the source item frame's item has a custom name

data modify entity @n[tag=displayframes_inprogress] CustomName set from entity @s Item.components."minecraft:custom_name"
data modify entity @n[tag=displayframes_inprogress] CustomNameVisible set value 1b
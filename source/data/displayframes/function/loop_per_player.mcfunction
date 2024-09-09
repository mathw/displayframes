execute if score @s if_hide matches 1 run execute as @s at @s run function displayframes:convert_thing_in_front_to_entity
execute if score @s if_hide matches 1 run scoreboard players set @s if_hide 0

execute if score @s if_show matches 1 run execute as @s at @s run function displayframes:convert_thing_in_front_to_frame
execute if score @s if_show matches 1 run scoreboard players set @s if_show 0

scoreboard players enable @s if_hide
scoreboard players enable @s if_show
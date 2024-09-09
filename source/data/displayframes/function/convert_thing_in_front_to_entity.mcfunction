# Toggles the item frame at player eye line to a display entity
# Entity @s: the player
# This code based on MukiTanuki/armor_statues if_invisible handler

# tag the item frame or glow item frame in front of the player's eyes with df_selected
execute anchored eyes positioned ^ ^ ^1 as @n[type=#displayframes:item_frames,distance=..1] run tag @s add df_selected

# if we have an item frame or glow item frame with df_selected, convert it to an item display entity
execute as @n[type=#displayframes:item_frames,tag=df_selected] run execute at @s run function displayframes:internal/to_item_display

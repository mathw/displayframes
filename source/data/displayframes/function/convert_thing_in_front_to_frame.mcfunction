# Toggles the item display at player eye line to an item frame
# Entity @s: the player
# This code based on MukiTanuki/armor_statues if_invisible handler

execute anchored eyes positioned ^ ^ ^1 as @n[type=minecraft:item_display,distance=..1] run execute at @s run function displayframes:internal/from_item_display
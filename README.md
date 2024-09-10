# Display Frames

A Minecraft datapack which allows you to convert item frames (with items in) to item display entities, and back again.

The displays are set up to look as much like an invisible item frame as possible. However, because they're display entities they're super lightweight on your server!

**WARNING** This is early days and it may do weird things sometimes.

## Supported versions

Only tested in Minecraft 1.21.1.

Will absolutely not work in anything before 1.21.0 as it makes extensive use of the `@n` selector.

## How to use it

Once installed, you have two triggers available.

### Hide an item frame / convert to item display

Look at the item frame and run `/trigger if_hide`.

If the item frame is within one block, it will convert to an item display.

### Show an item frame / convert to item frame

Look at the converted item frame / item display and run `/trigger if_show`.

If you are within one block, the item display will change back to an item frame with the original item in it.

## Features

* Works on item frames and glow item frames in all orientations
* Preserves the item's rotation within the frame
* Preserves all item data
* Item displays show the item's CustomName if it was set
* Deliberately doesn't work on item frames with filled maps in, because the rendering of those is special
* Also doesn't work on item frames which don't have an item in, because what would be the point?

## Info

Item displays created with this pack will have a number of tags so that the backwards conversion can work:

| Tag | Purpose |
|-----|---------|
|displayframes_entity|Marks this item display as being created by this pack and thus eligible for conversion to an item frame|
|displayframes_glow|The source item frame was a glow item frame|
|displayframes_up|The source item frame was facing up|
|displayframes_down|The source item frame was facing down|
|displayframes_east|The source item frame was facing east|
|displayframes_west|The source item frame was facing west|
|displayframes_north|The source item frame was facing north|
|displayframes_south|The source item frame was facing south|
|displayframes_rot0|The source item frame had ItemRotation=0b|
|displayframes_rot1|Bet you can guess what the other ItemRotation tags are|

Obviously if you really want to create item displays in other ways and have them work with this pack, you can just add relevant tags. Anything with `displayframes_entity` will get converted, but without a facing tag there's a really good chance the resulting item frame will just pop next time the server ticks it.

## Credits

* Codex404 for sharing initial experiments in converting item frames to item displays
* The authors of https://github.com/MukiTanuki/armor-statues, who provided inspiration and guidance in the form of the implementation of their `/trigger if_invisible`
* The Zedcraft community, who are sad that they can't use item frames to decorate their storage systems
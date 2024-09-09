# Display Frames

A Minecraft datapack which allows you to convert item frames (with items in) to item display entities, and back again.

The displays are set up to look as much like an invisible item frame as possible. However, because they're display entities they're super lightweight on your server!

**WARNING** This is early days and it may do weird things sometimes.

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
* Preserves all item data
* Item displays show the item's CustomName if it was set
* Deliberately doesn't work on item frames with filled maps in, because the rendering of those is special
* Also doesn't work on item frames which don't have an item in, because what would be the point?

## Credits

* Codex404 for sharing initial experiments in converting item frames to item displays
* The authors of https://github.com/MukiTanuki/armor-statues, who provided inspiration and guidance in the form of the implementation of their `/trigger if_invisible`
* The Zedcraft community, who are sad that they can't use item frames to decorate their storage systems
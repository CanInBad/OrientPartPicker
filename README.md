# Part Orient Picker

# This mod is now essentially useless

[The commit (7005248a)](https://github.com/Alexofp/BDCC/commit/7005248ac53f1217860a55628c409bc25e4e795b) has now been merged in main branch, more on how to migrate from this system to the base game below [How to use](#how-to-use), [CLICK ME!](#migration-to-base-game)

## How to use

1) add this repo as a submodule to `./Modules/PartOrientPicker`
2) add the picker with Instance Child Scene (CTRL + SHIFT + A) to your bodypart/clothing scene
3) add the part orient as a child to picker with Instance Child Scene
4) set the option in the part orient child scene, false for visible when doll is facing left (player default pose), true for visible when doll is facing right.
5) profit

## Migration to base game

1) open your godot scene **with a text editor** we'll replace values in packed scene directly.  
   if you can open and replace text in multiple files at once it will be easier.
2) Find and replace all instance of `res://Modules/PartOrientPicker/PartOrient.tscn` to `res://Player/Player3D/Parts/PartOrient.tscn`  
   and `res://Modules/PartOrientPicker/PartOrientPicker.tscn` to `res://Player/Player3D/Parts/PartOrientPicker.tscn`.  
3) repeat step 1 until you gone to all files, or use replace function of your text editor.
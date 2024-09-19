extends Module

func _init():
    id = "testPrint.CanInBad"
    author = "CanInBad"
    # events = [
    #     "res://Modules/PartOrientPicker/printAllDollsState.gd"
    # ]
    Console.addCommand("printAllDolls",self,"printDolls",[],"Print all dolls")

const toCheck:Array = ["Doll3D","Doll3D2", "Doll3D3", "Doll3D4"]

func printDolls():
    if GM.main != null:
        var _text:String = ""
        var currstage:BaseStageScene3D = GM.ui.getStage3d().currentScene
        var counter:int = 1
        for _doll in toCheck:
            if currstage.get_node(_doll) != null:
                var currentDoll = currstage.get_node(_doll)
                _text += "doll3d {0}, possess by {1}\n".format([counter, currentDoll.savedCharacterID])
                var isFlipped = (currentDoll.get_scale().x == -1.0)
                _text += "\tis flipped: " + str(isFlipped) + "\n"
                _text += "\tStates:\n"
                for i in currentDoll.state:
                    _text += "\t\t{0}\n".format([i])
                _text += "\n\t========\n"
            counter += 1
        print(_text)
    else: Log.printerr("\t"+id+": Currently not in the game")

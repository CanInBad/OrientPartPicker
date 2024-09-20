extends Spatial

export(bool) var invert = false

var _callcount:int = 0

func _ready():
	var theNode = get_node("..")
	var theDoll:Spatial
	# var sceneOptions:Dictionary = {}
	# var npcFlip:bool = false
	while !(theNode is BaseStageScene3D):
		var previousNode = theNode.get_node("..")
		if (previousNode == null || previousNode is Stage3D):
			break # just in case it got lower than Stage3D, the null check is here
		else:
			if theNode is Doll3D:
				theDoll = theNode
			theNode = previousNode

	var flipped = (theDoll.get_scale().x == -1)

	if theNode is BaseStageScene3D:
		if theNode.getVarOptions().has("flipNPC"):
			# print("### THIS SCENE HAS flipNPC!!!")
			yield(get_tree(), "idle_frame") # I sure hope no one notices this and this is a bad code. At the same time if I were to make ALL BaseStageScene3D store playAnimation() aruguments, it would take more space. Atleast that's what I think. - CanInBad
			flipped = theDoll.get_scale().x == -1
			# print(theDoll.savedCharacterID)
			
	# print(flipped)
	if (invert):
		setValue(!flipped)
	else:
		setValue(flipped)

func setValue(value):
	# _callcount+=1
	# print("setValue call count "+ str(_callcount))
	var PartOrient = load("res://Modules/PartOrientPicker/PartOrient.gd")
	# var _foundSomething = false
	for child in get_children():
		if child is PartOrient:
			if child.getOrient() == value:
				child.visible = true
				# _foundSomething = true
			else:
				child.visible = false
	
	# if !foundSomething:
	# 	for child in get_children():
	# 		if child is PartOrient:
	# 			if child.getOrient():
	# 				child.hide()
	# 			else:
	# 				child.show()
			

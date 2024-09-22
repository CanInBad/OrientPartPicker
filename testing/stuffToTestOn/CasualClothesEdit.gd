extends ItemBase

func _init():
	id = "LRTestingOrientation"

func getVisibleName():
	return "LR"
	
func getDescription():
	return "Just a simple shirt and shorts with colors for each side (2face cosplay real)"

func getClothingSlot():
	return InventorySlot.Body

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your shirt and pulls down the shorts"
	else:
		return "take off your shirt and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your shirt and the shorts"
	else:
		return "put on your shirt and the shorts"

func generateItemState():
	itemState = ShirtAndShortsState.new()

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	return {
		"clothing": "res://Modules/PartOrientPicker/testing/stuffToTestOn/partOrientClothTest.tscn",
	}

func canDye():
	return false

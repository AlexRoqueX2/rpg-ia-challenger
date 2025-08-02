extends Node2D

func announce(text : String) -> void:
	$billboard.text = text
	
func get_time() -> String:
	return Time.get_datetime_string_from_system()

func announceTime() -> void:
	$billboard.text = get_time()

func createIten(name: String, power: int, color: String) -> void:
	print("voce pegou uma " + name + " ela tem ")
	print(power)
	print("de poder , e possui uma cor :" + color)
 

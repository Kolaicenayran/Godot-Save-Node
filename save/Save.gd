extends Node2D

class_name Save , "res://save/icons8-save-48.png"
export(NodePath) onready var Save_Scene
export(String,FILE) var saveFile 
var createdPackage:PackedScene
var packageInstance:Node
signal saving


func save():
	emit_signal("saving")
	createdPackage = ScenePacker.create_package(get_node(Save_Scene))
	if !createdPackage:
		print("No package to save")
		return
	var error = ResourceSaver.save(saveFile, createdPackage)
	if error != OK:
		push_error("An error occurred while saving the scene to disk")

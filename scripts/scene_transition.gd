extends Area2D

signal loaded

var level_num := ""
var scene_num := ""

func _ready():
	loaded.emit()
	_update_scene_info()

func _update_scene_info():
	var scene_path := get_tree().current_scene.scene_file_path
	# Example: res://level_1-1/level_1_2.tscn
	
	var parts := scene_path.split("/")
	# ["res:", "", "level_1-1", "level_1_2.tscn"]
	
	level_num = parts[2] # "level_1-1"
	scene_num = parts[3].replace(".tscn", "") # "level_1_2"

func scene_trans(forward: bool):
	_update_scene_info()
	print("scene_trans running")
	print("level:", level_num, " scene:", scene_num)

	if level_num == "level_1-1":
		if forward:
			if scene_num == "level_1_1":
				_change_scene("res://level_1-1/level_1_2.tscn")
			elif scene_num == "level_1_2":
				_change_scene("res://level_1-1/level_1_3.tscn")
			elif scene_num == "level_1_3":
				_change_scene("res://level_1-1/level_1_4.tscn")
		else:
			if scene_num == "level_1_2":
				_change_scene("res://level_1-1/level_1_1.tscn")

func _change_scene(path: String):
	print("Changing to:", path)
	get_tree().call_deferred("change_scene_to_file", path)

func _process(_delta: float) -> void:
	print(scene_num)


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_trans(true)

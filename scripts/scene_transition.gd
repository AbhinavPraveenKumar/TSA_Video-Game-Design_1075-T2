extends Area2D

# NOTE: instance NextScene object in instead of keeping it for effiency
signal loaded
func _ready() -> void:
	var current_scene=str(get_tree().current_scene)
	var level_numString = current_scene[6]
	var scene_numString = current_scene[8]
	print(level_numString)
	print(scene_numString)
	print("next scene loaded into scene tree \n level number: ", level_num, " scene number: ", scene_numString, " scene path: ", current_scene)
	if str(current_scene)=="Level 1-1:<Node2D#28974253463>":
		loaded.emit()
	pass
#func _on_loaded():
#	await get_tree().ready
#	var current_scene=str(get_tree().current_scene)
#	var level_numString = current_scene[6]
#	var scene_numString = current_scene[8]
#	return current_scene
#@onready var current_scenePath = str(get_tree().current_scene)
#var scene_numString = current_scenePath[8]
var level_num:="res://level_1-1/"
var scene_num:="res://level_1-1/level_1_1.tscn" #int(scene_numString)
func scene_trans(forward_bool):
		print("scene_trans function running") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
		if forward_bool==true:
			if level_num=="res://level_1-1/":
				if scene_num=="res://level_1-1/level_1_1.tscn":
					Gamecontroller.change_2d_scene("res://level_1-1/level_1_2.tscn", false)
				elif scene_num=="res://level_1-1/level_1_2.tscn":
					Gamecontroller.change_2d_scene("res://level_1-1/level_1_3.tscn", false)
		elif forward_bool==false:
			if level_num=="res://level_1-1/":
				if scene_num=="res://level_1-1/level_1_2.tscn":
					Gamecontroller.change_2d_scene("res://level_1-1/level_1_1.tscn", false)
				elif scene_num=="res://level_1-1/level_1_2.tscn":
					Gamecontroller.change_2d_scene("res://level_1-1/level_1_2.tscn", false)
		print("Scene transition successful") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# activates scene transition function
func _process(_delta: float) -> void:
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_trans(true)
		# Global.game_controller.change_2d_scene()

extends Area2D

# NOTE: instance NextScene object in instead of keeping it for effiency
func _ready():
	var current_scenePath = str(get_tree().current_scene)
	# print("next scene loaded into scene tree \n level number: ", level_num, " scene number: ", scene_num, " scene path: ", current_scene)
	return current_scenePath

var current_scenePath = _ready()
var scene_numString = current_scenePath[8]
var level_num=1
var scene_num=int(scene_numString)
func scene_trans(forward_bool):
		print("scene_trans function running") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
		if forward_bool==true:
			if level_num==1:
				if scene_num==1:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_2.tscn")
				elif scene_num==2:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_3.tscn")
			scene_num=scene_num+1;
		elif forward_bool==false:
			if level_num==1:
				if scene_num==2:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_1.tscn")
				elif scene_num==3:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_2.tscn")
			scene_num=scene_num-1;
		print("Scene transition successful") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# activates scene transition function
func _process(_delta: float) -> void:
	if _delta==1:
		pass
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_trans(true)

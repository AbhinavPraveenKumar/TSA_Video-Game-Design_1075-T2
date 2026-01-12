extends Area2D

var level_num=1; # move this to a different script when we add a second level
var scene_num=1;

func _ready() -> void:
	var current_scene = get_tree().current_scene
	
	print("next scene loaded into scene tree \n level number: ", level_num, " scene number: ", scene_num, " scene path: ", current_scene)

func scene_trans(forward_bool):
		print("scene_trans function running") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
		if forward_bool==true:
			if level_num==1:
				if scene_num==1:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_2.tscn")
					scene_num=2;
				elif scene_num==2:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_3.tscn")
					scene_num=3;
		elif forward_bool==false:
			if level_num==1:
				if scene_num==2:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_1.tscn")
					scene_num=1;
				elif scene_num==3:
					get_tree().call_deferred("change_scene_to_file", "res://level_1-1/level_1_2.tscn")
					scene_num=2;
		print("Scene transition successful") # Debug
		print("level number: ", level_num, " scene number: ", scene_num)
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# activates scene transition function
func _process(_delta: float) -> void:
	# print('working')
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		scene_trans(true)

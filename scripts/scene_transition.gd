extends Area2D

var level_num=1; # move this to a different script when we add a second level
var scene_num=1;

func scene_trans(forward_bool):
	# print("scene_trans function running") # Debug
	if area_entered and is_in_group("character"):
		if forward_bool==true:
			if level_num==1:
				if scene_num==1:
					get_tree().change_scene_to_file("res://level_1-1/level_1_2.tscn")
					scene_num=2;
				elif scene_num==2:
					get_tree().change_scene_to_file("res://level_1-1/level_1_3.tscn")
					scene_num=3;
		elif forward_bool==false:
			if scene_num==1:
				if scene_num==2:
					get_tree().change_scene_to_file("res://level_1-1/level_1_1.tscn")
					scene_num=1;
				elif scene_num==3:
					get_tree().change_scene_to_file("res://level_1-1/level_1_2.tscn")
					scene_num=2;
			print("Scene transition successful") # Debug

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene_trans(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# activates scene transition function
func _process(_delta: float) -> void:
	# print('working')
	scene_trans(true);
	pass

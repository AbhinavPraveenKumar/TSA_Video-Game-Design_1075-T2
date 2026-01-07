extends Area2D

var level_num=1;
var scene_num=1;
func scene_trans(forward_bool):
	if forward_bool==true:
		if level_num==1:
			if scene_num==1:
				get_tree().change_scene_to_file("res://level_1-1/level_1_2.tscn")
				scene_num=2;
			elif scene_num==2:
				get_tree().change_scene_to_file("res://level_1-1/level_1_3.tscn")
				scene_num=3;
		elif forward_bool==false:
			if scene_num==2:
				get_tree().change_scene_to_file("res://level_1-1/level_1_1.tscn")
				scene_num=1;
			elif scene_num==3:
				get_tree().change_scene_to_file("res://level_1-1/level_1_2.tscn")
				scene_num=2;
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# activates scene transition function
func _process(_delta: float) -> void:
	# print('working')
	if body_entered and is_in_group("character"):
		scene_trans(true);
	pass

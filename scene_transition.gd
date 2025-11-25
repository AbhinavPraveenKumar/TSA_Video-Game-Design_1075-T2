extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if body_entered and is_in_group("character"):
		get_tree().change_scene_to_file("res://level_1_2.tscn")
	pass

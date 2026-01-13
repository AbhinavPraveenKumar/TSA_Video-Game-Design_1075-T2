extends Node2D

var character = preload("res://character/character.tscn")
var character_instance = character.instantiate()
var scene_trans_scene = preload("res://next_scene.tscn")
var scene_trans_scene_instantiate = scene_trans_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_instance.position = Vector2(165, 535)
	add_child(character_instance)
	scene_trans_scene_instantiate.position = Vector2(1133.5, 433.75)
	add_child(scene_trans_scene_instantiate)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

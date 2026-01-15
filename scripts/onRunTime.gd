extends Node2D

var character = preload("res://character/character.tscn")
var scene_trans_scene = preload("res://next_scene.tscn")
var enemy_scene = preload("res://level_1-1/enemy/enemy.tscn")

@onready var scene_path := get_tree().current_scene.scene_file_path

func _ready() -> void:
	var character_instance = character.instantiate()
	character_instance.position = Vector2(165, 535)
	add_child(character_instance)

	var scene_trans_scene_instance = scene_trans_scene.instantiate()
	scene_trans_scene_instance.position = Vector2(1133.5, 433.75)
	add_child(scene_trans_scene_instance)

	print("scene trans node loaded")
	print("Current scene path:", scene_path)

	# Spawn enemy only in level_1_4
	#if scene_path == "res://level_1-1/level_1_4.tscn":
	#	var enemy_instance = enemy_scene.instantiate()
	#	enemy_instance.position = Vector2(750, 500)
	#	add_child(enemy_instance)
	#	print("Enemy spawned in level_1_4")

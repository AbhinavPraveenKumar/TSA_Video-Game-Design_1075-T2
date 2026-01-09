extends Node2D

var character = preload("res://character/character.tscn")
var character_instance = character.instantiate()
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character_instance.position = Vector2(65, 535)
	add_child(character_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

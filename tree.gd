extends Node2D

@onready var game_manager = $"../GameManager"
@onready var sprite = $Sprite2D

var tree_activated = false

func _on_body_entered(body):
	if body.name == "Player":
		game_manager.add_point()

func turn_on():
	if tree_activated:
		return
	
	tree_activated = true
	
	scale = Vector2(2, 2)
	sprite.texture = load("res://addons/SolarPunk Sprites Export/happy tree.png")

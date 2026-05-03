extends Node2D

@onready var sprite = $Sprite2D

var activated = false

func turn_on():
	scale = Vector2(1.2, 1.2)
	if activated:
		return
	
	activated = true
	sprite.texture = load("res://addons/SolarPunk Sprites Export/solar panel onf.png")

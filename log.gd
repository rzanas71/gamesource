extends Area2D

@onready var tree = $"../tree"
@onready var windmill = $"../Windmill"
@onready var game_manager = $"../GameManager"

func _ready():
	$Sprite2D.visible = false

func show_log():
	if tree.tree_activated:
		$Sprite2D.visible = true

func _on_body_entered(body):
	if body.name != "Player":
		return
	
	if windmill.player_collided:
		game_manager.add_log()
		queue_free()

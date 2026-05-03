extends Area2D

@onready var log = $"../log"
@onready var log2 = $"../log2"
@onready var log3 = $"../log3"
@onready var log4 = $"../log4"
@onready var log5 = $"../log5"
@onready var log6 = $"../log6"

var player_collided = false
var activated = false
var player_already_collided = false

func _on_body_entered(body):
	if body.name != "Player":
		return
	
	player_collided = true
	
	if not player_already_collided:
		player_already_collided = true
		log.show_log()
		log2.show_log()
		log3.show_log()
		log4.show_log()
		log5.show_log()
		log6.show_log()
	
func turn_on_windmill():
	if activated:
		return
	
	activated = true
	$AnimatedSprite2D.play("happy_windmill")

extends Node2D

var score = 0
var log = 0

@onready var solar_panel = $"../SolarPanel"
@onready var gate = $"../Gate"
@onready var tree = $"../tree"
@onready var windmill = $"../Windmill"

@onready var energy_label = $"../Player/Camera2D/CanvasLayer/Label"
@onready var log_label = $"../Player/Camera2D/CanvasLayer/Label2"

func add_point():
	score += 1
	
	energy_label.text = "Energy: " + str(score)

	if score == 10:
		solar_panel.turn_on()
		gate.queue_free()
	
	elif score == 20:
		tree.turn_on()

func add_log():
	log += 1
	
	log_label.text = "Logs: " + str(log)

	if log >= 6:
		windmill.turn_on_windmill()

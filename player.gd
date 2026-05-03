extends CharacterBody2D

const SPEED = 125.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D

var dead = false

func _physics_process(delta):

	# Gravity should still work after death
	if not is_on_floor():
		velocity += get_gravity() * delta

	# If dead, only allow falling physics
	if dead:
		move_and_slide()
		return

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Flip sprite
	if Input.is_action_just_pressed("ui_left"):
		animated_sprite.flip_h = true

	if Input.is_action_just_pressed("ui_right"):
		animated_sprite.flip_h = false

	# Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("default")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")


func die():

	# Prevent die() running multiple times
	if dead:
		return

	dead = true

	# Stop horizontal movement
	velocity.x = 0

	# Play death animation
	animated_sprite.play("death")

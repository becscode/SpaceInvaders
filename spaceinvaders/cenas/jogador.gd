extends CharacterBody2D

@export var laser = preload("res://cenas/Laser.tscn")

@onready var ptoLaser = $PontoDoLaser 

var direction = Vector2()
const SPEED = 100.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("shoot"):
		var l = laser.instantiate()
		l.global_position =  ptoLaser.global_position
		get_parent().add_child(l)
	
	move_and_slide()

extends CharacterBody2D

@export var walk_speed = 4.0
const TILE_SIZE = 16

func _ready():
	pass

func process_player_input(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1

	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * walk_speed
		move_and_slide()

func _physics_process(delta):
	process_player_input(delta)

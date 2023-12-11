extends CharacterBody2D

@export var walk_speed = 4.0
const TILE_SIZE = 16

@onready
var animation_tree = $AnimationTree

@onready
var animation_state = animation_tree.get("parameters/playback")

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
		animation_state.travel("Walk")
		animation_tree.set("parameters/Idle/blend_position", velocity)
		animation_tree.set("parameters/Walk/blend_position", velocity)
	else:
		animation_state.travel("Idle")

func _physics_process(delta):
	process_player_input(delta)

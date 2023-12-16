extends CharacterBody2D

@export var health = 10

var is_alive = true

@export var walk_speed = 4.0
const TILE_SIZE = 16

@export var fireball_scene:PackedScene = null

@onready
var animation_tree = $AnimationTree

@onready
var animation_state = animation_tree.get("parameters/playback")

var last_direction = Vector2(0, -1)

func _ready():
	pass

func attack():
	var fireball = fireball_scene.instantiate()
	get_tree().root.add_child(fireball)
	fireball.velocity = last_direction * 60
	fireball.position = position + last_direction * 18
	
func process_player_input(delta):
	velocity = Vector2()
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	
	if Input.is_action_pressed("ui_left"):
		direction.x = -1

	if Input.is_action_pressed("ui_up"):
		direction.y = -1
		
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	
	if Input.is_action_just_pressed("attack"):
		attack()
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * walk_speed
		last_direction = direction
		move_and_slide()
		animation_state.travel("Walk")
		animation_tree.set("parameters/Idle/blend_position", velocity)
		animation_tree.set("parameters/Walk/blend_position", velocity)
	else:
		animation_state.travel("Idle")

func _physics_process(delta):
	if is_alive:
		process_player_input(delta)

func damage(amount):
	health -= amount
	if health < 1:
		health = 1
		is_alive = false

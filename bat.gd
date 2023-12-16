extends CharacterBody2D


@export
var speed = 30.0

@export
var direction_change_frequency = 1
var timer = direction_change_frequency

@onready
var animation_tree = $AnimationTree

@onready
var animation_state = animation_tree.get("parameters/playback")

const directions = [
	Vector2(1, 0),
	Vector2(0, 1),
	Vector2(-1, 0),
	Vector2(0, -1),
]

func change_direction():
	velocity = directions[randi() % 4] * speed
	animation_state.travel("Fly")
	animation_tree.set("parameters/Fly/blend_position", velocity)
	
func _physics_process(delta):
	timer += delta
	if timer > direction_change_frequency:
		change_direction()
		timer = 0
	move_and_slide()

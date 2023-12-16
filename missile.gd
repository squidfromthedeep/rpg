extends AnimatableBody2D

@export var max_distance = 10
@export var velocity = Vector2()
var distance_traveled = 0.0

func _physics_process(delta):
	var offset = velocity * delta
	distance_traveled += offset.length()
	position += offset
	if distance_traveled >= max_distance * 16:
		queue_free()

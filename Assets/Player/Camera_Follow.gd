extends Node2D

@export var player: Node2D
@export var scroll_margin = Vector2(20, 10)

func _ready():
	if player:
		position = player.position

func _physics_process(delta):
	if player:
		var gap = player.position - position
		if gap.x > scroll_margin.x:
			position.x = player.position.x - scroll_margin.x
		elif gap.x < -scroll_margin.x:
			position.x = player.position.x + scroll_margin.x

		if gap.y > scroll_margin.y:
			position.y = player.position.y - scroll_margin.y
		elif gap.y < -scroll_margin.y:
			position.y = player.position.y + scroll_margin.y


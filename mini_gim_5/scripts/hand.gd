extends Node2D

@onready var CARD_SCENE = preload("res://scenes/card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layout_cards()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func layout_cards():
	var card_count = get_child_count()
	if card_count == 0:
		return
	
	var radius = 720.0
	var max_angle = deg_to_rad(20)
	var spread_angle = clamp(card_count * deg_to_rad(7), deg_to_rad(5), max_angle)

	for i in range(card_count):
		var ratio = float(i) / max(1, card_count - 1)
		var angle = lerp(-spread_angle / 2, spread_angle / 2, ratio) if card_count > 1 else 0.0

		var x = radius * sin(angle)
		var y = radius * (1.0 - cos(angle))

		var card = get_child(i)
		card.position = Vector2(round(x), round(y))

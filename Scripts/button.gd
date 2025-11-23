extends Area2D

signal toggled(is_pressed: bool)

var is_pressed = false
var player_in_range = false

@onready var sprite = $Sprite2D

@export var unpressed_texture: Texture2D
@export var pressed_texture: Texture2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	_update_visual()

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		is_pressed = !is_pressed
		emit_signal("toggled", is_pressed)
		_update_visual()

func _update_visual():
	if is_pressed:
		sprite.texture = pressed_texture
	else:
		sprite.texture = unpressed_texture


func _on_toggled(is_pressed: bool) -> void:
	pass # Replace with function body.

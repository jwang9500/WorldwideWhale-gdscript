extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var collider = $CollisionShape2D

@export var closed_texture: Texture2D
@export var open_texture: Texture2D

func _ready():
	set_open(false)  # door starts closed

func set_open(is_open: bool):
	if is_open:
		sprite.texture = open_texture
		collider.disabled = true     # disable collision → door open
	else:
		sprite.texture = closed_texture
		collider.disabled = false    # enable collision → door closed

func _on_button_toggled(is_pressed: bool) -> void:
	set_open(is_pressed)

func _on_button_2_toggled(is_pressed: bool) -> void:
	set_open(is_pressed)

func _on_button_3_toggled(is_pressed: bool) -> void:
	set_open(is_pressed)
	
func _on_button_4_toggled(is_pressed: bool) -> void:
	set_open(is_pressed)

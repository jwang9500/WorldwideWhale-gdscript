extends CharacterBody2D

signal hit

@export var speed: int = 400
@export var gravity := 1200.0   # tune this
@export var bounce := 0.0       # 0 = no bounce, 1 = perfect bounce

var screen_size: Vector2

func _ready():
	screen_size = get_viewport_rect().size
	process_mode = Node.PROCESS_MODE_ALWAYS

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if get_tree().paused:
		velocity = Vector2.ZERO
		return

	var velocity_input := Vector2.ZERO

	if Input.is_action_pressed("moveRight"):
		velocity_input.x += 1
	if Input.is_action_pressed("moveLeft"):
		velocity_input.x -= 1
	if Input.is_action_pressed("moveDown"):
		velocity_input.y += 1
	if Input.is_action_pressed("moveUp"):
		velocity_input.y -= 1

	var anim := $AnimatedSprite2D

	if velocity_input.length() > 0:
		velocity_input = velocity_input.normalized()
		velocity = velocity_input * speed
		anim.play()
	else:
		velocity = Vector2.ZERO
		anim.stop()

	move_and_slide()
	
	if is_on_floor() and velocity.y > 0:
		velocity.y = -velocity.y * bounce
		
	# Flip sprite
	if velocity.x != 0:
		anim.animation = "walk"
		anim.flip_v = false
		anim.flip_h = velocity.x < 0

func _on_body_entered(body):
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(position: Vector2):
	self.position = position
	show()
	$CollisionShape2D.disabled = false

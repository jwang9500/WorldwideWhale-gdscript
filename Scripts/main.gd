extends Node

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	var paused := not get_tree().paused
	get_tree().paused = paused
	$PauseMenu.visible = paused

func _ready():
	var resume_button = $PauseMenu/Menu/Container/Resume
	resume_button.pressed.connect(on_resume_pressed)
	$PauseMenu.hide()

func on_resume_pressed():
	get_tree().paused = false
	$PauseMenu.hide()


func onResumePressed() -> void:
	pass # Replace with function body.

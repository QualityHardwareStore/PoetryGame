extends Node3D

@onready var door = $test1_v2/AnimationPlayer
var doorstate:bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		if doorstate:
			door.play("Close")
			doorstate = false
		else:
			door.play("Open")
			doorstate = true

extends CharacterBody3D

@export_group("speeds")
@export var speed := 10
@export var acceleration := 150
@export var rotation_speed := 7
@export var jump_velocity := 5

@export var gravity = 150

@onready var cam = %maincam
@onready var camRotation:float = cam.rotation.y

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
#		fix things in the way you can
	
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_velocity
	
	
	var input_dir := Input.get_vector("left", "right", "forwards", "backwards")
	var direction := (Vector3(input_dir.x, 0, input_dir.y).rotated(Vector3.UP, camRotation)).normalized()
	velocity = velocity.move_toward(direction * speed, acceleration * delta)
	
	if direction !=Vector3.ZERO:
		var target_angle = Basis.looking_at(direction)
		basis = basis.slerp(target_angle, rotation_speed * delta)
	
	move_and_slide()

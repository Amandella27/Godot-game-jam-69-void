extends CharacterBody3D

class_name Player

@onready var camera_pivot = $CameraPivot
@onready var camera_3d = $CameraPivot/Camera3D

var mouse_sensitivity = 0.002
var SPEED = 25.0

func _ready():
	Globals.input_mode = "Mouse"

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if Globals.input_mode == "Mouse":
			rotate_x(event.relative.y * mouse_sensitivity)
			rotate_z(-event.relative.x * mouse_sensitivity)

func _physics_process(delta):

	var forward = -transform.basis.z  # Forward direction is negative in 3D space
	global_transform.origin += forward * SPEED * delta  # Move the character forward

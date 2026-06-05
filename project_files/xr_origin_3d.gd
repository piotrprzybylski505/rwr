extends XROrigin3D

@export var move_speed: float = 2.5
@export var deadzone: float = 0.15
@onready var xr_camera: XRCamera3D = $XRCamera3D
@onready var left_ctrl: XRController3D = $LeftController
@export var turn_angle: float = 45.0 # O ile stopni ma obracac
@onready var right_ctrl: XRController3D = $RightController

var can_turn: bool = true # Flaga blokady ciaglego obrotu

func _physics_process(delta: float) -> void:
	var dir := Vector3.ZERO;

	var fwd := -xr_camera.global_transform.basis.z; fwd.y = 0.0; fwd = fwd.normalized()
	var right := xr_camera.global_transform.basis.x; right.y = 0.0; right = right.normalized()

	var v: Vector2 = left_ctrl.get_vector2("thumbstick")
	if v.length() < deadzone:
		v = Vector2.ZERO

	dir += fwd * (v.y) + right * (v.x)

	if dir.length() > 0.0:
		global_translate(dir.normalized() * move_speed * delta)
	
	#Obracanie prawym joystickiem
	var input_v: Vector2 = right_ctrl.get_vector2("thumbstick")
	if abs(input_v.x) < deadzone:
		can_turn = true
	elif can_turn:
		if input_v.x > 0.5: #prawo
			rotate_y(deg_to_rad(-turn_angle))
			can_turn = false
			
		elif input_v.x < -0.5: #lewo
			rotate_y(deg_to_rad(turn_angle))
			can_turn = false

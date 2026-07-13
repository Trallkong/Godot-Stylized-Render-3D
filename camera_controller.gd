extends Camera3D

const MOVE_SPEED = 0.2

var _rotate_x = 0.0
var _rotate_y = 0.0

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(_delta: float) -> void:
	rotation.x = _rotate_x
	rotation.y = _rotate_y
	
	var axis := Input.get_axis("move_down", "move_up")
	if axis:
		position.y += axis * MOVE_SPEED
	
	var dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = transform.basis.x * dir.x + transform.basis.z * dir.y
	if direction:
		position.z += direction.z * MOVE_SPEED
		position.x += direction.x * MOVE_SPEED
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var offset = event.relative
		_rotate_x -= offset.y * 0.01
		_rotate_y -= offset.x * 0.01

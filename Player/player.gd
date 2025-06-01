extends CharacterBody2D

const MAX_SPEED = 500
const ACCELERATION = 150;
const FRICTION = 500;

@onready var animationPlayer = $AnimationPlayer

func _ready() -> void:
	print("Hello World")	

func _physics_process(delta: float) -> void:	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animationPlayer.play("run_right")
		else:
			animationPlayer.play("run_left")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		velocity = velocity.limit_length(MAX_SPEED)
	else:
		animationPlayer.play("idle_right")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()

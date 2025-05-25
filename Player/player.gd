extends CharacterBody2D

func _ready() -> void:
	print("Hello World")

#Override base class, ran every frame. Delta is how long last frame took
func _physics_process(delta: float) -> void:
#	This is not the best approach using input vector
	#if Input.is_action_pressed("ui_right"):
##		#position.x += 10; Do not do this use vector
		#velocity.x = 4;
	#elif Input.is_action_pressed("ui_left"):
		#velocity.x = -4;
	#elif Input.is_action_pressed("ui_up"):
		#velocity.y = -4;
	#elif Input.is_action_pressed("ui_down"):
		#velocity.y = 4;
	#else:
		#velocity.x = 0
		#velocity.y = 0
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)

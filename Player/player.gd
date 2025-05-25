extends CharacterBody2D

const MAX_SPEED = 1000
const ACCELERATION = 100;
const FRICTION = 200;

func _ready() -> void:
	print("Hello World")

func _physics_process(delta: float) -> void:	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
#	CURRENTLY WE RUN QUICKER ON DIAGONALS BECAUSE OF PITHAGOREAN THEOREM
#	We can Normalize the vector this means creating a circle that has same space to every corner 
#	will clip to same lenght as x or y	

#	ACCELERATE SO DO NOT REACH TOP SPEED IMMEDIATLY USE DELTA TO NOT TIE OURSELVES TO FRAME RATE
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta # Modifies CharacterBody2D.velocity
		velocity = velocity.limit_length(MAX_SPEED)    # Modifies CharacterBody2D.velocity
#	DECELERATE SAME AS ABOVE
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta) # Modifies CharacterBody2D.velocity	
	move_and_collide(velocity * delta )

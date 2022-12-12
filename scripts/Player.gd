# player
extends KinematicBody2D

const ACCELERATION = 10;
const MAX_SPEED = 100;
const FRICTION = 10;

# vector.zero = initial postion in scene vector (0, 0)
var velocity = Vector2.ZERO;

# set physics actions and behavior (exec each frame)
func _physics_process(delta):
	
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	input_vector = input_vector.normalized();

	# if there is movement input
	if(input_vector != Vector2.ZERO):		
		# setting movement based on ACCELERATION and input;
		velocity += input_vector * ACCELERATION * delta;
		
		# limiting movement based on MAX_SPEED
		velocity = velocity.limit_length(MAX_SPEED * delta);
	else:
		# setting desaceleration when stop to input any movement
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta);
		
	# move
	move_and_collide(velocity);
		
	

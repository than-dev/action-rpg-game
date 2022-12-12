extends KinematicBody2D

var velocity = Vector2.ZERO;

# set physics actions
func _physics_process(_delta):
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");	
	
	if(input_vector.x < 0 && input_vector.y == 0):
		$Sprite.flip_h = true;
	elif(input_vector.x > 0 && input_vector.y == 0):
		$Sprite.flip_h = false;		
	
	
	if(input_vector != Vector2.ZERO):
		velocity = input_vector;
	else:
		velocity = Vector2.ZERO;
	
	# move	
	move_and_collide(velocity)
		
	

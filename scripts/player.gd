# player
extends KinematicBody2D

const ACCELERATION = 500;
const MAX_SPEED = 80;
const FRICTION = 500;

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE; 

# vector.zero = initial postion in scene vector (0, 0)
var velocity = Vector2.ZERO;

# onready "propertie" is a shortcut to godot function _ready;
onready var animation_player = $AnimationPlayer;
onready var animation_tree = $AnimationTree;

onready var animation_state = animation_tree.get("parameters/playback");

func _ready():
	animation_tree.active = true
	
	
func move_state(delta: float):
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left");
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	input_vector = input_vector.normalized();

	# if there is movement input
	if(input_vector != Vector2.ZERO):
		animation_tree.set("parameters/idle/blend_position", input_vector);
		animation_tree.set("parameters/run/blend_position", input_vector);
		animation_tree.set("parameters/attack/blend_position", input_vector);
		
		animation_state.travel("run");
				
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta);
	else:
		animation_state.travel("idle");
		
		# setting desaceleration when stop to input any movement
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta);
		
	# move
	velocity = move_and_slide(velocity);
	
	if(Input.is_action_just_pressed("attack")):
		velocity = Vector2.ZERO;
		state = ATTACK;
		

func attack_state(delta: float):
	animation_state.travel("attack");
	
func roll_state(delta: float):
	print('rolling')
	
# set physics actions and behavior (exec each frame)
func _physics_process(delta):
		match state:
			MOVE:
				move_state(delta);
			ROLL:
				roll_state(delta);
			ATTACK:
				attack_state(delta);
	

func attack_animation_finished():
	state = MOVE
	
	
	
		
	

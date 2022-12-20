extends Node2D

onready var animated_sprite = $AnimatedSprite;


func _ready():
	animated_sprite.play("animate");
	
	
func _process(_delta):
	if (Input.is_action_just_pressed("attack")):
		animated_sprite.frame = 0;
		animated_sprite.play("animate");


func _on_animation_finished():
	queue_free();

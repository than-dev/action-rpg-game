extends Node2D;

# paths
var grass_effect_scene_path = "res://scenes/effects/Grass-Effect.tscn";

#func _process(_delta):
#	create_grass_effect();

func create_grass_effect():
	# grass effect scene
	var grass_effect = load(grass_effect_scene_path).instance();
	
	# tree = whole game scene and its components
	var world = get_tree().current_scene;
	world.add_child(grass_effect);
	
	# global_position = grass position
	grass_effect.global_position = global_position;


func _area_entered(_area):
	create_grass_effect();
	
	# destroy
	queue_free();
	

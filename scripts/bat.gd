extends KinematicBody2D

var knockback = Vector2.ZERO;

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta);
	knockback = move_and_slide(knockback);

# collision
func _on_hurtbox_area_entered(area):
	knockback = area.knockback_vector * 100;

extends Character

onready var machete: Node2D = get_node("Machete")
onready var machete_animation_player: AnimationPlayer = machete.get_node("MacheteAnimationPlayer")

func _process(_delta: float) -> void:
	var mouse_direction : Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		
	machete.rotation = mouse_direction.angle()
	if machete.scale.y == 1 and mouse_direction.x < 0:
		machete.scale.y = -1
	elif machete.scale.y == -1 and mouse_direction.x > 0:
		machete.scale.y = 1
	if Input.is_action_just_pressed("ui_attack") and not machete_animation_player.is_playing():
		machete_animation_player.play("attack")
		
		
func get_input() -> void:
	mov_dirrection = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		mov_dirrection += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		mov_dirrection += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		mov_dirrection += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		mov_dirrection += Vector2.UP

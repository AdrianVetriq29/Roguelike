extends KinematicBody2D
class_name Character, "res://Dungeon Asset/Details/npc_elf.png"

const FRICTION: float = 0.15

export(int) var accerelation: int = 40
export(int) var max_speed: int = 100

onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_dirrection: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(_delta : float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	
func move() -> void:
	mov_dirrection = mov_dirrection.normalized()
	velocity += mov_dirrection * accerelation
	velocity = velocity.clamped(max_speed)

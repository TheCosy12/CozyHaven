#rozszerza
extends CharacterBody2D

#eksportuje predkosc poruszania sie
@export var speed = 300.0

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())

#system poruszania sie i mapowania
func _physics_process(_delta: float) -> void:
	
	if !is_multiplayer_authority(): return
	
	#mapowanie przyciskow
	var input_vector: Vector2 = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_vector * speed
	
	move_and_slide()

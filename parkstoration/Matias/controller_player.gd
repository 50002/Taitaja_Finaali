extends CharacterBody2D

@export_enum("Repair", "Exterminator") var Role
@onready var A: AnimatedSprite2D = $AnimatedSprite2D
@onready var interaction: Area2D = $Interaction
@onready var timer: Timer = $Timer

var correct : bool

var SPEED = 200.0
enum STATE {
	IDLE,
	MOVING,
	INTERACT
}
var player_state

func _ready() -> void:
	match Role:
		0:
			modulate = Color.GREEN
			interaction.set_collision_layer_value(15, true)
		1:
			self.modulate = Color.RED
			interaction.set_collision_layer_value(16, true)
			SPEED = 250.0
			
	for child in get_children():
		if child.has_method("initialize"):
			child.initialize(self)
	



func _physics_process(delta: float) -> void:
	match player_state:
		STATE.IDLE:
			timer.stop()
			A.play("IDLE")
		STATE.MOVING:
			if timer.is_stopped():
				timer.start()
			if Input.is_action_pressed("C_RIGHT"):
				print("A")
				A.flip_h = false
				A.play("MOVING_SIDE")
			elif Input.is_action_pressed("C_LEFT"):
				print("B")
				A.flip_h = true
				A.play("MOVING_SIDE")
			elif Input.is_action_pressed("C_UP"):
				print("C")
				A.play("MOVING_UP")
			else:
				A.play("MOVING_DOWN")
		STATE.INTERACT:
			timer.stop()
			A.play("INTERACTING")
		
			

	if movement() and player_state != STATE.INTERACT:
		player_state = STATE.MOVING
		var direction := Input.get_vector("C_LEFT","C_RIGHT","C_UP","C_DOWN")
		direction = direction.normalized()
		if direction:
			velocity = direction * SPEED
	elif Input.is_action_pressed("C_INTERACT"):
			velocity = Vector2.ZERO
			player_state = STATE.INTERACT
	else:
		player_state = STATE.IDLE
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func movement():
	for i in ["C_LEFT","C_RIGHT","C_UP","C_DOWN"]:
		if Input.is_action_pressed(i):
			return true
	return false


func _on_timer_timeout() -> void:
	$Timer/AudioStreamPlayer.play()

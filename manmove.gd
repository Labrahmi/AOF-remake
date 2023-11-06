extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var SPEED = 100.0
const JUMP_VELOCITY = -400.0
var health = 5000
var healthBar
var area

func _ready():
	healthBar = $"ProgressBar"
	area = $"manArea2D"

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.x = SPEED
	
	if (health <= 0):
		self.queue_free()
	healthBar.value = health;
	
	for body in area.get_overlapping_bodies():
		if ("enemyBase" in body.name) or ("enemy" in body.name):
			body.health -= 5
	move_and_slide()


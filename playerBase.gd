extends StaticBody2D

var health = 1000
var healthBar


func _ready():
	healthBar = $"ProgressBar"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (health <= 0):
		self.queue_free()
	healthBar.value = health;

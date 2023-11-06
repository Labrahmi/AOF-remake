extends Node2D

var man_var = preload("res://man.tscn")
var enemy_var = preload("res://enemy.tscn")
var playerBase
var enemyBase
var i = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	playerBase = get_node("playerBase")
	enemyBase = get_node("enemyBase")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	create_entity("man", Vector2(playerBase.position.x + 250, playerBase.position.y + 10))
	

func create_entity(entity, position):
	var entityObj
	if entity == "man":
		entityObj = man_var.instantiate()
	elif entity == "enemy":
		entityObj = enemy_var.instantiate()
	entityObj.position = position
	entityObj.name = entity + str(i)
	i += 1
	add_child(entityObj)

func _on_timer_timeout():
	create_entity("enemy", Vector2(enemyBase.position.x - 250, enemyBase.position.y + 10))

extends Area2D



func _on_Briefcase_body_entered(body):
	Global.Player.collect_briefcase()
	call_deferred("queue_free")

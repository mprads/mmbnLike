extends VBoxContainer
class_name StatsUI

@onready var health_progress_bar: ProgressBar = $HealthProgressBar
@onready var block_progress_bar: ProgressBar = $BlockProgressBar


func update_stats(stats: Stats) -> void:
	health_progress_bar.value = stats.health
	block_progress_bar.value = stats.block

	block_progress_bar.visible = stats.block > 0


func set_max_value(stats: Stats) -> void:
	health_progress_bar.max_value = stats.max_health
	block_progress_bar.max_value = stats.max_health / 2

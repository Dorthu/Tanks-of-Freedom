extends "res://scripts/bag_aware.gd"

var action_controller

func _initialize():
    self.action_controller = self.bag.controllers.action_controller

func is_king_mode():
	var objectives = self.action_controller.root_tree.get_nodes_in_group("objectives")

	return not objectives.empty()

func check_turn_cap():
    if self.bag.root.settings['turns_cap'] > 0:
        if self.action_controller.turn >= self.bag.root.settings['turns_cap']:
            self.action_controller.end_game(-1)

func check_win_conditions(field):
    if field.object.type == 0:
        self.action_controller.end_game(self.action_controller.current_player)
    return 1

func update_scores(current_player):
	var objectives = self.action_controller.root_tree.get_nodes_in_group("objectives")

	if objectives.empty():
		return

	for objective in objectives:
		if objective.player > -1 and objective.player != current_player:
			self.action_controller.scores[objective.player] += 1

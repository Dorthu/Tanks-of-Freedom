extends "res://scripts/bag_aware.gd"

var action_controller

const OBJECTIVE_MODE_WINNING_SCORE = 5 # TODO hardcoded cap

func _initialize():
    self.action_controller = self.bag.controllers.action_controller

func has_objectives():
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

func check_scores():
	var scores = self.action_controller.scores

	if scores[0] >= OBJECTIVE_MODE_WINNING_SCORE:
		self.action_controller.end_game(0)
	elif scores[1] >= OBJECTIVE_MODE_WINNING_SCORE:
		self.action_controller.end_game(1)

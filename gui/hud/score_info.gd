
var bag

var score_panel
var blue_score_label
var red_score_label

func _init_bag(bag):
	self.bag = bag

func bind(score_panel_scene):
	self.score_panel = score_panel_scene.get_node("score_panel")

	self.blue_score_label = self.score_panel.get_node("blue_score")
	self.red_score_label = self.score_panel.get_node("red_score")

func show():
	self.score_panel.show()

func hide():
	self.score_panel.hide()

func update_scores(blue_score, red_score):
	self.blue_score_label.set_text(str(blue_score))
	self.red_score_label.set_text(str(red_score))

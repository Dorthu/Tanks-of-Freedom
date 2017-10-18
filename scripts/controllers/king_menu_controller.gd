
var root
var king_menu = preload("res://gui/menu_king.xscn").instance()

var back_button
var start_button

var notice_header
var notice_body

func init_root(root_node):
	self.root = root_node
	self.bind_king_menu()
	self.attach_king_menu()

	self.notice_header.set_text("UNDER CONSTRUCTION")
	self.notice_body.set_text("Your mission is to capture the center objective.  At the end of each enemy turn, if you " +
		"control the objects, you get a point.  The game ends at X points or after Y turns. " +
		"This game mode is only supported against another human, and only locally.")


func bind_king_menu():
	self.back_button = self.king_menu.get_node("bottom/control/dialog_controls/close")
	self.start_button = self.king_menu.get_node("middle/control/dialog_controls/start")
	self.notice_header = self.king_menu.get_node("middle/control/dialog_controls/header")
	self.notice_body = self.king_menu.get_node("middle/control/dialog_controls/body")

	self.back_button.connect("pressed", self, "_back_button_pressed")
	self.start_button.connect("pressed", self, "_start_button_pressed")

func attach_king_menu():
    self.root.bag.controllers.menu_controller.add_child(self.king_menu)
    self.king_menu.hide()

func _back_button_pressed():
    self.root.sound_controller.play('menu')
    self.hide_king_menu()
    self.root.menu.king_button.grab_focus()

func _start_button_pressed():
	self.start_game()

func show_king_menu():
	self.start_button.grab_focus()
	self.king_menu.show()

func hide_king_menu():
    self.root.menu.refresh_buttons_labels()
    self.king_menu.hide()
    self.root.bag.controllers.menu_controller.show_control_nodes()

func start_game():
	self.root.bag.root.settings['turns_cap'] = 20 # TODO - tweak turn cap
	# TODO - do we need to unset turns_cap after the game?
	self.root.load_map("workshop", # TODO - this is wrong, skirmish maps don't do this
			"king_mode", false)
	self.hide_king_menu()
	self.root.toggle_menu()

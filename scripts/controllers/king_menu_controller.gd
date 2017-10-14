
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
	self.notice_body.set_text("This game mode is currently in development, and may not work even a little bit!")


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
	# starts the game
	pass

func show_king_menu():
	self.start_button.grab_focus()
	self.king_menu.show()

func hide_king_menu():
    self.root.menu.refresh_buttons_labels()
    self.king_menu.hide()
    self.root.bag.controllers.menu_controller.show_control_nodes()

terminals = ["guake", "terminal", "terminator", "xfce4-terminal"]


def is_terminal(window):
    class_name = window.get_active_class()
    for t in terminals:
        if class_name.find(t) != -1:
            return True
    return False


def send_no_term(window, keyboard, key):
    if not is_terminal(window):
        keyboard.send_keys('<ctrl>+'+key)


def send_with_term(window, keyboard, key):
    if is_terminal(window):
        keyboard.send_keys('<ctrl>+<shift>+'+key)
    else:
        keyboard.send_keys('<ctrl>+'+key)


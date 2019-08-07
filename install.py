#!/usr/bin/python

import os, sys


def install(home, for_home=True):

    do_for_all_existing = None

    for root, dirs, files in os.walk(home):
        if not files:
            continue
        if for_home:
            base_path = os.environ['HOME']
        else:
            base_path = '/'
        newroot = root.replace(home, base_path)
        for f in files:
            # Path to original copy
            filepath = os.path.realpath(os.path.join(root, f))
            # Path to link
            newpath = os.path.join(newroot, f)

            # Create dir if it doesn't exit
            if not os.path.exists(newroot):
                if not ask(
                    'Path {} does not exist.\n'
                    'Create it?'.format(newroot)
                ):
                    continue
                os.mkdir(newroot)


            # Flags
            create = False

            # Check if file already exists
            if os.path.exists(newpath):

                if do_for_all_existing:
                    answer = do_for_all_existing
                else:
                    answer = raw_input('File {} already exists.\n[s]kip, [b]ackup, [d]elete or [q]uit (use Caps for All): '.format(newpath))
                    if answer in 'SBD':
                        answer = answer.lower()
                        do_for_all_existing = answer
                    if answer in 'Qq':
                        sys.exit()

                if answer == 'b':
                    os.rename(newpath, newpath + ".back")
                    create = True
                elif answer == 'd':
                    create = True
                    os.remove(newpath)
                else:
                    continue

            if create or ask('Create link for {}'.format(newpath)):
                os.symlink(filepath, newpath)

def ask(question):
    answer = raw_input(question + " [y/n]: ")
    return True if answer == 'y' or answer == '' else False

if __name__ == '__main__':
    install('./home', True)

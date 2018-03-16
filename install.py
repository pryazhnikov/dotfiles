#!/usr/bin/env python
'''
Install config into current machine
'''
import os.path
from shutil import copyfile, copystat

def copy_binaries(current_dir):
    """
    Copy custom binary files into $PATH
    """
    BINARY_FILES_WHITELIST = (
        'gcm',
        'git-pwd',
        'git-task',
        'gpm',
        'gpo',
        'git-latest-build',
        'phpunit-resolver',
    )

    source_dir = os.path.join(current_dir, 'bin')
    target_dir = os.path.join(os.path.expanduser('~'), 'bin')
    if not os.path.exists(target_dir):
        raise OSError("Target dir %s is not exists" % target_dir)

    for file_name in BINARY_FILES_WHITELIST:
        source_file = os.path.join(source_dir, file_name)
        target_file = os.path.join(target_dir, file_name)
        print "Copying %s to %s" % (source_file, target_file)
        copyfile(source_file, target_file)
        copystat(source_file, target_file)

def main():
    current_dir = os.path.realpath(os.path.dirname(__file__))
    copy_binaries(current_dir)

if '__main__' == __name__:
    main()

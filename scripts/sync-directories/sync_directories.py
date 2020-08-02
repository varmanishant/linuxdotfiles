"""
This code syncs files from a source directory to a destination directory.

1. Traverse the source directory recursively and check if there is a mismatch.
   If there is a mismatch, notify it via `not_found`.
2. Do the same for the destination directory.
"""

import filecmp
import os

EXCLUDED = [".git", "__pycache__"]


def not_found(file):
    pass


def not_same(file):
    pass


def compare_files(src_file, dest_file):
    return filecmp.cmp(src_file, dest_file, shallow=False)


def compare_dirs(src_dir, dest_dir):
    result = {}
    result['not_found'] = []
    result['not_same'] = []
    for src_root, src_dirs, src_files in os.walk(src_dir):
        if any([x in src_root for x in EXCLUDED]):
            continue
        for src_file in src_files:
            src_file = os.path.join(src_root, src_file)
            real_file = os.path.relpath(src_file, src_dir)
            dest_file = os.path.join(dest_dir, real_file)
            if not (os.path.isfile(dest_file) or os.path.islink(dest_file)):
                result['not_found'].append(src_file)
            elif not compare_files(src_file, dest_file):
                result['not_same'].append(src_file)
    return result


def analyze_dirs(src_dir, dest_dir):
    result = compare_dirs(src_dir, dest_dir)
    for k, v in result.items():
        if v:
            globals()[k](v)
    result = compare_dirs(dest_dir, src_dir)
    for k, v in result.items():
        if v:
            globals()[k](v)

import unittest

from os import chdir,  mkdir, path
from shutil import copy, rmtree
from time import sleep

from sync_directories import analyze_dirs, compare_dirs, compare_files


def create_file(name, content=str()):
    f = open(name, "w")
    if content:
        f.write(content)
    f.close()


class TestSyncDirectories(unittest.TestCase):

    def setUp(self):
        mkdir('workspace')
        chdir('workspace')
        mkdir("src_dir")
        mkdir("dest_dir")
        create_file("same_left", "a")
        copy("same_left", "same_right")
        chdir("src_dir")
        create_file("not_found")
        create_file("not_same", content="a")
        chdir("..")
        chdir("dest_dir")
        create_file("not_same", content="b")
        chdir("..")

    def test_compare_file(self):
        self.assertTrue(compare_files("same_left", "same_right"))

    def test_compare_folders(self):
        result = compare_dirs("src_dir", "dest_dir")
        self.assertIn(path.join("src_dir", "not_found"), result['not_found'])
        self.assertIn(path.join("src_dir", "not_same"), result['not_same'])
        analyze_dirs("src_dir", "dest_dir")

    def tearDown(self):
        chdir("..")
        rmtree('workspace')


if __name__ == '__main__':
    unittest.main()

# check_dme_order.py
# Copyright 2024 Patrick Meade.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#----------------------------------------------------------------------------

from functools import cmp_to_key
import sys
import os

def get_includes(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    includes = [line for line in lines if line.strip().startswith('#include')]
    paths = [line.split('#include')[1].strip().strip('"') for line in includes]
    return paths

def compare_paths(path1, path2):
    # if the two paths are identical
    if path1 == path2:
        # they are identical; no sort preference
        return 0

    # split the paths up into their component parts
    path1_parts = path1.split('\\')
    path2_parts = path2.split('\\')

    # for each path part
    for i in range(0, min(len(path1_parts), len(path2_parts))):
        # get the parts we're interested in comparing
        part1 = path1_parts[i]
        part2 = path2_parts[i]

        # if the parts are identical
        if part1 == part2:
            # move on to the next set of parts
            continue

        # we've reached a difference; now is either one a file?

        # if path1 is a file, and path2 is not a file
        if ('.' in part1) and ('.' not in part2):
            # path1 comes before path2
            return -1

        # if path1 is not a file, and path2 is a file
        if ('.' not in part1) and ('.' in part2):
            # path2 comes before path1
            return 1

        # they are both files, or they are both folders, so we can compare on name
        # remember, they can't be identical, or they would have been skipped
        if part1 < part2:
            return -1
        else:
            return 1

    # we exhausted the shorter of the two, so we can compare on length
    # if path1 has more parts than path2, it comes after
    if len(path1_parts) > len(path2_parts):
        return 1

    # path1 comes before path2
    return -1

def sort_paths(paths):
    return sorted(paths, key=cmp_to_key(compare_paths))

def check_dme_order(file_path):
    paths = get_includes(file_path)
    sorted_paths = sort_paths(paths)

    if paths != sorted_paths:
        print("Some #include paths are not in DreamMaker order.")
        print("The correct order is as follows:\n")
        for path in sorted_paths:
            print("#include \"" + path + "\"")
        return False

    return True

if __name__ == "__main__":
    file_path = sys.argv[1]
    if not check_dme_order(file_path):
        sys.exit(1)
    else:
        print("All #include paths are in DreamMaker order.")

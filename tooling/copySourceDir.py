import os
import sys
import shutil


def copy_graph_folders(source_dir, destination_dir):
    print(source_dir)
    print(destination_dir)
    for root, dirs, files in os.walk(source_dir):
        for dir_name in dirs:
            if dir_name == "graphs":
                print("found a graph dir")
                source_path = os.path.join(root, dir_name)
                relative_path = os.path.relpath(source_path, source_dir)
                destination_path = os.path.join(destination_dir, relative_path)
                shutil.copytree(source_path, destination_path)
                print(f"Copied '{source_path}' to '{destination_path}'.")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python program.py source_directory destination_directory")
    else:
        source_directory = sys.argv[1]
        destination_directory = sys.argv[2]
        copy_graph_folders(source_directory, destination_directory)

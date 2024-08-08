from pathlib import Path

def get_project_root() -> Path:
    return Path(__file__).parent.absolute().resolve()

def list_files_in_directory(directory_path):
    return [path for path in Path.iterdir(directory_path) if path.is_file()]

def parse_file_name(file_path):
    pass

if __name__ == "__main__":
    ROOT_DIR = get_project_root()
    EXAMPLES_DIR = ROOT_DIR / "examples"


from pathlib import Path
import psycopg2

DB_NAME = "postgres"
USER = "postgres"
PASSWORD = "postgres"
HOST = "localhost"
PORT = "5432"

def get_project_root():
    """Get the absolute path of the project's root directory."""
    return Path(__file__).parent.parent.absolute().resolve()

def list_files_in_directory(directory_path):
    """List all files in the specified directory."""
    return [path for path in Path.iterdir(directory_path) if path.is_file()]

def parse_file_name(input_str):
    """Parse the file name to extract the author and title."""
    author_part, title_part = input_str.split('-', 1)

    author_words = author_part.split('_')
    title_words = title_part.split('_')

    author = ' '.join(author_words)
    title = ' '.join(title_words)

    return author, title

if __name__ == "__main__":
    ROOT_DIR = get_project_root()
    EXAMPLES_DIR = ROOT_DIR / "examples"

    with psycopg2.connect(dbname=DB_NAME, user=USER, password=PASSWORD, host=HOST, port=PORT) as conn:
        with conn.cursor() as curs:
            for text_file_path in list_files_in_directory(EXAMPLES_DIR):
                author, title = parse_file_name(Path(text_file_path).stem)

                with open(text_file_path, encoding="utf-8", mode="r") as file:
                    text = file.read()

                    curs.execute("""
                        INSERT INTO classical_literature(author, title, text)
                        VALUES(%s, %s, %s);
                        """,
                        (author, title, text))

    conn.close()

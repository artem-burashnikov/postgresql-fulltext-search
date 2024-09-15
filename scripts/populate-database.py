import os
from pathlib import Path
from typing import List
from dotenv import load_dotenv

import psycopg2
import sys

load_dotenv(".env")

DB_NAME = os.getenv("db_name")
USER = os.getenv("user")
PASSWORD = os.getenv("password")
HOST = os.getenv("host")
PORT = os.getenv("port")


def get_project_root() -> Path:
    """Get the absolute path of the project's root directory."""
    # This file should be left in ./scripts directory!
    return Path(__file__).parent.parent.absolute().resolve()


def list_files_in_directory(directory_path: Path) -> List[Path]:
    """List all files in the specified directory."""
    return [
        path
        for path in Path.iterdir(directory_path)
        if path.is_file() and path.suffix == ".txt"
    ]


def parse_file_name(input_str: str) -> tuple[str, str]:
    """Parse the file name to extract the author and title."""
    author_part, title_part = input_str.split("-", 1)

    author_words = author_part.split("_")
    title_words = title_part.split("_")

    author = " ".join(author_words)
    title = " ".join(title_words)

    return author, title


if __name__ == "__main__":

    ROOT_DIR = get_project_root()
    EXAMPLES_DIR = ROOT_DIR / "examples"
    SCRIPT_PATH = ROOT_DIR / "scripts" / "init-database.sql"

    with psycopg2.connect(
        dbname=DB_NAME, user=USER, password=PASSWORD, host=HOST, port=PORT
    ) as conn:
        print(f"SUCCESS Connected to database {DB_NAME} as {USER}")

        with conn.cursor() as curs:
            try:
                with open(SCRIPT_PATH, "r") as sql_file:
                    sql_src = sql_file.read()
                    curs.execute(sql_src)
                    conn.commit()
            except Exception as e:
                conn.close()
                print(f"FAIL SQL-script failed to execute: {e}")
                sys.exit(1)

            for text_file_path in list_files_in_directory(EXAMPLES_DIR):
                author, title = parse_file_name(Path(text_file_path).stem)

                with open(text_file_path, encoding="utf-8", mode="r") as file:
                    text = file.read()

                    try:
                        print(f"Inserting {author} - {title}...", end="")
                        curs.execute(
                            """
                            INSERT INTO text_2024.classical_literature(author, title, text)
                            VALUES(%s, %s, %s);
                            """,
                            (author, title, text),
                        )
                    except Exception as e:
                        conn.close()
                        print(f"\nFAIL Couldn't insert data into the table: {e}")
                        print(f"author: {author}, title: {title}")
                        sys.exit(1)
                print("OK")
    conn.close()
    print("Script finished succesfully")
    sys.exit(0)

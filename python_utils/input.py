import argparse

from functools import wraps
from typing import Any, Callable

parser = argparse.ArgumentParser()
parser.add_argument("-t", "--task", type=str, choices=["one", "two"])


def advent_input(filepath: str) -> Callable:
    def _filepath_function(func: Callable) -> Any:
        @wraps(func)
        def _input_func(*args, **kwargs):
            with open(filepath) as lines:
                return func(*args, lines=lines, **kwargs)

        return _input_func

    return _filepath_function


def add_argparse(func: Callable) -> Callable:
    @wraps(func)
    def _argparse_function(*args, **kwargs) -> Any:
        arguments = parser.parse_args()
        
        return func(*args, task=str(arguments.task), **kwargs)

    return _argparse_function
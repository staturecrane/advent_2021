from typing import Iterator

from python_utils.input import add_argparse, advent_input

get_int = lambda x: int(x.strip())

action_funcs = {
    "up": lambda x: -x,
    "down": lambda x: x,
}

@advent_input("02/input_1.txt")
def task_one(lines: Iterator[str]) -> None:
    depth = 0
    horizontal = 0

    for line in lines:
        action, value = line.strip().split(" ")
        value = get_int(value)

        if action in action_funcs:
            depth += action_funcs[action](value)
        else:
            horizontal += value

    print(depth * horizontal)


@advent_input("02/input_1.txt")
def task_two(lines: Iterator[str]) -> None:
    depth = 0
    horizontal = 0
    aim = 0

    for line in lines:
        action, value = line.strip().split(" ")
        value = get_int(value)

        if action in action_funcs:
            aim += action_funcs[action](value)
        else:
            horizontal += value
            depth += (aim * value)

    print(depth * horizontal)

@add_argparse
def main(task):
    task_one() if task == "one" else task_two()


if __name__ == "__main__":
    main()

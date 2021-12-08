from python_utils.input import add_argparse, advent_input


@advent_input("04/input_1.txt")
def one(lines):
    return lines


@advent_input("04/input_1.txt")
def two(lines):
    pass


def main():
    print(one())
    print(two())


if __name__ == "__main__":
    main()

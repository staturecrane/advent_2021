from python_utils.input import add_argparse, advent_input

get_int = lambda x: int(x.strip())


@advent_input('01/input_1.txt')
def task_one(lines):
    prev_value = get_int(next(lines))
    count = 0

    for line in lines:
        if (current_value := get_int(line)) > prev_value:
            count += 1

        prev_value = current_value

    print(count)


@advent_input('01/input_1.txt')
def task_two(lines):
    values = [get_int(line) for line in lines]

    prev = 0
    count = 0
    for i in range(values_length := len(values)):
        if (i + 3) >= values_length:
            break 
        
        if (current_value := sum(values[i:i+3])) > prev:
            count += 1
        
        prev = current_value

    print(count)

@add_argparse
def main(task):
    task_one() if task == "one" else task_two()


if __name__ == "__main__":
    main()
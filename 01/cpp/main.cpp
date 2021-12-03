#include <filesystem>
#include <fstream>
#include <string>
#include <iostream>
#include <vector>

#include <utils.h>


void one(){
    std::vector<int> values = textUtils::getFileLinesInt("02/input_1.txt");

    int prev = values.at(0);
    int count = 0;

    for (int i: values) {
        if (i > prev) {
            count++;
        }

        prev = i;
    }

    std::cout << count << "\n";
}

void two(){
    std::vector<int> values = textUtils::getFileLinesInt("01/input_1.txt");

    int prev = 0;
    int count = 0;

    for (int i = 0; i < values.size(); i++) {
        if (i + 3 >= values.size()) {
            break;
        }

        int a = values.at(i);
        int b = values.at(i + 1);
        int c = values.at(i + 2);

        int sum = a + b + c;

        if (sum > prev) {
           count++;
        }

        prev = sum;
    }

    std::cout << count << "\n";
}

int main() {
    one();
    two();
}
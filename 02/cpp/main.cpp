#include <filesystem>
#include <fstream>
#include <string>
#include <iostream>
#include <vector>

#include <utils.h>

std::vector<std::string> split(std::string line) {
    std::vector<std::string> values;
    std::string temp;

    for (int i = 0; i < line.length(); i++) {
        if (line[i] == ' ') {
            values.push_back(temp);
            temp = "";
        }
        temp.push_back(line[i]);
    }

    values.push_back(temp);

    return values;
}


void one(){
    std::vector<std::string> values = textUtils::getFileLines("02/input_1.txt");

    int depth = 0;
    int horizontal = 0;

    for (std::string line: values) {
        std::vector<std::string> inputs = split(line);
        
        std::string action = inputs.at(0);
        int value = std::stoi(inputs.at(1));

        if (action == "up") {
            depth = depth - value;
        } else if (action == "down") {
            depth = depth + value;
        } else if (action == "forward") {
            horizontal = horizontal + value;
        }
    }

    std::cout << depth * horizontal << "\n";
}

void two(){
    std::vector<std::string> values = textUtils::getFileLines("02/input_1.txt");

    int depth = 0;
    int horizontal = 0;
    int aim = 0;

    for (std::string line: values) {
        std::vector<std::string> inputs = split(line);
        
        std::string action = inputs.at(0);
        int value = std::stoi(inputs.at(1));

        if (action == "up") {
            aim = aim - value;
        } else if (action == "down") {
            aim = aim + value;
        } else if (action == "forward") {
            horizontal = horizontal + value;
            depth = depth + (aim * value);
        }
    }

    std::cout << depth * horizontal << "\n";
}

int main() {
    one();
    two();
}
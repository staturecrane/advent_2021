#include <filesystem>
#include <fstream>
#include <string>
#include <iostream>
#include <vector>


void one(){
    std::string line;
    std::ifstream rfile;

    std::vector<int> values;

    rfile.open("01/input_1.txt");
    
    if (rfile.is_open()) {
        while (std::getline(rfile, line)) {
            values.push_back(std::stoi(line));
        }
        rfile.close();
    }

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
    std::string line;
    std::ifstream rfile;

    std::vector<int> values;

    rfile.open("01/input_1.txt");
    
    if (rfile.is_open()) {
        while (std::getline(rfile, line)) {
            values.push_back(std::stoi(line));
        }
        rfile.close();
    }

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
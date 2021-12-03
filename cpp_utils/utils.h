#include <filesystem>
#include <fstream>
#include <string>
#include <iostream>
#include <vector>

namespace textUtils {
    std::vector<std::string> getFileLines(std::string filepath) {
        std::string line;
        std::ifstream rfile;

        std::vector<std::string> values;

        rfile.open("02/input_1.txt");
        
        if (rfile.is_open()) {
            while (std::getline(rfile, line)) {
                values.push_back(line);
            }
            rfile.close();
        }

        return values;
    }

    std::vector<int> getFileLinesInt(std::string filepath) {
        std::string line;
        std::ifstream rfile;

        std::vector<int> values;

        rfile.open("02/input_1.txt");
        
        if (rfile.is_open()) {
            while (std::getline(rfile, line)) {
                values.push_back(std::stoi(line));
            }
            rfile.close();
        }

        return values;
    }
}

    
    
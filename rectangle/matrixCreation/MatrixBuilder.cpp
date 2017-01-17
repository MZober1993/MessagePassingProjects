#include "MatrixBuilder.h"
#include "CoordValidator.h"
#include "VectorParser.h"
#include <iostream>

MatrixBuilder::MatrixBuilder(const int mode, const vector<string> lines) {
    this->mode = mode;
    this->lines = lines;
    this->n = 0;
    matrix = NULL;
}

MatrixBuilder::~MatrixBuilder() {
}

int *MatrixBuilder::constructMatrix() {
    if (mode == MODE_COMPLETE_RECTANGLE || mode == MODE_POSITION_PLACEMENT) {
        n = atoi(lines[0].c_str());
        int background = atoi(lines[1].c_str()) % 2;
        int foreground = (background + 1) % 2;
        vector<pair<int, int>> coords = VectorParser::splitAndParseToCoords(lines[2], ' ');
        CoordValidator validator = CoordValidator(coords, n, mode);
        if (validator.getValidation()) {
            this->matrix = new int[n * n];
            fillBackground(n, background);
            if (mode == MODE_COMPLETE_RECTANGLE) {
                drawCompleteRectangle(foreground, coords);
            } else {
                for (auto it = coords.begin(); it != coords.end(); ++it) {
                    matrix[it->first * n + it->second] = foreground;
                }
            }
        } else {
            std::cout << "error: validation of rectangle failure." << std::endl;
        }
    } else if (mode == MODE_CUSTOM) {
        n = lines.size();
        this->matrix = new int[n * n];
        for (int y = 0; y < lines.size(); y++) {
            const vector<int> &line = VectorParser::splitAndParseToLine(lines[y], ' ');
            if (lines.size() == line.size()) {
                for (int x = 0; x < line.size(); x++) {
                    matrix[y * n + x] = line[x];
                }
            } else {
                throw "error: given matrix is not an n*n matrix.";
            }
        }
    } else {
        cout << "error: wrong mode." << endl;
    }
    return matrix;
}

void MatrixBuilder::drawCompleteRectangle(const int foreground, const vector<pair<int, int>> &coords) {
    for (int x = coords[0].first; x <= coords[1].first; ++x) {
        for (int y = coords[0].second; y <= coords[2].second; ++y) {
            matrix[y * n + x] = foreground;
        }
    }
}

void MatrixBuilder::fillBackground(const int n, const int background) {
    for (int y = 0; y < n; ++y) {
        for (int x = 0; x < n; ++x) {
            matrix[y * n + x] = background;
        }
    }
}

const int *MatrixBuilder::getMatrix() {
    return matrix;
}

int MatrixBuilder::getMode() const {
    return mode;
}

void MatrixBuilder::setMode(int mode) {
    MatrixBuilder::mode = mode;
}

const vector<string> &MatrixBuilder::getLines() const {
    return lines;
}

void MatrixBuilder::setLines(const vector<string> &lines) {
    MatrixBuilder::lines = lines;
}

int MatrixBuilder::getN() const {
    return n;
}

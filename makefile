# Compiler and flags
CXX := g++

# Directories
SRC_DIR := src
INCLUDE_DIR := include
LIB_DIR := lib
TEST_DIR := tests
BUILD_DIR := build
BIN_DIR := bin

# Source files and objects
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

# Output names
TARGET := $(BIN_DIR)/app
TEST_TARGET := $(BIN_DIR)/tests

# Libraries (add if needed)
LIBS :=

.PHONY: all dev debug prod clean tests

# Default target: prod build
all: prod

# Production build (optimized, no debug)
prod: CXXFLAGS := -std=c++23 -O3 -I$(INCLUDE_DIR) -Wall
prod: $(TARGET)

# Debug build (no optimizations, debug info)
debug: CXXFLAGS := -std=c++23 -g -O0 -I$(INCLUDE_DIR) -Wall -DDEBUG
debug: $(TARGET)

# Dev build: debug build + run tests immediately
dev: debug tests

# Link executable
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LIBS)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create directories
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Build and run tests
tests: 
	$(CXX) $(CXXFLAGS) $(TEST_DIR)/*.cpp $(SRCS) -o $(TEST_TARGET) $(LIBS)
	./$(TEST_TARGET)

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

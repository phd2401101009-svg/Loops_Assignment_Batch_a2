#!/bin/bash

# Configuration
FILES=("q1.cpp" "q2.cpp" "q3.cpp")
CXX="g++"
CXXFLAGS="-Wall -std=c++17"

echo "=========================================="
echo " Starting Assignment Verification"
echo "=========================================="

all_passed=true

# Step 1: Check File Existence
echo -e "\n[1/2] Checking required files..."
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  [OK] Found $file"
    else
        echo "  [FAIL] Missing $file"
        all_passed=false
    fi
done

if [ "$all_passed" = false ]; then
    echo -e "\nError: Missing required files. Verification aborted."
    exit 1
fi

# Step 2: Compile Each File
echo -e "\n[2/2] Compiling files..."
for file in "${FILES[@]}"; do
    output_bin="${file%.cpp}.out"
    echo -n "  Compiling $file -> $output_bin ... "
    
    $CXX $CXXFLAGS "$file" -o "$output_bin" 2> compile_err.tmp
    
    if [ $? -eq 0 ]; then
        echo "[SUCCESS]"
        rm -f compile_err.tmp "$output_bin"
    else
        echo "[FAILED]"
        cat compile_err.tmp
        rm -f compile_err.tmp
        all_passed=false
    fi
done

echo -e "\n=========================================="
if [ "$all_passed" = true ]; then
    echo " Verification Passed! All files compiled successfully."
    echo "=========================================="
    exit 0
else
    echo " Verification Failed! Please resolve compiler errors above."
    echo "=========================================="
    exit 1
fi
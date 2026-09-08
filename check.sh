#!/bin/bash

# Configuration
FILES=("q1.cpp" "q2.cpp" "q3.cpp")
CXX="g++"
CXXFLAGS="-Wall -std=c++17"

echo "=========================================="
echo " Starting Assignment & Test Verification"
echo "=========================================="

all_passed=true

# Step 1: Check File Existence
echo -e "\n[1/3] Checking required files..."
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

# Step 2: Compile Files
echo -e "\n[2/3] Compiling files..."
for file in "${FILES[@]}"; do
    output_bin="${file%.cpp}.out"
    echo -n "  Compiling $file -> $output_bin ... "
    
    $CXX $CXXFLAGS "$file" -o "$output_bin" 2> compile_err.tmp
    
    if [ $? -eq 0 ]; then
        echo "[SUCCESS]"
        rm -f compile_err.tmp
    else
        echo "[FAILED]"
        cat compile_err.tmp
        rm -f compile_err.tmp
        all_passed=false
    fi
done

if [ "$all_passed" = false ]; then
    echo -e "\nError: Compilation failed. Testing aborted."
    exit 1
fi

# Step 3: Run Test Cases
echo -e "\n[3/3] Running Test Cases..."

run_test() {
    local bin="$1"
    local input="$2"
    local expected_regex="$3"
    local desc="$4"

    output=$(printf "%s\n" "$input" | "./$bin" 2>&1)

    if echo "$output" | grep -Eq "$expected_regex"; then
        echo "    [PASS] $desc"
    else
        echo "    [FAIL] $desc"
        echo "      Input: $input"
        echo "      Expected pattern: $expected_regex"
        echo "      Actual Output: $(echo "$output" | tr '\n' ' ')"
        all_passed=false
    fi
}

# --- Tests for Q1: Swap without third variable ---
echo -e "\n  Testing q1.cpp (Swapping values)..."
# Expects a = 40 and b = 15 after swapping 15 and 40[cite: 1]
run_test "q1.out" "15 40" "a = 40.*b = 15" "Positive integers (15, 40)"
# Expects a = 10 and b = -25 after swapping -25 and 10[cite: 1]
run_test "q1.out" "-25 10" "a = 10.*b = -25" "Negative and positive integers (-25, 10)"

# --- Tests for Q2: Prime checker function ---
echo -e "\n  Testing q2.cpp (Prime checker)..."
# Expects prime confirmation or return code 1 for 29[cite: 1]
run_test "q2.out" "29" "(returned: 1|PRIME)" "Prime number test (29)"
# Expects composite confirmation or return code 0 for 49[cite: 1]
run_test "q2.out" "49" "(returned: 0|NOT a prime)" "Composite number test (49)"
# Expects composite/non-prime confirmation for 1[cite: 1]
run_test "q2.out" "1" "(returned: 0|NOT a prime)" "Edge case (1)"

# --- Tests for Q3: Digit reversal and digit sum ---
echo -e "\n  Testing q3.cpp (Reverse & Sum)..."
# Expects reversed: 12345 and sum: 15 for 54321[cite: 1]
run_test "q3.out" "54321" "Reversed.*12345.*Sum.*15" "Positive integer (54321)"
# Expects reversed: 21 and sum: 3 for 1200[cite: 1]
run_test "q3.out" "1200" "Reversed.*21.*Sum.*3" "Trailing zeroes (1200)"
# Expects reversed: -284 and sum: 14 for -482[cite: 1]
run_test "q3.out" "-482" "Reversed.*-284.*Sum.*14" "Negative integer (-482)"

# Cleanup compiled binaries
rm -f q1.out q2.out q3.out

echo -e "\n=========================================="
if [ "$all_passed" = true ]; then
    echo " All tests passed successfully!"
    echo "=========================================="
    exit 0
else
    echo " Some tests failed. Please review the output above."
    echo "=========================================="
    exit 1
fi

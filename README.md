### Experiment 1: Swapping Two Variables Without a Third Variable

#### 1. Objective
Write a C program to swap the contents of two integer variables without using a temporary or auxiliary variable.
#### 2. Sample Test Cases
##### Test Case 1: Standard Positive Integers
```text
Enter first integer (a): 15
Enter second integer (b): 40

--- Before Swapping ---
a = 15, b = 40

--- After Swapping ---
a = 40, b = 15
```
##### Test Case 2: Negative & Positive Integers
```text
Enter first integer (a): -25
Enter second integer (b): 10

--- Before Swapping ---
a = -25, b = 10

--- After Swapping ---
a = 10, b = -25
```
---
### Experiment 2: Prime Number Checker Function

#### 1. Objective
Write a C program containing a modular function `int isPrime(int n)` that returns `1` if the number passed into it is prime, and `0` otherwise.
#### 2. Sample Test Cases

##### Test Case 1: Prime Number
```text
Enter an integer to check prime status: 29

Function returned: 1
Result: 29 is a PRIME number.
```

##### Test Case 2: Composite Number
```text
Enter an integer to check prime status: 49

Function returned: 0
Result: 49 is NOT a prime number.
```

##### Test Case 3: Edge Case (0, 1, or Negative)
```text
Enter an integer to check prime status: 1

Function returned: 0
Result: 1 is NOT a prime number.
```
---
### Experiment 3: Digit Reversal and Sum of Digits

#### 1. Objective
Write a C program that takes an integer from the user, reverses its digits, and computes the sum of its constituent digits.
#### 2. Sample Test Cases
##### Test Case 1: Positive Integer
```text
Enter an integer: 54321

--- Results ---
Original Number : 54321
Reversed Number : 12345
Sum of Digits   : 15
```
##### Test Case 2: Number with Trailing Zeroes
```text
Enter an integer: 1200

--- Results ---
Original Number : 1200
Reversed Number : 21
Sum of Digits   : 3
```
##### Test Case 3: Negative Integer
```text
Enter an integer: -482

--- Results ---
Original Number : -482
Reversed Number : -284
Sum of Digits   : 14
```
---
## Best Coding Practices & Guidelines

1. **Meaningful Variable Names:** Avoid single-letter variable names where possible, except for standard loop indices (`i`, `j`).
2. **Input Validation:** Always verify the return value of `scanf()` to prevent undefined behavior from unexpected characters.
3. **Proper Indentation:** Maintain standard 4-space or tab indentation for all nested blocks and control structures.
4. **Header Inclusions:** Only include standard libraries that are strictly necessary (`<stdio.h>`, `<stdlib.h>`, etc.).
5. **Code Comments:** Use docstrings or comments before custom functions to explain inputs, outputs, and edge-case behavior.
---

## Submission Guidelines

1. Ensure each `.c` source file contains a header comment with:
   - Student Name
   - Roll / Registration Number
   - Date of Experiment
2. Test code against edge cases (e.g., `0`, negative values, large numbers).
3. Push your changes to your assigned Git repository or export the files per your instructor's lab manual directions:
   ```bash
   git add .
   git commit -m "Add solutions for Lab Experiments 1, 2, and 3"
   git push origin main

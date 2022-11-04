import sys
import time
from statistics import median

sys.setrecursionlimit(5000)

def count_time(start=0):
    return time.perf_counter() - start


def factorial(n):
    if n == 0:
        return 1
    return n*factorial(n-1)


def fibonacci(n):
    if n <= 1:
        return 1
    return fibonacci(n-1) + fibonacci(n-2)


def measure_factorial():
    size = 1000
    list_ = [e for e in range(1000, 1000+size)]
    exec_times = list()
    for integer in list_:
        start = count_time()
        r = factorial(integer)
        counted_time = count_time(start)
        exec_times.append(counted_time)
    print(median(exec_times))


def measure_fibonacci():
    n = 40
    start = count_time()
    result = fibonacci(n)
    counted_time = count_time(start)
    print(counted_time)


def main(): #crashed in integer==2858
    measure_factorial()
    measure_fibonacci()


if __name__ == '__main__':
    main()
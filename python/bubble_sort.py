import random
import numpy as np
import time
from statistics import median


def count_time(start=0):
    return time.perf_counter() - start


def bubble_sort(list_):
    for i in range(len(list_)):
        for j in range(i+1, len(list_)):
            if list_[i] > list_[j]:
                list_[i], list_[j] = list_[j], list_[i]


def measure_sort():
    size = 1000
    X = np.array([random.randint(1,100000) for i in range(size)])
    exec_times = list()
    print(X)
    for i in range(1000):
        print(i)
        start = count_time()
        bubble_sort(X.copy())
        counted_time = count_time(start)
        exec_times.append(counted_time)
    print(median(exec_times))


def main():
    measure_sort()


if __name__ == '__main__':
    main()
import numpy as np
from sklearn.linear_model import LinearRegression

import random

import time
from statistics import median


def count_time(start=0):
    return time.perf_counter() - start


def regression(X, y):
    reg = LinearRegression().fit(X, y)
    return reg


def measure_regression():
    size = 1000000
    #y = np.array([i+random.randint(int(-0.1*i),int(0.1*i)) for i in range(size)]).reshape(-1,1)
    y = [[i+random.randint(int(-0.1*i),int(0.1*i))] for i in range(size)]
    #X = np.array([i for i in range(size)]).reshape(-1,1)
    X = [[i] for i in range(size)]
    exec_times = list()
    for i in range(100):
        print(i)
        start = count_time()
        r = regression(X, y)
        counted_time = count_time(start)
        exec_times.append(counted_time)
    print(median(exec_times))


def main(): 
    measure_regression()


if __name__ == '__main__':
    main()
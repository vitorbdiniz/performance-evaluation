from statistics import median
import time

def count_time(start=0):
    return time.perf_counter() - start


def in_linear_search(list_, element):
    return element in list_


def foreach_linear_search(list_, element):
    for e in list_:
        if e == element:
            return True
    return False


def for_linear_search(list_, element):
    for i in range(len(list_)):
        if list_[i] == element:
            return True
    return False


def main():
    list_ = [e for e in range(0, 1000000, 2)]
    items = [e for e in range(1000)]
    time_counters = dict(in_search=[], for_search=[], foreach_search=[])
    for item in items:
        print(item)
        start = count_time()
        in_linear_search(list_, item)
        end = count_time(start)
        time_counters['in_search'].append(end)

    for item in items:
        print(item)
        start = count_time()
        foreach_linear_search(list_, item)
        end = count_time(start)
        time_counters['foreach_search'].append(end)

    for item in items:
        print(item)
        start = count_time()
        foreach_linear_search(list_, item)
        end = count_time(start)
        time_counters['for_search'].append(end)

    print('-'*100)
    for k,v in time_counters.items():
        print(f'{k}: {median(v)}')


if __name__ == '__main__':
    main()
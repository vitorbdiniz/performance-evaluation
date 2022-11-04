package main

import (
	"fmt"
	"sort"
	"time"
)

func linear_search(list *[]int, element int) bool {
	for _, value := range *list {
		if value == element {
			return true
		}
	}
	return false
}

func mean(values *[]float64) float64 {
	var sum float64 = 0

	for _, v := range *values {
		sum += v
	}
	return sum / float64(len(*values))
}

func median(values []float64) float64 {
	sort.Float64s(values)
	midNumber := int(len(values) / 2)
	if len(values)%2 != 0 {
		return values[midNumber]
	} else {
		midNumbers := []float64{values[midNumber], values[midNumber+1]}
		return mean(&midNumbers)
	}

}

func makeRange(min, max int, step int) []int {
	numberOfElements := int((max - min) / step)
	a := make([]int, numberOfElements)
	for i := range a {
		a[i] = min + i*step
	}
	return a
}

func remove_value(list *[]float64, value float64) []float64 {
	var r []float64
	for _, v := range *list {
		if v != value {
			r = append(r, v)
		}
	}
	return r
}

func main() {
	list := makeRange(0, 1000000, 2)
	items := makeRange(999000, 1000000, 1)
	fmt.Println(len(list), len(items))
	time_counters := make([]float64, 1000)
	for _, item := range items {
		start := time.Now()
		found := linear_search(&list, item)
		elapsed := time.Since(start)
		fmt.Println(item, elapsed.Microseconds(), found)
		time_counters = append(time_counters, float64(elapsed.Microseconds()))

	}
	clean_times := remove_value(&time_counters, 0)
	fmt.Println(clean_times)
	fmt.Println(median(clean_times))

}

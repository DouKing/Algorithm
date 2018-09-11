//: [Previous](@previous)

import Foundation

//:冒泡排序
func bubbleSort(_ values: inout [Int]) {
  var i = 0
  //外层循环控制趟数
  while i < values.count - 1 {
    var j = 0
    //内层循环控制次数
    while j < values.count - 1 - i {
      if values[j] > values[j + 1] {
        values.swapAt(j, j + 1)
      }

      j = j + 1
    }

    i = i + 1
  }
}

//:选择排序
func selectionSort(_ values: inout [Int]) {
  var i = 0
  while i < values.count - 1 {
    var minIndex = i
    var j = i + 1
    while j < values.count {
      if values[j] < values[minIndex] {
        minIndex = j
      }
      j = j + 1
    }
    if i != minIndex {
      values.swapAt(i, minIndex)
    }
    i = i + 1
  }
}
//:插入排序
func insertSort(_ values: inout [Int]) {
  guard values.count > 1 else { return }
  var i = 1
  while i < values.count {
    let temp = values[i]
    var j = i
    while j > 0 && values[j - 1] > temp  {
      values[j] = values[j - 1]
      j = j - 1
    }
    values[j] = temp
    i = i + 1
  }
}
//: 快速排序
func quickSort(_ values: inout [Int], left: Int, right: Int){
  guard left < right, left >= 0, right < values.count else {
    return
  }
  let q = partition(&values, left: left, right: right)
  quickSort(&values, left: left, right: q - 1)
  quickSort(&values, left: q + 1, right: right)
}

func partition(_ values: inout [Int], left: Int, right: Int) -> Int {
  let x = values[right]
  var i = left - 1

  for index in left ..< right {
    let v = values[index]
    if v <= x {
      i = i + 1
      values.swapAt(i, index)
    }
  }

  values.swapAt(i + 1, right)
  return i + 1
}
//:归并排序
func mergeSort(_ values: inout [Int]) {
//  var a = values
//  let len = values.count
//  var b = Array(repeating: 0, count: values.count)
//  var seg = 1, start = 0
//  while seg < len {
//    while start < len {
//      let low = start, mid = min(start + seg, len), high = min(start + seg * 2, len)
//      var k = low
//      var start1 = low, end1 = mid
//      var start2 = mid, end2 = high
//      while start1 < end1 && start2 < end2 {
//        if a[start1] < a[start2] {
//          b[k] = a[start1]
//          start1 = start1 + 1
//        } else {
//          b[k] = a[start2]
//          start2 = start2 + 1
//        }
//        k = k + 1
//      }
//      while start1 < end1 {
//        b[k] = a[start1]
//        start1 = start1 + 1
//        k = k + 1
//      }
//      while start2 < end2 {
//        b[k] = a[start2]
//        start2 = start2 + 1
//        k = k + 1
//      }
//      start = start + seg * 2
//    }
//    let temp = a
//    a = b
//    b = temp
//    seg = seg + seg
//  }
//  if !a.elementsEqual(values) {
//    var i = 0
//    while i < len {
//      b[i] = a[i]
//      i = i + 1
//    }
//    b = a
//  }
}
//: 堆排序
func maxHeap(_ values: inout [Int], index: Int, length: Int) {
  let leftIndex = index * 2 + 1
  let rightIndex = leftIndex + 1
  var maxIndex = index
  if leftIndex < length && values[leftIndex] > values[maxIndex] {
    maxIndex = leftIndex
  }
  if rightIndex < length && values[rightIndex] > values[maxIndex] {
    maxIndex = rightIndex
  }
  values.swapAt(index, maxIndex)
}

func buildHeap(_ values: inout [Int], sortedNumber: Int) {
  let sortingNumber = values.count - sortedNumber
  var startIndex = (sortingNumber - 1) / 2
  while startIndex >= 0 {
    maxHeap(&values, index: startIndex, length: sortingNumber)
    startIndex = startIndex - 1
  }
}

func heapSort(_ values: inout [Int]) {
  var sortedNumber = 0
  while sortedNumber < values.count - 1 {
    buildHeap(&values, sortedNumber: sortedNumber)
    values.swapAt(0, values.count - sortedNumber - 1)
    sortedNumber = sortedNumber + 1
  }
}
//: 例子
var array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
bubbleSort(&array)
print("冒泡：  \(array)")

array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
selectionSort(&array)
print("选择：  \(array)")

array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
insertSort(&array)
print("插入：  \(array)")

array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
quickSort(&array, left: 0, right: array.count - 1)
print("快速：  \(array)")

//array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
//mergeSort(&array)
//print("归并：  \(array)")

array = [13, 19, 9, 5, 12, 8, 7, 4, 11, 2, 6, 21]
heapSort(&array)
print("堆排序  \(array)")

//: [Next](@next)
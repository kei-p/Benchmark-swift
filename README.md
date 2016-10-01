# Benchmark-swift

## Usage
### Case 1:
```
let b = Benchmark.measure("generateImage") {
  sleep(10)
}
print(b)
```


```:output
Benchmark generateImage {
 start 	0.000 sec - 2016-09-30 03:10:46 +0000
 end 	10.001 sec - 2016-09-30 03:10:56 +0000
 }
```

### Case 2:
```
let b = Benchmark.start("generateImage")
sleep(1)
b.lap("step1")
sleep(1)
b.lap("step2")
sleep(1)
b.end()
print(b)
```

```:output
Benchmark generateImage {
 start 	0.000 sec - 2016-09-30 03:10:56 +0000
 step1 	1.001 sec - 2016-09-30 03:10:57 +0000
 step2 	2.002 sec - 2016-09-30 03:10:58 +0000
 end 	3.003 sec - 2016-09-30 03:10:59 +0000
 }
```
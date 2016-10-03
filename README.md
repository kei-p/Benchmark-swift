# Benchmark-swift

## Installation
```
pod 'Benchmark', git: 'https://github.com/kei-p/Benchmark-swift.git'
```

## Usage
### Closure Style
```
Benchmark("test").measure { b in
	sleep(1)
	b.lap("1")
	sleep(1)
	b.lap("2")
	sleep(1)
}
```

#### outputlog:
```
test.start 	0.000 sec
test.1 	1.000 sec
test.2 	2.001 sec
test.end 	3.001 sec
```

### Instance Style
```
let b = Benchmark("test").start()
sleep(1)
b.lap("1")
sleep(1)
b.lap("2")
sleep(1)
b.end()
```

#### outputlog:
```
test.start 	0.000 sec
test.1 	1.000 sec
test.2 	2.001 sec
test.end 	3.001 sec
```

### Customize output stream
```
Benchmark.logger = { text in print("customize - " + text) }
Benchmark("test").measure { _ in
	sleep(1)
}
```

#### outputlog:
```
customize - test.start 	0.000 sec
customize - test.end 	1.001 sec
```



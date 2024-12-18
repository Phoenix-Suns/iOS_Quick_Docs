# Xử lý bất đồng bộ

## Await - Async

```swift
func somefunction() async -> Void {
    // bla bla bla
}

func anotherFunction() async {
    await somefunction()
}

// ### Trong 1 hàm bình thường
func tinh() {
	async {
		await somefunction()
	}
}

// ### Đợi kết quả trả về
func add(a: Int, b: Int) async -> Int {
    a + b
}
func tinh() async {
    let result = await add(a: A, b: B)
}
```

### Throw Exception

```swift
func chia(a: Int, b: Int) async throws -> Float {
    if b == 0 {
        throw MyError.bangKhong
    } else {
        return Float(a) / Float(b)
    }
}
```
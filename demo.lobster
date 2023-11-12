let content = read_file("input.txt")

assert(content)

print("input length: {content.length()}")

let result = write_file("output.txt", content)

print("write result: {result}")
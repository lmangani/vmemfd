# vload
experimental `memfd` ELF execution prototype in v

## Goals
- [x] memfd based execution in v
- [ ] self extracting _lambda-like_ serverless function

## Gist
```c
// Read binary ELF
data := os.read_file(filename) or {
  panic('error reading elf $filename')
  return
}

// Allocate a memfd MFD_CLOEXEC and write ELF
fd_id := memfd.vmemfd_new('myapp')
os.fd_write(fd_id, data)	

// Execute w/ arguments from memfd
pointer := '/proc/self/fd/$fd_id'
os.execve(pointer, args, []) or {
  panic('error executing $pointer')
  return
}
```

## Test
Compile an ELF binary expecting args _(or bring your own)_
```bash
v -o app -prod app.v
```

Load and execute ELF using `memdfd` 
```bash
v run vload.v test me
```

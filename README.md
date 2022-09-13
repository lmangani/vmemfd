# vload
experimental `memfd` ELF execution prototype in v

## Goals
- [x] memfd based execution in v
- [ ] self extracting feature for lambda functions

## Gist
```
  // Read binary ELF
  data := os.read_file(filename) or {
		panic('error reading elf $filename')
		return
	}		
  // Allocate a memfd EXEC and write bin
	res := memfd.vmemfd_new('clickhouse')
	os.fd_write(res, data)	
	pointer := '/proc/self/fd/3'
  // Execute w/ arguments from memfd
	os.execve(pointer, args, []) or {
		panic('error executing $pointer')
		return
	}
```

## Test
Compile an ELF binary expecting args _(or bring your own)_
```
v -o app -prod app.v
```

Load and execute ELF using `memdfd` 
```
v run vload.v test me
```

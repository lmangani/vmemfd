# vload
experimental `memfd` ELF execution prototype in v

## Goals
- [x] memfd based execution in v
- [ ] self extracting feature for lambda functions

## Test
Compile an ELF binary expecting args _(or bring your own)_
```
v -o app -prod app.v
```

Load and execute ELF using `memdfd` 
```
v run vload.v test me
```

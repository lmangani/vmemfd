# vload
experimental `memfd` ELF execution prototype in v

## Test
Compile an ELF binary expecting arguments
```
v -o app -prod app.v
```

Load and execute ELF using `memdfd` 
```
v run vload.v test me
```

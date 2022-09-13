import os
import memfd
import compress.zlib

fn main() {
	mut args := os.args.clone()
	args.delete(0)
	if args[0] == 'compress' {
		println('compressing $args.str()')
		compress(args[1])
		return
	} else {
		println('executing $args.str()')
		memexec('clickhouse', args)
		return
	}
}

fn memexec(filename string, args []string) {

	if filename.ends_with('.z') {
	  data := os.read_bytes(filename) or {
		panic('error reading file $filename')
		return
	  }		
	  elf := zlib.decompress(data) or {
                panic('error writing memfd $filename')
                return
          }

	  res := memfd.vmemfd_new('clickhouse.z')
	  os.fd_write(res, elf.bytestr())

	} else {
	  data := os.read_file(filename) or {
		panic('error reading file $filename')
		return
	  }		
	  res := memfd.vmemfd_new('clickhouse')
	  os.fd_write(res, data)
	}		

	pointer := '/proc/self/fd/3'
	os.execve(pointer, args, []) or {
		panic('error executing $pointer')
		return
	}
}

fn compress(filename string) {
	data := os.read_bytes(filename) or {
		panic('error reading file $filename')
		return
	}
	compressed := zlib.compress(data) or {
		panic('error compressing $filename')
		return
	}
	target := filename + '.z'
	os.write_file_array('$target', compressed) or {
		panic('error saving $target')
		return
	}
	println('Compressed $filename to $target')
	return
}

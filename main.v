module main

import memfd

fn main() {
	res := memfd.vmemfd_new('clickhouse')
	println(res)
	// assert res == 1003
}

import os

fn main() {
    mut args := os.args.clone()
    for arg in args {
        println('ENV $arg')
    }
}

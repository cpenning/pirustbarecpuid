libpirustbarecpuid
==================

## Description

A mostly literal translation from C to Rust of the boards/cpuid example from
[dwelch67's Raspberry Pi ARM based bare metal examples.](https://github.com/dwelch67/raspberrypi)
I straight up stole his `vectors.s` (renamed to `boot.S` here) and his `loader` script (I did have
to increase the size of the kernel since I have not _yet_ looked into optimizing the rust
compilation.)

## Prerequisites

I am assuming a Posix style environment such as linux, OS-X or cygwin on Windows. I used Ubuntu for this.

**Set up the Rust cross-compiler**

Install Rust:

`curl https://sh.rustup.rs -sSf | sh`

Install xargo (cargo replacement that simplifies cross-compiling.)

`cargo install xargo`

In this project directory, tell rust to use the nightly builds.

`rustup override set nightly`

And you should be to run `make` at this point.

## Ugliness

If you get an error regarding missing symbols, use `nm` to get the missing symbol name.
My build complained about `undefined reference to 'core::panicking::panic::h93f04452fe9c978c'`
so I tracked it down like this:

```
$ arm-none-eabi-nm target/arm-none-eabihf/debug/libpirustbarecpuid.rlib 2>/dev/null  | grep ' U .*panicking.*panic'
          U _ZN4core9panicking5panic17h93f04452fe9c978cE
```

## History

Project created 2018/02/20, tested on a PiZero WH and an RPi3.
```
$ rustc --version
rustc 1.25.0-nightly (bacb5c58d 2018-01-26)
```

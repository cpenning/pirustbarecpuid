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

Install the arm toolchain (ubuntu version given)

```
sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
sudo apt update
sudo apt install gcc-arm-none-eabi
```

Install Rust:

`curl https://sh.rustup.rs -sSf | sh`

Choose the default when you see the below.

`1) Proceed with installation (default)`

Install xargo (cargo replacement that simplifies cross-compiling.)

```
source $HOME/.cargo/env
cargo install xargo
```

In this project directory, tell rust to use the nightly builds.

`rustup override set nightly`

Install `rust-src`

`rustup component add rust-src`

And you should be to run `make` at this point.

## History

Project created 2018/02/20, tested on a PiZero WH and an RPi3.
```
$ rustc --version
rustc 1.25.0-nightly (bacb5c58d 2018-01-26)
```

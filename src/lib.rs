#![no_std]

extern {
    fn GETCPUID() -> u32;
}

#[no_mangle]
pub extern fn notmain() {
    let id: u32;
    unsafe {
        id = GETCPUID();
    }
}

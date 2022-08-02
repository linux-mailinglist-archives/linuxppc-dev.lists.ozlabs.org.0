Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E08587535
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 03:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxdK76mf1z306l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 11:52:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GVKBjD1E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ojeda@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GVKBjD1E;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxdJS2vQgz2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 11:51:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 544F6CE16F0;
	Tue,  2 Aug 2022 01:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C087AC433D6;
	Tue,  2 Aug 2022 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659405089;
	bh=3xVDpblfOW7CRBHtYe2gNVEKPz4HST8R7lJSNE6BaVE=;
	h=From:To:Cc:Subject:Date:From;
	b=GVKBjD1EJN4dOLawblA1z8mMlS1FDXGh2nbXJ/tOvHoLFcgGwcyIEfnaOnDsfo1ce
	 gNtXgUcCnaFdG2kL6xTigY1xJHR/EvTD2f+fv45wtjK76opvDViK6FgkmkYn++RSSj
	 vU/OlgZV9zEI8z+Vgppc3bWsCWF+QsehqAiVd17dMbAsx7QJAzHBGYcgYgKi/Ax0Mc
	 gCtkFh1ScY2phKKmSeDZQSJh1FWwybHhMK1j2IrTsSmKGbvhNs0odtcK+tOJgtXroU
	 OxnZfC2VWvt2/OTCg6FuqeVyx4SWCVhisFEcI1LURYsHYyxqhxlKqsWzizpNzr9qN6
	 mcmhY+Y9LnIdQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 00/31] Rust support
Date: Tue,  2 Aug 2022 03:49:47 +0200
Message-Id: <20220802015052.10452-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rust support

This is the patch series (v8) to add support for Rust as a second
language to the Linux kernel.

If you are interested in following this effort, please join us in
the mailing list at:

    rust-for-linux@vger.kernel.org

and take a look at the project itself at:

    https://github.com/Rust-for-Linux

As usual, special thanks go to ISRG (Internet Security Research
Group) and Google for their financial support on this endeavor.

Cheers,
Miguel

--

# Rust support

This cover letter explains the major changes and updates done since
the previous ones. For those, please see:

    RFC: https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/
    v1:  https://lore.kernel.org/lkml/20210704202756.29107-1-ojeda@kernel.org/
    v2:  https://lore.kernel.org/lkml/20211206140313.5653-1-ojeda@kernel.org/
    v3:  https://lore.kernel.org/lkml/20220117053349.6804-1-ojeda@kernel.org/
    v4:  https://lore.kernel.org/lkml/20220212130410.6901-1-ojeda@kernel.org/
    v5:  https://lore.kernel.org/lkml/20220317181032.15436-1-ojeda@kernel.org/
    v6:  https://lore.kernel.org/lkml/20220507052451.12890-1-ojeda@kernel.org/
    v7:  https://lore.kernel.org/lkml/20220523020209.11810-1-ojeda@kernel.org/


## Infrastructure updates

There have been several improvements to the overall Rust support:

  - Upgraded toolchain and `alloc` to Rust 1.62.0 from 1.60.0.
    Rust 1.61.0 stabilized `feature(const_fn_trait_bound)` that
    we are using.

  - Moved bindings into their own crate, `bindings`. This greatly
    improves build time when only the `kernel` crate changes (which
    previously contained the bindings).

  - Disabled unused `bindgen`'s layout test generation, which makes
    rust-analyzer significantly faster to run.

  - `bindgen` can now be detected via the `__BINDGEN__` macro, which
    we currently use to workaround an issue with the `btf_type_tag`
    attribute.

  - Reimplemented `concat_idents!` (an unstable standard library
    macro) as a proc macro, which means we no longer rely on
    `feature(concat_idents)`. Furthermore, the proc macro allows
    to refer to local variables.

  - Reimplemented `static_assert!` in a more idiomatic way, now that
    `core::assert!()` is supported in const contexts.

  - Made `build_error!`' work under `RUST_BUILD_ASSERT_{WARN,ALLOW}`
    for modules.

  - Removed `__mulodi4` panicking stub.

  - Added `kernel/configs/rust.config`.

  - Added a (temporary) self-test module for "pure" Rust tests.

  - Changed `.i` macro expanded files to the `.rsi` extension and
    clarified that they are not intended to be compilable.

  - Dropped support for compiling the Rust side with a different
    optimization level than the C side.

  - The Linux/Tux SVG logo (recently upstreamed) is used for
    the generated Rust documentation, instead of the GIF one.
    The `COPYING-logo` file is bundled too.

  - Other cleanups, fixes and improvements.


## Abstractions and driver updates

Some of the improvements to the abstractions and example drivers are:

  - Filesystem support (`fs` module), including:

      + `INode` type (which wraps `struct inode`).
      + `DEntry` type (which wraps `struct dentry`).
      + `Filename` type (which wraps `struct filename`).
      + `Registration` type.
      + `Type` and `Context` traits.
      + `SuperBlock` type (which wraps `struct super_block` and takes
        advantage of typestates for its initialization).
      + File system parameters support (with a `Value` enum; `Spec*`
        and `Constant*` types, `define_fs_params!` macro...).
      + File system flags.
      + `module_fs!` macro to simplify registering kernel modules that
        only implement a single file system.
      + A file system sample.

  - Workqueues support (`workqueue` module), including a `Work` type
    (which wraps `struct work_struct`), a `Queue` type (which wraps
    `struct workqueue_struct`), access to different system queues as
    well as macros to simplify usage, e.g.:

        spawn_work_item!(workqueue::system(), || pr_info!("Hi!\n"))?;

  - More asynchronous support (`kasync` module), including:

      + Executor support (including `Task` and `Executor` traits, a
        `AutoStopHandle` type that automatically stops the executor on
        drop, a `spawn_task!` macro that automatically defines a new
        lockdep lock class...).

      + A workqueue-based executor, which allows to run tasks on
        dedicated or shared thread pools that are managed by existing
        C kernel infrastructure, e.g.:

            let mut handle = Executor::try_new(workqueue::system())?;

            spawn_task!(handle.executor(), async {
                pr_info!("First workqueue task\n");
            })?;

            spawn_task!(handle.executor(), async {
                pr_info!("Second workqueue task\n");
            })?;

            handle.detach();

      + A `yield_now()` function that yields execution of the current
        task so that other ones may execute (but keeps it runnable so
        that it will run again as soon as the executor is available
        again), e.g.:

            async fn example() {
                pr_info!("Before yield\n");
                yield_now().await;
                pr_info!("After yield\n");
            }

      + `AsyncRevocable` type (in the `revocable` module), which
        allows access to objects to be revoked without having to wait
        for existing users to complete. This is useful to drop futures
        in tasks when executors are being torn down.

      + An asynchronous TCP echo server sample.

  - Introduced support for handling interrupts: `[Threaded]Handler`
    traits, `[Threaded]Registration` types, a `Return` enum (as the
    return value from handlers) and flags:

        struct Example;

        impl irq::Handler for Example {
            type Data = Box<u32>;

            fn handle_irq(_data: &u32) -> irq::Return {
                irq::Return::None
            }
        }

        fn request_irq(irq: u32, data: Box<u32>)
          -> Result<irq::Registration<Example>> {
            irq::Registration::try_new(
                irq, data, irq::flags::SHARED,
                fmt!("example_{irq}")
            )
        }

  - Introduced the `#[vtable]` proc macro attribute to simplify how
    function pointer tables like `struct file_operations` are used
    by Rust kernel modules.

    Previously, users had to call a `declare_*_operations!` macro
    which required passing the defined operations:

        impl file::Operations for SomeFile {
            ...
            declare_file_operations!(read, write, ioctl, ...);
            ...
        }

    Instead, now it is only required that they annotate the `impl`
    block with the attribute:

        #[vtable]
        impl file::Operations for SomeFile {
            ...
        }

    The proc macro will generate a boolean `HAS_*` associated constant
    for each method in the trait, indicating if the implementer has
    overridden a method.

  - Added `unsafe_list::List`, an intrusive circular doubly-linked
    list, meant to be used as the basis for other linked lists.

    It is also used in the workqueue-based executor to keep track of
    all tasks since it is cheaper than other options.

  - Initial RCU support: a `Guard` type that represents evidence that
    the RCU read side lock is held on the current thread/CPU.

    In addition, `Revocable` now uses this new abstraction so that
    users can provide evidence of the RCU read side lock being held
    when accessing the protected object, e.g.:

        fn add_pair(value: &Revocable<(u32, u32)>) -> Option<u32> {
            let guard = rcu::read_lock();
            let pair = value.try_access_with_guard(&guard)?;
            Some(pair.0 + pair.1)
        }

  - Added `StaticRef` which allows the creation of "reference-counted"
    globals; i.e. allows to define static variables that can be used
    when `Ref<T>` or `RefBorrow<'_, T>` are expected.

    This, in turn, allows to have functions that return shared
    resources (e.g. a global workqueue) without allocations (the
    shared object is statically allocated).

  - Added `Task::spawn()` function to create and automatically run
    kernel threads easily, e.g.:

        for i in 0..10 {
            Task::spawn(fmt!("test{i}"), threadfn).unwrap();
        }

  - Added `Task::wake_up()` method.

  - Converted `Task` to use `ARef` to unify the usage of all
    ref-counted C structures.

  - Initial support for delays/sleeps (`delay` module) with a basic
    `coarse_sleep()` function that wraps the C side `msleep()` and
    takes advantage of the `Duration` standard library type:

        coarse_sleep(Duration::from_millis(20));

  - Added file flags (to further reduce `bindings::*` usage), e.g.:

        let blocking = (file.flags() & file::flags::O_NONBLOCK) == 0;

  - Added `gpio_chip_register!` and `gpio_irq_chip_register!` macros
    which automatically define the required lock classes.

  - Removal of `bindings::lock_class_key` from drivers. This gets us
    closer to eventually make bindings private to the `kernel` crate.

  - Moved usage of `ManuallyDrop` to `MaybeUninit` in `Revocable`,
    which was unsound.

  - Other cleanups, fixes and improvements.


## Patch series updates

The patch series has been reorganized a bit since last time:

  - The `include/linux/` changes for the C helpers have been moved
    into their own small patches, which can be taken independently
    as prerequisite patches if needed.

  - Now that the bindings are in their own `bindings` crate,
    they also get their own patch.

  - There is a new patch that adds the `kernel/configs/rust.config`.

  - One of the `kallsyms` patches has been split into three smaller
    ones.

  - Cleaned up some "exceeds 100 columns" `checkpatch.pl` warnings.
    With this final cleanup, the remaining warnings (of all kinds)
    are either false positives, or cannot be changed without diverging
    with upstream `alloc` or would make things look worse.


## Patch series status

The Rust support is still to be considered experimental. However,
support is good enough that kernel developers can start working on the
Rust abstractions for subsystems and write drivers and other modules.

The current series will appear in the next `linux-next`, as usual.
Similarly, the preview docs for this series can be seen at:

    https://rust-for-linux.github.io/docs/kernel/

As usual, please see the following link for the live list of unstable
Rust features we are using:

    https://github.com/Rust-for-Linux/linux/issues/2


## Conferences, meetings and liaisons

Join us in LPC 2022 (Linux Plumbers Conference) for the Rust MC
(microconference)! The schedule is available at:

    https://lpc.events/event/16/sessions/150/

We will be talking about GCC Rust (the Rust frontend for GCC),
`rustc_codegen_gcc` (the GCC backend for `rustc`), Rust for Linux,
the Rust NVMe driver, the integration of Rust with the Kernel Testing
Service and Rust in the Kernel (via eBPF).

In addition, I would like to personally thank Google and ISRG
(Internet Security Research Group) for sponsoring Kangrejos,
the Rust for Linux workshop:

    https://kangrejos.com

Furthermore, we would like to thank the venues we were invited to:

  - Linux Foundation Live Mentorship Series
  - Open Source Summit North America
  - Huawei Global Software Technology Summit


## Related news

The GCC Steering Committee accepted the contribution of the Rust
frontend (GCC Rust). Its first released version (experimental,
disabled by default) should appear in GCC 13. The first round of
patches has been posted to the gcc-patches mailing list.

`rustc_codegen_gcc` (the GCC backend for `rustc`) has seen enough
progress on SIMD support to compile `stdarch`. In addition, more
prerequisite patches are making their way into GCC.


## Acknowledgements

The signatures in the main commits correspond to the people that
wrote code that has ended up in them at the present time. For details
on contributions to code and discussions, please see our repository:

    https://github.com/Rust-for-Linux/linux

However, we would like to give credit to everyone that has contributed
in one way or another to the Rust for Linux project. Since the
previous cover letter:

  - Nick Desaulniers, Joe Perches, Masahiro Yamada and Jarkko Sakkinen
    for their reviews of some of the v7 patches.

  - Daniel Latypov, Brendan Higgins and Shuah Khan for picking up
    the KUnit prerequisite patch.

  - As usual, Björn Roy Baron (bjorn3) and Gary Guo for all the input
    on Rust compiler details, reviews and suggestions.

  - Andreas Hindborg for working on the NVMe driver, as well as
    adding atomic allocations for `Box` and allowing to use GFP flags
    for `KernelAllocator`.

  - Li Hongyu for working on a virtio abstraction.

  - Boqun Feng for working on adding an alloc alignment test.

  - Andreas Reindl for working on adding missing `SAFETY` comments.

  - Anhad Singh for working on adding the `new_with_flags` method
    to `Pages`.

  - Finn Behrens for working on making it possible to compile
    the kernel on macOS with Rust enabled.

  - Roel Kluin for working on code refactorings.

  - Wei Liu for taking the time to answer questions from newcomers
    in Zulip.

  - Philip Li, Yujie Liu et al. for continuing their work on adding
    Rust support to the Intel 0DAY/LKP kernel test robot.

  - Philip Herron and Arthur Cohen (and his supporters Open Source
    Security and Embecosm) et al. for their ongoing work on GCC Rust.

  - Antoni Boucher (and his supporters) et al. for their ongoing
    work on `rustc_codegen_gcc`.

  - Emilio Cobos Álvarez et. al. for their work on `bindgen`,
    including on issues that affect the kernel.

  - Mats Larsen, Marc Poulhiès et al. for their ongoing work on
    improving Rust support in Compiler Explorer.

  - Many folks that have reported issues, tested the project,
    helped spread the word, joined discussions and contributed in
    other ways!

Please see also the acknowledgements on the previous cover letters.


Boqun Feng (2):
  kallsyms: use `sizeof` instead of hardcoded size
  kallsyms: avoid hardcoding buffer size

Gary Guo (2):
  rust: add `build_error` crate
  vsprintf: add new `%pA` format specifier

Miguel Ojeda (19):
  kallsyms: add static relationship between `KSYM_NAME_LEN{,_BUFFER}`
  kallsyms: support "big" kernel symbols
  kallsyms: increase maximum kernel symbol length to 512
  rust: add C helpers
  rust: add `compiler_builtins` crate
  rust: import upstream `alloc` crate
  rust: adapt `alloc` crate to the kernel
  rust: add `macros` crate
  rust: add `bindings` crate
  rust: export generated symbols
  scripts: checkpatch: diagnose uses of `%pA` in the C side as errors
  scripts: checkpatch: enable language-independent checks for Rust
  scripts: add `rustdoc_test_{builder,gen}.py` scripts
  scripts: add `generate_rust_analyzer.py` scripts
  scripts: decode_stacktrace: demangle Rust symbols
  docs: add Rust documentation
  Kbuild: add Rust support
  samples: add Rust examples
  MAINTAINERS: Rust

Wedson Almeida Filho (8):
  workqueue: introduce `__INIT_WORK_WITH_KEY`
  locking/spinlock: introduce `__spin_lock_init`
  locking/spinlock: introduce `_raw_spin_lock_init`
  rust: add `kernel` crate's `sync` module
  rust: add `kernel` crate
  configs: add `rust` config
  [RFC] drivers: gpio: PrimeCell PL061 in Rust
  [RFC] drivers: android: Binder IPC in Rust

 .gitignore                                   |    6 +
 .rustfmt.toml                                |   12 +
 Documentation/core-api/printk-formats.rst    |   10 +
 Documentation/doc-guide/kernel-doc.rst       |    3 +
 Documentation/index.rst                      |    1 +
 Documentation/kbuild/kbuild.rst              |   17 +
 Documentation/kbuild/makefiles.rst           |   50 +-
 Documentation/process/changes.rst            |   41 +
 Documentation/rust/arch-support.rst          |   23 +
 Documentation/rust/coding-guidelines.rst     |  216 ++
 Documentation/rust/general-information.rst   |   79 +
 Documentation/rust/index.rst                 |   22 +
 Documentation/rust/quick-start.rst           |  232 ++
 MAINTAINERS                                  |   15 +
 Makefile                                     |  172 +-
 arch/Kconfig                                 |    6 +
 arch/arm/Kconfig                             |    1 +
 arch/arm64/Kconfig                           |    1 +
 arch/powerpc/Kconfig                         |    1 +
 arch/riscv/Kconfig                           |    1 +
 arch/riscv/Makefile                          |    5 +
 arch/um/Kconfig                              |    1 +
 arch/x86/Kconfig                             |    1 +
 arch/x86/Makefile                            |   10 +
 drivers/android/Kconfig                      |    6 +
 drivers/android/Makefile                     |    2 +
 drivers/android/allocation.rs                |  266 ++
 drivers/android/context.rs                   |   80 +
 drivers/android/defs.rs                      |   99 +
 drivers/android/node.rs                      |  476 +++
 drivers/android/process.rs                   |  961 +++++
 drivers/android/range_alloc.rs               |  189 +
 drivers/android/rust_binder.rs               |  106 +
 drivers/android/thread.rs                    |  871 +++++
 drivers/android/transaction.rs               |  326 ++
 drivers/gpio/Kconfig                         |    8 +
 drivers/gpio/Makefile                        |    1 +
 drivers/gpio/gpio_pl061_rust.rs              |  367 ++
 include/linux/compiler_types.h               |    6 +-
 include/linux/kallsyms.h                     |    2 +-
 include/linux/spinlock.h                     |   17 +-
 include/linux/workqueue.h                    |   21 +-
 include/uapi/linux/android/binder.h          |   30 +-
 init/Kconfig                                 |   46 +-
 kernel/configs/rust.config                   |    1 +
 kernel/kallsyms.c                            |   26 +-
 kernel/livepatch/core.c                      |    4 +-
 lib/Kconfig.debug                            |   82 +
 lib/vsprintf.c                               |   13 +
 rust/.gitignore                              |   10 +
 rust/Makefile                                |  415 +++
 rust/alloc/README.md                         |   33 +
 rust/alloc/alloc.rs                          |  440 +++
 rust/alloc/borrow.rs                         |  498 +++
 rust/alloc/boxed.rs                          | 2026 +++++++++++
 rust/alloc/boxed/thin.rs                     |  219 ++
 rust/alloc/collections/mod.rs                |  156 +
 rust/alloc/ffi/c_str.rs                      | 1203 ++++++
 rust/alloc/ffi/mod.rs                        |   93 +
 rust/alloc/fmt.rs                            |  614 ++++
 rust/alloc/lib.rs                            |  239 ++
 rust/alloc/macros.rs                         |  128 +
 rust/alloc/raw_vec.rs                        |  567 +++
 rust/alloc/slice.rs                          | 1295 +++++++
 rust/alloc/str.rs                            |  641 ++++
 rust/alloc/string.rs                         | 2944 +++++++++++++++
 rust/alloc/vec/drain.rs                      |  186 +
 rust/alloc/vec/drain_filter.rs               |  145 +
 rust/alloc/vec/into_iter.rs                  |  365 ++
 rust/alloc/vec/is_zero.rs                    |  120 +
 rust/alloc/vec/mod.rs                        | 3420 ++++++++++++++++++
 rust/alloc/vec/partial_eq.rs                 |   49 +
 rust/alloc/vec/set_len_on_drop.rs            |   30 +
 rust/alloc/vec/spec_extend.rs                |  174 +
 rust/bindgen_parameters                      |   21 +
 rust/bindings/bindings_helper.h              |   49 +
 rust/bindings/lib.rs                         |   57 +
 rust/build_error.rs                          |   29 +
 rust/compiler_builtins.rs                    |   79 +
 rust/exports.c                               |   21 +
 rust/helpers.c                               |  679 ++++
 rust/kernel/allocator.rs                     |   64 +
 rust/kernel/amba.rs                          |  261 ++
 rust/kernel/build_assert.rs                  |   83 +
 rust/kernel/chrdev.rs                        |  206 ++
 rust/kernel/clk.rs                           |   79 +
 rust/kernel/cred.rs                          |   46 +
 rust/kernel/delay.rs                         |  104 +
 rust/kernel/device.rs                        |  527 +++
 rust/kernel/driver.rs                        |  442 +++
 rust/kernel/error.rs                         |  564 +++
 rust/kernel/file.rs                          |  887 +++++
 rust/kernel/fs.rs                            |  846 +++++
 rust/kernel/fs/param.rs                      |  553 +++
 rust/kernel/gpio.rs                          |  505 +++
 rust/kernel/hwrng.rs                         |  210 ++
 rust/kernel/io_buffer.rs                     |  153 +
 rust/kernel/io_mem.rs                        |  278 ++
 rust/kernel/iov_iter.rs                      |   81 +
 rust/kernel/irq.rs                           |  681 ++++
 rust/kernel/kasync.rs                        |   50 +
 rust/kernel/kasync/executor.rs               |  154 +
 rust/kernel/kasync/executor/workqueue.rs     |  291 ++
 rust/kernel/kasync/net.rs                    |  322 ++
 rust/kernel/kunit.rs                         |   91 +
 rust/kernel/lib.rs                           |  267 ++
 rust/kernel/linked_list.rs                   |  247 ++
 rust/kernel/miscdev.rs                       |  290 ++
 rust/kernel/mm.rs                            |  149 +
 rust/kernel/module_param.rs                  |  499 +++
 rust/kernel/net.rs                           |  392 ++
 rust/kernel/net/filter.rs                    |  447 +++
 rust/kernel/of.rs                            |   63 +
 rust/kernel/pages.rs                         |  144 +
 rust/kernel/platform.rs                      |  223 ++
 rust/kernel/power.rs                         |  118 +
 rust/kernel/prelude.rs                       |   36 +
 rust/kernel/print.rs                         |  406 +++
 rust/kernel/random.rs                        |   42 +
 rust/kernel/raw_list.rs                      |  361 ++
 rust/kernel/rbtree.rs                        |  563 +++
 rust/kernel/revocable.rs                     |  425 +++
 rust/kernel/security.rs                      |   38 +
 rust/kernel/static_assert.rs                 |   34 +
 rust/kernel/std_vendor.rs                    |  161 +
 rust/kernel/str.rs                           |  597 +++
 rust/kernel/sync.rs                          |  169 +
 rust/kernel/sync/arc.rs                      |  582 +++
 rust/kernel/sync/condvar.rs                  |  140 +
 rust/kernel/sync/guard.rs                    |  159 +
 rust/kernel/sync/locked_by.rs                |  111 +
 rust/kernel/sync/mutex.rs                    |  149 +
 rust/kernel/sync/nowait.rs                   |  188 +
 rust/kernel/sync/rcu.rs                      |   52 +
 rust/kernel/sync/revocable.rs                |  246 ++
 rust/kernel/sync/rwsem.rs                    |  196 +
 rust/kernel/sync/seqlock.rs                  |  201 +
 rust/kernel/sync/smutex.rs                   |  290 ++
 rust/kernel/sync/spinlock.rs                 |  357 ++
 rust/kernel/sysctl.rs                        |  199 +
 rust/kernel/task.rs                          |  239 ++
 rust/kernel/types.rs                         |  705 ++++
 rust/kernel/unsafe_list.rs                   |  680 ++++
 rust/kernel/user_ptr.rs                      |  175 +
 rust/kernel/workqueue.rs                     |  512 +++
 rust/macros/concat_idents.rs                 |   23 +
 rust/macros/helpers.rs                       |   79 +
 rust/macros/lib.rs                           |  191 +
 rust/macros/module.rs                        |  655 ++++
 rust/macros/vtable.rs                        |   95 +
 samples/Kconfig                              |    2 +
 samples/Makefile                             |    1 +
 samples/rust/Kconfig                         |  165 +
 samples/rust/Makefile                        |   19 +
 samples/rust/hostprogs/.gitignore            |    3 +
 samples/rust/hostprogs/Makefile              |    5 +
 samples/rust/hostprogs/a.rs                  |    7 +
 samples/rust/hostprogs/b.rs                  |    5 +
 samples/rust/hostprogs/single.rs             |   12 +
 samples/rust/rust_chrdev.rs                  |   49 +
 samples/rust/rust_echo_server.rs             |   60 +
 samples/rust/rust_fs.rs                      |   59 +
 samples/rust/rust_minimal.rs                 |   35 +
 samples/rust/rust_miscdev.rs                 |  142 +
 samples/rust/rust_module_parameters.rs       |   69 +
 samples/rust/rust_netfilter.rs               |   54 +
 samples/rust/rust_platform.rs                |   22 +
 samples/rust/rust_print.rs                   |   54 +
 samples/rust/rust_random.rs                  |   60 +
 samples/rust/rust_selftests.rs               |   99 +
 samples/rust/rust_semaphore.rs               |  170 +
 samples/rust/rust_semaphore_c.c              |  212 ++
 samples/rust/rust_stack_probing.rs           |   36 +
 samples/rust/rust_sync.rs                    |   93 +
 scripts/.gitignore                           |    1 +
 scripts/Kconfig.include                      |    6 +-
 scripts/Makefile                             |    3 +
 scripts/Makefile.build                       |   60 +
 scripts/Makefile.debug                       |   10 +
 scripts/Makefile.host                        |   34 +-
 scripts/Makefile.lib                         |   12 +
 scripts/Makefile.modfinal                    |    8 +-
 scripts/cc-version.sh                        |   12 +-
 scripts/checkpatch.pl                        |   12 +-
 scripts/decode_stacktrace.sh                 |   14 +
 scripts/generate_rust_analyzer.py            |  141 +
 scripts/generate_rust_target.rs              |  232 ++
 scripts/is_rust_module.sh                    |   16 +
 scripts/kallsyms.c                           |   47 +-
 scripts/kconfig/confdata.c                   |   75 +
 scripts/min-tool-version.sh                  |    6 +
 scripts/rust-is-available-bindgen-libclang.h |    2 +
 scripts/rust-is-available.sh                 |  160 +
 scripts/rustdoc_test_builder.py              |   59 +
 scripts/rustdoc_test_gen.py                  |  164 +
 tools/include/linux/kallsyms.h               |    2 +-
 tools/lib/perf/include/perf/event.h          |    2 +-
 tools/lib/symbol/kallsyms.h                  |    2 +-
 198 files changed, 43688 insertions(+), 75 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 Documentation/rust/arch-support.rst
 create mode 100644 Documentation/rust/coding-guidelines.rst
 create mode 100644 Documentation/rust/general-information.rst
 create mode 100644 Documentation/rust/index.rst
 create mode 100644 Documentation/rust/quick-start.rst
 create mode 100644 drivers/android/allocation.rs
 create mode 100644 drivers/android/context.rs
 create mode 100644 drivers/android/defs.rs
 create mode 100644 drivers/android/node.rs
 create mode 100644 drivers/android/process.rs
 create mode 100644 drivers/android/range_alloc.rs
 create mode 100644 drivers/android/rust_binder.rs
 create mode 100644 drivers/android/thread.rs
 create mode 100644 drivers/android/transaction.rs
 create mode 100644 drivers/gpio/gpio_pl061_rust.rs
 create mode 100644 kernel/configs/rust.config
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/alloc/README.md
 create mode 100644 rust/alloc/alloc.rs
 create mode 100644 rust/alloc/borrow.rs
 create mode 100644 rust/alloc/boxed.rs
 create mode 100644 rust/alloc/boxed/thin.rs
 create mode 100644 rust/alloc/collections/mod.rs
 create mode 100644 rust/alloc/ffi/c_str.rs
 create mode 100644 rust/alloc/ffi/mod.rs
 create mode 100644 rust/alloc/fmt.rs
 create mode 100644 rust/alloc/lib.rs
 create mode 100644 rust/alloc/macros.rs
 create mode 100644 rust/alloc/raw_vec.rs
 create mode 100644 rust/alloc/slice.rs
 create mode 100644 rust/alloc/str.rs
 create mode 100644 rust/alloc/string.rs
 create mode 100644 rust/alloc/vec/drain.rs
 create mode 100644 rust/alloc/vec/drain_filter.rs
 create mode 100644 rust/alloc/vec/into_iter.rs
 create mode 100644 rust/alloc/vec/is_zero.rs
 create mode 100644 rust/alloc/vec/mod.rs
 create mode 100644 rust/alloc/vec/partial_eq.rs
 create mode 100644 rust/alloc/vec/set_len_on_drop.rs
 create mode 100644 rust/alloc/vec/spec_extend.rs
 create mode 100644 rust/bindgen_parameters
 create mode 100644 rust/bindings/bindings_helper.h
 create mode 100644 rust/bindings/lib.rs
 create mode 100644 rust/build_error.rs
 create mode 100644 rust/compiler_builtins.rs
 create mode 100644 rust/exports.c
 create mode 100644 rust/helpers.c
 create mode 100644 rust/kernel/allocator.rs
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/build_assert.rs
 create mode 100644 rust/kernel/chrdev.rs
 create mode 100644 rust/kernel/clk.rs
 create mode 100644 rust/kernel/cred.rs
 create mode 100644 rust/kernel/delay.rs
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/driver.rs
 create mode 100644 rust/kernel/error.rs
 create mode 100644 rust/kernel/file.rs
 create mode 100644 rust/kernel/fs.rs
 create mode 100644 rust/kernel/fs/param.rs
 create mode 100644 rust/kernel/gpio.rs
 create mode 100644 rust/kernel/hwrng.rs
 create mode 100644 rust/kernel/io_buffer.rs
 create mode 100644 rust/kernel/io_mem.rs
 create mode 100644 rust/kernel/iov_iter.rs
 create mode 100644 rust/kernel/irq.rs
 create mode 100644 rust/kernel/kasync.rs
 create mode 100644 rust/kernel/kasync/executor.rs
 create mode 100644 rust/kernel/kasync/executor/workqueue.rs
 create mode 100644 rust/kernel/kasync/net.rs
 create mode 100644 rust/kernel/kunit.rs
 create mode 100644 rust/kernel/lib.rs
 create mode 100644 rust/kernel/linked_list.rs
 create mode 100644 rust/kernel/miscdev.rs
 create mode 100644 rust/kernel/mm.rs
 create mode 100644 rust/kernel/module_param.rs
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/filter.rs
 create mode 100644 rust/kernel/of.rs
 create mode 100644 rust/kernel/pages.rs
 create mode 100644 rust/kernel/platform.rs
 create mode 100644 rust/kernel/power.rs
 create mode 100644 rust/kernel/prelude.rs
 create mode 100644 rust/kernel/print.rs
 create mode 100644 rust/kernel/random.rs
 create mode 100644 rust/kernel/raw_list.rs
 create mode 100644 rust/kernel/rbtree.rs
 create mode 100644 rust/kernel/revocable.rs
 create mode 100644 rust/kernel/security.rs
 create mode 100644 rust/kernel/static_assert.rs
 create mode 100644 rust/kernel/std_vendor.rs
 create mode 100644 rust/kernel/str.rs
 create mode 100644 rust/kernel/sync.rs
 create mode 100644 rust/kernel/sync/arc.rs
 create mode 100644 rust/kernel/sync/condvar.rs
 create mode 100644 rust/kernel/sync/guard.rs
 create mode 100644 rust/kernel/sync/locked_by.rs
 create mode 100644 rust/kernel/sync/mutex.rs
 create mode 100644 rust/kernel/sync/nowait.rs
 create mode 100644 rust/kernel/sync/rcu.rs
 create mode 100644 rust/kernel/sync/revocable.rs
 create mode 100644 rust/kernel/sync/rwsem.rs
 create mode 100644 rust/kernel/sync/seqlock.rs
 create mode 100644 rust/kernel/sync/smutex.rs
 create mode 100644 rust/kernel/sync/spinlock.rs
 create mode 100644 rust/kernel/sysctl.rs
 create mode 100644 rust/kernel/task.rs
 create mode 100644 rust/kernel/types.rs
 create mode 100644 rust/kernel/unsafe_list.rs
 create mode 100644 rust/kernel/user_ptr.rs
 create mode 100644 rust/kernel/workqueue.rs
 create mode 100644 rust/macros/concat_idents.rs
 create mode 100644 rust/macros/helpers.rs
 create mode 100644 rust/macros/lib.rs
 create mode 100644 rust/macros/module.rs
 create mode 100644 rust/macros/vtable.rs
 create mode 100644 samples/rust/Kconfig
 create mode 100644 samples/rust/Makefile
 create mode 100644 samples/rust/hostprogs/.gitignore
 create mode 100644 samples/rust/hostprogs/Makefile
 create mode 100644 samples/rust/hostprogs/a.rs
 create mode 100644 samples/rust/hostprogs/b.rs
 create mode 100644 samples/rust/hostprogs/single.rs
 create mode 100644 samples/rust/rust_chrdev.rs
 create mode 100644 samples/rust/rust_echo_server.rs
 create mode 100644 samples/rust/rust_fs.rs
 create mode 100644 samples/rust/rust_minimal.rs
 create mode 100644 samples/rust/rust_miscdev.rs
 create mode 100644 samples/rust/rust_module_parameters.rs
 create mode 100644 samples/rust/rust_netfilter.rs
 create mode 100644 samples/rust/rust_platform.rs
 create mode 100644 samples/rust/rust_print.rs
 create mode 100644 samples/rust/rust_random.rs
 create mode 100644 samples/rust/rust_selftests.rs
 create mode 100644 samples/rust/rust_semaphore.rs
 create mode 100644 samples/rust/rust_semaphore_c.c
 create mode 100644 samples/rust/rust_stack_probing.rs
 create mode 100644 samples/rust/rust_sync.rs
 create mode 100755 scripts/generate_rust_analyzer.py
 create mode 100644 scripts/generate_rust_target.rs
 create mode 100755 scripts/is_rust_module.sh
 create mode 100644 scripts/rust-is-available-bindgen-libclang.h
 create mode 100755 scripts/rust-is-available.sh
 create mode 100755 scripts/rustdoc_test_builder.py
 create mode 100755 scripts/rustdoc_test_gen.py


base-commit: 3d7cb6b04c3f3115719235cc6866b10326de34cd
-- 
2.37.1


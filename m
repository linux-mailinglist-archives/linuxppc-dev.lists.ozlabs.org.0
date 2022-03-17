Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8794DCD43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 19:11:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKFb92JRwz30Qv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 05:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vLjaZJax;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=ojeda@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vLjaZJax; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKFZT51mDz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 05:11:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73AEC6163F;
 Thu, 17 Mar 2022 18:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AA2C340E9;
 Thu, 17 Mar 2022 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647540670;
 bh=XdgzuXN9aeiZfb9/RrTbmUugTKoTTSFNgHTlI0iJos8=;
 h=From:To:Cc:Subject:Date:From;
 b=vLjaZJaxmo531Mi1n7H19XJu/GxO5162QeJ+FG/vMCecmulIudwOj8+3iCDM7DoMN
 q0tbyyarTHDi2WBOlOc17afP30b27KMTQMECxxaWv0pOkVzqDCSf3KgxcIi9z3eaJH
 KnI8iZBnnG/sR7sHpdY0c9aj+rlaqCjb+aYg3ZSBKkQF6VtKwX9prE6UaRuYBtIZ4I
 5C47ZsXGaeJ0WLvBFCkwIlS0K9OJWKnhNUHmVNdnwKIXksy0ltCXIwXr6vRPMPFlMe
 SzEGR8a6tnPSeH9iMqNOKZOvYMmr/nia1eGYzFZLOf0Aytdk3DArm8eaE4mphDaXfX
 qV3YLz3aYwiMw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 00/20] Rust support
Date: Thu, 17 Mar 2022 19:09:48 +0100
Message-Id: <20220317181032.15436-1-ojeda@kernel.org>
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
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rust support

This is the patch series (v5) to add support for Rust as a second
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


## Infrastructure updates

There have been several improvements to the overall Rust support:

  - The toolchain and `alloc` have been upgraded to Rust 1.59.0.
    This version stabilized `feature(global_asm)` as well as
    the `-Csymbol-mangling-version=v0` flag.

  - Added support for host programs written in Rust. This should
    only be used in scenarios where Rust is required to be available.

  - Target specification files are now generated on the fly based
    on the kernel configuration, via a Rust script, instead of
    having a few predefined files.

    The content of the generated file has been simplified and,
    for x86, all the options that can be specified through the
    command-line have been moved to the architecture `Makefile`.

    The goal is to reduce the content of the file as much as possible
    for all architectures, and eventually, stop needing such a file.

  - Added `HAVE_RUST` kernel option. This symbol should be selected
    by an architecture if it supports Rust.

  - Added documentation on `RUSTFLAGS*` and `KBUILD_RUST*` variables.

  - Simplified tags and cross-references in the documentation.

  - Other cleanups, fixes and improvements on the build system.


## Abstractions and driver updates

Some of the improvements to the abstractions and example drivers are:

  - Added abstraction for the Hardware Random Number Generator.

  - `%pA` rework in `vsprintf` following the review.

  - The `sync` sample now shows how to use static mutexes and
    conditional variables.

  - Error codes can now be used without prefixing them with
    `Error::`, which makes using them closer to C. For instance:

        fn f(...) -> Result {
            if ... {
                return Err(EINVAL);
            }
            ...
            Ok(())
        }

  - Added `CString` type for owned C strings.

  - `miscdev` registration now holds an owned C string, which enables
    scenarios when the device name is constructed at runtime.

  - Added `Bool` trait meant to be used in type states to allow
    boolean constraints in implementation blocks.

  - Added `LockInfo` trait that lock "type states" must implement.
    This allows the definition of additional writable type states.

  - Simplification of the spin lock implementation by splitting
    acquisition types. Type states are used to implement two versions
    of the `Lock` trait: one which never modifies the interrupt state
    and one that disables them (if they are enabled, then re-enables
    on unlock).

  - `Result::unwrap` can now be used in examples that are compiled,
    linked and run.

  - Merged `Formatter` and `Buffer` types.

  - Added `IoMem::offset_ok` for runtime sizes.

  - Other cleanups, fixes and improvements.


## Patch series status

The Rust support is still to be considered experimental. However,
support is good enough that kernel developers can start working on the
Rust abstractions for subsystems and write drivers and other modules.

The current series has just arrived in `linux-next`, as usual.
Similarly, the preview docs for this series can be seen at:

    https://rust-for-linux.github.io/docs/kernel/

As usual, please see the following link for the
live list of unstable Rust features we are using:

    https://github.com/Rust-for-Linux/linux/issues/2

Note that this time the series depends on a patch queued in
powerpc-next:

    https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=d4be60fe66b7380530868ceebe549f8eebccacc5


## Acknowledgements

The signatures in the main commits correspond to the people that
wrote code that has ended up in them at the present time. For details
on contributions to code and discussions, please see our repository:

    https://github.com/Rust-for-Linux/linux

However, we would like to give credit to everyone that has contributed
in one way or another to the Rust for Linux project. Since the
previous cover letter:

  - Akira Yokosawa for a detailed review of the documentation and
    suggesting several improvements.

  - Petr Mladek and Rasmus Villemoes for their printing/formatting
    review and suggestions.

  - Russell King for his review of the Kconfig changes.

  - Andy Shevchenko, Sergey Senozhatsky, John Paul Adrian Glaubitz
    and David Laight for their reviews and feedback on the previous
    round.

  - bjorn3 for reviewing many PRs.

  - As usual, bjorn3 and Gary Guo for all the input on Rust compiler
    details and suggestions.

  - Philip Li, Yujie Liu et al. for continuing their work on adding
    Rust support to the Intel 0DAY/LKP kernel test robot. Also,
    thanks to Nathan Chancellor and Nick Desaulniers for their input.

  - Wei Liu for taking the time to answer questions from newcomers
    in Zulip.

  - Antoni Boucher (and his supporters) et al. for their ongoing
    work on `rustc_codegen_gcc`.

  - Philip Herrons (and his supporters Open Source Security and
    Embecosm) et al. for their ongoing work on GCC Rust.

  - Mats Larsen, Marc Poulhiès et al. for their ongoing work on
    improving Rust support in Compiler Explorer.

  - Many folks that have reported issues, tested the project,
    helped spread the word, joined discussions and contributed in
    other ways!

Please see also the acknowledgements on the previous cover letters.

Boqun Feng (1):
  kallsyms: use the correct buffer size for symbols

Gary Guo (2):
  rust: add `build_error` crate
  vsprintf: add new `%pA` format specifier

Miguel Ojeda (13):
  kallsyms: support "big" kernel symbols
  kallsyms: increase maximum kernel symbol length to 512
  rust: add C helpers
  rust: add `compiler_builtins` crate
  rust: add `alloc` crate
  rust: add `macros` crate
  rust: export generated symbols
  scripts: add `generate_rust_analyzer.py`
  scripts: decode_stacktrace: demangle Rust symbols
  docs: add Rust documentation
  Kbuild: add Rust support
  samples: add Rust examples
  MAINTAINERS: Rust

Wedson Almeida Filho (4):
  rust: add `kernel` crate's `sync` module
  rust: add `kernel` crate
  [RFC] drivers: gpio: PrimeCell PL061 in Rust
  [RFC] drivers: android: Binder IPC in Rust

 .gitignore                                   |    5 +
 .rustfmt.toml                                |   12 +
 Documentation/doc-guide/kernel-doc.rst       |    3 +
 Documentation/index.rst                      |    1 +
 Documentation/kbuild/kbuild.rst              |   17 +
 Documentation/kbuild/makefiles.rst           |   50 +-
 Documentation/process/changes.rst            |   41 +
 Documentation/rust/arch-support.rst          |   34 +
 Documentation/rust/coding-guidelines.rst     |  214 ++
 Documentation/rust/general-information.rst   |   77 +
 Documentation/rust/index.rst                 |   20 +
 Documentation/rust/logo.svg                  |  357 ++
 Documentation/rust/quick-start.rst           |  230 ++
 MAINTAINERS                                  |   15 +
 Makefile                                     |  173 +-
 arch/Kconfig                                 |    6 +
 arch/arm/Kconfig                             |    1 +
 arch/arm64/Kconfig                           |    1 +
 arch/powerpc/Kconfig                         |    1 +
 arch/riscv/Kconfig                           |    1 +
 arch/riscv/Makefile                          |    5 +
 arch/x86/Kconfig                             |    1 +
 arch/x86/Makefile                            |   14 +
 drivers/android/Kconfig                      |    6 +
 drivers/android/Makefile                     |    2 +
 drivers/android/allocation.rs                |  266 ++
 drivers/android/context.rs                   |   80 +
 drivers/android/defs.rs                      |   99 +
 drivers/android/node.rs                      |  476 +++
 drivers/android/process.rs                   |  960 +++++
 drivers/android/range_alloc.rs               |  189 +
 drivers/android/rust_binder.rs               |  111 +
 drivers/android/thread.rs                    |  870 +++++
 drivers/android/transaction.rs               |  326 ++
 drivers/gpio/Kconfig                         |    8 +
 drivers/gpio/Makefile                        |    1 +
 drivers/gpio/gpio_pl061_rust.rs              |  370 ++
 include/linux/kallsyms.h                     |    2 +-
 include/linux/spinlock.h                     |   17 +-
 include/uapi/linux/android/binder.h          |   28 +-
 init/Kconfig                                 |   44 +-
 kernel/kallsyms.c                            |   26 +-
 kernel/livepatch/core.c                      |    4 +-
 lib/Kconfig.debug                            |  143 +
 lib/vsprintf.c                               |   13 +
 rust/.gitignore                              |    8 +
 rust/Makefile                                |  376 ++
 rust/alloc/README.md                         |   32 +
 rust/alloc/alloc.rs                          |  440 +++
 rust/alloc/borrow.rs                         |  498 +++
 rust/alloc/boxed.rs                          | 2008 +++++++++++
 rust/alloc/collections/mod.rs                |  156 +
 rust/alloc/fmt.rs                            |  601 ++++
 rust/alloc/lib.rs                            |  231 ++
 rust/alloc/macros.rs                         |  126 +
 rust/alloc/raw_vec.rs                        |  561 +++
 rust/alloc/slice.rs                          | 1279 +++++++
 rust/alloc/str.rs                            |  632 ++++
 rust/alloc/string.rs                         | 2862 +++++++++++++++
 rust/alloc/vec/drain.rs                      |  186 +
 rust/alloc/vec/drain_filter.rs               |  145 +
 rust/alloc/vec/into_iter.rs                  |  356 ++
 rust/alloc/vec/is_zero.rs                    |  106 +
 rust/alloc/vec/mod.rs                        | 3353 ++++++++++++++++++
 rust/alloc/vec/partial_eq.rs                 |   49 +
 rust/alloc/vec/set_len_on_drop.rs            |   30 +
 rust/alloc/vec/spec_extend.rs                |  174 +
 rust/bindgen_parameters                      |   13 +
 rust/build_error.rs                          |   29 +
 rust/compiler_builtins.rs                    |   57 +
 rust/exports.c                               |   20 +
 rust/helpers.c                               |  531 +++
 rust/kernel/allocator.rs                     |   65 +
 rust/kernel/amba.rs                          |  259 ++
 rust/kernel/bindings.rs                      |   47 +
 rust/kernel/bindings_helper.h                |   37 +
 rust/kernel/build_assert.rs                  |   80 +
 rust/kernel/c_types.rs                       |  119 +
 rust/kernel/chrdev.rs                        |  207 ++
 rust/kernel/clk.rs                           |   75 +
 rust/kernel/cred.rs                          |   73 +
 rust/kernel/device.rs                        |  554 +++
 rust/kernel/driver.rs                        |  440 +++
 rust/kernel/error.rs                         |  560 +++
 rust/kernel/file.rs                          |  873 +++++
 rust/kernel/gpio.rs                          |  478 +++
 rust/kernel/hwrng.rs                         |  242 ++
 rust/kernel/io_buffer.rs                     |  153 +
 rust/kernel/io_mem.rs                        |  237 ++
 rust/kernel/iov_iter.rs                      |   81 +
 rust/kernel/irq.rs                           |  409 +++
 rust/kernel/lib.rs                           |  260 ++
 rust/kernel/linked_list.rs                   |  247 ++
 rust/kernel/miscdev.rs                       |  291 ++
 rust/kernel/mm.rs                            |  149 +
 rust/kernel/module_param.rs                  |  498 +++
 rust/kernel/of.rs                            |   63 +
 rust/kernel/pages.rs                         |  144 +
 rust/kernel/platform.rs                      |  224 ++
 rust/kernel/power.rs                         |  118 +
 rust/kernel/prelude.rs                       |   36 +
 rust/kernel/print.rs                         |  414 +++
 rust/kernel/random.rs                        |   50 +
 rust/kernel/raw_list.rs                      |  361 ++
 rust/kernel/rbtree.rs                        |  562 +++
 rust/kernel/revocable.rs                     |  163 +
 rust/kernel/security.rs                      |   36 +
 rust/kernel/static_assert.rs                 |   39 +
 rust/kernel/std_vendor.rs                    |  150 +
 rust/kernel/str.rs                           |  592 ++++
 rust/kernel/sync/arc.rs                      |  500 +++
 rust/kernel/sync/condvar.rs                  |  138 +
 rust/kernel/sync/guard.rs                    |  166 +
 rust/kernel/sync/locked_by.rs                |  112 +
 rust/kernel/sync/mod.rs                      |  157 +
 rust/kernel/sync/mutex.rs                    |  114 +
 rust/kernel/sync/revocable_mutex.rs          |  184 +
 rust/kernel/sync/rwsem.rs                    |  149 +
 rust/kernel/sync/seqlock.rs                  |  202 ++
 rust/kernel/sync/spinlock.rs                 |  192 +
 rust/kernel/sysctl.rs                        |  199 ++
 rust/kernel/task.rs                          |  182 +
 rust/kernel/types.rs                         |  569 +++
 rust/kernel/user_ptr.rs                      |  175 +
 rust/macros/helpers.rs                       |   79 +
 rust/macros/lib.rs                           |   94 +
 rust/macros/module.rs                        |  631 ++++
 samples/Kconfig                              |    2 +
 samples/Makefile                             |    1 +
 samples/rust/Kconfig                         |  130 +
 samples/rust/Makefile                        |   15 +
 samples/rust/hostprogs/.gitignore            |    3 +
 samples/rust/hostprogs/Makefile              |    5 +
 samples/rust/hostprogs/a.rs                  |    7 +
 samples/rust/hostprogs/b.rs                  |    5 +
 samples/rust/hostprogs/single.rs             |   12 +
 samples/rust/rust_chrdev.rs                  |   50 +
 samples/rust/rust_minimal.rs                 |   35 +
 samples/rust/rust_miscdev.rs                 |  143 +
 samples/rust/rust_module_parameters.rs       |   69 +
 samples/rust/rust_platform.rs                |   22 +
 samples/rust/rust_print.rs                   |   54 +
 samples/rust/rust_random.rs                  |   60 +
 samples/rust/rust_semaphore.rs               |  171 +
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
 scripts/decode_stacktrace.sh                 |   14 +
 scripts/generate_rust_analyzer.py            |  133 +
 scripts/generate_rust_target.rs              |  227 ++
 scripts/is_rust_module.sh                    |   13 +
 scripts/kallsyms.c                           |   40 +-
 scripts/kconfig/confdata.c                   |   75 +
 scripts/min-tool-version.sh                  |    6 +
 scripts/rust-is-available-bindgen-libclang.h |    2 +
 scripts/rust-is-available.sh                 |  158 +
 tools/include/linux/kallsyms.h               |    2 +-
 tools/lib/perf/include/perf/event.h          |    2 +-
 tools/lib/symbol/kallsyms.h                  |    2 +-
 168 files changed, 35290 insertions(+), 63 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 Documentation/rust/arch-support.rst
 create mode 100644 Documentation/rust/coding-guidelines.rst
 create mode 100644 Documentation/rust/general-information.rst
 create mode 100644 Documentation/rust/index.rst
 create mode 100644 Documentation/rust/logo.svg
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
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/alloc/README.md
 create mode 100644 rust/alloc/alloc.rs
 create mode 100644 rust/alloc/borrow.rs
 create mode 100644 rust/alloc/boxed.rs
 create mode 100644 rust/alloc/collections/mod.rs
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
 create mode 100644 rust/build_error.rs
 create mode 100644 rust/compiler_builtins.rs
 create mode 100644 rust/exports.c
 create mode 100644 rust/helpers.c
 create mode 100644 rust/kernel/allocator.rs
 create mode 100644 rust/kernel/amba.rs
 create mode 100644 rust/kernel/bindings.rs
 create mode 100644 rust/kernel/bindings_helper.h
 create mode 100644 rust/kernel/build_assert.rs
 create mode 100644 rust/kernel/c_types.rs
 create mode 100644 rust/kernel/chrdev.rs
 create mode 100644 rust/kernel/clk.rs
 create mode 100644 rust/kernel/cred.rs
 create mode 100644 rust/kernel/device.rs
 create mode 100644 rust/kernel/driver.rs
 create mode 100644 rust/kernel/error.rs
 create mode 100644 rust/kernel/file.rs
 create mode 100644 rust/kernel/gpio.rs
 create mode 100644 rust/kernel/hwrng.rs
 create mode 100644 rust/kernel/io_buffer.rs
 create mode 100644 rust/kernel/io_mem.rs
 create mode 100644 rust/kernel/iov_iter.rs
 create mode 100644 rust/kernel/irq.rs
 create mode 100644 rust/kernel/lib.rs
 create mode 100644 rust/kernel/linked_list.rs
 create mode 100644 rust/kernel/miscdev.rs
 create mode 100644 rust/kernel/mm.rs
 create mode 100644 rust/kernel/module_param.rs
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
 create mode 100644 rust/kernel/sync/arc.rs
 create mode 100644 rust/kernel/sync/condvar.rs
 create mode 100644 rust/kernel/sync/guard.rs
 create mode 100644 rust/kernel/sync/locked_by.rs
 create mode 100644 rust/kernel/sync/mod.rs
 create mode 100644 rust/kernel/sync/mutex.rs
 create mode 100644 rust/kernel/sync/revocable_mutex.rs
 create mode 100644 rust/kernel/sync/rwsem.rs
 create mode 100644 rust/kernel/sync/seqlock.rs
 create mode 100644 rust/kernel/sync/spinlock.rs
 create mode 100644 rust/kernel/sysctl.rs
 create mode 100644 rust/kernel/task.rs
 create mode 100644 rust/kernel/types.rs
 create mode 100644 rust/kernel/user_ptr.rs
 create mode 100644 rust/macros/helpers.rs
 create mode 100644 rust/macros/lib.rs
 create mode 100644 rust/macros/module.rs
 create mode 100644 samples/rust/Kconfig
 create mode 100644 samples/rust/Makefile
 create mode 100644 samples/rust/hostprogs/.gitignore
 create mode 100644 samples/rust/hostprogs/Makefile
 create mode 100644 samples/rust/hostprogs/a.rs
 create mode 100644 samples/rust/hostprogs/b.rs
 create mode 100644 samples/rust/hostprogs/single.rs
 create mode 100644 samples/rust/rust_chrdev.rs
 create mode 100644 samples/rust/rust_minimal.rs
 create mode 100644 samples/rust/rust_miscdev.rs
 create mode 100644 samples/rust/rust_module_parameters.rs
 create mode 100644 samples/rust/rust_platform.rs
 create mode 100644 samples/rust/rust_print.rs
 create mode 100644 samples/rust/rust_random.rs
 create mode 100644 samples/rust/rust_semaphore.rs
 create mode 100644 samples/rust/rust_semaphore_c.c
 create mode 100644 samples/rust/rust_stack_probing.rs
 create mode 100644 samples/rust/rust_sync.rs
 create mode 100755 scripts/generate_rust_analyzer.py
 create mode 100644 scripts/generate_rust_target.rs
 create mode 100755 scripts/is_rust_module.sh
 create mode 100644 scripts/rust-is-available-bindgen-libclang.h
 create mode 100755 scripts/rust-is-available.sh


base-commit: 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
-- 
2.35.1


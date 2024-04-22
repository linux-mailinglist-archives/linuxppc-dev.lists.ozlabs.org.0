Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F338AC6F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:27:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaTvZzJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJJp1Fqlz3dV3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:27:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WaTvZzJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJJ46BLWz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:26:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADB5DCE0939;
	Mon, 22 Apr 2024 08:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422E5C113CC;
	Mon, 22 Apr 2024 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713774399;
	bh=TaKjak6gIBlraV8Mbmahr73OGfbuZErVxOcLmx3nWY4=;
	h=From:To:Cc:Subject:Date:From;
	b=WaTvZzJpWUir1wNI+KEmdwFdGTrP4woDnA6LGEZoOZt9K9SJHNWhVjQhZIp1foQ9I
	 yvqgbVpxTaHT6X7IPK2KW8B87G+8MOBHV9UCedKDJoV5rnS3tIgC825SBGDLnGsOkf
	 REWQA9L8cquHDRJgyM1NKwJIO4wyYhNZ408Gxn8qURVHxvtJzFZLViRkYC28T0ur6Z
	 ob0J5ShRKJwlmIcdV85po636NpkS8YJ2uP09HOTDsBaencLsUK2+eun1AoI1opu2gn
	 4yL2tIktIDMd/sP1gDAH0thnB2WR+Xp0ogYlmicaad4vyYXV3m/rhG7JpfHmE8ny1C
	 /wvz50x9pJH9w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/15] mm: jit/text allocator
Date: Mon, 22 Apr 2024 11:26:19 +0300
Message-ID: <20240422082619.3509958-1-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <ke
 nt.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

Since v3 I looked into making execmem more of an utility toolbox, as we
discussed at LPC with Mark Rutland, but it was getting more hairier than
having a struct describing architecture constraints and a type identifying
the consumer of execmem.

And I do think that having the description of architecture constraints for
allocations of executable memory in a single place is better than having it
spread all over the place.

The patches available via git:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v5

v5 changes:
* rebase on v6.9-rc4 to avoid a conflict in kprobes
* add copyrights to mm/execmem.c (Luis)
* fix spelling (Ingo)
* define MODULES_VADDDR for sparc (Sam)
* consistently initialize struct execmem_info (Peter)
* reduce #ifdefs in function bodies in kprobes (Masami) 

v4: https://lore.kernel.org/all/20240411160051.2093261-1-rppt@kernel.org
* rebase on v6.9-rc2
* rename execmem_params to execmem_info and execmem_arch_params() to
  execmem_arch_setup()
* use single execmem_alloc() API instead of execmem_{text,data}_alloc() (Song)
* avoid extra copy of execmem parameters (Rick)
* run execmem_init() as core_initcall() except for the architectures that
  may allocated text really early (currently only x86) (Will)
* add acks for some of arm64 and riscv changes, thanks Will and Alexandre
* new commits:
  - drop call to kasan_alloc_module_shadow() on arm64 because it's not
    needed anymore
  - rename MODULE_START to MODULES_VADDR on MIPS
  - use CONFIG_EXECMEM instead of CONFIG_MODULES on powerpc as per Christophe:
    https://lore.kernel.org/all/79062fa3-3402-47b3-8920-9231ad05e964@csgroup.eu/

v3: https://lore.kernel.org/all/20230918072955.2507221-1-rppt@kernel.org
* add type parameter to execmem allocation APIs
* remove BPF dependency on modules

v2: https://lore.kernel.org/all/20230616085038.4121892-1-rppt@kernel.org
* Separate "module" and "others" allocations with execmem_text_alloc()
and jit_text_alloc()
* Drop ROX entailment on x86
* Add ack for nios2 changes, thanks Dinh Nguyen

v1: https://lore.kernel.org/all/20230601101257.530867-1-rppt@kernel.org

= Cover letter from v1 (sligtly updated) =

module_alloc() is used everywhere as a mean to allocate memory for code.

Beside being semantically wrong, this unnecessarily ties all subsystmes
that need to allocate code, such as ftrace, kprobes and BPF to modules and
puts the burden of code allocation to the modules code.

Several architectures override module_alloc() because of various
constraints where the executable memory can be located and this causes
additional obstacles for improvements of code allocation.

A centralized infrastructure for code allocation allows allocations of
executable memory as ROX, and future optimizations such as caching large
pages for better iTLB performance and providing sub-page allocations for
users that only need small jit code snippets.

Rick Edgecombe proposed perm_alloc extension to vmalloc [1] and Song Liu
proposed execmem_alloc [2], but both these approaches were targeting BPF
allocations and lacked the ground work to abstract executable allocations
and split them from the modules core.

Thomas Gleixner suggested to express module allocation restrictions and
requirements as struct mod_alloc_type_params [3] that would define ranges,
protections and other parameters for different types of allocations used by
modules and following that suggestion Song separated allocations of
different types in modules (commit ac3b43283923 ("module: replace
module_layout with module_memory")) and posted "Type aware module
allocator" set [4].

I liked the idea of parametrising code allocation requirements as a
structure, but I believe the original proposal and Song's module allocator
was too module centric, so I came up with these patches.

This set splits code allocation from modules by introducing execmem_alloc()
and and execmem_free(), APIs, replaces call sites of module_alloc() and
module_memfree() with the new APIs and implements core text and related
allocations in a central place.

Instead of architecture specific overrides for module_alloc(), the
architectures that require non-default behaviour for text allocation must
fill execmem_info structure and implement execmem_arch_setup() that returns
a pointer to that structure. If an architecture does not implement
execmem_arch_setup(), the defaults compatible with the current
modules::module_alloc() are used.

Since architectures define different restrictions on placement,
permissions, alignment and other parameters for memory that can be used by
different subsystems that allocate executable memory, execmem APIs
take a type argument, that will be used to identify the calling subsystem
and to allow architectures to define parameters for ranges suitable for that
subsystem.

The new infrastructure allows decoupling of BPF, kprobes and ftrace from
modules, and most importantly it paves the way for ROX allocations for
executable memory.

[1] https://lore.kernel.org/lkml/20201120202426.18009-1-rick.p.edgecombe@intel.com/
[2] https://lore.kernel.org/all/20221107223921.3451913-1-song@kernel.org/
[3] https://lore.kernel.org/all/87v8mndy3y.ffs@tglx/
[4] https://lore.kernel.org/all/20230526051529.3387103-1-song@kernel.org


Mike Rapoport (IBM) (17):
  arm64: module: remove unneeded call to kasan_alloc_module_shadow()
  mips: module: rename MODULE_START to MODULES_VADDR
  nios2: define virtual address space for modules
  sparc: simplify module_alloc()
  module: make module_memory_{alloc,free} more self-contained
  mm: introduce execmem_alloc() and execmem_free()
  mm/execmem, arch: convert simple overrides of module_alloc to execmem
  mm/execmem, arch: convert remaining overrides of module_alloc to execmem
  riscv: extend execmem_params for generated code allocations
  powerpc: extend execmem_params for kprobes allocations
  arch: make execmem setup available regardless of CONFIG_MODULES
  x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
  powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropriate
  kprobes: remove dependency on CONFIG_MODULES
  bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
  fixup: kprobes without CONFIG_MODULES
  fixup: kprobes without CONFIG_MODULES and with module_is_coming

 arch/Kconfig                         |   8 +-
 arch/arm/kernel/module.c             |  34 -------
 arch/arm/mm/init.c                   |  45 +++++++++
 arch/arm64/kernel/module.c           | 126 -----------------------
 arch/arm64/kernel/probes/kprobes.c   |   7 --
 arch/arm64/mm/init.c                 | 140 ++++++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c        |  11 --
 arch/loongarch/kernel/module.c       |   6 --
 arch/loongarch/mm/init.c             |  21 ++++
 arch/mips/include/asm/pgtable-64.h   |   4 +-
 arch/mips/kernel/module.c            |  10 --
 arch/mips/mm/fault.c                 |   4 +-
 arch/mips/mm/init.c                  |  23 +++++
 arch/nios2/include/asm/pgtable.h     |   5 +-
 arch/nios2/kernel/module.c           |  20 ----
 arch/nios2/mm/init.c                 |  21 ++++
 arch/parisc/kernel/module.c          |  12 ---
 arch/parisc/mm/init.c                |  23 ++++-
 arch/powerpc/Kconfig                 |   2 +-
 arch/powerpc/include/asm/kasan.h     |   2 +-
 arch/powerpc/kernel/head_8xx.S       |   4 +-
 arch/powerpc/kernel/head_book3s_32.S |   6 +-
 arch/powerpc/kernel/kprobes.c        |  22 +---
 arch/powerpc/kernel/module.c         |  38 -------
 arch/powerpc/lib/code-patching.c     |   2 +-
 arch/powerpc/mm/book3s32/mmu.c       |   2 +-
 arch/powerpc/mm/mem.c                |  64 ++++++++++++
 arch/riscv/kernel/module.c           |  12 ---
 arch/riscv/kernel/probes/kprobes.c   |  10 --
 arch/riscv/mm/init.c                 |  45 +++++++++
 arch/riscv/net/bpf_jit_core.c        |  13 ---
 arch/s390/kernel/ftrace.c            |   4 +-
 arch/s390/kernel/kprobes.c           |   4 +-
 arch/s390/kernel/module.c            |  42 +-------
 arch/s390/mm/init.c                  |  30 ++++++
 arch/sparc/include/asm/pgtable_32.h  |   2 +
 arch/sparc/kernel/module.c           |  30 ------
 arch/sparc/mm/Makefile               |   2 +
 arch/sparc/mm/execmem.c              |  21 ++++
 arch/sparc/net/bpf_jit_comp_32.c     |   8 +-
 arch/x86/Kconfig                     |   2 +
 arch/x86/kernel/ftrace.c             |  16 +--
 arch/x86/kernel/kprobes/core.c       |   4 +-
 arch/x86/kernel/module.c             |  51 ----------
 arch/x86/mm/init.c                   |  29 ++++++
 include/linux/execmem.h              | 132 ++++++++++++++++++++++++
 include/linux/module.h               |   9 ++
 include/linux/moduleloader.h         |  15 ---
 kernel/bpf/Kconfig                   |   2 +-
 kernel/bpf/core.c                    |   6 +-
 kernel/kprobes.c                     |  63 +++++++-----
 kernel/module/Kconfig                |   1 +
 kernel/module/main.c                 | 105 +++++++++----------
 kernel/trace/trace_kprobe.c          |  20 +++-
 mm/Kconfig                           |   3 +
 mm/Makefile                          |   1 +
 mm/execmem.c                         | 145 +++++++++++++++++++++++++++
 mm/mm_init.c                         |   2 +
 58 files changed, 910 insertions(+), 581 deletions(-)
 create mode 100644 arch/sparc/mm/execmem.c
 create mode 100644 include/linux/execmem.h
 create mode 100644 mm/execmem.c


base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
-- 
2.43.0

*** BLURB HERE ***

Mike Rapoport (IBM) (15):
  arm64: module: remove unneeded call to kasan_alloc_module_shadow()
  mips: module: rename MODULE_START to MODULES_VADDR
  nios2: define virtual address space for modules
  sparc: simplify module_alloc()
  module: make module_memory_{alloc,free} more self-contained
  mm: introduce execmem_alloc() and execmem_free()
  mm/execmem, arch: convert simple overrides of module_alloc to execmem
  mm/execmem, arch: convert remaining overrides of module_alloc to
    execmem
  riscv: extend execmem_params for generated code allocations
  powerpc: extend execmem_params for kprobes allocations
  arch: make execmem setup available regardless of CONFIG_MODULES
  x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
  powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where
    appropriate
  kprobes: remove dependency on CONFIG_MODULES
  bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of

 arch/Kconfig                         |   8 +-
 arch/arm/kernel/module.c             |  34 -------
 arch/arm/mm/init.c                   |  45 +++++++++
 arch/arm64/kernel/module.c           | 126 -----------------------
 arch/arm64/kernel/probes/kprobes.c   |   7 --
 arch/arm64/mm/init.c                 | 140 ++++++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c        |  11 --
 arch/loongarch/kernel/module.c       |   6 --
 arch/loongarch/mm/init.c             |  21 ++++
 arch/mips/include/asm/pgtable-64.h   |   4 +-
 arch/mips/kernel/module.c            |  10 --
 arch/mips/mm/fault.c                 |   4 +-
 arch/mips/mm/init.c                  |  23 +++++
 arch/nios2/include/asm/pgtable.h     |   5 +-
 arch/nios2/kernel/module.c           |  20 ----
 arch/nios2/mm/init.c                 |  21 ++++
 arch/parisc/kernel/module.c          |  12 ---
 arch/parisc/mm/init.c                |  23 ++++-
 arch/powerpc/Kconfig                 |   2 +-
 arch/powerpc/include/asm/kasan.h     |   2 +-
 arch/powerpc/kernel/head_8xx.S       |   4 +-
 arch/powerpc/kernel/head_book3s_32.S |   6 +-
 arch/powerpc/kernel/kprobes.c        |  22 +---
 arch/powerpc/kernel/module.c         |  38 -------
 arch/powerpc/lib/code-patching.c     |   2 +-
 arch/powerpc/mm/book3s32/mmu.c       |   2 +-
 arch/powerpc/mm/mem.c                |  64 ++++++++++++
 arch/riscv/kernel/module.c           |  12 ---
 arch/riscv/kernel/probes/kprobes.c   |  10 --
 arch/riscv/mm/init.c                 |  45 +++++++++
 arch/riscv/net/bpf_jit_core.c        |  13 ---
 arch/s390/kernel/ftrace.c            |   4 +-
 arch/s390/kernel/kprobes.c           |   4 +-
 arch/s390/kernel/module.c            |  42 +-------
 arch/s390/mm/init.c                  |  30 ++++++
 arch/sparc/include/asm/pgtable_32.h  |   2 +
 arch/sparc/kernel/module.c           |  30 ------
 arch/sparc/mm/Makefile               |   2 +
 arch/sparc/mm/execmem.c              |  21 ++++
 arch/sparc/net/bpf_jit_comp_32.c     |   8 +-
 arch/x86/Kconfig                     |   2 +
 arch/x86/kernel/ftrace.c             |  16 +--
 arch/x86/kernel/kprobes/core.c       |   4 +-
 arch/x86/kernel/module.c             |  51 ----------
 arch/x86/mm/init.c                   |  29 ++++++
 include/linux/execmem.h              | 132 ++++++++++++++++++++++++
 include/linux/module.h               |   9 ++
 include/linux/moduleloader.h         |  15 ---
 kernel/bpf/Kconfig                   |   2 +-
 kernel/bpf/core.c                    |   6 +-
 kernel/kprobes.c                     |  63 +++++++-----
 kernel/module/Kconfig                |   1 +
 kernel/module/main.c                 | 105 +++++++++----------
 kernel/trace/trace_kprobe.c          |  20 +++-
 mm/Kconfig                           |   3 +
 mm/Makefile                          |   1 +
 mm/execmem.c                         | 145 +++++++++++++++++++++++++++
 mm/mm_init.c                         |   2 +
 58 files changed, 910 insertions(+), 581 deletions(-)
 create mode 100644 arch/sparc/mm/execmem.c
 create mode 100644 include/linux/execmem.h
 create mode 100644 mm/execmem.c


base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
-- 
2.43.0


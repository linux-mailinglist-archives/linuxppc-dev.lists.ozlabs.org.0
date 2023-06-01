Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 875B37198B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX26P1d7Zz3chT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:14:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW6qnl+I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mW6qnl+I;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX25W2m4lz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:13:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9F9C64306;
	Thu,  1 Jun 2023 10:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB9EC433EF;
	Thu,  1 Jun 2023 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614396;
	bh=AFUoVH57IicSC1SUB3rNbSa55KIIf5fvCH3QgG43svk=;
	h=From:To:Cc:Subject:Date:From;
	b=mW6qnl+Iscw1AVEmuh/+zsjQC3Skvf6tgVrd8H0mW7nk/Q4kR8aZiIus1dGIFP0tu
	 g3rQeS6P4z2sg2eRb4NVK2fSVZyk7O67J0bqoAY5zsHBwd4m5pGbhDwVNj62iw489S
	 WwJRyB2rENdRnYC5sKzXzzMfTG9/RUH5Fq0wJ8oT8tMyy9YYy4BnDsnxhAjT9MeepB
	 H1tV4aCIaB0/6raud9FT8L5dMFEDagbhbs3liHazB+zv7gap/xaJMb6C7mJsHMki13
	 b3RfbDTWSX2rQpcBObYqwwehSGuzsUPwmJr6dpDHZ0JMs7xXA+oJ8tyL/OL1vetfWT
	 OQoViqeiM1NHQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] mm: jit/text allocator
Date: Thu,  1 Jun 2023 13:12:44 +0300
Message-Id: <20230601101257.530867-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozl
 abs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

module_alloc() is used everywhere as a mean to allocate memory for code.

Beside being semantically wrong, this unnecessarily ties all subsystmes
that need to allocate code, such as ftrace, kprobes and BPF to modules
and puts the burden of code allocation to the modules code.

Several architectures override module_alloc() because of various
constraints where the executable memory can be located and this causes
additional obstacles for improvements of code allocation.

This set splits code allocation from modules by introducing
jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
sites of module_alloc() and module_memfree() with the new APIs and
implements core text and related allocation in a central place.

Instead of architecture specific overrides for module_alloc(), the
architectures that require non-default behaviour for text allocation must
fill jit_alloc_params structure and implement jit_alloc_arch_params() that
returns a pointer to that structure. If an architecture does not implement
jit_alloc_arch_params(), the defaults compatible with the current
modules::module_alloc() are used.

The new jitalloc infrastructure allows decoupling of kprobes and ftrace
from modules, and most importantly it enables ROX allocations for
executable memory.

A centralized infrastructure for code allocation allows future
optimizations for allocations of executable memory, caching large pages for
better iTLB performance and providing sub-page allocations for users that
only need small jit code snippets.

patches 1-5: split out the code allocation from modules and arch
patch 6: add dedicated API for data allocations with constraints similar to
code allocations
patches 7-9: decouple dynamic ftrace and kprobes form CONFIG_MODULES
patches 10-13: enable ROX allocations for executable memory on x86

Mike Rapoport (IBM) (11):
  nios2: define virtual address space for modules
  mm: introduce jit_text_alloc() and use it instead of module_alloc()
  mm/jitalloc, arch: convert simple overrides of module_alloc to jitalloc
  mm/jitalloc, arch: convert remaining overrides of module_alloc to jitalloc
  module, jitalloc: drop module_alloc
  mm/jitalloc: introduce jit_data_alloc()
  x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
  arch: make jitalloc setup available regardless of CONFIG_MODULES
  kprobes: remove dependcy on CONFIG_MODULES
  modules, jitalloc: prepare to allocate executable memory as ROX
  x86/jitalloc: make memory allocated for code ROX

Song Liu (2):
  ftrace: Add swap_func to ftrace_process_locs()
  x86/jitalloc: prepare to allocate exectuatble memory as ROX

 arch/Kconfig                     |   5 +-
 arch/arm/kernel/module.c         |  32 ------
 arch/arm/mm/init.c               |  35 ++++++
 arch/arm64/kernel/module.c       |  47 --------
 arch/arm64/mm/init.c             |  42 +++++++
 arch/loongarch/kernel/module.c   |   6 -
 arch/loongarch/mm/init.c         |  16 +++
 arch/mips/kernel/module.c        |   9 --
 arch/mips/mm/init.c              |  19 ++++
 arch/nios2/include/asm/pgtable.h |   5 +-
 arch/nios2/kernel/module.c       |  24 ++--
 arch/parisc/kernel/module.c      |  11 --
 arch/parisc/mm/init.c            |  21 +++-
 arch/powerpc/kernel/kprobes.c    |   4 +-
 arch/powerpc/kernel/module.c     |  37 -------
 arch/powerpc/mm/mem.c            |  41 +++++++
 arch/riscv/kernel/module.c       |  10 --
 arch/riscv/mm/init.c             |  18 +++
 arch/s390/kernel/ftrace.c        |   4 +-
 arch/s390/kernel/kprobes.c       |   4 +-
 arch/s390/kernel/module.c        |  46 +-------
 arch/s390/mm/init.c              |  35 ++++++
 arch/sparc/kernel/module.c       |  34 +-----
 arch/sparc/mm/Makefile           |   2 +
 arch/sparc/mm/jitalloc.c         |  21 ++++
 arch/sparc/net/bpf_jit_comp_32.c |   8 +-
 arch/x86/Kconfig                 |   2 +
 arch/x86/kernel/alternative.c    |  43 ++++---
 arch/x86/kernel/ftrace.c         |  59 +++++-----
 arch/x86/kernel/kprobes/core.c   |   4 +-
 arch/x86/kernel/module.c         |  75 +------------
 arch/x86/kernel/static_call.c    |  10 +-
 arch/x86/kernel/unwind_orc.c     |  13 ++-
 arch/x86/mm/init.c               |  52 +++++++++
 arch/x86/net/bpf_jit_comp.c      |  22 +++-
 include/linux/ftrace.h           |   2 +
 include/linux/jitalloc.h         |  69 ++++++++++++
 include/linux/moduleloader.h     |  15 ---
 kernel/bpf/core.c                |  14 +--
 kernel/kprobes.c                 |  51 +++++----
 kernel/module/Kconfig            |   1 +
 kernel/module/main.c             |  56 ++++------
 kernel/trace/ftrace.c            |  13 ++-
 kernel/trace/trace_kprobe.c      |  11 ++
 mm/Kconfig                       |   3 +
 mm/Makefile                      |   1 +
 mm/jitalloc.c                    | 185 +++++++++++++++++++++++++++++++
 mm/mm_init.c                     |   2 +
 48 files changed, 777 insertions(+), 462 deletions(-)
 create mode 100644 arch/sparc/mm/jitalloc.c
 create mode 100644 include/linux/jitalloc.h
 create mode 100644 mm/jitalloc.c


base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
-- 
2.35.1


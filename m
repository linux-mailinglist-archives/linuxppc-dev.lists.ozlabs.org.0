Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A9230191
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 07:16:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BG4fH22x6zDr31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=zUj8Ky/I; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BG4YD51vSzDqwP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:12:16 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 799682070A;
 Tue, 28 Jul 2020 05:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913133;
 bh=SiunFkOH1KIyW1NC3iO0mc1YnQ8vPMqtL902CN9Sglg=;
 h=From:To:Cc:Subject:Date:From;
 b=zUj8Ky/ISJogZYImW1cerS7gxpsJPyD/s5COPLWHq2m806d7LS+KeFmOjturCkeKD
 HrFFBTdERy4l0XPM2jQi1NdsS/0AEv/DNIDcsxWU/Hw8p6tUQjHHE7reUbZz0w1jhv
 yHsh8/Ni8CjiRR1lxOFECz5g0SlMvzBSWjQUZxXU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/15] memblock: seasonal cleaning^w cleanup
Date: Tue, 28 Jul 2020 08:11:38 +0300
Message-Id: <20200728051153.1590-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches simplify several uses of memblock iterators and hide some of
the memblock implementation details from the rest of the system.

The patches are on top of v5.8-rc7 + cherry-pick of "mm/sparse: cleanup the
code surrounding memory_present()" [1] from mmotm tree.

[1] http://lkml.kernel.org/r/20200712083130.22919-1-rppt@kernel.org 

Mike Rapoport (15):
  KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
  dma-contiguous: simplify cma_early_percent_memory()
  arm, xtensa: simplify initialization of high memory pages
  arm64: numa: simplify dummy_numa_init()
  h8300, nds32, openrisc: simplify detection of memory extents
  powerpc: fadamp: simplify fadump_reserve_crash_area()
  riscv: drop unneeded node initialization
  mircoblaze: drop unneeded NUMA and sparsemem initializations
  memblock: make for_each_memblock_type() iterator private
  memblock: make memblock_debug and related functionality private
  memblock: reduce number of parameters in for_each_mem_range()
  arch, mm: replace for_each_memblock() with for_each_mem_pfn_range()
  arch, drivers: replace for_each_membock() with for_each_mem_range()
  x86/numa: remove redundant iteration over memblock.reserved
  memblock: remove 'type' parameter from for_each_memblock()

 .clang-format                            |  1 +
 arch/arm/kernel/setup.c                  | 18 +++++---
 arch/arm/mm/init.c                       | 59 +++++-------------------
 arch/arm/mm/mmu.c                        | 39 ++++++----------
 arch/arm/mm/pmsa-v7.c                    | 20 ++++----
 arch/arm/mm/pmsa-v8.c                    | 17 ++++---
 arch/arm/xen/mm.c                        |  7 +--
 arch/arm64/kernel/machine_kexec_file.c   |  6 +--
 arch/arm64/kernel/setup.c                |  2 +-
 arch/arm64/mm/init.c                     | 11 ++---
 arch/arm64/mm/kasan_init.c               |  8 ++--
 arch/arm64/mm/mmu.c                      | 11 ++---
 arch/arm64/mm/numa.c                     | 15 +++---
 arch/c6x/kernel/setup.c                  |  9 ++--
 arch/h8300/kernel/setup.c                |  8 ++--
 arch/microblaze/mm/init.c                | 24 ++--------
 arch/mips/cavium-octeon/dma-octeon.c     | 12 ++---
 arch/mips/kernel/setup.c                 | 31 ++++++-------
 arch/mips/netlogic/xlp/setup.c           |  2 +-
 arch/nds32/kernel/setup.c                |  8 +---
 arch/openrisc/kernel/setup.c             |  9 +---
 arch/openrisc/mm/init.c                  |  8 ++--
 arch/powerpc/kernel/fadump.c             | 58 ++++++++---------------
 arch/powerpc/kvm/book3s_hv_builtin.c     | 11 +----
 arch/powerpc/mm/book3s64/hash_utils.c    | 16 +++----
 arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++---
 arch/powerpc/mm/kasan/kasan_init_32.c    |  8 ++--
 arch/powerpc/mm/mem.c                    | 33 +++++++------
 arch/powerpc/mm/numa.c                   |  7 +--
 arch/powerpc/mm/pgtable_32.c             |  8 ++--
 arch/riscv/mm/init.c                     | 33 ++++---------
 arch/riscv/mm/kasan_init.c               | 10 ++--
 arch/s390/kernel/crash_dump.c            |  8 ++--
 arch/s390/kernel/setup.c                 | 31 ++++++++-----
 arch/s390/mm/page-states.c               |  6 +--
 arch/s390/mm/vmem.c                      | 16 ++++---
 arch/sh/mm/init.c                        |  9 ++--
 arch/sparc/mm/init_64.c                  | 12 ++---
 arch/x86/mm/numa.c                       | 26 ++++-------
 arch/xtensa/mm/init.c                    | 55 ++++------------------
 drivers/bus/mvebu-mbus.c                 | 12 ++---
 drivers/s390/char/zcore.c                |  9 ++--
 include/linux/memblock.h                 | 45 +++++++++---------
 kernel/dma/contiguous.c                  | 11 +----
 mm/memblock.c                            | 28 +++++++----
 mm/page_alloc.c                          | 11 ++---
 mm/sparse.c                              | 10 ++--
 47 files changed, 324 insertions(+), 485 deletions(-)

-- 
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4424899D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 17:23:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWF6B6YjdzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 01:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=mZ4Dw/78; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWDz747BTzDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 01:16:51 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 140422054F;
 Tue, 18 Aug 2020 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763808;
 bh=pWqW8YgLG90UU3p8BWQ4xo9QKFARTHRes7KpRDQutEY=;
 h=From:To:Cc:Subject:Date:From;
 b=mZ4Dw/78TkBwbT4zckybu8GS6IeYljCyckNW7F7V9LPqkH0uP6lZLns364B8ofjDq
 g40MFxNJ9gEv01k6pNkEpjYOvmf4wvbJAjpvy8rkOX3Ub/pu7s4r9Q//DEwKnW4wz3
 DIa8FLdmh9cooXoz1dI6BSyEhKPCYBl/+8BDlFOg=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 00/17] memblock: seasonal cleaning^w cleanup
Date: Tue, 18 Aug 2020 18:16:17 +0300
Message-Id: <20200818151634.14343-1-rppt@kernel.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches simplify several uses of memblock iterators and hide some of
the memblock implementation details from the rest of the system.

The patches are on top of v5.9-rc1

v3 changes:
* rebase on v5.9-rc1, as the result this required some non-trivial changes
  in patches 10 and 16. I didn't add Baoquan's Reviewed-by to theses
  patches, but I keept Thomas and Miguel
* Add Acked-by from Thomas and Miguel as there were changes in MIPS and
  only trivial changes in .clang-format
* Added Reviewed-by from Baoquan except for the patches 10 and 16
* Fixed misc build errors and warnings reported by kbuild bot
* Updated PowerPC KVM reservation size (patch 2), as per Daniel's comment

v2 changes:
* replace for_each_memblock() with two versions, one for memblock.memory
  and another one for memblock.reserved
* fix overzealous cleanup of powerpc fadamp: keep the traversal over the
  memblocks, but use better suited iterators
* don't remove traversal over memblock.reserved in x86 numa cleanup but
  replace for_each_memblock() with new for_each_reserved_mem_region()
* simplify ramdisk and crash kernel allocations on x86
* drop more redundant and unused code: __next_reserved_mem_region() and
  memblock_mem_size()
* add description of numa initialization fix on arm64 (thanks Jonathan)
* add Acked and Reviewed tags

Mike Rapoport (17):
  KVM: PPC: Book3S HV: simplify kvm_cma_reserve()
  dma-contiguous: simplify cma_early_percent_memory()
  arm, xtensa: simplify initialization of high memory pages
  arm64: numa: simplify dummy_numa_init()
  h8300, nds32, openrisc: simplify detection of memory extents
  riscv: drop unneeded node initialization
  mircoblaze: drop unneeded NUMA and sparsemem initializations
  memblock: make for_each_memblock_type() iterator private
  memblock: make memblock_debug and related functionality private
  memblock: reduce number of parameters in for_each_mem_range()
  arch, mm: replace for_each_memblock() with for_each_mem_pfn_range()
  arch, drivers: replace for_each_membock() with for_each_mem_range()
  x86/setup: simplify initrd relocation and reservation
  x86/setup: simplify reserve_crashkernel()
  memblock: remove unused memblock_mem_size()
  memblock: implement for_each_reserved_mem_region() using
    __next_mem_region()
  memblock: use separate iterators for memory and reserved regions

 .clang-format                            |  5 +-
 arch/arm/kernel/setup.c                  | 18 +++--
 arch/arm/mm/init.c                       | 59 +++------------
 arch/arm/mm/mmu.c                        | 39 ++++------
 arch/arm/mm/pmsa-v7.c                    | 23 +++---
 arch/arm/mm/pmsa-v8.c                    | 17 ++---
 arch/arm/xen/mm.c                        |  7 +-
 arch/arm64/kernel/machine_kexec_file.c   |  6 +-
 arch/arm64/kernel/setup.c                |  4 +-
 arch/arm64/mm/init.c                     | 11 +--
 arch/arm64/mm/kasan_init.c               | 10 +--
 arch/arm64/mm/mmu.c                      | 11 +--
 arch/arm64/mm/numa.c                     | 15 ++--
 arch/c6x/kernel/setup.c                  |  9 ++-
 arch/h8300/kernel/setup.c                |  8 +-
 arch/microblaze/mm/init.c                | 21 ++----
 arch/mips/cavium-octeon/dma-octeon.c     | 12 +--
 arch/mips/kernel/setup.c                 | 31 ++++----
 arch/mips/netlogic/xlp/setup.c           |  2 +-
 arch/nds32/kernel/setup.c                |  8 +-
 arch/openrisc/kernel/setup.c             |  9 +--
 arch/openrisc/mm/init.c                  |  8 +-
 arch/powerpc/kernel/fadump.c             | 57 +++++++-------
 arch/powerpc/kexec/file_load_64.c        | 16 ++--
 arch/powerpc/kvm/book3s_hv_builtin.c     | 12 +--
 arch/powerpc/mm/book3s64/hash_utils.c    | 16 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c | 10 +--
 arch/powerpc/mm/kasan/kasan_init_32.c    |  8 +-
 arch/powerpc/mm/mem.c                    | 33 ++++----
 arch/powerpc/mm/numa.c                   |  7 +-
 arch/powerpc/mm/pgtable_32.c             |  8 +-
 arch/riscv/mm/init.c                     | 36 +++------
 arch/riscv/mm/kasan_init.c               | 10 +--
 arch/s390/kernel/setup.c                 | 27 ++++---
 arch/s390/mm/page-states.c               |  6 +-
 arch/s390/mm/vmem.c                      |  7 +-
 arch/sh/mm/init.c                        |  9 +--
 arch/sparc/mm/init_64.c                  | 12 +--
 arch/x86/kernel/setup.c                  | 56 +++++---------
 arch/x86/mm/numa.c                       |  2 +-
 arch/xtensa/mm/init.c                    | 55 +++-----------
 drivers/bus/mvebu-mbus.c                 | 12 +--
 drivers/irqchip/irq-gic-v3-its.c         |  2 +-
 include/linux/memblock.h                 | 88 +++++++++++++---------
 kernel/dma/contiguous.c                  | 11 +--
 mm/memblock.c                            | 95 ++++++++++--------------
 mm/page_alloc.c                          | 11 ++-
 mm/sparse.c                              | 10 +--
 48 files changed, 387 insertions(+), 562 deletions(-)

-- 
2.26.2


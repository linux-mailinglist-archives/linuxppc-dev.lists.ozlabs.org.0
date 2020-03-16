Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EE2186B69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 13:50:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gx3M6v8TzDqC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 23:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=G2GWrkeK; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwkx3vJLzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:35:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwkh3drBz9tygG;
 Mon, 16 Mar 2020 13:35:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=G2GWrkeK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jFgipoEaC1LX; Mon, 16 Mar 2020 13:35:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwkh2Y3qz9tyg5;
 Mon, 16 Mar 2020 13:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362140; bh=ivi67ooOYR4NIcKJvR+0+FvNkWM7JlV6Tch7soe4bFM=;
 h=From:Subject:To:Cc:Date:From;
 b=G2GWrkeKkUDGHu7p0zWyS98Zia78Gfr95R93ddIUQtznS4hruuI0vPb1d7rGL5S/M
 Yual5rCH5SR4fsZRgNmt3hYTHWGr7C4mQ6YxXd7OAd0YPNhpiQTXdQo203OoRN6CEq
 aU/dj8Zb/1yrtLQk4otSjYVbqyx3Pc6DcYrLdLUQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 47A9E8B7D0;
 Mon, 16 Mar 2020 13:35:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ubuyxrt3CRxg; Mon, 16 Mar 2020 13:35:45 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DC598B7CB;
 Mon, 16 Mar 2020 13:35:45 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F37D465595; Mon, 16 Mar 2020 12:35:44 +0000 (UTC)
Message-Id: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 00/46] Use hugepages to map kernel mem on 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:44 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main purpose of this big series is to:
- reorganise huge page handling to avoid using mm_slices.
- use huge pages to map kernel memory on the 8xx.

The 8xx supports 4 page sizes: 4k, 16k, 512k and 8M.
It uses 2 Level page tables, PGD having 1024 entries, each entry
covering 4M address space. Then each page table has 1024 entries.

At the time being, page sizes are managed in PGD entries, implying
the use of mm_slices as it can't mix several pages of the same size
in one page table.

The first purpose of this series is to reorganise things so that
standard page tables can also handle 512k pages. This is done by
adding a new _PAGE_HUGE flag which will be copied into the Level 1
entry in the TLB miss handler. That done, we have 2 types of pages:
- PGD entries to regular page tables handling 4k/16k and 512k pages
- PGD entries to hugepd tables handling 8M pages.

There is no need to mix 8M pages with other sizes, because a 8M page
will use more than what a single PGD covers.

Then comes the second purpose of this series. At the time being, the
8xx has implemented special handling in the TLB miss handlers in order
to transparently map kernel linear address space and the IMMR using
huge pages by building the TLB entries in assembly at the time of the
exception.

As mm_slices is only for user space pages, and also because it would
anyway not be convenient to slice kernel address space, it was not
possible to use huge pages for kernel address space. But after step
one of the series, it is now more flexible to use huge pages.

This series drop all assembly 'just in time' handling of huge pages
and use huge pages in page tables instead.

Once the above is done, then comes the cherry on cake:
- Use huge pages for KASAN shadow mapping
- Allow pinned TLBs with strict kernel rwx
- Allow pinned TLBs with debug pagealloc

Then, last but not least, those modifications for the 8xx allows the
following improvement on book3s/32:
- Mapping KASAN shadow with BATs
- Allowing BATs with debug pagealloc

All this allows to considerably simplify TLB miss handlers and associated
initialisation. The overhead of reading page tables is negligible
compared to the reduction of the miss handlers.

While we were at touching pte_update(), some cleanup was done
there too.

Tested widely on 8xx and 832x. Boot tested on QEMU MAC99.

Christophe Leroy (46):
  powerpc/kasan: Fix shadow memory protection with CONFIG_KASAN_VMALLOC
  powerpc/kasan: Fix error detection on memory allocation
  powerpc/kasan: Fix issues by lowering KASAN_SHADOW_END
  powerpc/kasan: Fix shadow pages allocation failure
  powerpc/kasan: Remove unnecessary page table locking
  powerpc/kasan: Refactor update of early shadow mappings
  powerpc/kasan: Declare kasan_init_region() weak
  powerpc/ptdump: Limit size of flags text to 1/2 chars on PPC32
  powerpc/ptdump: Reorder flags
  powerpc/ptdump: Add _PAGE_COHERENT flag
  powerpc/ptdump: Display size of BATs
  powerpc/ptdump: Standardise display of BAT flags
  powerpc/ptdump: Properly handle non standard page size
  powerpc/ptdump: Handle hugepd at PGD level
  powerpc/32s: Don't warn when mapping RO data ROX.
  powerpc/mm: Allocate static page tables for fixmap
  powerpc/mm: Fix conditions to perform MMU specific management by
    blocks on PPC32.
  powerpc/mm: PTE_ATOMIC_UPDATES is only for 40x
  powerpc/mm: Refactor pte_update() on nohash/32
  powerpc/mm: Refactor pte_update() on book3s/32
  powerpc/mm: Standardise __ptep_test_and_clear_young() params between
    PPC32 and PPC64
  powerpc/mm: Standardise pte_update() prototype between PPC32 and PPC64
  powerpc/mm: Create a dedicated pte_update() for 8xx
  powerpc/mm: Reduce hugepd size for 8M hugepages on 8xx
  powerpc/8xx: Drop CONFIG_8xx_COPYBACK option
  powerpc/8xx: Prepare handlers for _PAGE_HUGE for 512k pages.
  powerpc/8xx: Manage 512k huge pages as standard pages.
  powerpc/8xx: Only 8M pages are hugepte pages now
  powerpc/8xx: MM_SLICE is not needed anymore
  powerpc/8xx: Move PPC_PIN_TLB options into 8xx Kconfig
  powerpc/8xx: Add function to update pinned TLBs
  powerpc/8xx: Don't set IMMR map anymore at boot
  powerpc/8xx: Always pin TLBs at startup.
  powerpc/8xx: Drop special handling of Linear and IMMR mappings in I/D
    TLB handlers
  powerpc/8xx: Remove now unused TLB miss functions
  powerpc/8xx: Move DTLB perf handling closer.
  powerpc/mm: Don't be too strict with _etext alignment on PPC32
  powerpc/8xx: Refactor kernel address boundary comparison
  powerpc/8xx: Add a function to early map kernel via huge pages
  powerpc/8xx: Map IMMR with a huge page
  powerpc/8xx: Map linear memory with huge pages
  powerpc/8xx: Allow STRICT_KERNEL_RwX with pinned TLB
  powerpc/8xx: Allow large TLBs with DEBUG_PAGEALLOC
  powerpc/8xx: Implement dedicated kasan_init_region()
  powerpc/32s: Allow mapping with BATs with DEBUG_PAGEALLOC
  powerpc/32s: Implement dedicated kasan_init_region()

 arch/powerpc/Kconfig                          |  62 +---
 arch/powerpc/configs/adder875_defconfig       |   1 -
 arch/powerpc/configs/ep88xc_defconfig         |   1 -
 arch/powerpc/configs/mpc866_ads_defconfig     |   1 -
 arch/powerpc/configs/mpc885_ads_defconfig     |   1 -
 arch/powerpc/configs/tqm8xx_defconfig         |   1 -
 arch/powerpc/include/asm/book3s/32/pgtable.h  |  78 ++---
 arch/powerpc/include/asm/fixmap.h             |   4 +
 arch/powerpc/include/asm/hugetlb.h            |   6 +-
 arch/powerpc/include/asm/kasan.h              |  10 +-
 .../include/asm/nohash/32/hugetlb-8xx.h       |  32 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  |  75 +----
 arch/powerpc/include/asm/nohash/32/pgtable.h  | 104 +++----
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  |   4 +-
 arch/powerpc/include/asm/nohash/32/slice.h    |  20 --
 arch/powerpc/include/asm/nohash/64/pgtable.h  |  28 +-
 arch/powerpc/include/asm/nohash/pgtable.h     |   2 +-
 arch/powerpc/include/asm/pgtable.h            |   2 +
 arch/powerpc/include/asm/slice.h              |   2 -
 arch/powerpc/kernel/head_8xx.S                | 292 ++++++------------
 arch/powerpc/kernel/setup_32.c                |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S             |   3 +-
 arch/powerpc/mm/book3s32/mmu.c                |  12 +-
 arch/powerpc/mm/hugetlbpage.c                 |  43 +--
 arch/powerpc/mm/init_32.c                     |  12 +-
 arch/powerpc/mm/kasan/8xx.c                   |  74 +++++
 arch/powerpc/mm/kasan/Makefile                |   2 +
 arch/powerpc/mm/kasan/book3s_32.c             |  57 ++++
 arch/powerpc/mm/kasan/kasan_init_32.c         |  91 +++---
 arch/powerpc/mm/mmu_decl.h                    |   4 +
 arch/powerpc/mm/nohash/8xx.c                  | 250 ++++++++-------
 arch/powerpc/mm/pgtable.c                     |  34 +-
 arch/powerpc/mm/pgtable_32.c                  |  22 +-
 arch/powerpc/mm/ptdump/8xx.c                  |  52 ++--
 arch/powerpc/mm/ptdump/bats.c                 |  41 ++-
 arch/powerpc/mm/ptdump/ptdump.c               |  72 +++--
 arch/powerpc/mm/ptdump/ptdump.h               |   2 +
 arch/powerpc/mm/ptdump/shared.c               |  58 ++--
 arch/powerpc/perf/8xx-pmu.c                   |  10 -
 arch/powerpc/platforms/8xx/Kconfig            |  50 ++-
 arch/powerpc/platforms/Kconfig.cputype        |   2 +-
 arch/powerpc/sysdev/cpm_common.c              |   2 +
 42 files changed, 820 insertions(+), 801 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/nohash/32/slice.h
 create mode 100644 arch/powerpc/mm/kasan/8xx.c
 create mode 100644 arch/powerpc/mm/kasan/book3s_32.c

-- 
2.25.0


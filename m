Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D19184D3826
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDKPH4xhPz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 04:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDKNB6Dj3z3bV7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 04:45:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDKN10yPJz9sTW;
 Wed,  9 Mar 2022 18:45:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJdS-TtWKGA7; Wed,  9 Mar 2022 18:45:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDKN00fxhz9sSk;
 Wed,  9 Mar 2022 18:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 009FA8B763;
 Wed,  9 Mar 2022 18:45:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U8pGWKoUCZce; Wed,  9 Mar 2022 18:45:03 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E297A8B788;
 Wed,  9 Mar 2022 18:45:02 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 229HitR93619013
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Mar 2022 18:44:55 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 229HipBZ3619006;
 Wed, 9 Mar 2022 18:44:51 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout (v8)
Date: Wed,  9 Mar 2022 18:44:34 +0100
Message-Id: <cover.1646847561.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646847882; l=5167; s=20211009;
 h=from:subject:message-id; bh=Uau/5HE7D8+NGsmvUcKOtp/wS0NGpronay3YtKaYLFE=;
 b=VX/STdMX0iP0Zj6tzDx+vFVjELCXikSoBhZ3eYZIWlNRHJx1dTm7H/M4gIiYqH+UENJFCd5Sr5PQ
 CuOz/8C2B11Prj4H8I48f5BONp0029IISEVALluR9EC1P9z3Iy+B
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rebased on top of powerpc/next branch

This series converts powerpc to default topdown mmap layout.

powerpc requires its own arch_get_unmapped_area() only when
slices are needed, which is only for book3s/64. First part of
the series moves slices into book3s/64 specific directories
and cleans up other subarchitectures.

Last part converts to default topdown mmap layout.

A small modification is done to core mm to allow
powerpc to still provide its own arch_randomize_brk()

Another modification is done to core mm to allow powerpc
to use generic versions of get_unmapped_area functions for Radix
while still providing its own implementation for Hash, the
selection between Radix and Hash being doing at runtime.

Last modification to core mm is to give len and flags to
arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Changes in v8:
- Moved patch "sizes.h: Add SZ_1T macro" up from which is already in linux-next but not in Linus tree yet.
- Rebased on today's powerpc/next

Changes in v7:
- Taken into account comments from Catalin (patches 3 and 4)

Changes in v6:
- New patch (patch 4) to take arch_get_mmap_base() and arch_get_mmap_end() into account in generic hugetlb_get_unmapped_area()
- Get back arch_randomize_brk() simplification as it relies on default topdown mmap layout.
- Fixed precedence between || and && in powerpc's arch_get_mmap_end() (patch 9)

Changes in v5:
- Added patch 3
- Added arch_get_mmap_base() and arch_get_mmap_end() to patch 7 to better match original powerpc behaviour
- Switched patched 10 and 11 and performed full randomisation in patch 10 just before switching to default implementation, as suggested by Nic.

Changes in v4:
- Move arch_randomize_brk() simplification out of this series
- Add a change to core mm to enable using generic implementation
while providing arch specific one at the same time.
- Reworked radix get_unmapped_area to use generic implementation
- Rebase on top of Nic's series v6

Changes in v3:
- Fixed missing <linux/elf-randomize.h> in last patch
- Added a patch to move SZ_1T out of drivers/pci/controller/pci-xgene.c

Changes in v2:
- Moved patch 4 before patch 2
- Make generic arch_randomize_brk() __weak
- Added patch 9

Christophe Leroy (14):
  sizes.h: Add SZ_1T macro
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  mm, hugetlbfs: Allow an arch to always use generic versions of
    get_unmapped_area functions
  mm: Add len and flags parameters to arch_get_mmap_end()
  mm, hugetlbfs: Allow for "high" userspace addresses
  powerpc/mm: Move vma_mmu_pagesize()
  powerpc/mm: Make slice specific to book3s/64
  powerpc/mm: Remove CONFIG_PPC_MM_SLICES
  powerpc/mm: Use generic_get_unmapped_area() and call it from
    arch_get_unmapped_area()
  powerpc/mm: Use generic_hugetlb_get_unmapped_area()
  powerpc/mm: Move get_unmapped_area functions to slice.c
  powerpc/mm: Enable full randomisation of memory mappings
  powerpc/mm: Convert to default topdown mmap layout
  powerpc: Simplify and move arch_randomize_brk()

 arch/arm64/include/asm/processor.h            |   4 +-
 arch/powerpc/Kconfig                          |   2 +-
 arch/powerpc/include/asm/book3s/64/hugetlb.h  |   4 -
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 -
 arch/powerpc/include/asm/book3s/64/slice.h    |  24 ++
 arch/powerpc/include/asm/hugetlb.h            |   2 +-
 arch/powerpc/include/asm/paca.h               |   7 -
 arch/powerpc/include/asm/page.h               |   1 -
 arch/powerpc/include/asm/processor.h          |   2 -
 arch/powerpc/include/asm/slice.h              |  46 ----
 arch/powerpc/include/asm/task_size_64.h       |   8 +
 arch/powerpc/kernel/paca.c                    |   5 -
 arch/powerpc/kernel/process.c                 |  41 ---
 arch/powerpc/mm/Makefile                      |   3 +-
 arch/powerpc/mm/book3s64/Makefile             |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  33 ++-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  55 ----
 arch/powerpc/mm/{ => book3s64}/slice.c        |  71 ++++-
 arch/powerpc/mm/hugetlbpage.c                 |  34 ---
 arch/powerpc/mm/mmap.c                        | 256 ------------------
 arch/powerpc/mm/nohash/mmu_context.c          |   9 -
 arch/powerpc/mm/nohash/tlb.c                  |   4 -
 arch/powerpc/platforms/Kconfig.cputype        |   4 -
 drivers/pci/controller/pci-xgene.c            |   1 -
 fs/hugetlbfs/inode.c                          |  26 +-
 include/linux/hugetlb.h                       |   5 +
 include/linux/sched/mm.h                      |  17 ++
 include/linux/sizes.h                         |   2 +
 mm/mmap.c                                     |  43 +--
 mm/util.c                                     |   2 +-
 31 files changed, 185 insertions(+), 535 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ => book3s64}/slice.c (91%)
 delete mode 100644 arch/powerpc/mm/mmap.c

-- 
2.34.1


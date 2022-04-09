Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376D4FA9E8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 19:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbMQK13yVz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 03:23:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbMKb0KBQz3bd5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 03:18:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KbMJw2Qxyz9sTc;
 Sat,  9 Apr 2022 19:18:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMhuDyPeB0eN; Sat,  9 Apr 2022 19:18:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KbMJl643tz9sTb;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B325C8B765;
 Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nZ4w1YF23s7U; Sat,  9 Apr 2022 19:18:15 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.53])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8E238B7AE;
 Sat,  9 Apr 2022 19:18:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 239HI6gW833194
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 9 Apr 2022 19:18:06 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 239HI0bF833193;
 Sat, 9 Apr 2022 19:18:00 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, akpm@linux-foundation.org
Subject: [PATCH v10 00/13] Convert powerpc to default topdown mmap layout (v10)
Date: Sat,  9 Apr 2022 19:17:24 +0200
Message-Id: <cover.1649523076.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1649524639; l=5571; s=20211009;
 h=from:subject:message-id; bh=JzgjaIKR+7dxVs2ANLv2x9IoQcxBQhALwaltY+p4vu0=;
 b=ZUS137jugYJSbV22lkd98zg4vqkoyJ1LwCyNYDM1WkeC2thS3deL3wLtVfyO+9J/DKu/7jWsv1+b
 LfsK9hpCBjwXcEfYZZ4/SJY/blwQOrPY6Y33kybXyO+GPuBU/3iI
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rebased on top of v5.18-rc1

This series converts powerpc to default topdown mmap layout.

First patch is a mm fix that should go into v5.18 and stable.

Andrew, can you take it ?

It is a complement/fix of f6795053dac8 ("mm: mmap: Allow for
"high" userspace addresses") for hugetlb. It adds support for "high"
userspace addresses that are optionally supported on the system and
have to be requested via a hint mechanism ("high" addr parameter to mmap).

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

Changes in v10:
- Moved patch 4 as first patch in order to allow merging a stable backporting independently

Changes in v9:
- v9 was just a split of v8 for tentatively getting the mm part merge through mm and the rest through powerpc tree

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

Christophe Leroy (13):
  mm, hugetlbfs: Allow for "high" userspace addresses
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  mm, hugetlbfs: Allow an arch to always use generic versions of
    get_unmapped_area functions
  mm: Add len and flags parameters to arch_get_mmap_end()
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
 fs/hugetlbfs/inode.c                          |  26 +-
 include/linux/hugetlb.h                       |   5 +
 include/linux/sched/mm.h                      |  17 ++
 mm/mmap.c                                     |  43 +--
 mm/util.c                                     |   2 +-
 29 files changed, 183 insertions(+), 534 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ => book3s64}/slice.c (91%)
 delete mode 100644 arch/powerpc/mm/mmap.c

-- 
2.35.1


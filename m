Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2E88A569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GH13nz7z3dXK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 01:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GGY6z7Mz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:56:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4V3GGL3yshz9sq1;
	Mon, 25 Mar 2024 15:56:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0GLhUgBDpEJ; Mon, 25 Mar 2024 15:56:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4V3GGK1NtXz9sTD;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BF598B770;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ILrl3yQG2tup; Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0882E8B765;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc 8xx
Date: Mon, 25 Mar 2024 15:55:53 +0100
Message-ID: <cover.1711377230.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711378567; l=4005; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1QUfp3pSHGOWHPlUD77voOXNtRwi/Hp1Mh0eHpyYI3M=; b=C2sC3KyJ+kZ+6wF7ahqvDmuEGRLy5haI+SS54JsNZwoPEOE39owJkJ0ambGrjV6GLYJixynOt hLZawct1NZMDswMbTvR/oOyV7gzS1FnN6AeaEeEOZQL1j80Ng/rUHOW
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series reimplements hugepages with hugepd on powerpc 8xx.

Unlike most architectures, powerpc 8xx HW requires a two-level
pagetable topology for all page sizes. So a leaf PMD-contig approach
is not feasible as such.

Possible sizes are 4k, 16k, 512k and 8M.

First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
must point to a single entry level-2 page table. Until now that was
done using hugepd. This series changes it to use standard page tables
where the entry is replicated 1024 times on each of the two pagetables
refered by the two associated PMD entries for that 8M page.

At the moment it has to look into each helper to know if the
hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
a lower size. I hope this can me handled by core-mm in the future.

There are probably several ways to implement stuff, so feedback is
very welcome.

Christophe Leroy (8):
  mm: Provide pagesize to pmd_populate()
  mm: Provide page size to pte_alloc_huge()
  mm: Provide pmd to pte_leaf_size()
  mm: Provide mm_struct and address to huge_ptep_get()
  powerpc/mm: Allow hugepages without hugepd
  powerpc/8xx: Fix size given to set_huge_pte_at()
  powerpc/8xx: Remove support for 8M pages
  powerpc/8xx: Add back support for 8M pages using contiguous PTE
    entries

 arch/arm64/include/asm/hugetlb.h              |  2 +-
 arch/arm64/include/asm/pgtable.h              |  2 +-
 arch/arm64/mm/hugetlbpage.c                   |  2 +-
 arch/parisc/mm/hugetlbpage.c                  |  2 +-
 arch/powerpc/Kconfig                          |  1 -
 arch/powerpc/include/asm/hugetlb.h            | 13 +++-
 .../include/asm/nohash/32/hugetlb-8xx.h       | 54 ++++++++---------
 arch/powerpc/include/asm/nohash/32/pgalloc.h  |  2 +
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  | 59 +++++++++++++------
 arch/powerpc/include/asm/nohash/pgtable.h     | 12 ++--
 arch/powerpc/include/asm/page.h               |  5 --
 arch/powerpc/include/asm/pgtable.h            |  1 +
 arch/powerpc/kernel/head_8xx.S                | 10 +---
 arch/powerpc/mm/hugetlbpage.c                 | 23 +++++++-
 arch/powerpc/mm/nohash/8xx.c                  | 46 +++++++--------
 arch/powerpc/mm/pgtable.c                     | 26 +++++---
 arch/powerpc/mm/pgtable_32.c                  |  2 +-
 arch/powerpc/platforms/Kconfig.cputype        |  2 +
 arch/riscv/include/asm/pgtable.h              |  2 +-
 arch/riscv/mm/hugetlbpage.c                   |  2 +-
 arch/sh/mm/hugetlbpage.c                      |  2 +-
 arch/sparc/include/asm/pgtable_64.h           |  2 +-
 arch/sparc/mm/hugetlbpage.c                   |  4 +-
 fs/hugetlbfs/inode.c                          |  2 +-
 fs/proc/task_mmu.c                            |  8 +--
 fs/userfaultfd.c                              |  2 +-
 include/asm-generic/hugetlb.h                 |  2 +-
 include/linux/hugetlb.h                       |  4 +-
 include/linux/mm.h                            | 12 ++--
 include/linux/pgtable.h                       |  2 +-
 include/linux/swapops.h                       |  2 +-
 kernel/events/core.c                          |  2 +-
 mm/damon/vaddr.c                              |  6 +-
 mm/filemap.c                                  |  2 +-
 mm/gup.c                                      |  2 +-
 mm/hmm.c                                      |  2 +-
 mm/hugetlb.c                                  | 46 +++++++--------
 mm/internal.h                                 |  2 +-
 mm/memory-failure.c                           |  2 +-
 mm/memory.c                                   | 19 +++---
 mm/mempolicy.c                                |  2 +-
 mm/migrate.c                                  |  4 +-
 mm/mincore.c                                  |  2 +-
 mm/pgalloc-track.h                            |  2 +-
 mm/userfaultfd.c                              |  6 +-
 45 files changed, 229 insertions(+), 180 deletions(-)

-- 
2.43.0


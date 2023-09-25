Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6917ADED9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWhj4z5yz3ddY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:33:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWg71GDHz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:31:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWfv3d16z9v2F;
	Mon, 25 Sep 2023 20:31:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzDSs0ZPbu5A; Mon, 25 Sep 2023 20:31:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWfs3ypKz9v53;
	Mon, 25 Sep 2023 20:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 811308B763;
	Mon, 25 Sep 2023 20:31:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RIJaMQ3W-tD1; Mon, 25 Sep 2023 20:31:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BCFF8B78C;
	Mon, 25 Sep 2023 20:31:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVQuO1499129
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:26 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVO8P1499128;
	Mon, 25 Sep 2023 20:31:24 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 00/37] Implement execute-only protection on powerpc
Date: Mon, 25 Sep 2023 20:31:14 +0200
Message-ID: <cover.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666673; l=5464; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7nZh0WO2/BaZaATtvhUmLJNVHAy8we948o8I7rD7dYY=; b=qqNWaTHwTLjgjSLIIJHFiyPt+85pQyPWpF5nF354FG14i/O5efyD1+E5+0ggYPvDPvDos3nKF fBYuF/Q8ndtD/DuNc8REUe1Ck0E4OAIE4Pbjv6XuVBX1H9XjHGnegLM
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series reworks _PAGE_FLAGS on all platforms in order
to implement execute-only protection on all powerpc.

For all targets except 40x and 604 it will be a real execute-only
protection as the hardware and/or software allows a distinct protection.

For 40x and 604 that's a poor's man execute-only protection in the
way that once the page is in the TLB it can be executed. But it's
better than nothing and allows to have a similar implementation for
all sorts of powerpc.

Patches 1 and 2 are fixes that should also be back-ported to stable
version.

Patches 3 to 7 are generic trivial cleanups.

Patches 8 to 19 are a cleanup of pgtable.h for nohash. Main purpose
is to refactor a lot of common code between nohash/32 and nohash/64.

Patches 20 to 37 do the real work on PAGE flags in order to
switch all platforms to _PAGE_READ and _PAGE_WRITE like book3s/64
today. Once that is done it is easy to implement execute-only
protection.

Patch 1 to 19 were already sent-out as v1 of series
named "cleanup/refactor pgtable.h". Problems reported by robots
are fixed here.

Christophe Leroy (37):
  powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
  powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
  powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
  powerpc: Remove pte_ERROR()
  powerpc: Deduplicate prototypes of ptep_set_access_flags() and
    phys_mem_access_prot()
  powerpc: Refactor update_mmu_cache_range()
  powerpc: Untangle fixmap.h and pgtable.h and mmu.h
  powerpc/nohash: Remove {pte/pmd}_protnone()
  powerpc/nohash: Refactor declaration of {map/unmap}_kernel_page()
  powerpc/nohash: Move 8xx version of pte_update() into pte-8xx.h
  powerpc/nohash: Replace #ifdef CONFIG_44x by IS_ENABLED(CONFIG_44x) in
    pgtable.h
  powerpc/nohash: Refactor pte_update()
  powerpc/nohash: Refactor checking of no-change in pte_update()
  powerpc/nohash: Deduplicate _PAGE_CHG_MASK
  powerpc/nohash: Deduplicate pte helpers
  powerpc/nohash: Refactor ptep_test_and_clear_young()
  powerpc/nohash: Deduplicate ptep_set_wrprotect() and
    ptep_get_and_clear()
  powerpc/nohash: Refactor pte_clear()
  powerpc/nohash: Refactor __ptep_set_access_flags()
  powerpc/e500: Simplify pte_mkexec()
  powerpc: Implement and use pgprot_nx()
  powerpc: Fail ioremap() instead of silently ignoring flags when
    PAGE_USER is set
  powerpc: Remove pte_mkuser() and pte_mkpriviledged()
  powerpc: Rely on address instead of pte_user()
  powerpc: Refactor permission masks used for __P/__S table and kernel
    memory flags
  powerpc/8xx: Use generic permission masks
  powerpc/64s: Use generic permission masks
  powerpc/nohash: Add _PAGE_WRITE to supplement _PAGE_RW
  powerpc/nohash: Replace pte_user() by pte_read()
  powerpc/e500: Introduce _PAGE_READ and remove _PAGE_USER
  powerpc/44x: Introduce _PAGE_READ and remove _PAGE_USER
  powerpc/40x: Introduce _PAGE_READ and remove _PAGE_USER
  powerpc/32s: Add _PAGE_WRITE to supplement _PAGE_RW
  powerpc/32s: Introduce _PAGE_READ and remove _PAGE_USER
  powerpc/ptdump: Display _PAGE_READ and _PAGE_WRITE
  powerpc: Finally remove _PAGE_USER
  powerpc: Support execute-only on all powerpc

 arch/powerpc/include/asm/book3s/32/pgtable.h  |  83 +++----
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  35 +--
 arch/powerpc/include/asm/book3s/pgtable.h     |  33 ---
 arch/powerpc/include/asm/fixmap.h             |  16 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h  |   1 -
 arch/powerpc/include/asm/nohash/32/pgtable.h  | 201 +---------------
 arch/powerpc/include/asm/nohash/32/pte-40x.h  |  21 +-
 arch/powerpc/include/asm/nohash/32/pte-44x.h  |  20 +-
 arch/powerpc/include/asm/nohash/32/pte-85xx.h |  20 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  |  99 +++++---
 arch/powerpc/include/asm/nohash/64/pgtable.h  | 120 +---------
 arch/powerpc/include/asm/nohash/pgtable.h     | 216 ++++++++++++------
 arch/powerpc/include/asm/nohash/pte-e500.h    |  41 +---
 arch/powerpc/include/asm/pgtable-masks.h      |  32 +++
 arch/powerpc/include/asm/pgtable.h            |  35 +++
 arch/powerpc/kernel/head_40x.S                |  19 +-
 arch/powerpc/kernel/head_44x.S                |  40 ++--
 arch/powerpc/kernel/head_85xx.S               |  12 +-
 arch/powerpc/kernel/head_book3s_32.S          |  63 ++---
 arch/powerpc/mm/book3s32/hash_low.S           |  32 ++-
 arch/powerpc/mm/book3s32/mmu.c                |   6 +-
 arch/powerpc/mm/book3s64/pgtable.c            |  10 +-
 arch/powerpc/mm/fault.c                       |   9 +-
 arch/powerpc/mm/init_32.c                     |   1 +
 arch/powerpc/mm/ioremap.c                     |   6 +-
 arch/powerpc/mm/mem.c                         |   1 +
 arch/powerpc/mm/nohash/40x.c                  |  19 +-
 arch/powerpc/mm/nohash/8xx.c                  |   2 +
 arch/powerpc/mm/nohash/book3e_pgtable.c       |   2 +-
 arch/powerpc/mm/nohash/e500.c                 |   6 +-
 arch/powerpc/mm/nohash/e500_hugetlbpage.c     |   3 +-
 arch/powerpc/mm/pgtable.c                     |  26 +--
 arch/powerpc/mm/ptdump/8xx.c                  |   5 -
 arch/powerpc/mm/ptdump/shared.c               |  14 +-
 arch/powerpc/platforms/83xx/misc.c            |   2 +
 arch/powerpc/platforms/8xx/cpm1.c             |   1 +
 36 files changed, 511 insertions(+), 741 deletions(-)
 create mode 100644 arch/powerpc/include/asm/pgtable-masks.h

-- 
2.41.0


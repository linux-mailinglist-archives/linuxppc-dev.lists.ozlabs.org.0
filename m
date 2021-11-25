Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D545D624
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 09:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J09vb4fwMz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 19:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J09rr6TbTz3c8W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 19:24:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J09rT5YzZz9sSW;
 Thu, 25 Nov 2021 09:23:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZQ4In98YiGg; Thu, 25 Nov 2021 09:23:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J09rM5s9Mz9sSs;
 Thu, 25 Nov 2021 09:23:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8F358B763;
 Thu, 25 Nov 2021 09:23:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xdzKrB0X8hTb; Thu, 25 Nov 2021 09:23:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC0918B77E;
 Thu, 25 Nov 2021 09:23:46 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AP8NbZm086344
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 09:23:37 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AP8NZ8w086343;
 Thu, 25 Nov 2021 09:23:35 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v2 0/9] Convert powerpc to default topdown mmap layout
Date: Thu, 25 Nov 2021 09:23:22 +0100
Message-Id: <cover.1637828367.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637828608; l=2768; s=20211009;
 h=from:subject:message-id; bh=Ne8VWHr7UfXdPKHcWWwHDV+u9sxnekcI1jHJ7Ct1EsI=;
 b=pRH9I5Vx22vrN4e7OT2gh7KvhlTErFlJbr+DAIOoR80mIkJ8i+7+aTY/xkWgRj8Qrf5F2xgDFUE8
 ahXrLfCZBVNKu9evBfvVImY9xYLubuSrbwgE35F8/LfrbuNHsNKP
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

This series converts powerpc to default topdown mmap layout.

powerpc provides its own arch_get_unmapped_area() only when
slices are needed, which is only for book3s/64. First part of
the series moves slices into book3s/64 specific directories
and cleans up other subarchitectures.

Then a small modification is done to core mm to allow
powerpc to still provide its own arch_randomize_brk()

Last part converts to default topdown mmap layout.

Changes in v2:
- Moved patch 4 before patch 2
- Make generic arch_randomize_brk() __weak
- Added patch 9

Christophe Leroy (9):
  powerpc/mm: Make slice specific to book3s/64
  powerpc/mm: Move vma_mmu_pagesize() and hugetlb_get_unmapped_area() to
    slice.c
  powerpc/mm: Remove CONFIG_PPC_MM_SLICES
  powerpc/mm: Remove asm/slice.h
  powerpc/mm: Call radix__arch_get_unmapped_area() from
    arch_get_unmapped_area()
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  powerpc/mm: Convert to default topdown mmap layout
  powerpc/mm: Properly randomise mmap with slices
  powerpc: Simplify and move arch_randomize_brk()

 arch/powerpc/Kconfig                          |   2 +-
 arch/powerpc/include/asm/book3s/64/hash.h     |   5 +-
 arch/powerpc/include/asm/book3s/64/hugetlb.h  |   4 -
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/slice.h    |  18 ++
 arch/powerpc/include/asm/hugetlb.h            |   2 +-
 arch/powerpc/include/asm/paca.h               |   5 -
 arch/powerpc/include/asm/page.h               |   1 -
 arch/powerpc/include/asm/processor.h          |   2 -
 arch/powerpc/include/asm/slice.h              |  46 ----
 arch/powerpc/kernel/paca.c                    |   5 -
 arch/powerpc/kernel/process.c                 |  40 ---
 arch/powerpc/mm/Makefile                      |   3 +-
 arch/powerpc/mm/book3s64/Makefile             |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  32 +--
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  55 -----
 arch/powerpc/mm/{ => book3s64}/slice.c        | 200 ++++++++++++++-
 arch/powerpc/mm/hugetlbpage.c                 |  28 ---
 arch/powerpc/mm/mmap.c                        | 228 ------------------
 arch/powerpc/mm/nohash/mmu_context.c          |   9 -
 arch/powerpc/mm/nohash/tlb.c                  |   4 -
 arch/powerpc/platforms/Kconfig.cputype        |   4 -
 include/linux/sizes.h                         |   2 +
 mm/util.c                                     |   2 +-
 24 files changed, 234 insertions(+), 466 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ => book3s64}/slice.c (80%)
 delete mode 100644 arch/powerpc/mm/mmap.c

-- 
2.33.1


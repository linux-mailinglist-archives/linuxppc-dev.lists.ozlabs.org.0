Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 019661602FD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 09:42:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48L0xS5FL4zDqKq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2020 19:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=g/7hKB6P; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48L0SB1BxwzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 19:20:58 +1100 (AEDT)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 590392086A;
 Sun, 16 Feb 2020 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581841256;
 bh=AS1N2p4BpR1Wp3lQ9tOhwMdbr5iUMexF6sWGldk1z/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g/7hKB6PbUNoRQhr2FSUV/EZNHMBHDzp+OThZ5TUaMd0LcM615MGeGVBPa9Y/cpUT
 EXICYRZH1WEhYsrxZ/uxHUhQBALePHLLDRTYnaWhL2Z9DHLTPsUT9ycYjRNusAD2PA
 l6WxgWTsxpIFjC43EEzO3qPqunr2TJiqU09lTOAI=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] mm: remove __ARCH_HAS_5LEVEL_HACK and
 include/asm-generic/5level-fixup.h
Date: Sun, 16 Feb 2020 10:18:43 +0200
Message-Id: <20200216081843.28670-14-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Jonas Bonn <jonas@southpole.se>,
 linux-arch@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Marc Zyngier <maz@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 James Morse <james.morse@arm.com>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

There are no architectures that use include/asm-generic/5level-fixup.h
therefore it can be removed along with __ARCH_HAS_5LEVEL_HACK define and
the code it surrounds

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/asm-generic/5level-fixup.h | 58 ------------------------------
 include/linux/mm.h                 |  6 ----
 mm/kasan/init.c                    | 11 ------
 mm/memory.c                        |  8 -----
 4 files changed, 83 deletions(-)
 delete mode 100644 include/asm-generic/5level-fixup.h

diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
deleted file mode 100644
index 4c74b1c1d13b..000000000000
--- a/include/asm-generic/5level-fixup.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _5LEVEL_FIXUP_H
-#define _5LEVEL_FIXUP_H
-
-#define __ARCH_HAS_5LEVEL_HACK
-#define __PAGETABLE_P4D_FOLDED 1
-
-#define P4D_SHIFT			PGDIR_SHIFT
-#define P4D_SIZE			PGDIR_SIZE
-#define P4D_MASK			PGDIR_MASK
-#define MAX_PTRS_PER_P4D		1
-#define PTRS_PER_P4D			1
-
-#define p4d_t				pgd_t
-
-#define pud_alloc(mm, p4d, address) \
-	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
-		NULL : pud_offset(p4d, address))
-
-#define p4d_alloc(mm, pgd, address)	(pgd)
-#define p4d_offset(pgd, start)		(pgd)
-
-#ifndef __ASSEMBLY__
-static inline int p4d_none(p4d_t p4d)
-{
-	return 0;
-}
-
-static inline int p4d_bad(p4d_t p4d)
-{
-	return 0;
-}
-
-static inline int p4d_present(p4d_t p4d)
-{
-	return 1;
-}
-#endif
-
-#define p4d_ERROR(p4d)			do { } while (0)
-#define p4d_clear(p4d)			pgd_clear(p4d)
-#define p4d_val(p4d)			pgd_val(p4d)
-#define p4d_populate(mm, p4d, pud)	pgd_populate(mm, p4d, pud)
-#define p4d_populate_safe(mm, p4d, pud)	pgd_populate(mm, p4d, pud)
-#define p4d_page(p4d)			pgd_page(p4d)
-#define p4d_page_vaddr(p4d)		pgd_page_vaddr(p4d)
-
-#define __p4d(x)			__pgd(x)
-#define set_p4d(p4dp, p4d)		set_pgd(p4dp, p4d)
-
-#undef p4d_free_tlb
-#define p4d_free_tlb(tlb, x, addr)	do { } while (0)
-#define p4d_free(mm, x)			do { } while (0)
-
-#undef  p4d_addr_end
-#define p4d_addr_end(addr, end)		(end)
-
-#endif
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52269e56c514..69fb46e1d91b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1841,11 +1841,6 @@ int __pte_alloc_kernel(pmd_t *pmd);
 
 #if defined(CONFIG_MMU)
 
-/*
- * The following ifdef needed to get the 5level-fixup.h header to work.
- * Remove it when 5level-fixup.h has been removed.
- */
-#ifndef __ARCH_HAS_5LEVEL_HACK
 static inline p4d_t *p4d_alloc(struct mm_struct *mm, pgd_t *pgd,
 		unsigned long address)
 {
@@ -1859,7 +1854,6 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
 	return (unlikely(p4d_none(*p4d)) && __pud_alloc(mm, p4d, address)) ?
 		NULL : pud_offset(p4d, address);
 }
-#endif /* !__ARCH_HAS_5LEVEL_HACK */
 
 static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
 {
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index ce45c491ebcd..fe6be0be1f76 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -250,20 +250,9 @@ int __ref kasan_populate_early_shadow(const void *shadow_start,
 			 * 3,2 - level page tables where we don't have
 			 * puds,pmds, so pgd_populate(), pud_populate()
 			 * is noops.
-			 *
-			 * The ifndef is required to avoid build breakage.
-			 *
-			 * With 5level-fixup.h, pgd_populate() is not nop and
-			 * we reference kasan_early_shadow_p4d. It's not defined
-			 * unless 5-level paging enabled.
-			 *
-			 * The ifndef can be dropped once all KASAN-enabled
-			 * architectures will switch to pgtable-nop4d.h.
 			 */
-#ifndef __ARCH_HAS_5LEVEL_HACK
 			pgd_populate(&init_mm, pgd,
 					lm_alias(kasan_early_shadow_p4d));
-#endif
 			p4d = p4d_offset(pgd, addr);
 			p4d_populate(&init_mm, p4d,
 					lm_alias(kasan_early_shadow_pud));
diff --git a/mm/memory.c b/mm/memory.c
index 0bccc622e482..10cc147db1b8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4252,19 +4252,11 @@ int __pud_alloc(struct mm_struct *mm, p4d_t *p4d, unsigned long address)
 	smp_wmb(); /* See comment in __pte_alloc */
 
 	spin_lock(&mm->page_table_lock);
-#ifndef __ARCH_HAS_5LEVEL_HACK
 	if (!p4d_present(*p4d)) {
 		mm_inc_nr_puds(mm);
 		p4d_populate(mm, p4d, new);
 	} else	/* Another has populated it */
 		pud_free(mm, new);
-#else
-	if (!pgd_present(*p4d)) {
-		mm_inc_nr_puds(mm);
-		pgd_populate(mm, p4d, new);
-	} else	/* Another has populated it */
-		pud_free(mm, new);
-#endif /* __ARCH_HAS_5LEVEL_HACK */
 	spin_unlock(&mm->page_table_lock);
 	return 0;
 }
-- 
2.24.0


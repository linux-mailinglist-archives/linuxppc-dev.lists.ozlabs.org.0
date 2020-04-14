Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3F1A84EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:30:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491rZM5YpzzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 02:30:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=1uXYftVP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qNV5F0lzDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:36:58 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E5F920678;
 Tue, 14 Apr 2020 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878616;
 bh=+PM6cCkwYFqje74qzoRC6poZ06tSHFDDyFeAMiCHCeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1uXYftVP+SP8zAkhuU/yZP3XxMdTuasDKvfSy5JabFslhgYvIqGAY3gx75EMaGZCP
 c1BEUefD/ho3vwJjC8da0hE+eMTa9FhGFDTJyxFAmWVy+fIvJDP42sqU3PraFGMcTT
 WfnmK5AWGpqRApF3UrQRroyPdYXW48Z1E2raP14Q=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 11/14] sh: add support for folded p4d page tables
Date: Tue, 14 Apr 2020 18:34:52 +0300
Message-Id: <20200414153455.21744-12-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
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
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Implement primitives necessary for the 4th level folding, add walks of p4d
level where appropriate and remove usage of __ARCH_USE_5LEVEL_HACK.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/sh/include/asm/pgtable-2level.h |  1 -
 arch/sh/include/asm/pgtable-3level.h |  1 -
 arch/sh/kernel/io_trapped.c          |  7 ++++++-
 arch/sh/mm/cache-sh4.c               |  4 +++-
 arch/sh/mm/cache-sh5.c               |  7 ++++++-
 arch/sh/mm/fault.c                   | 26 +++++++++++++++++++++++---
 arch/sh/mm/hugetlbpage.c             | 28 ++++++++++++++++++----------
 arch/sh/mm/init.c                    |  9 ++++++++-
 arch/sh/mm/kmap.c                    |  2 +-
 arch/sh/mm/tlbex_32.c                |  6 +++++-
 arch/sh/mm/tlbex_64.c                |  7 ++++++-
 11 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/arch/sh/include/asm/pgtable-2level.h b/arch/sh/include/asm/pgtable-2level.h
index bf1eb51c3ee5..08bff93927ff 100644
--- a/arch/sh/include/asm/pgtable-2level.h
+++ b/arch/sh/include/asm/pgtable-2level.h
@@ -2,7 +2,6 @@
 #ifndef __ASM_SH_PGTABLE_2LEVEL_H
 #define __ASM_SH_PGTABLE_2LEVEL_H
 
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopmd.h>
 
 /*
diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
index 779260b721ca..0f80097e5c9c 100644
--- a/arch/sh/include/asm/pgtable-3level.h
+++ b/arch/sh/include/asm/pgtable-3level.h
@@ -2,7 +2,6 @@
 #ifndef __ASM_SH_PGTABLE_3LEVEL_H
 #define __ASM_SH_PGTABLE_3LEVEL_H
 
-#define __ARCH_USE_5LEVEL_HACK
 #include <asm-generic/pgtable-nopud.h>
 
 /*
diff --git a/arch/sh/kernel/io_trapped.c b/arch/sh/kernel/io_trapped.c
index 60c828a2b8a2..037aab2708b7 100644
--- a/arch/sh/kernel/io_trapped.c
+++ b/arch/sh/kernel/io_trapped.c
@@ -136,6 +136,7 @@ EXPORT_SYMBOL_GPL(match_trapped_io_handler);
 static struct trapped_io *lookup_tiop(unsigned long address)
 {
 	pgd_t *pgd_k;
+	p4d_t *p4d_k;
 	pud_t *pud_k;
 	pmd_t *pmd_k;
 	pte_t *pte_k;
@@ -145,7 +146,11 @@ static struct trapped_io *lookup_tiop(unsigned long address)
 	if (!pgd_present(*pgd_k))
 		return NULL;
 
-	pud_k = pud_offset(pgd_k, address);
+	p4d_k = p4d_offset(pgd_k, address);
+	if (!p4d_present(*p4d_k))
+		return NULL;
+
+	pud_k = pud_offset(p4d_k, address);
 	if (!pud_present(*pud_k))
 		return NULL;
 
diff --git a/arch/sh/mm/cache-sh4.c b/arch/sh/mm/cache-sh4.c
index eee911422cf9..45943bcb7042 100644
--- a/arch/sh/mm/cache-sh4.c
+++ b/arch/sh/mm/cache-sh4.c
@@ -209,6 +209,7 @@ static void sh4_flush_cache_page(void *args)
 	unsigned long address, pfn, phys;
 	int map_coherent = 0;
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -224,7 +225,8 @@ static void sh4_flush_cache_page(void *args)
 		return;
 
 	pgd = pgd_offset(vma->vm_mm, address);
-	pud = pud_offset(pgd, address);
+	p4d = p4d_offset(pgd, address);
+	pud = pud_offset(p4d, address);
 	pmd = pmd_offset(pud, address);
 	pte = pte_offset_kernel(pmd, address);
 
diff --git a/arch/sh/mm/cache-sh5.c b/arch/sh/mm/cache-sh5.c
index 445b5e69b73c..442a77cc2957 100644
--- a/arch/sh/mm/cache-sh5.c
+++ b/arch/sh/mm/cache-sh5.c
@@ -383,6 +383,7 @@ static void sh64_dcache_purge_user_pages(struct mm_struct *mm,
 				unsigned long addr, unsigned long end)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -397,7 +398,11 @@ static void sh64_dcache_purge_user_pages(struct mm_struct *mm,
 	if (pgd_bad(*pgd))
 		return;
 
-	pud = pud_offset(pgd, addr);
+	p4d = p4d_offset(pgd, addr);
+	if (p4d_none(*p4d) || p4d_bad(*p4d))
+		return;
+
+	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud) || pud_bad(*pud))
 		return;
 
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 7b74e18b71d7..8b3ab65c81c4 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -53,6 +53,7 @@ static void show_pte(struct mm_struct *mm, unsigned long addr)
 		 (u64)pgd_val(*pgd));
 
 	do {
+		p4d_t *p4d;
 		pud_t *pud;
 		pmd_t *pmd;
 		pte_t *pte;
@@ -65,7 +66,20 @@ static void show_pte(struct mm_struct *mm, unsigned long addr)
 			break;
 		}
 
-		pud = pud_offset(pgd, addr);
+		p4d = p4d_offset(pgd, addr);
+		if (PTRS_PER_P4D != 1)
+			pr_cont(", *p4d=%0*Lx", (u32)(sizeof(*p4d) * 2),
+			        (u64)p4d_val(*p4d));
+
+		if (p4d_none(*p4d))
+			break;
+
+		if (p4d_bad(*p4d)) {
+			pr_cont("(bad)");
+			break;
+		}
+
+		pud = pud_offset(p4d, addr);
 		if (PTRS_PER_PUD != 1)
 			pr_cont(", *pud=%0*llx", (u32)(sizeof(*pud) * 2),
 				(u64)pud_val(*pud));
@@ -107,6 +121,7 @@ static inline pmd_t *vmalloc_sync_one(pgd_t *pgd, unsigned long address)
 {
 	unsigned index = pgd_index(address);
 	pgd_t *pgd_k;
+	p4d_t *p4d, *p4d_k;
 	pud_t *pud, *pud_k;
 	pmd_t *pmd, *pmd_k;
 
@@ -116,8 +131,13 @@ static inline pmd_t *vmalloc_sync_one(pgd_t *pgd, unsigned long address)
 	if (!pgd_present(*pgd_k))
 		return NULL;
 
-	pud = pud_offset(pgd, address);
-	pud_k = pud_offset(pgd_k, address);
+	p4d = p4d_offset(pgd, address);
+	p4d_k = p4d_offset(pgd_k, address);
+	if (!p4d_present(*p4d_k))
+		return NULL;
+
+	pud = pud_offset(p4d, address);
+	pud_k = pud_offset(p4d_k, address);
 	if (!pud_present(*pud_k))
 		return NULL;
 
diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 960deb1f24a1..acd5652a0de3 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -26,17 +26,21 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 			unsigned long addr, unsigned long sz)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte = NULL;
 
 	pgd = pgd_offset(mm, addr);
 	if (pgd) {
-		pud = pud_alloc(mm, pgd, addr);
-		if (pud) {
-			pmd = pmd_alloc(mm, pud, addr);
-			if (pmd)
-				pte = pte_alloc_map(mm, pmd, addr);
+		p4d = p4d_alloc(mm, pgd, addr);
+		if (p4d) {
+			pud = pud_alloc(mm, p4d, addr);
+			if (pud) {
+				pmd = pmd_alloc(mm, pud, addr);
+				if (pmd)
+					pte = pte_alloc_map(mm, pmd, addr);
+			}
 		}
 	}
 
@@ -47,17 +51,21 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		       unsigned long addr, unsigned long sz)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte = NULL;
 
 	pgd = pgd_offset(mm, addr);
 	if (pgd) {
-		pud = pud_offset(pgd, addr);
-		if (pud) {
-			pmd = pmd_offset(pud, addr);
-			if (pmd)
-				pte = pte_offset_map(pmd, addr);
+		p4d = p4d_offset(pgd, addr);
+		if (p4d) {
+			pud = pud_offset(p4d, addr);
+			if (pud) {
+				pmd = pmd_offset(pud, addr);
+				if (pmd)
+					pte = pte_offset_map(pmd, addr);
+			}
 		}
 	}
 
diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
index f445ba630790..60c33cf7acd1 100644
--- a/arch/sh/mm/init.c
+++ b/arch/sh/mm/init.c
@@ -45,6 +45,7 @@ void __init __weak plat_mem_setup(void)
 static pte_t *__get_pte_phys(unsigned long addr)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 
@@ -54,7 +55,13 @@ static pte_t *__get_pte_phys(unsigned long addr)
 		return NULL;
 	}
 
-	pud = pud_alloc(NULL, pgd, addr);
+	p4d = p4d_alloc(NULL, pgd, addr);
+	if (unlikely(!p4d)) {
+		p4d_ERROR(*p4d);
+		return NULL;
+	}
+
+	pud = pud_alloc(NULL, p4d, addr);
 	if (unlikely(!pud)) {
 		pud_ERROR(*pud);
 		return NULL;
diff --git a/arch/sh/mm/kmap.c b/arch/sh/mm/kmap.c
index 9e6b38b03cf7..0e7039137f5a 100644
--- a/arch/sh/mm/kmap.c
+++ b/arch/sh/mm/kmap.c
@@ -15,7 +15,7 @@
 #include <asm/cacheflush.h>
 
 #define kmap_get_fixmap_pte(vaddr)                                     \
-	pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr))
+	pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr)), vaddr)
 
 static pte_t *kmap_coherent_pte;
 
diff --git a/arch/sh/mm/tlbex_32.c b/arch/sh/mm/tlbex_32.c
index 382262dc0c4b..1c53868632ee 100644
--- a/arch/sh/mm/tlbex_32.c
+++ b/arch/sh/mm/tlbex_32.c
@@ -23,6 +23,7 @@ handle_tlbmiss(struct pt_regs *regs, unsigned long error_code,
 	       unsigned long address)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -42,7 +43,10 @@ handle_tlbmiss(struct pt_regs *regs, unsigned long error_code,
 		pgd = pgd_offset(current->mm, address);
 	}
 
-	pud = pud_offset(pgd, address);
+	p4d = p4d_offset(pgd, address);
+	if (p4d_none_or_clear_bad(p4d))
+		return 1;
+	pud = pud_offset(p4d, address);
 	if (pud_none_or_clear_bad(pud))
 		return 1;
 	pmd = pmd_offset(pud, address);
diff --git a/arch/sh/mm/tlbex_64.c b/arch/sh/mm/tlbex_64.c
index 8ff966dd0c74..0d015f7556fa 100644
--- a/arch/sh/mm/tlbex_64.c
+++ b/arch/sh/mm/tlbex_64.c
@@ -44,6 +44,7 @@ static int handle_tlbmiss(unsigned long long protection_flags,
 			  unsigned long address)
 {
 	pgd_t *pgd;
+	p4d_t *p4d;
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
@@ -58,7 +59,11 @@ static int handle_tlbmiss(unsigned long long protection_flags,
 		pgd = pgd_offset(current->mm, address);
 	}
 
-	pud = pud_offset(pgd, address);
+	p4d = p4d_offset(pgd, address);
+	if (p4d_none(*p4d) || !p4d_present(*p4d))
+		return 1;
+
+	pud = pud_offset(p4d, address);
 	if (pud_none(*pud) || !pud_present(*pud))
 		return 1;
 
-- 
2.25.1


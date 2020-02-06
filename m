Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A4154583
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 14:55:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D0Lt41DszDqQM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 00:55:34 +1100 (AEDT)
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
 header.s=mail header.b=tupqd5xr; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D0F75sLLzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 00:50:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48D0F16K7Tz9v996;
 Thu,  6 Feb 2020 14:50:29 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tupqd5xr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BLdc-dv9CEj2; Thu,  6 Feb 2020 14:50:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48D0F14F70z9v994;
 Thu,  6 Feb 2020 14:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580997029; bh=uc8VNbrzn2Tun7H3rxrb1NAqwgMomOLG/cwa2WL0XrI=;
 h=From:Subject:To:Cc:Date:From;
 b=tupqd5xrNQLdgEsO2AcJVhmkNDxeVYcsAPNRMq2Uqh4Qkesm61e/a+YtblrJKKXp1
 jO/JQsA4HtEiK3X3aAeqySyH+OBdckfevM+EOprgf5TW2qd6imBoeWl/kcZrofSIiq
 iGvJz6SCxIDeHpg/TOTvmADdmgZr2+YxOEoEV35U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D46EE8B889;
 Thu,  6 Feb 2020 14:50:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zqimB3y9gjxp; Thu,  6 Feb 2020 14:50:30 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 425478B887;
 Thu,  6 Feb 2020 14:50:30 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E46DD652B7; Thu,  6 Feb 2020 13:50:29 +0000 (UTC)
Message-Id: <e744db1529271d11a3fdcdf641617846907b6ffd.1580997012.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/hugetlb: Fix 8M hugepages on 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 aneesh.kumar@linux.ibm.com
Date: Thu,  6 Feb 2020 13:50:29 +0000 (UTC)
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

Commit 55c8fc3f4930 ("powerpc/8xx: reintroduce 16K pages with HW
assistance") redefined pte_t as a struct of 4 pte_basic_t, because
in 16K pages mode there are four identical entries in the page table.
But hugepd entries for 8k pages require only one entrie of size
pte_basic_t. So there is no point in creating a cache for 4 entries
page tables.

Also, with HW assistance the entries must be 4k aligned, the 8xx
drops the last 12 bits. Redefine HUGEPD_SHIFT_MASK to mask them out.

Calculate PTE_T_ORDER using the size of pte_basic_t instead of pte_t.

In 16k mode, define a specific set_huge_pte_at() function which writes
the pte in a single entry instead of using set_pte_at() which writes
4 identical entries. Define set_pte_filter() inline otherwise GCC
doesn't inline it anymore because it is now used twice, and that gives
a pretty suboptimal code because of pte_t being a struct of 4 entries.
This function is also used for 512k pages which only require one entry
as well allthough replicating it four times is harmless as 512k pages
entries are spread every 128 bytes in the table.

Fixes: 22569b881d37 ("powerpc/8xx: Enable 8M hugepage support with HW assistance")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/hugetlb.h |  5 +++++
 arch/powerpc/include/asm/page.h    |  5 +++++
 arch/powerpc/mm/hugetlbpage.c      |  3 ++-
 arch/powerpc/mm/pgtable.c          | 19 ++++++++++++++++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index bd6504c28c2f..f43cfbcf014f 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -64,6 +64,11 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 {
 }
 
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
+#endif
+
 #include <asm-generic/hugetlb.h>
 
 #else /* ! CONFIG_HUGETLB_PAGE */
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 86332080399a..080a0bf8e54b 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -295,8 +295,13 @@ static inline bool pfn_valid(unsigned long pfn)
 /*
  * Some number of bits at the level of the page table that points to
  * a hugepte are used to encode the size.  This masks those bits.
+ * On 8xx, HW assistance requires 4k alignment for the hugepte.
  */
+#ifdef CONFIG_PPC_8xx
+#define HUGEPD_SHIFT_MASK     0xfff
+#else
 #define HUGEPD_SHIFT_MASK     0x3f
+#endif
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 73d4873fc7f8..c61032580185 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -30,7 +30,8 @@ bool hugetlb_disabled = false;
 
 #define hugepd_none(hpd)	(hpd_val(hpd) == 0)
 
-#define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_t)) - __builtin_ffs(sizeof(void *)))
+#define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_basic_t)) - \
+			 __builtin_ffs(sizeof(void *)))
 
 pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr, unsigned long sz)
 {
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index e3759b69f81b..7a38eaa6ca72 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -100,7 +100,7 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
  * as we don't have two bits to spare for _PAGE_EXEC and _PAGE_HWEXEC so
  * instead we "filter out" the exec permission for non clean pages.
  */
-static pte_t set_pte_filter(pte_t pte)
+static inline pte_t set_pte_filter(pte_t pte)
 {
 	struct page *pg;
 
@@ -259,6 +259,23 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	return changed;
 #endif
 }
+
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	pte = pte_mkpte(pte);
+
+	pte = set_pte_filter(pte);
+
+	ptep->pte = pte_val(pte);
+}
+#endif
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #ifdef CONFIG_DEBUG_VM
-- 
2.25.0


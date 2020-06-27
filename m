Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE4320C27D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 16:47:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vGmm4HXqzDqH6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 00:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=kGeCaidI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vGWT5ZDvzDr8g
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 00:35:33 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5920C20885;
 Sat, 27 Jun 2020 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268531;
 bh=ug/zgldkEF9Y1EOWxCdQbFhq6W6AubLqDruRfdpZtCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kGeCaidImTPJgGt9S6wijt8HSPaAsXufRU8Bw3R+Jenx9IwSCz19tOS+s33DYy3Fd
 IcDlElpk6m8c8IYERIfYCh6px/euMBEW7PkfFZkG6NsKEPz+Lcoqc14NcBs88W/xGZ
 9cQUVwRq1YyhbGySMR8ZhKm3fhDosCXptMIYyEmY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] xtensa: switch to generic version of pte allocation
Date: Sat, 27 Jun 2020 17:34:48 +0300
Message-Id: <20200627143453.31835-4-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

xtensa clears PTEs during allocation of the page tables and pte_clear()
sets the PTE to a non-zero value. Splitting ptes_clear() helper out of
pte_alloc_one() and pte_alloc_one_kernel() allows reuse of base generic
allocation methods (__pte_alloc_one() and __pte_alloc_one_kernel()) and the
common GFP mask for page table allocations.

The pte_free() and pte_free_kernel() implementations on xtensa are
identical to the generic ones and can be dropped.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/xtensa/include/asm/pgalloc.h | 41 ++++++++++++++-----------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/xtensa/include/asm/pgalloc.h b/arch/xtensa/include/asm/pgalloc.h
index 1d38f0e755ba..60ee94b42850 100644
--- a/arch/xtensa/include/asm/pgalloc.h
+++ b/arch/xtensa/include/asm/pgalloc.h
@@ -8,9 +8,14 @@
 #ifndef _XTENSA_PGALLOC_H
 #define _XTENSA_PGALLOC_H
 
+#ifdef CONFIG_MMU
 #include <linux/highmem.h>
 #include <linux/slab.h>
 
+#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
+#define __HAVE_ARCH_PTE_ALLOC_ONE
+#include <asm-generic/pgalloc.h>
+
 /*
  * Allocating and freeing a pmd is trivial: the 1-entry pmd is
  * inside the pgd, so has no extra memory associated with it.
@@ -33,45 +38,37 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
 	free_page((unsigned long)pgd);
 }
 
+static inline void ptes_clear(pte_t *ptep)
+{
+	int i;
+
+	for (i = 0; i < PTRS_PER_PTE; i++)
+		pte_clear(NULL, 0, ptep + i);
+}
+
 static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
 	pte_t *ptep;
-	int i;
 
-	ptep = (pte_t *)__get_free_page(GFP_KERNEL);
+	ptep = (pte_t *)__pte_alloc_one_kernel(mm);
 	if (!ptep)
 		return NULL;
-	for (i = 0; i < 1024; i++)
-		pte_clear(NULL, 0, ptep + i);
+	ptes_clear(ptep);
 	return ptep;
 }
 
 static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	pte_t *pte;
 	struct page *page;
 
-	pte = pte_alloc_one_kernel(mm);
-	if (!pte)
-		return NULL;
-	page = virt_to_page(pte);
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	page = __pte_alloc_one(mm, GFP_PGTABLE_USER);
+	if (!page)
 		return NULL;
-	}
+	ptes_clear(page_address(page));
 	return page;
 }
 
-static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
-{
-	free_page((unsigned long)pte);
-}
-
-static inline void pte_free(struct mm_struct *mm, pgtable_t pte)
-{
-	pgtable_pte_page_dtor(pte);
-	__free_page(pte);
-}
 #define pmd_pgtable(pmd) pmd_page(pmd)
+#endif CONFIG_MMU
 
 #endif /* _XTENSA_PGALLOC_H */
-- 
2.26.2


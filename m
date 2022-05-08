Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59451EC88
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 11:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kwzk41vDLz3bfg
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 19:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwzjB5l7Cz3bqw
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 19:37:02 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R831e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VCZxoXx_1652002612; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCZxoXx_1652002612) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 08 May 2022 17:36:53 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org, mike.kravetz@oracle.com,
 catalin.marinas@arm.com, will@kernel.org
Subject: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
Date: Sun,  8 May 2022 17:36:39 +0800
Message-Id: <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
table when unmapping or migrating a hugetlb page, and will change
to use huge_ptep_clear_flush() instead in the following patches.

So this is a preparation patch, which changes the huge_ptep_clear_flush()
to return the original pte to help to nuke a hugetlb page table.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/arm64/include/asm/hugetlb.h   |  4 ++--
 arch/arm64/mm/hugetlbpage.c        | 12 +++++-------
 arch/ia64/include/asm/hugetlb.h    |  4 ++--
 arch/mips/include/asm/hugetlb.h    |  9 ++++++---
 arch/parisc/include/asm/hugetlb.h  |  4 ++--
 arch/powerpc/include/asm/hugetlb.h |  9 ++++++---
 arch/s390/include/asm/hugetlb.h    |  6 +++---
 arch/sh/include/asm/hugetlb.h      |  4 ++--
 arch/sparc/include/asm/hugetlb.h   |  4 ++--
 include/asm-generic/hugetlb.h      |  4 ++--
 mm/hugetlb.c                       |  2 +-
 11 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 1242f71..616b2ca 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -39,8 +39,8 @@ extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 extern void huge_ptep_set_wrprotect(struct mm_struct *mm,
 				    unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-extern void huge_ptep_clear_flush(struct vm_area_struct *vma,
-				  unsigned long addr, pte_t *ptep);
+extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep);
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index cbace1c..ca8e65c 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -486,19 +486,17 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 		set_pte_at(mm, addr, ptep, pfn_pte(pfn, hugeprot));
 }
 
-void huge_ptep_clear_flush(struct vm_area_struct *vma,
-			   unsigned long addr, pte_t *ptep)
+pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+			    unsigned long addr, pte_t *ptep)
 {
 	size_t pgsize;
 	int ncontig;
 
-	if (!pte_cont(READ_ONCE(*ptep))) {
-		ptep_clear_flush(vma, addr, ptep);
-		return;
-	}
+	if (!pte_cont(READ_ONCE(*ptep)))
+		return ptep_clear_flush(vma, addr, ptep);
 
 	ncontig = find_num_contig(vma->vm_mm, addr, ptep, &pgsize);
-	clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
+	return get_clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
 }
 
 static int __init hugetlbpage_init(void)
diff --git a/arch/ia64/include/asm/hugetlb.h b/arch/ia64/include/asm/hugetlb.h
index 7e46ebd..65d3811 100644
--- a/arch/ia64/include/asm/hugetlb.h
+++ b/arch/ia64/include/asm/hugetlb.h
@@ -23,8 +23,8 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 #define is_hugepage_only_range is_hugepage_only_range
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
 }
 
diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index c214440..fd69c88 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -43,16 +43,19 @@ static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
+	pte_t pte;
+
 	/*
 	 * clear the huge pte entry firstly, so that the other smp threads will
 	 * not get old pte entry after finishing flush_tlb_page and before
 	 * setting new huge pte entry
 	 */
-	huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
+	pte = huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
 	flush_tlb_page(vma, addr);
+	return pte;
 }
 
 #define __HAVE_ARCH_HUGE_PTE_NONE
diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
index a69cf9e..25bc560 100644
--- a/arch/parisc/include/asm/hugetlb.h
+++ b/arch/parisc/include/asm/hugetlb.h
@@ -28,8 +28,8 @@ static inline int prepare_hugepage_range(struct file *file,
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
 }
 
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 6a1a1ac..8a5674f 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -43,11 +43,14 @@ static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
-	huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
+	pte_t pte;
+
+	pte = huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
 	flush_hugetlb_page(vma, addr);
+	return pte;
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index 32c3fd6..f22beda 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -50,10 +50,10 @@ static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		set_pte(ptep, __pte(_SEGMENT_ENTRY_EMPTY));
 }
 
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long address, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long address, pte_t *ptep)
 {
-	huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
+	return huge_ptep_get_and_clear(vma->vm_mm, address, ptep);
 }
 
 static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
diff --git a/arch/sh/include/asm/hugetlb.h b/arch/sh/include/asm/hugetlb.h
index ae4de7b..e727cc9 100644
--- a/arch/sh/include/asm/hugetlb.h
+++ b/arch/sh/include/asm/hugetlb.h
@@ -21,8 +21,8 @@ static inline int prepare_hugepage_range(struct file *file,
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
 }
 
diff --git a/arch/sparc/include/asm/hugetlb.h b/arch/sparc/include/asm/hugetlb.h
index 53838a1..b50aa6f 100644
--- a/arch/sparc/include/asm/hugetlb.h
+++ b/arch/sparc/include/asm/hugetlb.h
@@ -21,8 +21,8 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep);
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
-					 unsigned long addr, pte_t *ptep)
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+					  unsigned long addr, pte_t *ptep)
 {
 }
 
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 896f341..a57d667 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -84,10 +84,10 @@ static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 #endif
 
 #ifndef __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
-static inline void huge_ptep_clear_flush(struct vm_area_struct *vma,
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep)
 {
-	ptep_clear_flush(vma, addr, ptep);
+	return ptep_clear_flush(vma, addr, ptep);
 }
 #endif
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8605d7e..61a21af 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 		ClearHPageRestoreReserve(new_page);
 
 		/* Break COW or unshare */
-		huge_ptep_clear_flush(vma, haddr, ptep);
+		(void)huge_ptep_clear_flush(vma, haddr, ptep);
 		mmu_notifier_invalidate_range(mm, range.start, range.end);
 		page_remove_rmap(old_page, vma, true);
 		hugepage_add_new_anon_rmap(new_page, vma, haddr);
-- 
1.8.3.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F08734DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:51:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua7DEidB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua7DEidB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTkV5tf6z3vb1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua7DEidB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua7DEidB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqTYm4LTtz3vkb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 21:43:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xvz813LBdD6KfIiJu0YrLJw0jIHhy/6tbusNo7kv74Y=;
	b=Ua7DEidBShpJB34CHcjVKn7NDv1NNFuEM/mAmi5sWWydhFnkK6RjUdo0zx53yFoWkWFVLa
	/NeVaVcnVoNIk0TBCcMvBmXQJxX5pbwbtTTEycAh8KJMXuOJ8gXJo8gCQ/MCxM8Sz6QQzh
	Qa6RljZo/NyjhZUKQ+7N43Xiznqr4WE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xvz813LBdD6KfIiJu0YrLJw0jIHhy/6tbusNo7kv74Y=;
	b=Ua7DEidBShpJB34CHcjVKn7NDv1NNFuEM/mAmi5sWWydhFnkK6RjUdo0zx53yFoWkWFVLa
	/NeVaVcnVoNIk0TBCcMvBmXQJxX5pbwbtTTEycAh8KJMXuOJ8gXJo8gCQ/MCxM8Sz6QQzh
	Qa6RljZo/NyjhZUKQ+7N43Xiznqr4WE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-L24BTaYGPsqZY-a0Fdh6Vw-1; Wed, 06 Mar 2024 05:43:31 -0500
X-MC-Unique: L24BTaYGPsqZY-a0Fdh6Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D19AE18A6670;
	Wed,  6 Mar 2024 10:43:30 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01513112131D;
	Wed,  6 Mar 2024 10:43:24 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 12/13] mm/treewide: Remove pXd_huge()
Date: Wed,  6 Mar 2024 18:41:46 +0800
Message-ID: <20240306104147.193052-13-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

This API is not used anymore, drop it for the whole tree.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm/mm/Makefile                          |  1 -
 arch/arm/mm/hugetlbpage.c                     | 29 -------------------
 arch/arm64/mm/hugetlbpage.c                   | 10 -------
 arch/loongarch/mm/hugetlbpage.c               | 10 -------
 arch/mips/include/asm/pgtable-32.h            |  2 +-
 arch/mips/include/asm/pgtable-64.h            |  2 +-
 arch/mips/mm/hugetlbpage.c                    | 10 -------
 arch/parisc/mm/hugetlbpage.c                  | 11 -------
 .../include/asm/book3s/64/pgtable-4k.h        | 10 -------
 .../include/asm/book3s/64/pgtable-64k.h       | 25 ----------------
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  3 --
 arch/powerpc/include/asm/nohash/pgtable.h     | 10 -------
 arch/riscv/mm/hugetlbpage.c                   | 10 -------
 arch/s390/mm/hugetlbpage.c                    | 10 -------
 arch/sh/mm/hugetlbpage.c                      | 10 -------
 arch/sparc/mm/hugetlbpage.c                   | 10 -------
 arch/x86/mm/hugetlbpage.c                     | 16 ----------
 include/linux/hugetlb.h                       | 24 ---------------
 18 files changed, 2 insertions(+), 201 deletions(-)
 delete mode 100644 arch/arm/mm/hugetlbpage.c

diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index 71b858c9b10c..1779e12db085 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -21,7 +21,6 @@ KASAN_SANITIZE_physaddr.o	:= n
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
-obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_ARM_PV_FIXUP)	+= pv-fixup-asm.o
 
 obj-$(CONFIG_CPU_ABRT_NOMMU)	+= abort-nommu.o
diff --git a/arch/arm/mm/hugetlbpage.c b/arch/arm/mm/hugetlbpage.c
deleted file mode 100644
index c2fa643f6bb5..000000000000
--- a/arch/arm/mm/hugetlbpage.c
+++ /dev/null
@@ -1,29 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mm/hugetlbpage.c
- *
- * Copyright (C) 2012 ARM Ltd.
- *
- * Based on arch/x86/include/asm/hugetlb.h and Bill Carson's patches
- */
-
-#include <linux/init.h>
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/hugetlb.h>
-#include <linux/pagemap.h>
-#include <linux/err.h>
-#include <linux/sysctl.h>
-#include <asm/mman.h>
-#include <asm/tlb.h>
-#include <asm/tlbflush.h>
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index f494fc31201f..ca58210d6c07 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -79,16 +79,6 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 }
 #endif
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, size_t *pgsize)
 {
diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
index a4e78e74aa21..12222c56cb59 100644
--- a/arch/loongarch/mm/hugetlbpage.c
+++ b/arch/loongarch/mm/hugetlbpage.c
@@ -50,16 +50,6 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 	return (pte_t *) pmd;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return (pmd_val(pmd) & _PAGE_HUGE) != 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return (pud_val(pud) & _PAGE_HUGE) != 0;
-}
-
 uint64_t pmd_to_entrylo(unsigned long pmd_val)
 {
 	uint64_t val;
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 0e196650f4f4..92b7591aac2a 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -129,7 +129,7 @@ static inline int pmd_none(pmd_t pmd)
 static inline int pmd_bad(pmd_t pmd)
 {
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-	/* pmd_huge(pmd) but inline */
+	/* pmd_leaf(pmd) but inline */
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
 		return 0;
 #endif
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 20ca48c1b606..7c28510b3768 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -245,7 +245,7 @@ static inline int pmd_none(pmd_t pmd)
 static inline int pmd_bad(pmd_t pmd)
 {
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
-	/* pmd_huge(pmd) but inline */
+	/* pmd_leaf(pmd) but inline */
 	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
 		return 0;
 #endif
diff --git a/arch/mips/mm/hugetlbpage.c b/arch/mips/mm/hugetlbpage.c
index 7eaff5b07873..0b9e15555b59 100644
--- a/arch/mips/mm/hugetlbpage.c
+++ b/arch/mips/mm/hugetlbpage.c
@@ -57,13 +57,3 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
 	}
 	return (pte_t *) pmd;
 }
-
-int pmd_huge(pmd_t pmd)
-{
-	return (pmd_val(pmd) & _PAGE_HUGE) != 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return (pud_val(pud) & _PAGE_HUGE) != 0;
-}
diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index a9f7e21f6656..0356199bd9e7 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -180,14 +180,3 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	}
 	return changed;
 }
-
-
-int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 92545981bb49..baf934578c3a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -6,16 +6,6 @@
  */
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_HUGETLB_PAGE
-static inline int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 /*
  * With radix , we have hugepage ptes in the pud and pmd entries. We don't
  * need to setup hugepage directory for them. Our pte and page directory format
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index 2fce3498b000..579a7153857f 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -4,31 +4,6 @@
 
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_HUGETLB_PAGE
-/*
- * We have PGD_INDEX_SIZ = 12 and PTE_INDEX_SIZE = 8, so that we can have
- * 16GB hugepage pte in PGD and 16MB hugepage pte at PMD;
- *
- * Defined in such a way that we can optimize away code block at build time
- * if CONFIG_HUGETLB_PAGE=n.
- *
- * returns true for pmd migration entries, THP, devmap, hugetlb
- * But compile time dependent on CONFIG_HUGETLB_PAGE
- */
-static inline int pmd_huge(pmd_t pmd)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	/*
-	 * leaf pte for huge page
-	 */
-	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-}
 
 /*
  * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index df66dce8306f..05a91c99d431 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1436,9 +1436,6 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
-/*
- * Like pmd_huge(), but works regardless of config options
- */
 #define pmd_leaf pmd_leaf
 static inline bool pmd_leaf(pmd_t pmd)
 {
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 427db14292c9..f5f39d4f03c8 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -351,16 +351,6 @@ static inline int hugepd_ok(hugepd_t hpd)
 #endif
 }
 
-static inline int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
 #define is_hugepd(hpd)		(hugepd_ok(hpd))
 #endif
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 29c7606414d2..9a4bc4bd2a01 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -399,16 +399,6 @@ static bool is_napot_size(unsigned long size)
 
 #endif /*CONFIG_RISCV_ISA_SVNAPOT*/
 
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
 static bool __hugetlb_valid_size(unsigned long size)
 {
 	if (size == HPAGE_SIZE)
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index c2e8242bd15d..ca43b6fce71c 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -233,16 +233,6 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return (pte_t *) pmdp;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	if (MACHINE_HAS_EDAT1 && size == PMD_SIZE)
diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 6cb0ad73dbb9..ff209b55285a 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -70,13 +70,3 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
 	return pte;
 }
-
-int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-int pud_huge(pud_t pud)
-{
-	return 0;
-}
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index d31c2cec35c9..8ed5bdf95d25 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -407,16 +407,6 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return entry;
 }
 
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);;
-}
-
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
 			   unsigned long addr)
 {
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 8362953a24ce..dab6db288e5b 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -19,22 +19,6 @@
 #include <asm/tlbflush.h>
 #include <asm/elf.h>
 
-/*
- * pmd_huge() returns 1 if @pmd is hugetlb related entry.
- */
-int pmd_huge(pmd_t pmd)
-{
-	return pmd_leaf(pmd);
-}
-
-/*
- * pud_huge() returns 1 if @pud is hugetlb related entry.
- */
-int pud_huge(pud_t pud)
-{
-	return pud_leaf(pud);
-}
-
 #ifdef CONFIG_HUGETLB_PAGE
 static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		unsigned long addr, unsigned long len,
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 77b30a8c6076..300de33c6fde 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -272,13 +272,9 @@ void hugetlb_vma_unlock_write(struct vm_area_struct *vma);
 int hugetlb_vma_trylock_write(struct vm_area_struct *vma);
 void hugetlb_vma_assert_locked(struct vm_area_struct *vma);
 void hugetlb_vma_lock_release(struct kref *kref);
-
-int pmd_huge(pmd_t pmd);
-int pud_huge(pud_t pud);
 long hugetlb_change_protection(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end, pgprot_t newprot,
 		unsigned long cp_flags);
-
 bool is_hugetlb_entry_migration(pte_t pte);
 bool is_hugetlb_entry_hwpoisoned(pte_t pte);
 void hugetlb_unshare_all_pmds(struct vm_area_struct *vma);
@@ -399,16 +395,6 @@ static inline void hugetlb_vma_assert_locked(struct vm_area_struct *vma)
 {
 }
 
-static inline int pmd_huge(pmd_t pmd)
-{
-	return 0;
-}
-
-static inline int pud_huge(pud_t pud)
-{
-	return 0;
-}
-
 static inline int is_hugepage_only_range(struct mm_struct *mm,
 					unsigned long addr, unsigned long len)
 {
@@ -493,16 +479,6 @@ static inline vm_fault_t hugetlb_fault(struct mm_struct *mm,
 static inline void hugetlb_unshare_all_pmds(struct vm_area_struct *vma) { }
 
 #endif /* !CONFIG_HUGETLB_PAGE */
-/*
- * hugepages at page global directory. If arch support
- * hugepages at pgd level, they need to define this.
- */
-#ifndef pgd_huge
-#define pgd_huge(x)	0
-#endif
-#ifndef p4d_huge
-#define p4d_huge(x)	0
-#endif
 
 #ifndef pgd_write
 static inline int pgd_write(pgd_t pgd)
-- 
2.44.0


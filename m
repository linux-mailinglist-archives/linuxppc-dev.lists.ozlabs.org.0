Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A875E9B58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 09:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZsr1RpHz3dq7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:59:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LoMfB/0u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LoMfB/0u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZrl1Q6Bz3cCC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:58:46 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q7i6p5025661
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2SC1V5qMUfm7QaN4tBNVuWRQa8gZzbGN0lTGBcTj4Qg=;
 b=LoMfB/0uR7NUe5LA4CkXZfSx5ONaQJPDUtiH2Ci62Xq4tKpcPnwiB8oI2jvJ7n8H8SLx
 1uOpsf4MUqEN51yEOKi0yfQNecNAPcf1QWQ+mcbm1iPkYti2QWOPWSMni99RdZK3rnBU
 XoGAfcsJLNxbS+dFhi4fY4URUxY9mmPrtbIivLmRcXl6p6FTXLRyYLRpalNoJevcTNCt
 BcHYvEB0PuKTUBO6Bn4Rhfb2xXZ4fAXZ0wDDwCeAWTNDAQxElQaXvRJAlPrga6SKh9tM
 HkFcWQF1fUxCU/DRUauB7unV4uGANX7l4p53mFwBUU7UGOmLGd/IypqiQ/FTmHBVMpMh MQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju7pr8qtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:58:44 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q7orHH024770
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma02fra.de.ibm.com with ESMTP id 3jssh91j96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q7vemu50266424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEDD7AE04D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50675AE051
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4F41060593;
	Mon, 26 Sep 2022 17:57:37 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/4] powerpc/64s: Enable KFENCE on book3s64
Date: Mon, 26 Sep 2022 07:57:26 +0000
Message-Id: <20220926075726.2846-4-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926075726.2846-1-nicholas@linux.ibm.com>
References: <20220926075726.2846-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qhx130vZ2jljJF1s8-w6qKZwSYAhoxaH
X-Proofpoint-ORIG-GUID: qhx130vZ2jljJF1s8-w6qKZwSYAhoxaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_05,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260043
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KFENCE support was added for ppc32 in commit 90cbac0e995d
("powerpc: Enable KFENCE for PPC32").
Enable KFENCE on ppc64 architecture with hash and radix MMUs.
It uses the same mechanism as debug pagealloc to
protect/unprotect pages. All KFENCE kunit tests pass on both
MMUs.

KFENCE memory is initially allocated using memblock but is
later marked as SLAB allocated. This necessitates the change
to __pud_free to ensure that the KFENCE pages are freed
appropriately.

Based on previous work by Christophe Leroy and Jordan Niethe.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
v2: Refactor
v3: Simplified ABI version check
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  6 ++++--
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/kfence.h            | 15 +++++++++++++++
 arch/powerpc/mm/book3s64/hash_utils.c        | 10 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  6 ++++--
 6 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a4f8a5276e5c..f7dd0f49510d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -194,7 +194,7 @@ config PPC
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
-	select HAVE_ARCH_KFENCE			if PPC_BOOK3S_32 || PPC_8xx || 40x
+	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index e1af0b394ceb..dd2cff53a111 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -113,9 +113,11 @@ static inline void __pud_free(pud_t *pud)
 
 	/*
 	 * Early pud pages allocated via memblock allocator
-	 * can't be directly freed to slab
+	 * can't be directly freed to slab. KFENCE pages have
+	 * both reserved and slab flags set so need to be freed
+	 * kmem_cache_free.
 	 */
-	if (PageReserved(page))
+	if (PageReserved(page) && !PageSlab(page))
 		free_reserved_page(page);
 	else
 		kmem_cache_free(PGT_CACHE(PUD_CACHE_INDEX), pud);
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb9d5fd39d7f..fd5d800f2836 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1123,7 +1123,7 @@ static inline void vmemmap_remove_mapping(unsigned long start,
 }
 #endif
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (radix_enabled())
diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index a9846b68c6b9..6fd2b4d486c5 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -11,11 +11,25 @@
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
+#define ARCH_FUNC_PREFIX "."
+#endif
+
 static inline bool arch_kfence_init_pool(void)
 {
 	return true;
 }
 
+#ifdef CONFIG_PPC64
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	struct page *page = virt_to_page(addr);
+
+	__kernel_map_pages(page, 1, !protect);
+
+	return true;
+}
+#else
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
 {
 	pte_t *kpte = virt_to_kpte(addr);
@@ -29,5 +43,6 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 
 	return true;
 }
+#endif
 
 #endif /* __ASM_POWERPC_KFENCE_H */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b37412fe5930..9cceaa5998a3 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -424,7 +424,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		if (debug_pagealloc_enabled() &&
+		if (debug_pagealloc_enabled_or_kfence() &&
 			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
 			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
 	}
@@ -773,7 +773,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();
 
-	if (!debug_pagealloc_enabled()) {
+	if (!debug_pagealloc_enabled_or_kfence()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
@@ -1061,7 +1061,7 @@ static void __init htab_initialize(void)
 
 	prot = pgprot_val(PAGE_KERNEL);
 
-	if (debug_pagealloc_enabled()) {
+	if (debug_pagealloc_enabled_or_kfence()) {
 		linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 		linear_map_hash_slots = memblock_alloc_try_nid(
 				linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
@@ -1983,7 +1983,7 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 	return slot;
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static DEFINE_SPINLOCK(linear_map_hash_lock);
 
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
@@ -2056,7 +2056,7 @@ void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	}
 	local_irq_restore(flags);
 }
-#endif /* CONFIG_DEBUG_PAGEALLOC */
+#endif /* CONFIG_DEBUG_PAGEALLOC || CONFIG_KFENCE */
 
 void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index daa40e3b74dd..6e4c2ca980ad 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -34,6 +34,8 @@
 
 #include <trace/events/thp.h>
 
+#include <mm/mmu_decl.h>
+
 unsigned int mmu_base_pid;
 unsigned long radix_mem_block_size __ro_after_init;
 
@@ -276,7 +278,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	int psize;
 	unsigned long max_mapping_size = radix_mem_block_size;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		max_mapping_size = PAGE_SIZE;
 
 	start = ALIGN(start, PAGE_SIZE);
@@ -899,7 +901,7 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #endif
 #endif
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long addr;
-- 
2.34.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0135BC11F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 03:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW6zH0vsnz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 11:48:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qkRXsSmz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qkRXsSmz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MW6xv3sfNz2xJG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 11:47:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J1i9pl006293
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5O7HW+iC5qdnGOk2hKLAXNAndH2SrwM8eX7Z2WDZPwU=;
 b=qkRXsSmzlIvTrkkMsWRew0rUilNHTGakti+BisviRpstwW73vEROVZaC3Vr7w61vcwvK
 FFmYU78DrbJYf3PTE4yxXENIin29aJlog5YRbLoT5NvXwqyBPfHd3/6hGu8WCx0dhe2I
 D//TE+VsP9WNbtZf1NNytHlH4LIqyp6hw9DqTQgp/1Jl+/ybw3zVwUBaVnoeEto3cjW3
 OfAfazdU2YhBzZ4oLvbKWV68b0VZYJnGOdBpkGqYXej6nuVRduCKijmjvjMyxlWEAo5d
 1q2dBjggrgdjMiio2+3yYwW1JE5wky9sEiskS2o0BsjDcqPzVOFRufRFCZA6yMB9HvUe Aw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpaqb4e10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:44 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J1ZKp4011832
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3jn5v9191t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J1leLM33882452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98D4611C04A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEB0211C052
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:47:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BA2B360531;
	Mon, 19 Sep 2022 11:47:38 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64s: Enable KFENCE on book3s64
Date: Mon, 19 Sep 2022 01:44:37 +0000
Message-Id: <20220919014437.608167-4-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919014437.608167-1-nicholas@linux.ibm.com>
References: <20220919014437.608167-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wiHkrrAfjvxdZQjH_5nr8kbsuN-dMzeq
X-Proofpoint-GUID: wiHkrrAfjvxdZQjH_5nr8kbsuN-dMzeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190009
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
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  6 ++++--
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/kfence.h            | 18 ++++++++++++++++++
 arch/powerpc/mm/book3s64/hash_utils.c        | 10 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  8 +++++---
 6 files changed, 34 insertions(+), 12 deletions(-)

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
index a9846b68c6b9..33edbc312a51 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -11,11 +11,28 @@
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
+#if defined(CONFIG_PPC64) && !defined(CONFIG_PPC64_ELF_ABI_V2)
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
+	if (protect)
+		__kernel_map_pages(page, 1, 0);
+	else
+		__kernel_map_pages(page, 1, 1);
+
+	return true;
+}
+#else
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
 {
 	pte_t *kpte = virt_to_kpte(addr);
@@ -29,5 +46,6 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 
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
index 483c99bfbde5..217833fe4f34 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -34,6 +34,8 @@
 
 #include <trace/events/thp.h>
 
+#include <mm/mmu_decl.h>
+
 unsigned int mmu_base_pid;
 unsigned long radix_mem_block_size __ro_after_init;
 
@@ -504,7 +506,7 @@ static unsigned long __init radix_memory_block_size(void)
 {
 	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		return PAGE_SIZE;
 
 	/*
@@ -523,7 +525,7 @@ static unsigned long __init radix_memory_block_size(void)
 
 static unsigned long __init radix_memory_block_size(void)
 {
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		return PAGE_SIZE;
 
 	return 1UL * 1024 * 1024 * 1024;
@@ -903,7 +905,7 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #endif
 #endif
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long addr;
-- 
2.34.1


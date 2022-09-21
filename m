Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 969515BF340
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 04:04:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXMDb41gJz3bfb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 12:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQ9We0L5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CQ9We0L5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXMBQ0r14z2yxG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 12:02:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L1rGZS013268
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i5+ND1AqVsxzgL2frpf2yovwVl7dztAfFH+7mpIVH40=;
 b=CQ9We0L5DnGcjbz0TiFgn1IWp1fidOA4Ay0UEpon6FBVvJK7se2Zkq2OveIoA6PayxEC
 1LVWAemy1hOMGOz+0b/Um2OdABx4sTnlrrU40qTvhsugPu7rSB3TuT9YhdNCMktnFtlN
 V9Z17ESpQjxnH4m329LecgRB0QpFHXSUWSNcLMLdC4ekHZun2pwlBQ4CnhNmKYcsad26
 dRnzwIYuAFNBDHa8q7KF9NNP72mhJ+7NNokjZezwZMk+57Vfed4CzpygliCPimQsmjEN
 QtATVoLuzGtzJUSQO+uJv/Qb6DF0g9IU4fHJVEtejzNqWn/6uHDEKOd0lLrLJn51k9Tv og== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqsbh86f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:48 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L1q51x024997
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj4jgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L1wi2943254098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 01:58:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E4A1A405F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5761A4054
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:02:43 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 84BA260060;
	Wed, 21 Sep 2022 12:02:42 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/64s: Enable KFENCE on book3s64
Date: Wed, 21 Sep 2022 02:02:13 +0000
Message-Id: <20220921020213.868124-4-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921020213.868124-1-nicholas@linux.ibm.com>
References: <20220921020213.868124-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aBlkt0HkDW68bnWKCk9MqphIxSKaNBeE
X-Proofpoint-ORIG-GUID: aBlkt0HkDW68bnWKCk9MqphIxSKaNBeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_12,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210008
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
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/book3s/64/pgalloc.h |  6 ++++--
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/kfence.h            | 15 +++++++++++++++
 arch/powerpc/mm/book3s64/hash_utils.c        | 10 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  8 +++++---
 6 files changed, 31 insertions(+), 12 deletions(-)

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
index a9846b68c6b9..cff60983e88d 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -11,11 +11,25 @@
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
index 623455c195d8..e88f9c45f34a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -34,6 +34,8 @@
 
 #include <trace/events/thp.h>
 
+#include <mm/mmu_decl.h>
+
 unsigned int mmu_base_pid;
 unsigned long radix_mem_block_size __ro_after_init;
 
@@ -335,7 +337,7 @@ static void __init radix_init_pgtable(void)
 	u64 i;
 	unsigned long size = radix_mem_block_size;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		size = PAGE_SIZE;
 
 	/* We don't support slb for radix */
@@ -851,7 +853,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 {
 	unsigned long size = radix_mem_block_size;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		size = PAGE_SIZE;
 
 	if (end >= RADIX_VMALLOC_START) {
@@ -906,7 +908,7 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #endif
 #endif
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long addr;
-- 
2.34.1


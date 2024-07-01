Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C191E015
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 15:01:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OALKGbgN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCR4Y5gSXz3dVX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 23:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OALKGbgN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCR3q52pPz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 23:00:38 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461Bur0G025294;
	Mon, 1 Jul 2024 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=U2Zm6fipJPDCUZBhGG8eUR8A/aQXoTuzJa8i8U3
	2foA=; b=OALKGbgN6pa1zgQ29UKKqfa8+ZBpExgohWygoJNmdzn0kRUEhf0tR5d
	NAoQGkpizQQEqt+whxhUo5/nXGqEur19D8Z0vEMlwxikeSV7S61cO6TbVL1RmUg8
	YL6cn8AhszUD8FtQRXxJSY/t9BaLabeh/dJea6b4x8bkZLdKS/MFAynXSxHxL0FC
	ZiYnf+QzAUNKhfmxMNNWRw5Mlpji3yNycH3KNJeifYEcjxK2yWHJ45i1Q3JGqsOM
	jP8XpYBI1uBs5Ry3VhRUYVfF7ogP0ojOwDb6JE6VhsYOFPJHRyshroP2QIM++4uF
	7qVBLtNYyjia78s8BpK8f8Rj/b24u6Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403um1r9dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 13:00:29 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 461D0TU8008664;
	Mon, 1 Jul 2024 13:00:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403um1r9df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 13:00:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 461CfMqs009477;
	Mon, 1 Jul 2024 13:00:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 402xtmf2pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 13:00:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 461D0Oji21299650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 13:00:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5F0320040;
	Mon,  1 Jul 2024 13:00:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A4C22004D;
	Mon,  1 Jul 2024 13:00:22 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.123])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 13:00:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] radix/kfence: map __kfence_pool at page granularity
Date: Mon,  1 Jul 2024 18:30:21 +0530
Message-ID: <20240701130021.578240-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WWbPqNaop5SsmpoxyE0qYcDIwbP4KYHm
X-Proofpoint-GUID: M4AMW8JS0fTyXTUs47Acqmaur4R9E-dr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407010099
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
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Marco Elver <elver@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Potapenko <glider@google.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When KFENCE is enabled, total system memory is mapped at page level
granularity. But in radix MMU mode, ~3GB additional memory is needed
to map 100GB of system memory at page level granularity when compared
to using 2MB direct mapping. This is not desired considering KFENCE is
designed to be enabled in production kernels [1]. Also, mapping only
the memory allocated for KFENCE pool at page granularity is sufficient
to enable KFENCE support. So, allocate __kfence_pool during bootup and
map it at page granularity instead of mapping all system memory at
page granularity.

Without patch:
    # cat /proc/meminfo
    MemTotal:       101201920 kB

With patch:
    # cat /proc/meminfo
    MemTotal:       104483904 kB

Note that enabling KFENCE at runtime is disabled for radix MMU for now,
as it depends on the ability to split page table mappings and such APIs
are not currently implemented for radix MMU.

All kfence_test.c testcases passed with this patch.

[1] https://lore.kernel.org/all/20201103175841.3495947-2-elver@google.com/

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v3:
* Updated the changelog and contained changes relevant for radix MMU
  within radix-pgtable.c as suggested by mpe.

Changes in v2:
* Dropped the patch that adds support to enable KFENCE after startup.
* Added changes to avoid KFENCE enablement after system startup.
* Also, added a TODO explaining why KFENCE enablement after startup
  is not supported for now.
* Functions to alloc/map __kfence_pool as suggested by Ritesh.
* Moved changes that apply to ppc32 as well to common file as suggested
  by Christophe.

 
 arch/powerpc/include/asm/kfence.h        | 11 +++-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 84 ++++++++++++++++++++++--
 arch/powerpc/mm/init-common.c            |  3 +
 3 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index 424ceef82ae6..fab124ada1c7 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -15,10 +15,19 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
+#ifdef CONFIG_KFENCE
+extern bool kfence_disabled;
+
+static inline void disable_kfence(void)
+{
+	kfence_disabled = true;
+}
+
 static inline bool arch_kfence_init_pool(void)
 {
-	return true;
+	return !kfence_disabled;
 }
+#endif
 
 #ifdef CONFIG_PPC64
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 15e88f1439ec..b0d927009af8 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -17,6 +17,7 @@
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
+#include <linux/kfence.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -31,6 +32,7 @@
 #include <asm/uaccess.h>
 #include <asm/ultravisor.h>
 #include <asm/set_memory.h>
+#include <asm/kfence.h>
 
 #include <trace/events/thp.h>
 
@@ -293,7 +295,8 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 
 static int __meminit create_physical_mapping(unsigned long start,
 					     unsigned long end,
-					     int nid, pgprot_t _prot)
+					     int nid, pgprot_t _prot,
+					     unsigned long mapping_sz_limit)
 {
 	unsigned long vaddr, addr, mapping_size = 0;
 	bool prev_exec, exec = false;
@@ -301,7 +304,10 @@ static int __meminit create_physical_mapping(unsigned long start,
 	int psize;
 	unsigned long max_mapping_size = memory_block_size;
 
-	if (debug_pagealloc_enabled_or_kfence())
+	if (mapping_sz_limit < max_mapping_size)
+		max_mapping_size = mapping_sz_limit;
+
+	if (debug_pagealloc_enabled())
 		max_mapping_size = PAGE_SIZE;
 
 	start = ALIGN(start, PAGE_SIZE);
@@ -356,8 +362,74 @@ static int __meminit create_physical_mapping(unsigned long start,
 	return 0;
 }
 
+#ifdef CONFIG_KFENCE
+static bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
+
+static int __init parse_kfence_early_init(char *arg)
+{
+	int val;
+
+	if (get_option(&arg, &val))
+		kfence_early_init = !!val;
+	return 0;
+}
+early_param("kfence.sample_interval", parse_kfence_early_init);
+
+static inline phys_addr_t alloc_kfence_pool(void)
+{
+	phys_addr_t kfence_pool;
+
+	/*
+	 * TODO: Support to enable KFENCE after bootup depends on the ability to
+	 *       split page table mappings. As such support is not currently
+	 *       implemented for radix pagetables, support enabling KFENCE
+	 *       only at system startup for now.
+	 *
+	 *       After support for splitting mappings is available on radix,
+	 *       alloc_kfence_pool() & map_kfence_pool() can be dropped and
+	 *       mapping for __kfence_pool memory can be
+	 *       split during arch_kfence_init_pool().
+	 */
+	if (!kfence_early_init)
+		goto no_kfence;
+
+	kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
+	if (!kfence_pool)
+		goto no_kfence;
+
+	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
+	return kfence_pool;
+
+no_kfence:
+	disable_kfence();
+	return 0;
+}
+
+static inline void map_kfence_pool(phys_addr_t kfence_pool)
+{
+	if (!kfence_pool)
+		return;
+
+	if (create_physical_mapping(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
+				    -1, PAGE_KERNEL, PAGE_SIZE))
+		goto err;
+
+	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
+	__kfence_pool = __va(kfence_pool);
+	return;
+
+err:
+	memblock_phys_free(kfence_pool, KFENCE_POOL_SIZE);
+	disable_kfence();
+}
+#else
+static inline phys_addr_t alloc_kfence_pool(void) { return 0; }
+static inline void map_kfence_pool(phys_addr_t kfence_pool) { }
+#endif
+
 static void __init radix_init_pgtable(void)
 {
+	phys_addr_t kfence_pool;
 	unsigned long rts_field;
 	phys_addr_t start, end;
 	u64 i;
@@ -365,6 +437,8 @@ static void __init radix_init_pgtable(void)
 	/* We don't support slb for radix */
 	slb_set_size(0);
 
+	kfence_pool = alloc_kfence_pool();
+
 	/*
 	 * Create the linear mapping
 	 */
@@ -381,9 +455,11 @@ static void __init radix_init_pgtable(void)
 		}
 
 		WARN_ON(create_physical_mapping(start, end,
-						-1, PAGE_KERNEL));
+						-1, PAGE_KERNEL, ~0UL));
 	}
 
+	map_kfence_pool(kfence_pool);
+
 	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
 			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
@@ -875,7 +951,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 	}
 
 	return create_physical_mapping(__pa(start), __pa(end),
-				       nid, prot);
+				       nid, prot, ~0UL);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index d3a7726ecf51..21131b96d209 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -31,6 +31,9 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
 
 bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
+#ifdef CONFIG_KFENCE
+bool __ro_after_init kfence_disabled;
+#endif
 
 static int __init parse_nosmep(char *p)
 {
-- 
2.45.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F790E8A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 12:50:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tdar1DOF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W40kv63tWz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 20:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tdar1DOF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W40kB4yjBz3cSy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 20:49:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9Q0Gr027623;
	Wed, 19 Jun 2024 10:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=BvLfdd4mR0gZp5pCsqop5ufMyk6Ypmh74Cst0AM
	vu3g=; b=Tdar1DOFEXhZtjVvLJbzIeU7C0H8v1MAMbYHH6vpVgFRXOGs5WNP1mE
	c7jZIAXU1MfQejjU0D3n0OlPgtnMHh7H4kfpL+/HZpth5Rm9mTiBwcSbDd/F2bC6
	/HygmY9W3FRwm3BviRtmjq/qQ7eSnlpzvEApmIra0B3ZjsocJuG4PSt+NYFS8KIF
	dhpOpvSJZa3frl1cL5T6Zv6oQoeglCU1VXrJdVZ1Wb8JjewueXmXSjLG4vFBfZyn
	5fImO0M/4ahT+W9kpJ4JkVPA6qdWnWf0M6bY2GO1qRs2IpX88wME58WaJfs47jzk
	vqeUVPhSxJuofO6AgoQpuYoyCSUzoxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yusnarn6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:49:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45JAnR3F027269;
	Wed, 19 Jun 2024 10:49:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yusnarn68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:49:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45JAaKO2011052;
	Wed, 19 Jun 2024 10:49:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yspsnbc9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 10:49:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45JAnMCN51184096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jun 2024 10:49:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E3022004B;
	Wed, 19 Jun 2024 10:49:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41A9F2005A;
	Wed, 19 Jun 2024 10:49:20 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Jun 2024 10:49:20 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] radix/kfence: map __kfence_pool at page granularity
Date: Wed, 19 Jun 2024 16:19:19 +0530
Message-ID: <20240619104919.20772-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D7fJCl3thuJucY4RvBxk4027s49wyQxp
X-Proofpoint-GUID: vySMH3z2m1sggXuhsD7qz3LcNcZ8KYo3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190077
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
designed to be enabled in production kernels [1]. Also, mapping memory
allocated for KFENCE pool at page granularity seems sufficient enough
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

Changes in v2:
* Dropped the patch that adds support to enable KFENCE after startup.
* Added changes to avoid KFENCE enablement after system startup.
* Also, added a TODO explaining why KFENCE enablement after startup
  is not supported for now.
* Functions to alloc/map __kfence_pool as suggested by Ritesh.
* Moved changes that apply to ppc32 as well to common file as suggested
  by Christophe.


 arch/powerpc/include/asm/kfence.h        | 12 +++-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 74 ++++++++++++++++++++++--
 arch/powerpc/mm/init-common.c            | 14 +++++
 3 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index 424ceef82ae6..78590288ee80 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -15,10 +15,20 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
+#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
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
index 15e88f1439ec..a74912e0fd99 100644
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
@@ -356,8 +362,64 @@ static int __meminit create_physical_mapping(unsigned long start,
 	return 0;
 }
 
+#ifdef CONFIG_KFENCE
+static inline phys_addr_t radix_alloc_kfence_pool_early(void)
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
+	 *       radix_alloc_kfence_pool_early() & radix_map_kfence_pool_early()
+	 *       can be dropped and mapping for __kfence_pool memory can be
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
+static inline void radix_map_kfence_pool_early(phys_addr_t kfence_pool)
+{
+	int ret;
+
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
+static inline phys_addr_t radix_alloc_kfence_pool_early(void) { return 0; }
+static inline void radix_map_kfence_pool_early(phys_addr_t kfence_pool) { }
+#endif
+
 static void __init radix_init_pgtable(void)
 {
+	phys_addr_t kfence_pool;
 	unsigned long rts_field;
 	phys_addr_t start, end;
 	u64 i;
@@ -365,6 +427,8 @@ static void __init radix_init_pgtable(void)
 	/* We don't support slb for radix */
 	slb_set_size(0);
 
+	kfence_pool = radix_alloc_kfence_pool_early();
+
 	/*
 	 * Create the linear mapping
 	 */
@@ -381,9 +445,11 @@ static void __init radix_init_pgtable(void)
 		}
 
 		WARN_ON(create_physical_mapping(start, end,
-						-1, PAGE_KERNEL));
+						-1, PAGE_KERNEL, ~0UL));
 	}
 
+	radix_map_kfence_pool_early(kfence_pool);
+
 	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
 			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
@@ -875,7 +941,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 	}
 
 	return create_physical_mapping(__pa(start), __pa(end),
-				       nid, prot);
+				       nid, prot, ~0UL);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index d3a7726ecf51..f881ab5107aa 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -31,6 +31,20 @@ EXPORT_SYMBOL_GPL(kernstart_virt_addr);
 
 bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
+#ifdef CONFIG_KFENCE
+bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
+bool __ro_after_init kfence_disabled;
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
+#endif
 
 static int __init parse_nosmep(char *p)
 {
-- 
2.45.1


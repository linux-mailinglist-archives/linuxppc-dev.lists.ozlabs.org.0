Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61A8B080D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 13:11:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WplcODHK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPbrm5Hkrz3vYH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 21:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WplcODHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPbqD3rmRz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 21:09:43 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43OAw7oF024942;
	Wed, 24 Apr 2024 11:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=pZwrcCGPr2IFK7BeGC4ojUZLtSftfzcRsbiZ791Q1vk=;
 b=WplcODHK4Zf4iYr2LwSrzaKWTrvZ15wr8tYl8pR65FL9JGa51Urk3WtMKbBctNp6TYIM
 0Lb970dOeU5zBZ+hM8k6dyJQPqmM+c6S6ULk3cneHAGuhQLqzlb73sLzBtAnhsxddCmB
 DKf7tLqljVhjHN8Em/KKuvTA+UF/QFMAEw1Wgmq5Mu8U4hye+7kBF9vLIVXYmZwxJTYG
 xk5U1tu7arekE6wHNiAFomtVcfqumD7ePxsIstciZ7RlJgeeHC/WD4eu8e4b795gDuoM
 VAS3sl4bthAHJYPKXdW2/c58lS3Uwy7+e2V6aSshZQogVkoYUtnxOcjDao3YDyrmus1u gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xq0sar0qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:36 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43OB9aNR012359;
	Wed, 24 Apr 2024 11:09:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xq0sar0qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:36 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43O9jsba005736;
	Wed, 24 Apr 2024 11:09:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmx3cj0hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:35 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43OB9Tov34996772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Apr 2024 11:09:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2A0420040;
	Wed, 24 Apr 2024 11:09:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3D4820043;
	Wed, 24 Apr 2024 11:09:27 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Apr 2024 11:09:27 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] radix/kfence: map __kfence_pool at page granularity
Date: Wed, 24 Apr 2024 16:39:25 +0530
Message-ID: <20240424110926.184077-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P_sYw4f4LeE6qeLOqrjv5qGsNWvOfXGU
X-Proofpoint-GUID: xBDnxHZi2FSHS4f3HMj3915KJXVg0Mwd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_08,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404240045
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
Cc: Marco Elver <elver@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Potapenko <glider@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Dmitry Vyukov <dvyukov@google.com>
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

All kfence_test.c testcases passed with this patch.

[1] https://lore.kernel.org/all/20201103175841.3495947-2-elver@google.com/

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/kfence.h        |  5 ++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 34 ++++++++++++++++++------
 arch/powerpc/mm/init_64.c                | 14 ++++++++++
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index 424ceef82ae6..18ec2b06ba1e 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -8,6 +8,7 @@
 #ifndef __ASM_POWERPC_KFENCE_H
 #define __ASM_POWERPC_KFENCE_H
 
+#include <linux/kfence.h>
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
@@ -15,6 +16,10 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
+#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
+#endif
+
 static inline bool arch_kfence_init_pool(void)
 {
 	return true;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 15e88f1439ec..fccbf92f279b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -31,6 +31,7 @@
 #include <asm/uaccess.h>
 #include <asm/ultravisor.h>
 #include <asm/set_memory.h>
+#include <asm/kfence.h>
 
 #include <trace/events/thp.h>
 
@@ -291,9 +292,8 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 	return end;
 }
 
-static int __meminit create_physical_mapping(unsigned long start,
-					     unsigned long end,
-					     int nid, pgprot_t _prot)
+static int __meminit create_physical_mapping(unsigned long start, unsigned long end, int nid,
+					     pgprot_t _prot, unsigned long mapping_sz_limit)
 {
 	unsigned long vaddr, addr, mapping_size = 0;
 	bool prev_exec, exec = false;
@@ -301,7 +301,10 @@ static int __meminit create_physical_mapping(unsigned long start,
 	int psize;
 	unsigned long max_mapping_size = memory_block_size;
 
-	if (debug_pagealloc_enabled_or_kfence())
+	if (mapping_sz_limit < max_mapping_size)
+		max_mapping_size = mapping_sz_limit;
+
+	if (debug_pagealloc_enabled())
 		max_mapping_size = PAGE_SIZE;
 
 	start = ALIGN(start, PAGE_SIZE);
@@ -358,6 +361,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 
 static void __init radix_init_pgtable(void)
 {
+	phys_addr_t kfence_pool __maybe_unused;
 	unsigned long rts_field;
 	phys_addr_t start, end;
 	u64 i;
@@ -365,6 +369,13 @@ static void __init radix_init_pgtable(void)
 	/* We don't support slb for radix */
 	slb_set_size(0);
 
+#ifdef CONFIG_KFENCE
+	if (kfence_early_init) {
+		kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
+		memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
+	}
+#endif
+
 	/*
 	 * Create the linear mapping
 	 */
@@ -380,10 +391,18 @@ static void __init radix_init_pgtable(void)
 			continue;
 		}
 
-		WARN_ON(create_physical_mapping(start, end,
-						-1, PAGE_KERNEL));
+		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL, ~0UL));
 	}
 
+#ifdef CONFIG_KFENCE
+	if (kfence_early_init) {
+		create_physical_mapping(kfence_pool, kfence_pool + KFENCE_POOL_SIZE, -1,
+					PAGE_KERNEL, PAGE_SIZE);
+		memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
+		__kfence_pool = __va(kfence_pool);
+	}
+#endif
+
 	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
 			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
@@ -874,8 +893,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 		return -1;
 	}
 
-	return create_physical_mapping(__pa(start), __pa(end),
-				       nid, prot);
+	return create_physical_mapping(__pa(start), __pa(end), nid, prot, ~0UL);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index d96bbc001e73..8155bfd6c16b 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -64,6 +64,20 @@
 
 #include <mm/mmu_decl.h>
 
+#ifdef CONFIG_KFENCE
+bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
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
+
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 /*
  * Given an address within the vmemmap, determine the page that
-- 
2.44.0


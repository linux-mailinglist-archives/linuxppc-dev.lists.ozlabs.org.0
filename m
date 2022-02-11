Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26D4B1ED7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw47r36V0z3cCG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:53:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RNBnoLUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RNBnoLUe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw4794p2mz2yQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 17:52:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B5Pghl023635; 
 Fri, 11 Feb 2022 06:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MOxYEFDtbtT9kUr1oj0znqEJhFJqbBcu93r8U/b31M8=;
 b=RNBnoLUeo38AVNgGw2SCus6w9dQ5mAn8qPG0QkK+slODT+vjImi1YxuW1c0VfCTcS925
 PhrAZJVsGyq1CYGOSeMM86zPs2ivn0ugESWYljgVw6WSNzPU2aKUuT/DvNFCFdpSBAMl
 m5AY/kdWN4UfIxDeoExv6VIxZgDGEINtXudZggMQbqstbhuHjj3SnIZh4cfRLgQrf3Sp
 NgQmagpkF9YUjTYAGnXkJZMGMpC5k4E2OzR8t8PsJXJGF4a8p7pRDmR3idtr5yIjkNg+
 xwNDefoKM/5A+p4907rUYvah/2mUw+sWSIt3N3XgBzqLISeCHiVZEcn52VvEl9mytLNq Zw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e58vtaeuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:52:31 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21B6m0bl015640;
 Fri, 11 Feb 2022 06:52:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3e1gvebw3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:52:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21B6qTmx38404456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 06:52:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29C8DBE054;
 Fri, 11 Feb 2022 06:52:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68A2EBE053;
 Fri, 11 Feb 2022 06:52:27 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.41.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 06:52:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mm: Update default hugetlb size early
Date: Fri, 11 Feb 2022 12:22:15 +0530
Message-Id: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j9-fsW5BjpFNry43VGoU-CTziMbD6Lfz
X-Proofpoint-ORIG-GUID: j9-fsW5BjpFNry43VGoU-CTziMbD6Lfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110036
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
Cc: linux-mm@kvack.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
introduced pageblock_order which will be used to group pages better.
The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
should be set before we call set_pageblock_order.

set_pageblock_order happens early in the boot and default hugetlb page size
should be initialized before that to compute the right pageblock_order value.

Currently, default hugetlbe page size is set via arch_initcalls which happens
late in the boot as shown via the below callstack:

[c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
[c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
[c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
[c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
[c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64

and the pageblock_order initialization is done early during the boot.

[c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
[c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
[c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
[c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
[c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
[c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98

delaying default hugetlb page size initialization implies the kernel will
initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
value for mobility grouping. IIUC we always had this issue. But it was not
a problem for hash translation mode because (MAX_ORDER - 1) is the same as
HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
5 instead of 8.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/hugetlb.h     | 5 ++++-
 arch/powerpc/mm/book3s64/hugetlbpage.c | 2 +-
 arch/powerpc/mm/hugetlbpage.c          | 5 +----
 arch/powerpc/mm/init_64.c              | 4 ++++
 4 files changed, 10 insertions(+), 6 deletions(-)

Changes from v1:
* update commit message

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 962708fa1017..6a1a1ac5743b 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -15,7 +15,7 @@
 
 extern bool hugetlb_disabled;
 
-void __init hugetlbpage_init_default(void);
+void __init hugetlbpage_init_defaultsize(void);
 
 int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 			   unsigned long len);
@@ -76,6 +76,9 @@ static inline void __init gigantic_hugetlb_cma_reserve(void)
 {
 }
 
+static inline void __init hugetlbpage_init_defaultsize(void)
+{
+}
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #endif /* _ASM_POWERPC_HUGETLB_H */
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index ea8f83afb0ae..3bc0eb21b2a0 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -150,7 +150,7 @@ void huge_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr
 	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
 }
 
-void __init hugetlbpage_init_default(void)
+void __init hugetlbpage_init_defaultsize(void)
 {
 	/* Set default large page size. Currently, we pick 16M or 1M
 	 * depending on what is available
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index ddead41e2194..b642a5a8668f 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -664,10 +664,7 @@ static int __init hugetlbpage_init(void)
 		configured = true;
 	}
 
-	if (configured) {
-		if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
-			hugetlbpage_init_default();
-	} else
+	if (!configured)
 		pr_info("Failed to initialize. Disabling HugeTLB");
 
 	return 0;
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 35f46bf54281..83c0ee9fbf05 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -59,6 +59,7 @@
 #include <asm/sections.h>
 #include <asm/iommu.h>
 #include <asm/vdso.h>
+#include <asm/hugetlb.h>
 
 #include <mm/mmu_decl.h>
 
@@ -513,6 +514,9 @@ void __init mmu_early_init_devtree(void)
 	} else
 		hash__early_init_devtree();
 
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_SIZE_VARIABLE))
+		hugetlbpage_init_defaultsize();
+
 	if (!(cur_cpu_spec->mmu_features & MMU_FTR_HPTE_TABLE) &&
 	    !(cur_cpu_spec->mmu_features & MMU_FTR_TYPE_RADIX))
 		panic("kernel does not support any MMU type offered by platform");
-- 
2.34.1


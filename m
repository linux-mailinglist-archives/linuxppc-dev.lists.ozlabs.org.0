Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE24A9956
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 13:31:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqvzs1MsCz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 23:31:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GKMPasci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GKMPasci; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqvz65DsSz3002
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 23:31:14 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2149il52007812; 
 Fri, 4 Feb 2022 12:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dFHxJRiO/hFvihmytRGD6q+QyjBRWCx7uMS/A7et7pE=;
 b=GKMPascitpCt0AYb614x2PuDMA9cL3QaP3L5pWyLVPSvAyoZFq0yXyp+uMaTfsfg4bcO
 ejYyjDfOzY5WNemmPlwSE4Sl1fclRZvAlbr4Yvr2zXqegcu+ZJv89Kz/Bs1ViO4gFUo1
 eV9RjzM4M5KemK10WIoPk1BMxzW5CfQh8bAHleqCdVSBp2vSMZjAGEPu/iDuxzwUo8oj
 SESJLDZUADEHFyqtPqdRYmxXrATMzSuAKi5rLAvfuRa11j3HR8sOfHQBWgjahXLoBXu+
 EfsFNjZ6lkZqWsQrRZNQg+p9MwN1NVnyPg7+kpljC/KG4jm0/wbE+HV+PaKxmAQ1dAKf 8A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx2m6rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 12:31:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 214CD3Jj016877;
 Fri, 4 Feb 2022 12:31:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3e0r0smdcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 12:31:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 214CV4ku30671352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Feb 2022 12:31:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D2F11206E;
 Fri,  4 Feb 2022 12:31:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CABD11206D;
 Fri,  4 Feb 2022 12:31:02 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.63.99])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  4 Feb 2022 12:31:01 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm: Update default hugetlb size early
Date: Fri,  4 Feb 2022 18:00:52 +0530
Message-Id: <20220204123052.360042-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BbsNCYU8BdH3YOGSqKljR-pijtkEz8Wd
X-Proofpoint-GUID: BbsNCYU8BdH3YOGSqKljR-pijtkEz8Wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040069
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

We use the default hugetlb page size to calculate pageblock order.
set_pageblock_order happens early in the boot and we need to make sure
we set the default hugetlb page size before that to compute the right
pageblock_order value.

arch_initcalls get called later in the boot as shown below

[c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
[c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
[c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
[c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
[c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64

and we do the pageblock_order initialization early during the boot.

[c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
[c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
[c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
[c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
[c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
[c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98

IIUC we always had this issue. But it was not a problem for hash because
MAX_ORDER - 1  was the same as HUGETLB_PAGE_ORDER (8) in the case of hash (16MB).
With radix, HUGETLB_PAGE_ORDER will be 5 (2M size) and hence we would
want pageblock_order to be 5 instead of 8.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/hugetlb.h     | 5 ++++-
 arch/powerpc/mm/book3s64/hugetlbpage.c | 2 +-
 arch/powerpc/mm/hugetlbpage.c          | 5 +----
 arch/powerpc/mm/init_64.c              | 4 ++++
 4 files changed, 10 insertions(+), 6 deletions(-)

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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966121D9F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B56hY4jv9zDqQR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 01:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B56Tw0RTJzDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 01:08:19 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DF2TxX124213; Mon, 13 Jul 2020 11:08:13 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279x86jfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 11:08:13 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DExpvv018450;
 Mon, 13 Jul 2020 15:08:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 327528n035-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 15:08:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DF88d78127214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 15:08:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52F0F7805F;
 Mon, 13 Jul 2020 15:08:10 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 060B87805E;
 Mon, 13 Jul 2020 15:08:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.101])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 15:08:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/hugetlb/cma: Allocate gigantic hugetlb pages
 using CMA
Date: Mon, 13 Jul 2020 20:37:48 +0530
Message-Id: <20200713150749.25245-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_14:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130110
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic hugepages using cma")
added support for allocating gigantic hugepages using CMA. This patch
enables the same for powerpc

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/hugetlb.h |  7 +++++++
 arch/powerpc/kernel/setup-common.c |  3 +++
 arch/powerpc/mm/hugetlbpage.c      | 18 ++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 551a9d4d3958..013165e62618 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -57,6 +57,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
+void gigantic_hugetlb_cma_reserve(void) __init;
 #include <asm-generic/hugetlb.h>
 
 #else /* ! CONFIG_HUGETLB_PAGE */
@@ -71,6 +72,12 @@ static inline pte_t *hugepte_offset(hugepd_t hpd, unsigned long addr,
 {
 	return NULL;
 }
+
+
+static inline void __init gigantic_hugetlb_cma_reserve(void)
+{
+}
+
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #endif /* _ASM_POWERPC_HUGETLB_H */
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 9d3faac53295..b198b0ff25bc 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -928,6 +928,9 @@ void __init setup_arch(char **cmdline_p)
 	/* Reserve large chunks of memory for use by CMA for KVM. */
 	kvm_cma_reserve();
 
+	/*  Reserve large chunks of memory for us by CMA for hugetlb */
+	gigantic_hugetlb_cma_reserve();
+
 	klp_init_thread_info(&init_task);
 
 	init_mm.start_code = (unsigned long)_stext;
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index e9bfbccd975d..26292544630f 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -684,3 +684,21 @@ void flush_dcache_icache_hugepage(struct page *page)
 		}
 	}
 }
+
+void __init gigantic_hugetlb_cma_reserve(void)
+{
+	unsigned long order = 0;
+
+	if (radix_enabled())
+		order = PUD_SHIFT - PAGE_SHIFT;
+	else if (!firmware_has_feature(FW_FEATURE_LPAR) && mmu_psize_defs[MMU_PAGE_16G].shift)
+		/*
+		 * For pseries we do use ibm,expected#pages for reserving 16G pages.
+		 */
+		order = mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
+
+	if (order) {
+		VM_WARN_ON(order < MAX_ORDER);
+		hugetlb_cma_reserve(order);
+	}
+}
-- 
2.26.2


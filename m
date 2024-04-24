Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345ED8B0807
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 13:10:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBp/BXDV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPbqz5zMyz3dSv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 21:10:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VBp/BXDV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPbqD37NGz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 21:09:43 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43OB4gCR002566;
	Wed, 24 Apr 2024 11:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HLU7ONeu9Nvh3ksMCOGNKf5vsMDI83v7vnizH8GI6FE=;
 b=VBp/BXDVo2v/El3aXQgjRosQuZo6jlNO7eXnZ+uMxcOAC4kXwXKuFbazbW6g3X9lG3Tc
 exLtLgU9Ylb7es9tyu8euXpRVZ4GjlyKHG3hR/VmKKTkIfJBPd/l0voGDgfmQTq3+L+2
 Mh7f2uc9L85+kL8RXQGNfB4t4GvaIwB44pMvuq3pOc9c56YcwSQVCf+P8q1/Y7ZeNJNI
 MxnL1ZH+M3pCpeDX0ICmB3xO8gTk4KAztVmaC3xWRVqwZcMdMsCRIsPCFTQZjSZjBEsa
 9IAGkOzKYiGB6Xnsn9ytWLDdF9W8TTRk2yjLpbBPgLqnlgor1gNKHZCbqyZJq8YnrCcJ 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xq0w0r087-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:39 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43OB9d4I009343;
	Wed, 24 Apr 2024 11:09:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xq0w0r082-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43O81EeT023051;
	Wed, 24 Apr 2024 11:09:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1p38et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 11:09:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43OB9WJ953412294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Apr 2024 11:09:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40D8520040;
	Wed, 24 Apr 2024 11:09:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36B3420043;
	Wed, 24 Apr 2024 11:09:30 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 24 Apr 2024 11:09:30 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] radix/kfence: support late __kfence_pool allocation
Date: Wed, 24 Apr 2024 16:39:26 +0530
Message-ID: <20240424110926.184077-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424110926.184077-1-hbathini@linux.ibm.com>
References: <20240424110926.184077-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bJt_UXpwhSWuME7RNrIQvHiyTHhhsv8k
X-Proofpoint-ORIG-GUID: m0z3pf3zByM-oeghEgxjC-eftHIYcbAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_08,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404240045
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

With commit b33f778bba5ef ("kfence: alloc kfence_pool after system
startup"), KFENCE pool can be allocated after system startup via the
page allocator. This can lead to problems as all memory is not mapped
at page granularity anymore with CONFIG_KFENCE. Address this by direct
mapping all memory at PMD level and split the mapping for PMD pages
that overlap with __kfence_pool to page level granularity if and when
__kfence_pool is allocated after system startup.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  2 +
 arch/powerpc/include/asm/kfence.h          | 14 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 50 +++++++++++++++++++++-
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8f55ff74bb68..0423ddbcf73c 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -340,6 +340,8 @@ extern void radix__vmemmap_remove_mapping(unsigned long start,
 extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
 				 pgprot_t flags, unsigned int psz);
 
+extern bool radix_kfence_init_pool(void);
+
 static inline unsigned long radix__get_tree_size(void)
 {
 	unsigned long rts_field;
diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index 18ec2b06ba1e..c5d2fb2f9ecb 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -18,12 +18,24 @@
 
 #ifdef CONFIG_KFENCE
 extern bool kfence_early_init;
-#endif
+
+static inline bool kfence_alloc_pool_late(void)
+{
+	return !kfence_early_init;
+}
 
 static inline bool arch_kfence_init_pool(void)
 {
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (radix_enabled())
+		return radix_kfence_init_pool();
+#endif
+
 	return true;
 }
+#else
+static inline bool kfence_alloc_pool_late(void) { return false; }
+#endif
 
 #ifdef CONFIG_PPC64
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index fccbf92f279b..f4374e3e31e1 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -253,6 +253,53 @@ void radix__mark_initmem_nx(void)
 }
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
+#ifdef CONFIG_KFENCE
+static inline int radix_split_pmd_page(pmd_t *pmd, unsigned long addr)
+{
+	pte_t *pte = pte_alloc_one_kernel(&init_mm);
+	unsigned long pfn = PFN_DOWN(__pa(addr));
+	int i;
+
+	if (!pte)
+		return -ENOMEM;
+
+	for (i = 0; i < PTRS_PER_PTE; i++) {
+		__set_pte_at(&init_mm, addr, pte + i, pfn_pte(pfn + i, PAGE_KERNEL), 0);
+		asm volatile("ptesync": : :"memory");
+	}
+	pmd_populate_kernel(&init_mm, pmd, pte);
+
+	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+	return 0;
+}
+
+bool radix_kfence_init_pool(void)
+{
+	unsigned int page_psize, pmd_psize;
+	unsigned long addr;
+	pmd_t *pmd;
+
+	if (!kfence_alloc_pool_late())
+		return true;
+
+	page_psize = shift_to_mmu_psize(PAGE_SHIFT);
+	pmd_psize = shift_to_mmu_psize(PMD_SHIFT);
+	for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
+	     addr += PAGE_SIZE) {
+		pmd = pmd_off_k(addr);
+
+		if (pmd_leaf(*pmd)) {
+			if (radix_split_pmd_page(pmd, addr & PMD_MASK))
+				return false;
+			update_page_count(pmd_psize, -1);
+			update_page_count(page_psize, PTRS_PER_PTE);
+		}
+	}
+
+	return true;
+}
+#endif
+
 static inline void __meminit
 print_mapping(unsigned long start, unsigned long end, unsigned long size, bool exec)
 {
@@ -391,7 +438,8 @@ static void __init radix_init_pgtable(void)
 			continue;
 		}
 
-		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL, ~0UL));
+		WARN_ON(create_physical_mapping(start, end, -1, PAGE_KERNEL,
+						kfence_alloc_pool_late() ? PMD_SIZE : ~0UL));
 	}
 
 #ifdef CONFIG_KFENCE
-- 
2.44.0


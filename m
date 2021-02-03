Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27E30D2B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 06:01:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVqKS1Zl9zDwvQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 16:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hGehXXc+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVqFd3XJWzDwqd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 15:58:29 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1134ZEHh175616; Tue, 2 Feb 2021 23:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GCUsTSDyvXCixUA7eWbW4RbFvjDQy153kqwI1jxlWZ8=;
 b=hGehXXc+E/J6pV0/8mlOvlDXmeSsAdqhv0R80MGNIDMqswvt9xbR52X3NtXvgosXrp5y
 52vFq9PnRFaaxwIYbPdXXxCpDvlFJhutoYWuHKHZds4CLTZiNB34minN59RfeUNyoFdI
 poIDcyYe+/eo/glYDk96vDZJeAAkzGgKBKD9nrZQKjbq0OHoVV0e1c+E8cAcPZYB7o2s
 x2ByU43uobOgP6KwPxK+y4k1uZG0lu3hExvvm6bx6EJeC4WlJfBiucwpXEDgoPPWVxt8
 y088/O+k7rFjVSZIEqUN1zCEQlPOmCzGTddsStsewKEcnkJjZscxcEcysms4r8olgsBl Ng== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36fmeh91qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 23:58:23 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1134wBvR023183;
 Wed, 3 Feb 2021 04:58:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 36f2nwy313-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 04:58:23 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1134wMl728443056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 04:58:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F8B2805A;
 Wed,  3 Feb 2021 04:58:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 106DC28058;
 Wed,  3 Feb 2021 04:58:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.69.155])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 04:58:20 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/mm: Add PG_dcache_clean to indicate dcache clean
 state
Date: Wed,  3 Feb 2021 10:28:11 +0530
Message-Id: <20210203045812.234439-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
References: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=970 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030019
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

This just add a better name for PG_arch_1. No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/cacheflush.h |  6 ++++++
 arch/powerpc/include/asm/kvm_ppc.h    |  4 ++--
 arch/powerpc/mm/book3s64/hash_utils.c |  4 ++--
 arch/powerpc/mm/mem.c                 |  4 ++--
 arch/powerpc/mm/pgtable.c             | 14 +++++++-------
 5 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 138e46d8c04e..f63495109f63 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -8,6 +8,12 @@
 #include <asm/cputable.h>
 #include <asm/cpu_has_feature.h>
 
+/*
+ * This flag is used to indicate that the page pointed to by a pte is clean
+ * and does not require cleaning before returning it to the user.
+ */
+#define PG_dcache_clean PG_arch_1
+
 #ifdef CONFIG_PPC_BOOK3S_64
 /*
  * Book3s has no ptesync after setting a pte, so without this ptesync it's
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..c90d4b128b66 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -881,9 +881,9 @@ static inline void kvmppc_mmu_flush_icache(kvm_pfn_t pfn)
 
 	/* Clear i-cache for new pages */
 	page = pfn_to_page(pfn);
-	if (!test_bit(PG_arch_1, &page->flags)) {
+	if (!test_bit(PG_dcache_clean, &page->flags)) {
 		flush_dcache_icache_page(page);
-		set_bit(PG_arch_1, &page->flags);
+		set_bit(PG_dcache_clean, &page->flags);
 	}
 }
 
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 73b06adb6eeb..5358c397f6c7 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1143,10 +1143,10 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 	page = pte_page(pte);
 
 	/* page is dirty */
-	if (!test_bit(PG_arch_1, &page->flags) && !PageReserved(page)) {
+	if (!test_bit(PG_dcache_clean, &page->flags) && !PageReserved(page)) {
 		if (trap == 0x400) {
 			flush_dcache_icache_page(page);
-			set_bit(PG_arch_1, &page->flags);
+			set_bit(PG_dcache_clean, &page->flags);
 		} else
 			pp |= HPTE_R_N;
 	}
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ed64ca80d5fd..883e67d37bbc 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -489,8 +489,8 @@ void flush_dcache_page(struct page *page)
 	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE))
 		return;
 	/* avoid an atomic op if possible */
-	if (test_bit(PG_arch_1, &page->flags))
-		clear_bit(PG_arch_1, &page->flags);
+	if (test_bit(PG_dcache_clean, &page->flags))
+		clear_bit(PG_dcache_clean, &page->flags);
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 15555c95cebc..7d997caccfa5 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -81,9 +81,9 @@ static pte_t set_pte_filter_hash(pte_t pte)
 		struct page *pg = maybe_pte_to_page(pte);
 		if (!pg)
 			return pte;
-		if (!test_bit(PG_arch_1, &pg->flags)) {
+		if (!test_bit(PG_dcache_clean, &pg->flags)) {
 			flush_dcache_icache_page(pg);
-			set_bit(PG_arch_1, &pg->flags);
+			set_bit(PG_dcache_clean, &pg->flags);
 		}
 	}
 	return pte;
@@ -116,13 +116,13 @@ static inline pte_t set_pte_filter(pte_t pte)
 		return pte;
 
 	/* If the page clean, we move on */
-	if (test_bit(PG_arch_1, &pg->flags))
+	if (test_bit(PG_dcache_clean, &pg->flags))
 		return pte;
 
 	/* If it's an exec fault, we flush the cache and make it clean */
 	if (is_exec_fault()) {
 		flush_dcache_icache_page(pg);
-		set_bit(PG_arch_1, &pg->flags);
+		set_bit(PG_dcache_clean, &pg->flags);
 		return pte;
 	}
 
@@ -161,12 +161,12 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 		goto bail;
 
 	/* If the page is already clean, we move on */
-	if (test_bit(PG_arch_1, &pg->flags))
+	if (test_bit(PG_dcache_clean, &pg->flags))
 		goto bail;
 
-	/* Clean the page and set PG_arch_1 */
+	/* Clean the page and set PG_dcache_clean */
 	flush_dcache_icache_page(pg);
-	set_bit(PG_arch_1, &pg->flags);
+	set_bit(PG_dcache_clean, &pg->flags);
 
  bail:
 	return pte_mkexec(pte);
-- 
2.29.2


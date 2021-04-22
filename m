Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBA3367975
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:46:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQmdJ1nY1z3c8J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:46:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bqBeZN63;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bqBeZN63; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQmZH0Yzjz301q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:44:06 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M5WiRC074018; Thu, 22 Apr 2021 01:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5uFU0tukKhEYqHwqu6mp5sIDmh0kcuxqUwuJ4Kzy/Ns=;
 b=bqBeZN63KH1aUzXym5AUxJ1IQdkkPkAjV0i5NTUGoBQPANtdlrDrFxfJBdXvOSaxC1pX
 GjTVcQyb3QUJvjDSTEnC6Adg1/jtjvwvdnLRtz+LakJrf2yc/hVSEtQ92dmm/YnyviKc
 8eOabHrhi4a1miw8zVjN0yMMEgIi6U1l7wPloa0IqX21GV8wmPID8NyRYkUuPSVjpxM0
 4E/3uSId1UrR1TOmfdTRiYnyQu57do66Yp2IF8PRj30Lw4Ui8Vx+3QuhZbd7hLAMh63d
 xiGqjLFF8kJKlvlaBmc6klH5UlMudkDVeLrKzWXvP27phfqQUOgUR5CUZNfESIlefZne Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38318kjrxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:58 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M5Y6an082431;
 Thu, 22 Apr 2021 01:43:57 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38318kjrxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:57 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M5guHS017072;
 Thu, 22 Apr 2021 05:43:56 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 37yqa9fk89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 05:43:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M5htqr25297336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 05:43:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5068C7805E;
 Thu, 22 Apr 2021 05:43:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D6D67805C;
 Thu, 22 Apr 2021 05:43:52 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.37.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 05:43:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to take
 a page walk cache flush argument
Date: Thu, 22 Apr 2021 11:13:19 +0530
Message-Id: <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jF-trDOjTqVSPCyn15a62ncYWMCFDdYx
X-Proofpoint-ORIG-GUID: tW-2KSAzTQbPdawvJaUzplkEJWvFGVwu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220047
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No functional change in this patch

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../include/asm/book3s/64/tlbflush-radix.h    | 19 +++++++-----
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 ++++++++++++---
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 +--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 29 +++++++------------
 4 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 8b33601cdb9d..171441a43b35 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -56,15 +56,18 @@ static inline void radix__flush_all_lpid_guest(unsigned int lpid)
 }
 #endif
 
-extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
-					   unsigned long start, unsigned long end);
-extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
-					 unsigned long end, int psize);
-extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
-				       unsigned long start, unsigned long end);
-extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
+void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
+				    unsigned long start, unsigned long end,
+				    bool flush_pwc);
+void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
+				unsigned long start, unsigned long end,
+				bool flush_pwc);
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize, bool flush_pwc);
+void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
-extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
+
 
 extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
 extern void radix__local_flush_all_mm(struct mm_struct *mm);
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 215973b4cb26..f9f8a3a264f7 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
 		hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
 }
 
+static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end,
+					   bool flush_pwc)
+{
+	if (radix_enabled())
+		return radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
+	return hash__flush_tlb_range(vma, start, end);
+}
 
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
 				       unsigned long start, unsigned long end)
+{
+	return flush_pmd_tlb_pwc_range(vma, start, end, false);
+}
+
+static inline void flush_hugetlb_tlb_pwc_range(struct vm_area_struct *vma,
+					       unsigned long start,
+					       unsigned long end,
+					       bool flush_pwc)
 {
 	if (radix_enabled())
-		return radix__flush_pmd_tlb_range(vma, start, end);
+		return radix__flush_hugetlb_tlb_range(vma, start, end, flush_pwc);
 	return hash__flush_tlb_range(vma, start, end);
 }
 
@@ -60,9 +77,7 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 					   unsigned long start,
 					   unsigned long end)
 {
-	if (radix_enabled())
-		return radix__flush_hugetlb_tlb_range(vma, start, end);
-	return hash__flush_tlb_range(vma, start, end);
+	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index cb91071eef52..e62f5679b119 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -26,13 +26,13 @@ void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned long v
 }
 
 void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long start,
-				   unsigned long end)
+				    unsigned long end, bool flush_pwc)
 {
 	int psize;
 	struct hstate *hstate = hstate_file(vma->vm_file);
 
 	psize = hstate_get_psize(hstate);
-	radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
+	radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize, flush_pwc);
 }
 
 /*
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 817a02ef6032..5a59e19f9e53 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1090,7 +1090,7 @@ void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 {
 #ifdef CONFIG_HUGETLB_PAGE
 	if (is_vm_hugetlb_page(vma))
-		return radix__flush_hugetlb_tlb_range(vma, start, end);
+		return radix__flush_hugetlb_tlb_range(vma, start, end, false);
 #endif
 
 	__radix__flush_tlb_range(vma->vm_mm, start, end);
@@ -1151,9 +1151,6 @@ void radix__flush_all_lpid_guest(unsigned int lpid)
 	_tlbie_lpid_guest(lpid, RIC_FLUSH_ALL);
 }
 
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize);
-
 void radix__tlb_flush(struct mmu_gather *tlb)
 {
 	int psize = 0;
@@ -1177,10 +1174,8 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 		else
 			radix__flush_all_mm(mm);
 	} else {
-		if (!tlb->freed_tables)
-			radix__flush_tlb_range_psize(mm, start, end, psize);
-		else
-			radix__flush_tlb_pwc_range_psize(mm, start, end, psize);
+		radix__flush_tlb_pwc_range_psize(mm, start,
+						 end, psize, tlb->freed_tables);
 	}
 }
 
@@ -1254,16 +1249,10 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	preempt_enable();
 }
 
-void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize)
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize, bool flush_pwc)
 {
-	return __radix__flush_tlb_range_psize(mm, start, end, psize, false);
-}
-
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize)
-{
-	__radix__flush_tlb_range_psize(mm, start, end, psize, true);
+	__radix__flush_tlb_range_psize(mm, start, end, psize, flush_pwc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -1315,9 +1304,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
-				unsigned long start, unsigned long end)
+				unsigned long start, unsigned long end,
+				bool flush_pwc)
 {
-	radix__flush_tlb_range_psize(vma->vm_mm, start, end, MMU_PAGE_2M);
+	__radix__flush_tlb_range_psize(vma->vm_mm, start,
+				       end, MMU_PAGE_2M, flush_pwc);
 }
 EXPORT_SYMBOL(radix__flush_pmd_tlb_range);
 
-- 
2.30.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC2134E107
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 08:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8fGW4j3qz3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:11:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IaDmsUjH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IaDmsUjH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8fCB45C4z30JS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 17:08:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U63n2J130371; Tue, 30 Mar 2021 02:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nZNziKoKLSyg5eZ+6VlnoZwq5zLQgtI2gGNt92+T5YY=;
 b=IaDmsUjHsCayE8dCrmJWIQB5uh6g3bMakQnw4MFvMPtXVwIM5tZQGFLksrmSQWcgUxl8
 Z4eEXD84TFgRhdzfiRFOoqWQ+vwReaNfgiMOXqhj9OGtUe2LGjedPzTrU16ezqZo+UnI
 bXRRhDp8Rh3zaOjPDL4uEs0C9VSCPQm9BdY/RvVwfMzmYNPO4myRKXvjwCAxHmWfXYtH
 JUTOEatXkV4oRotnj8/5MLww0eFgTiNFv7VAE6K/otibE8F9FPn6XcLY7LDQ+vqA3h+V
 QvUM40M11ilxpjI3dCBklF0cG2XIQ3/hAi5oVQUbgSkGghLSH+1ZPhpCADJcdJS/aYxk 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnm59ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:32 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U641CE131560;
 Tue, 30 Mar 2021 02:08:27 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhnm59x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:27 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U631XP011130;
 Tue, 30 Mar 2021 06:08:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 37hvb9bgh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 06:08:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U68PV927918616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 06:08:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E5A07805C;
 Tue, 30 Mar 2021 06:08:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0B2B7805F;
 Tue, 30 Mar 2021 06:08:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 06:08:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 5/9] powerpc/mm/book3s64: Update tlb flush routines to take
 a page walk cache flush argument
Date: Tue, 30 Mar 2021 11:37:48 +0530
Message-Id: <20210330060752.592769-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
References: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vp7GYlszzGZ3N4Du9BiFULK7YV53qCx_
X-Proofpoint-ORIG-GUID: Pwnj2o5agNpSk7vgXi5uLHkV1yOhuEaZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_01:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103300043
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
Cc: kaleshsingh@google.com, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../include/asm/book3s/64/tlbflush-radix.h    | 19 ++++++++-------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 +++++++++++++++----
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 ++--
 arch/powerpc/mm/book3s64/radix_tlb.c          | 23 ++++++++-----------
 4 files changed, 42 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 8b33601cdb9d..90c91f7b526f 100644
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
+				    bool also_pwc);
+void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
+				unsigned long start, unsigned long end,
+				bool also_pwc);
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize, bool also_pwc);
+void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
-extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
+
 
 extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
 extern void radix__local_flush_all_mm(struct mm_struct *mm);
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 215973b4cb26..efe5336e2b6f 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
 		hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
 }
 
+static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end,
+					   bool also_pwc)
+{
+	if (radix_enabled())
+		return radix__flush_pmd_tlb_range(vma, start, end, also_pwc);
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
+					       bool also_pwc)
 {
 	if (radix_enabled())
-		return radix__flush_pmd_tlb_range(vma, start, end);
+		return radix__flush_hugetlb_tlb_range(vma, start, end, also_pwc);
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
index cb91071eef52..55c5c9c39ae2 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -26,13 +26,13 @@ void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned long v
 }
 
 void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long start,
-				   unsigned long end)
+				    unsigned long end, bool also_pwc)
 {
 	int psize;
 	struct hstate *hstate = hstate_file(vma->vm_file);
 
 	psize = hstate_get_psize(hstate);
-	radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
+	radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize, also_pwc);
 }
 
 /*
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 817a02ef6032..416fe9b48e14 100644
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
 
@@ -1260,10 +1255,10 @@ void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
 	return __radix__flush_tlb_range_psize(mm, start, end, psize, false);
 }
 
-static void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
-				  unsigned long end, int psize)
+void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
+				      unsigned long end, int psize, bool also_pwc)
 {
-	__radix__flush_tlb_range_psize(mm, start, end, psize, true);
+	__radix__flush_tlb_range_psize(mm, start, end, psize, also_pwc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -1315,9 +1310,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
-				unsigned long start, unsigned long end)
+				unsigned long start, unsigned long end,
+				bool also_pwc)
 {
-	radix__flush_tlb_range_psize(vma->vm_mm, start, end, MMU_PAGE_2M);
+	__radix__flush_tlb_range_psize(vma->vm_mm, start,
+				       end, MMU_PAGE_2M, also_pwc);
 }
 EXPORT_SYMBOL(radix__flush_pmd_tlb_range);
 
-- 
2.30.2


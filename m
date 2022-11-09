Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C591622346
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:58:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xlq1YZKz3f9x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fc5tsqfX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fc5tsqfX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xch32hZz3bhv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A94R1Iv002515;
	Wed, 9 Nov 2022 04:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=N1tS4X8+heTzkVXLVHBoP4F5d0jgs2004snFBcHMPrE=;
 b=Fc5tsqfXVggc+Tm13qznraTY6y4rtnM82kpl0oiTqkRT/rKO2i8+AVG8FV0P4h1U4tQD
 /SfkUjXOJ0bbDqBD6rDiHOB185OfOpY8vtxpVmC9HNHavnx0n50K/mEl318fY8W1t8uy
 yOzt820LWNS1rNKUh37oQrIyCBvoQFNeQdgw//hb/N5vDTmxv+hULox5HdeFgMC95tPZ
 sYUoIohUcmiZPrDQ8twePK8qjlBRuzuP3c8orpBUUAHyJlyu1Hn90/x57nEJoI7/3yrQ
 tDV5OEzVVr5YCP3jk8sfOocvEHGBe8pnsRh5rFyZoha2lO5eTQtwdrB2tuTA71MeYUzW Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh8ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A94V0wD029077;
	Wed, 9 Nov 2022 04:51:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr56mh899-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94pUCX014752;
	Wed, 9 Nov 2022 04:51:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3kngqdd1vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94pV3r4063822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:51:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 541A5A404D;
	Wed,  9 Nov 2022 04:51:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A973AA4040;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:30 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CC4886038E;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 3/9] powerpc/mm: Remove extern from function prototypes
Date: Wed,  9 Nov 2022 15:51:06 +1100
Message-Id: <20221109045112.187069-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RAR7cPrRCiG-PW9Q3poePFprc68GGT-s
X-Proofpoint-ORIG-GUID: w7XTdfAtoNcCeQoc1rUwmDWD_SUg-Xk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=662 adultscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090028
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the extern keyword from function declarations. It is redundant
and would cause inconsistent style when new functions are added without
it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* New in v10 for consistency with new functions
---
 .../include/asm/book3s/64/tlbflush-hash.h     | 19 +++++++++---------
 arch/powerpc/include/asm/nohash/tlbflush.h    | 20 +++++++++----------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index fab8332fe1ad..3c89e625e620 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -22,7 +22,7 @@ struct ppc64_tlb_batch {
 };
 DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
 
-extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
+void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
 
 #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
 
@@ -51,14 +51,13 @@ static inline void arch_leave_lazy_mmu_mode(void)
 
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
 
-extern void hash__tlbiel_all(unsigned int action);
+void hash__tlbiel_all(unsigned int action);
 
-extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
-			    int ssize, unsigned long flags);
-extern void flush_hash_range(unsigned long number, int local);
-extern void flush_hash_hugepage(unsigned long vsid, unsigned long addr,
-				pmd_t *pmdp, unsigned int psize, int ssize,
-				unsigned long flags);
+void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize, int ssize,
+		     unsigned long flags);
+void flush_hash_range(unsigned long number, int local);
+void flush_hash_hugepage(unsigned long vsid, unsigned long addr, pmd_t *pmdp,
+			 unsigned int psize, int ssize, unsigned long flags);
 static inline void hash__local_flush_tlb_mm(struct mm_struct *mm)
 {
 }
@@ -111,11 +110,11 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 
 
 struct mmu_gather;
-extern void hash__tlb_flush(struct mmu_gather *tlb);
+void hash__tlb_flush(struct mmu_gather *tlb);
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Private function for use by PCI IO mapping code */
-extern void __flush_hash_table_range(unsigned long start, unsigned long end);
+void __flush_hash_table_range(unsigned long start, unsigned long end);
 void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr);
 #else
 static inline void __flush_hash_table_range(unsigned long start, unsigned long end) { }
diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index bdaf34ad41ea..0cef5e4f8d92 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -28,8 +28,7 @@ struct mm_struct;
 
 #define MMU_NO_CONTEXT      	((unsigned int)-1)
 
-extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
-			    unsigned long end);
+void flush_tlb_range(struct vm_area_struct *vma, unsigned long start, unsigned long end);
 
 #ifdef CONFIG_PPC_8xx
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
@@ -55,19 +54,18 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 		asm volatile ("sync; tlbia; isync" : : : "memory");
 }
 #else
-extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
-extern void local_flush_tlb_mm(struct mm_struct *mm);
-extern void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+void local_flush_tlb_mm(struct mm_struct *mm);
+void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
-extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
-				   int tsize, int ind);
+void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
+			    int tsize, int ind);
 #endif
 
 #ifdef CONFIG_SMP
-extern void flush_tlb_mm(struct mm_struct *mm);
-extern void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
-extern void __flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
-			     int tsize, int ind);
+void flush_tlb_mm(struct mm_struct *mm);
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
+void __flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr, int tsize, int ind);
 #else
 #define flush_tlb_mm(mm)		local_flush_tlb_mm(mm)
 #define flush_tlb_page(vma,addr)	local_flush_tlb_page(vma,addr)
-- 
2.38.1


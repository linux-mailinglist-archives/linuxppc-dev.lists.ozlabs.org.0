Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FBE2BAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 10:02:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zKTp6zj6zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:02:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zKP621rbzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 18:58:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9O7vleV137859; Thu, 24 Oct 2019 03:58:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vu7nv8nrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 03:58:12 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9O7wBlu139792;
 Thu, 24 Oct 2019 03:58:11 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vu7nv8nqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 03:58:11 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9O7sVat029841;
 Thu, 24 Oct 2019 07:58:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2vqt47trc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 07:58:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9O7w9Gg39780802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 07:58:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0A82124053;
 Thu, 24 Oct 2019 07:58:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 406A5124052;
 Thu, 24 Oct 2019 07:58:08 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.127])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 07:58:08 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH v1 2/3] powerpc/mm/book3s64/radix: Use freed_tables instead of
 need_flush_all
Date: Thu, 24 Oct 2019 13:28:00 +0530
Message-Id: <20191024075801.22434-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024075801.22434-1-aneesh.kumar@linux.ibm.com>
References: <20191024075801.22434-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240076
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit: 22a61c3c4f13 ("asm-generic/tlb: Track freeing of page-table
directories in struct mmu_gather") we now track whether we freed page
table in mmu_gather. Use that to decide whether to flush Page Walk Cache.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgalloc.h  | 15 ---------------
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 16 ----------------
 arch/powerpc/mm/book3s64/radix_tlb.c          | 11 +++--------
 3 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgalloc.h b/arch/powerpc/include/asm/book3s/64/pgalloc.h
index d5a44912902f..f6968c811026 100644
--- a/arch/powerpc/include/asm/book3s/64/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/64/pgalloc.h
@@ -122,11 +122,6 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long address)
 {
-	/*
-	 * By now all the pud entries should be none entries. So go
-	 * ahead and flush the page walk cache
-	 */
-	flush_tlb_pgtable(tlb, address);
 	pgtable_free_tlb(tlb, pud, PUD_INDEX);
 }
 
@@ -143,11 +138,6 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long address)
 {
-	/*
-	 * By now all the pud entries should be none entries. So go
-	 * ahead and flush the page walk cache
-	 */
-	flush_tlb_pgtable(tlb, address);
 	return pgtable_free_tlb(tlb, pmd, PMD_INDEX);
 }
 
@@ -166,11 +156,6 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t table,
 				  unsigned long address)
 {
-	/*
-	 * By now all the pud entries should be none entries. So go
-	 * ahead and flush the page walk cache
-	 */
-	flush_tlb_pgtable(tlb, address);
 	pgtable_free_tlb(tlb, table, PTE_INDEX);
 }
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 7aa8195b6cff..dcb5c3839d2f 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -147,22 +147,6 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 		flush_tlb_page(vma, address);
 }
 
-/*
- * flush the page walk cache for the address
- */
-static inline void flush_tlb_pgtable(struct mmu_gather *tlb, unsigned long address)
-{
-	/*
-	 * Flush the page table walk cache on freeing a page table. We already
-	 * have marked the upper/higher level page table entry none by now.
-	 * So it is safe to flush PWC here.
-	 */
-	if (!radix_enabled())
-		return;
-
-	radix__flush_tlb_pwc(tlb, address);
-}
-
 extern bool tlbie_capable;
 extern bool tlbie_enabled;
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 24d1f30556e0..f9a4d5793f03 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -732,18 +732,13 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 	}
 	preempt_enable();
 }
+
 void radix__flush_all_mm(struct mm_struct *mm)
 {
 	__flush_all_mm(mm, false);
 }
 EXPORT_SYMBOL(radix__flush_all_mm);
 
-void radix__flush_tlb_pwc(struct mmu_gather *tlb, unsigned long addr)
-{
-	tlb->need_flush_all = 1;
-}
-EXPORT_SYMBOL(radix__flush_tlb_pwc);
-
 void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmaddr,
 				 int psize)
 {
@@ -1003,12 +998,12 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	if (tlb->fullmm) {
 		__flush_all_mm(mm, true);
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
-		if (!tlb->need_flush_all)
+		if (!tlb->freed_tables)
 			radix__flush_tlb_mm(mm);
 		else
 			radix__flush_all_mm(mm);
 	} else {
-		if (!tlb->need_flush_all)
+		if (!tlb->freed_tables)
 			radix__flush_tlb_range_psize(mm, start, end, psize);
 		else
 			radix__flush_tlb_pwc_range_psize(mm, start, end, psize);
-- 
2.21.0


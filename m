Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31A1C4F39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:35:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GWjH1gSPzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWK341DlzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:17:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04571w2t154617; Tue, 5 May 2020 03:17:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4v7pymu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:51 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04572J1d155766;
 Tue, 5 May 2020 03:17:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4v7pymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:17:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FKli016365;
 Tue, 5 May 2020 07:17:50 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 30s0g74jau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:17:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457Hmow26804730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:17:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76A78BE04F;
 Tue,  5 May 2020 07:17:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 555B1BE054;
 Tue,  5 May 2020 07:17:47 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:17:46 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 04/22] powerpc/hash64: Restrict page table lookup using
 init_mm with __flush_hash_table_range
Date: Tue,  5 May 2020 12:47:11 +0530
Message-Id: <20200505071729.54912-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is only used with init_mm currently. Walking init_mm is much simpler
because we don't need to handle concurrent page table like other mm_context

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 .../include/asm/book3s/64/tlbflush-hash.h        |  3 +--
 arch/powerpc/kernel/pci_64.c                     |  2 +-
 arch/powerpc/mm/book3s64/hash_tlb.c              | 16 +++-------------
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 64d02a704bcb..3b95769739c7 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -113,8 +113,7 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
 struct mmu_gather;
 extern void hash__tlb_flush(struct mmu_gather *tlb);
 /* Private function for use by PCI IO mapping code */
-extern void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
-				     unsigned long end);
+extern void __flush_hash_table_range(unsigned long start, unsigned long end);
 extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr);
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_HASH_H */
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index f83d1f69b1dd..30d07fc79dd1 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -100,7 +100,7 @@ int pcibios_unmap_io_space(struct pci_bus *bus)
 			 pci_name(bus->self));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-		__flush_hash_table_range(&init_mm, res->start + _IO_BASE,
+		__flush_hash_table_range(res->start + _IO_BASE,
 					 res->end + _IO_BASE + 1);
 #endif
 		return 0;
diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index 4a70d8dd39cd..1fa2173413b5 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -176,7 +176,6 @@ void hash__tlb_flush(struct mmu_gather *tlb)
  *                            from the hash table (and the TLB). But keeps
  *                            the linux PTEs intact.
  *
- * @mm		: mm_struct of the target address space (generally init_mm)
  * @start	: starting address
  * @end         : ending address (not included in the flush)
  *
@@ -189,17 +188,14 @@ void hash__tlb_flush(struct mmu_gather *tlb)
  * Because of that usage pattern, it is implemented for small size rather
  * than speed.
  */
-void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
-			      unsigned long end)
+void __flush_hash_table_range(unsigned long start, unsigned long end)
 {
-	bool is_thp;
 	int hugepage_shift;
 	unsigned long flags;
 
 	start = _ALIGN_DOWN(start, PAGE_SIZE);
 	end = _ALIGN_UP(end, PAGE_SIZE);
 
-	BUG_ON(!mm->pgd);
 
 	/*
 	 * Note: Normally, we should only ever use a batch within a
@@ -212,21 +208,15 @@ void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
 	local_irq_save(flags);
 	arch_enter_lazy_mmu_mode();
 	for (; start < end; start += PAGE_SIZE) {
-		pte_t *ptep = find_current_mm_pte(mm->pgd, start, &is_thp,
-						  &hugepage_shift);
+		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
 		unsigned long pte;
 
 		if (ptep == NULL)
 			continue;
 		pte = pte_val(*ptep);
-		if (is_thp)
-			trace_hugepage_invalidate(start, pte);
 		if (!(pte & H_PAGE_HASHPTE))
 			continue;
-		if (unlikely(is_thp))
-			hpte_do_hugepage_flush(mm, start, (pmd_t *)ptep, pte);
-		else
-			hpte_need_flush(mm, start, ptep, pte, hugepage_shift);
+		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
 	}
 	arch_leave_lazy_mmu_mode();
 	local_irq_restore(flags);
-- 
2.26.2


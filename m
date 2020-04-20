Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E642C1B0C49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:12:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Rtf0F20zDqlm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 23:12:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495RHY3xJPzDqcN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:45:13 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KCVsnv034218; Mon, 20 Apr 2020 08:45:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmvfnwuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:07 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03KCWpaJ037375;
 Mon, 20 Apr 2020 08:45:07 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmvfnwtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:45:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KCdtnq020519;
 Mon, 20 Apr 2020 12:45:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 30fs660jfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 12:45:05 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KCj4CI58917252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 12:45:04 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 820DF136059;
 Mon, 20 Apr 2020 12:45:04 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4CC513604F;
 Mon, 20 Apr 2020 12:45:00 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.51.43])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 12:45:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v3 04/22] powerpc/hash64: Restrict page table lookup using
 init_mm with __flush_hash_table_range
Date: Mon, 20 Apr 2020 18:14:16 +0530
Message-Id: <20200420124434.47330-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
References: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200107
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
Cc: leonardo@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 npiggin@gmail.com, kirill@shutemov.name
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
2.25.3


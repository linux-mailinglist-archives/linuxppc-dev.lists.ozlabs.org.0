Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93AC0ECA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 01:58:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g7zz4xjGzDql5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 09:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g7bl4HSszDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 09:41:23 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RNbTOm135082; Fri, 27 Sep 2019 19:40:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9rkswerh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:40:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8RNbkb0135919;
 Fri, 27 Sep 2019 19:40:57 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9rkswer7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:40:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8RNeO2h023852;
 Fri, 27 Sep 2019 23:40:56 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2v5bg8b71f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 23:40:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RNetGr43647294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 23:40:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7795112063;
 Fri, 27 Sep 2019 23:40:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14094112062;
 Fri, 27 Sep 2019 23:40:52 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.58])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 23:40:51 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v4 08/11] powerpc/kvm/book3s_hv: Applies counting method to
 monitor lockless pgtbl walks
Date: Fri, 27 Sep 2019 20:40:05 -0300
Message-Id: <20190927234008.11513-9-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927234008.11513-1-leonardo@linux.ibm.com>
References: <20190927234008.11513-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=897 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270205
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
Cc: Keith Busch <keith.busch@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Paul Mackerras <paulus@samba.org>, John Hubbard <jhubbard@nvidia.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Applies the counting-based method for monitoring all book3s_hv related
functions that do lockless pagetable walks.

Adds comments explaining that some lockless pagetable walks don't need
protection due to guest pgd not being a target of THP collapse/split, or
due to being called from Realmode + MSR_EE = 0

kvmppc_do_h_enter: Fixes where local_irq_restore() must be placed (after
the last usage of ptep).

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 22 ++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 18 ++++++++++++++----
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 735e0ac6f5b2..5a641b559de7 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -803,7 +803,11 @@ static void kvmhv_update_nest_rmap_rc(struct kvm *kvm, u64 n_rmap,
 	if (!gp)
 		return;
 
-	/* Find the pte */
+	/* Find the pte:
+	 * We are walking the nested guest (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
 	/*
 	 * If the pte is present and the pfn is still the same, update the pte.
@@ -853,7 +857,11 @@ static void kvmhv_remove_nest_rmap(struct kvm *kvm, u64 n_rmap,
 	if (!gp)
 		return;
 
-	/* Find and invalidate the pte */
+	/* Find and invalidate the pte:
+	 * We are walking the nested guest (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
 	/* Don't spuriously invalidate ptes if the pfn has changed */
 	if (ptep && pte_present(*ptep) && ((pte_val(*ptep) & mask) == hpa))
@@ -921,6 +929,11 @@ static bool kvmhv_invalidate_shadow_pte(struct kvm_vcpu *vcpu,
 	int shift;
 
 	spin_lock(&kvm->mmu_lock);
+	/*
+	 * We are walking the nested guest (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(gp->shadow_pgtable, gpa, NULL, &shift);
 	if (!shift)
 		shift = PAGE_SHIFT;
@@ -1362,6 +1375,11 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 	/* See if can find translation in our partition scoped tables for L1 */
 	pte = __pte(0);
 	spin_lock(&kvm->mmu_lock);
+	/*
+	 * We are walking the secondary (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	pte_p = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 	if (!shift)
 		shift = PAGE_SHIFT;
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 63e0ce91e29d..2076a7ac230a 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -252,6 +252,7 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 	 * If we had a page table table change after lookup, we would
 	 * retry via mmu_notifier_retry.
 	 */
+	start_lockless_pgtbl_walk(kvm->mm);
 	if (!realmode)
 		local_irq_save(irq_flags);
 	/*
@@ -287,8 +288,6 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 			pa |= gpa & ~PAGE_MASK;
 		}
 	}
-	if (!realmode)
-		local_irq_restore(irq_flags);
 
 	ptel &= HPTE_R_KEY | HPTE_R_PP0 | (psize-1);
 	ptel |= pa;
@@ -311,6 +310,9 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 		ptel &= ~(HPTE_R_W|HPTE_R_I|HPTE_R_G);
 		ptel |= HPTE_R_M;
 	}
+	if (!realmode)
+		local_irq_restore(irq_flags);
+	end_lockless_pgtbl_walk(kvm->mm);
 
 	/* Find and lock the HPTEG slot to use */
  do_insert:
@@ -885,11 +887,19 @@ static int kvmppc_get_hpa(struct kvm_vcpu *vcpu, unsigned long gpa,
 	/* Translate to host virtual address */
 	hva = __gfn_to_hva_memslot(memslot, gfn);
 
-	/* Try to find the host pte for that virtual address */
+	/* Try to find the host pte for that virtual address :
+	 * Called by hcall_real_table (real mode + MSR_EE=0)
+	 * Interrupts are disabled here.
+	 */
+	start_lockless_pgtbl_walk(kvm->mm);
 	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
-	if (!ptep)
+	if (!ptep) {
+		end_lockless_pgtbl_walk(kvm->mm);
 		return H_TOO_HARD;
+	}
 	pte = kvmppc_read_update_linux_pte(ptep, writing);
+	end_lockless_pgtbl_walk(kvm->mm);
+
 	if (!pte_present(pte))
 		return H_TOO_HARD;
 
-- 
2.20.1


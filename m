Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEAC0ECD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 02:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g82g521TzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 10:01:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g7bp01k5zDqjX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 09:41:25 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RNcKa2044357; Fri, 27 Sep 2019 19:41:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9srxbhqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:41:01 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8RNe3o6060519;
 Fri, 27 Sep 2019 19:41:01 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9srxbhq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 19:41:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8RNeQnP017035;
 Fri, 27 Sep 2019 23:41:00 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2v5bg8476s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 23:41:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RNexde19792218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 23:40:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7FA7112063;
 Fri, 27 Sep 2019 23:40:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07C0E112065;
 Fri, 27 Sep 2019 23:40:56 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.58])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 23:40:55 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v4 09/11] powerpc/kvm/book3s_64: Applies counting method to
 monitor lockless pgtbl walks
Date: Fri, 27 Sep 2019 20:40:06 -0300
Message-Id: <20190927234008.11513-10-leonardo@linux.ibm.com>
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
 mlxlogscore=462 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Applies the counting-based method for monitoring all book3s_64-related
functions that do lockless pagetable walks.

Adds comments explaining that some lockless pagetable walks don't need
protection due to guest pgd not being a target of THP collapse/split, or
due to being called from Realmode + MSR_EE = 0.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 ++
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 30 ++++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_64_vio_hv.c    |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 9a75f0e1933b..fcd3dad1297f 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -620,6 +620,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			 * We need to protect against page table destruction
 			 * hugepage split and collapse.
 			 */
+			start_lockless_pgtbl_walk(kvm->mm);
 			local_irq_save(flags);
 			ptep = find_current_mm_pte(current->mm->pgd,
 						   hva, NULL, NULL);
@@ -629,6 +630,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 					write_ok = 1;
 			}
 			local_irq_restore(flags);
+			end_lockless_pgtbl_walk(kvm->mm);
 		}
 	}
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 2d415c36a61d..9b374b9838fa 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -813,6 +813,7 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	 * Read the PTE from the process' radix tree and use that
 	 * so we get the shift and attribute bits.
 	 */
+	start_lockless_pgtbl_walk(kvm->mm);
 	local_irq_disable();
 	ptep = __find_linux_pte(vcpu->arch.pgdir, hva, NULL, &shift);
 	/*
@@ -821,12 +822,14 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	 */
 	if (!ptep) {
 		local_irq_enable();
+		end_lockless_pgtbl_walk(kvm->mm);
 		if (page)
 			put_page(page);
 		return RESUME_GUEST;
 	}
 	pte = *ptep;
 	local_irq_enable();
+	end_lockless_pgtbl_walk(kvm->mm);
 
 	/* If we're logging dirty pages, always map single pages */
 	large_enable = !(memslot->flags & KVM_MEM_LOG_DIRTY_PAGES);
@@ -972,10 +975,16 @@ int kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	unsigned long gpa = gfn << PAGE_SHIFT;
 	unsigned int shift;
 
+	/*
+	 * We are walking the secondary (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 	if (ptep && pte_present(*ptep))
 		kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
 				 kvm->arch.lpid);
+
 	return 0;				
 }
 
@@ -989,6 +998,11 @@ int kvm_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	int ref = 0;
 	unsigned long old, *rmapp;
 
+	/*
+	 * We are walking the secondary (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 	if (ptep && pte_present(*ptep) && pte_young(*ptep)) {
 		old = kvmppc_radix_update_pte(kvm, ptep, _PAGE_ACCESSED, 0,
@@ -1013,6 +1027,11 @@ int kvm_test_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 	unsigned int shift;
 	int ref = 0;
 
+	/*
+	 * We are walking the secondary (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 	if (ptep && pte_present(*ptep) && pte_young(*ptep))
 		ref = 1;
@@ -1030,6 +1049,11 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
 	int ret = 0;
 	unsigned long old, *rmapp;
 
+	/*
+	 * We are walking the secondary (partition-scoped) page table here.
+	 * We can do this without disabling irq because the Linux MM
+	 * subsystem doesn't do THP splits and collapses on this tree.
+	 */
 	ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 	if (ptep && pte_present(*ptep) && pte_dirty(*ptep)) {
 		ret = 1;
@@ -1046,6 +1070,7 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
 					       1UL << shift);
 		spin_unlock(&kvm->mmu_lock);
 	}
+
 	return ret;
 }
 
@@ -1085,6 +1110,11 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	gpa = memslot->base_gfn << PAGE_SHIFT;
 	spin_lock(&kvm->mmu_lock);
 	for (n = memslot->npages; n; --n) {
+		/*
+		 * We are walking the secondary (partition-scoped) page table here.
+		 * We can do this without disabling irq because the Linux MM
+		 * subsystem doesn't do THP splits and collapses on this tree.
+		 */
 		ptep = __find_linux_pte(kvm->arch.pgtable, gpa, NULL, &shift);
 		if (ptep && pte_present(*ptep))
 			kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index b4f20f13b860..376d069a92dd 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -431,6 +431,7 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu,
 		unsigned long ua, unsigned long *phpa)
 {
+	struct kvm *kvm = vcpu->kvm;
 	pte_t *ptep, pte;
 	unsigned shift = 0;
 
@@ -443,10 +444,12 @@ static long kvmppc_rm_ua_to_hpa(struct kvm_vcpu *vcpu,
 	 * to exit which will agains result in the below page table walk
 	 * to finish.
 	 */
+	start_lockless_pgtbl_walk(kvm->mm);
 	ptep = __find_linux_pte(vcpu->arch.pgdir, ua, NULL, &shift);
 	if (!ptep || !pte_present(*ptep))
 		return -ENXIO;
 	pte = *ptep;
+	end_lockless_pgtbl_walk(kvm->mm);
 
 	if (!shift)
 		shift = PAGE_SHIFT;
-- 
2.20.1


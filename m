Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5348171179
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:30:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Skq0152gzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:30:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk4z5tYZzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:39 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6qUZf000716; Thu, 27 Feb 2020 01:57:34 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydhhny9a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:33 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6qVkB000730;
 Thu, 27 Feb 2020 01:57:32 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydhhny993-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:57:32 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ujdD017831;
 Thu, 27 Feb 2020 06:57:31 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 2ydcmkx472-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:57:31 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6vUE341615802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:57:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9411B28058;
 Thu, 27 Feb 2020 06:57:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F22E28059;
 Thu, 27 Feb 2020 06:57:28 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:57:28 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 17/21] powerpc/kvm/book3s: Avoid using rmap to protect
 parallel page table update.
Date: Thu, 27 Feb 2020 12:26:16 +0530
Message-Id: <20200227065620.50804-18-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
References: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002270053
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

We now depend on kvm->mmu_lock

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_vio_hv.c | 38 +++++++----------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index 8a6bf12d2e88..2176d0d225d2 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -75,8 +75,8 @@ struct kvmppc_spapr_tce_table *kvmppc_find_table(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(kvmppc_find_table);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-static long kvmppc_rm_tce_to_ua(struct kvm *kvm, unsigned long tce,
-		unsigned long *ua, unsigned long **prmap)
+static long kvmppc_rm_tce_to_ua(struct kvm *kvm,
+				unsigned long tce, unsigned long *ua)
 {
 	unsigned long gfn = tce >> PAGE_SHIFT;
 	struct kvm_memory_slot *memslot;
@@ -88,9 +88,6 @@ static long kvmppc_rm_tce_to_ua(struct kvm *kvm, unsigned long tce,
 	*ua = __gfn_to_hva_memslot(memslot, gfn) |
 		(tce & ~(PAGE_MASK | TCE_PCI_READ | TCE_PCI_WRITE));
 
-	if (prmap)
-		*prmap = &memslot->arch.rmap[gfn - memslot->base_gfn];
-
 	return 0;
 }
 
@@ -117,7 +114,7 @@ static long kvmppc_rm_tce_validate(struct kvmppc_spapr_tce_table *stt,
 	if (iommu_tce_check_gpa(stt->page_shift, gpa))
 		return H_PARAMETER;
 
-	if (kvmppc_rm_tce_to_ua(stt->kvm, tce, &ua, NULL))
+	if (kvmppc_rm_tce_to_ua(stt->kvm, tce, &ua))
 		return H_TOO_HARD;
 
 	list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -412,7 +409,7 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 		return ret;
 
 	dir = iommu_tce_direction(tce);
-	if ((dir != DMA_NONE) && kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua, NULL))
+	if ((dir != DMA_NONE) && kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua))
 		return H_PARAMETER;
 
 	entry = ioba >> stt->page_shift;
@@ -489,7 +486,6 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 	struct kvmppc_spapr_tce_table *stt;
 	long i, ret = H_SUCCESS;
 	unsigned long tces, entry, ua = 0;
-	unsigned long *rmap = NULL;
 	unsigned long mmu_seq;
 	bool prereg = false;
 	struct kvmppc_spapr_tce_iommu_table *stit;
@@ -531,7 +527,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 */
 		struct mm_iommu_table_group_mem_t *mem;
 
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua, NULL))
+		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua))
 			return H_TOO_HARD;
 
 		mem = mm_iommu_lookup_rm(vcpu->kvm->mm, ua, IOMMU_PAGE_SIZE_4K);
@@ -547,23 +543,9 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 * We do not require memory to be preregistered in this case
 		 * so lock rmap and do __find_linux_pte_or_hugepte().
 		 */
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua, &rmap))
-			return H_TOO_HARD;
-
-		rmap = (void *) vmalloc_to_phys(rmap);
-		if (WARN_ON_ONCE_RM(!rmap))
+		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua))
 			return H_TOO_HARD;
 
-		/*
-		 * Synchronize with the MMU notifier callbacks in
-		 * book3s_64_mmu_hv.c (kvm_unmap_hva_range_hv etc.).
-		 * While we have the rmap lock, code running on other CPUs
-		 * cannot finish unmapping the host real page that backs
-		 * this guest real page, so we are OK to access the host
-		 * real page.
-		 */
-		lock_rmap(rmap);
-
 		arch_spin_lock(&kvm->mmu_lock.rlock.raw_lock);
 		if (kvmppc_rm_ua_to_hpa(vcpu, mmu_seq, ua, &tces)) {
 			ret = H_TOO_HARD;
@@ -583,7 +565,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		unsigned long tce = be64_to_cpu(((u64 *)tces)[i]);
 
 		ua = 0;
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua, NULL)) {
+		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
 			ret = H_PARAMETER;
 			goto invalidate_exit;
 		}
@@ -608,10 +590,8 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		iommu_tce_kill_rm(stit->tbl, entry, npages);
 
 unlock_exit:
-	if (rmap)
-		unlock_rmap(rmap);
-
-	arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
+	if (!prereg)
+		arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
 	return ret;
 }
 
-- 
2.24.1


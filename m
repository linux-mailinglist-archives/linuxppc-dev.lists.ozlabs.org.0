Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C41C4FC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 09:59:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXDW1z20zDqsC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:59:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWKk5j5CzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:18:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04571xXK154655; Tue, 5 May 2020 03:18:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4v7q02b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04575YEV165189;
 Tue, 5 May 2020 03:18:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4v7q024-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:26 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457HZGw027401;
 Tue, 5 May 2020 07:18:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 30s0g6cm58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:18:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457IO3918219434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:18:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9C71BE053;
 Tue,  5 May 2020 07:18:24 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4118EBE056;
 Tue,  5 May 2020 07:18:22 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:18:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 16/22] powerpc/kvm/book3s: Avoid using rmap to protect
 parallel page table update.
Date: Tue,  5 May 2020 12:47:23 +0530
Message-Id: <20200505071729.54912-17-aneesh.kumar@linux.ibm.com>
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
 suspectscore=8 adultscore=0 clxscore=1015 impostorscore=0
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We now depend on kvm->mmu_lock

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_vio_hv.c | 38 +++++++----------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index acc3ce570be7..167029e57c8f 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -74,8 +74,8 @@ struct kvmppc_spapr_tce_table *kvmppc_find_table(struct kvm *kvm,
 EXPORT_SYMBOL_GPL(kvmppc_find_table);
 
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-static long kvmppc_rm_tce_to_ua(struct kvm *kvm, unsigned long tce,
-		unsigned long *ua, unsigned long **prmap)
+static long kvmppc_rm_tce_to_ua(struct kvm *kvm,
+				unsigned long tce, unsigned long *ua)
 {
 	unsigned long gfn = tce >> PAGE_SHIFT;
 	struct kvm_memory_slot *memslot;
@@ -87,9 +87,6 @@ static long kvmppc_rm_tce_to_ua(struct kvm *kvm, unsigned long tce,
 	*ua = __gfn_to_hva_memslot(memslot, gfn) |
 		(tce & ~(PAGE_MASK | TCE_PCI_READ | TCE_PCI_WRITE));
 
-	if (prmap)
-		*prmap = &memslot->arch.rmap[gfn - memslot->base_gfn];
-
 	return 0;
 }
 
@@ -116,7 +113,7 @@ static long kvmppc_rm_tce_validate(struct kvmppc_spapr_tce_table *stt,
 	if (iommu_tce_check_gpa(stt->page_shift, gpa))
 		return H_PARAMETER;
 
-	if (kvmppc_rm_tce_to_ua(stt->kvm, tce, &ua, NULL))
+	if (kvmppc_rm_tce_to_ua(stt->kvm, tce, &ua))
 		return H_TOO_HARD;
 
 	list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -411,7 +408,7 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 		return ret;
 
 	dir = iommu_tce_direction(tce);
-	if ((dir != DMA_NONE) && kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua, NULL))
+	if ((dir != DMA_NONE) && kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua))
 		return H_PARAMETER;
 
 	entry = ioba >> stt->page_shift;
@@ -488,7 +485,6 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 	struct kvmppc_spapr_tce_table *stt;
 	long i, ret = H_SUCCESS;
 	unsigned long tces, entry, ua = 0;
-	unsigned long *rmap = NULL;
 	unsigned long mmu_seq;
 	bool prereg = false;
 	struct kvmppc_spapr_tce_iommu_table *stit;
@@ -530,7 +526,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 */
 		struct mm_iommu_table_group_mem_t *mem;
 
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua, NULL))
+		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce_list, &ua))
 			return H_TOO_HARD;
 
 		mem = mm_iommu_lookup_rm(vcpu->kvm->mm, ua, IOMMU_PAGE_SIZE_4K);
@@ -546,23 +542,9 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
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
@@ -582,7 +564,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		unsigned long tce = be64_to_cpu(((u64 *)tces)[i]);
 
 		ua = 0;
-		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua, NULL)) {
+		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
 			ret = H_PARAMETER;
 			goto invalidate_exit;
 		}
@@ -607,10 +589,8 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
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
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D64223697
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:07:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7NyB4PgQzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:07:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7Nq34Wq8zDrMJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:01:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H7Ym4Q173607; Fri, 17 Jul 2020 04:00:57 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1mey7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:00:56 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H7fWfu025905;
 Fri, 17 Jul 2020 08:00:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgx8ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 08:00:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H80jjo55247018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 08:00:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC2BA4059;
 Fri, 17 Jul 2020 08:00:44 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D897A407B;
 Fri, 17 Jul 2020 08:00:41 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.39.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 08:00:41 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [v4 1/5] KVM: PPC: Book3S HV: Disable page merging in H_SVM_INIT_START
Date: Fri, 17 Jul 2020 01:00:23 -0700
Message-Id: <1594972827-13928-2-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_04:2020-07-16,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=763
 suspectscore=2 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170054
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
Cc: ldufour@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Page-merging of pages in memory-slots associated with a Secure VM,
is disabled in H_SVM_PAGE_IN handler.

This operation should have been done much earlier; the moment the VM
is initiated for secure-transition. Delaying this operation, increases
the probability for those pages to acquire new references , making it
impossible to migrate those pages.

Disable page-migration in H_SVM_INIT_START handling.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 Documentation/powerpc/ultravisor.rst |  1 +
 arch/powerpc/kvm/book3s_hv_uvmem.c   | 98 +++++++++++++++++++++++++++---------
 2 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index df136c8..a1c8c37 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -895,6 +895,7 @@ Return values
     One of the following values:
 
 	* H_SUCCESS	 on success.
+        * H_STATE        if the VM is not in a position to switch to secure.
 
 Description
 ~~~~~~~~~~~
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e6f76bc..0baa293 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -211,6 +211,65 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 	return false;
 }
 
+static int kvmppc_memslot_page_merge(struct kvm *kvm,
+		struct kvm_memory_slot *memslot, bool merge)
+{
+	unsigned long gfn = memslot->base_gfn;
+	unsigned long end, start = gfn_to_hva(kvm, gfn);
+	int ret = 0;
+	struct vm_area_struct *vma;
+	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
+
+	if (kvm_is_error_hva(start))
+		return H_STATE;
+
+	end = start + (memslot->npages << PAGE_SHIFT);
+
+	mmap_write_lock(kvm->mm);
+	do {
+		vma = find_vma_intersection(kvm->mm, start, end);
+		if (!vma) {
+			ret = H_STATE;
+			break;
+		}
+		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
+			  merge_flag, &vma->vm_flags);
+		if (ret) {
+			ret = H_STATE;
+			break;
+		}
+		start = vma->vm_end + 1;
+	} while (end > vma->vm_end);
+
+	mmap_write_unlock(kvm->mm);
+	return ret;
+}
+
+static int __kvmppc_page_merge(struct kvm *kvm, bool merge)
+{
+	struct kvm_memslots *slots;
+	struct kvm_memory_slot *memslot;
+	int ret = 0;
+
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(memslot, slots) {
+		ret = kvmppc_memslot_page_merge(kvm, memslot, merge);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
+static inline int kvmppc_disable_page_merge(struct kvm *kvm)
+{
+	return __kvmppc_page_merge(kvm, false);
+}
+
+static inline int kvmppc_enable_page_merge(struct kvm *kvm)
+{
+	return __kvmppc_page_merge(kvm, true);
+}
+
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
@@ -232,11 +291,18 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 		return H_AUTHORITY;
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
+
+	/* disable page-merging for all memslot */
+	ret = kvmppc_disable_page_merge(kvm);
+	if (ret)
+		goto out;
+
+	/* register the memslot */
 	slots = kvm_memslots(kvm);
 	kvm_for_each_memslot(memslot, slots) {
 		if (kvmppc_uvmem_slot_init(kvm, memslot)) {
 			ret = H_PARAMETER;
-			goto out;
+			break;
 		}
 		ret = uv_register_mem_slot(kvm->arch.lpid,
 					   memslot->base_gfn << PAGE_SHIFT,
@@ -245,9 +311,12 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 		if (ret < 0) {
 			kvmppc_uvmem_slot_free(kvm, memslot);
 			ret = H_PARAMETER;
-			goto out;
+			break;
 		}
 	}
+
+	if (ret)
+		kvmppc_enable_page_merge(kvm);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return ret;
@@ -384,7 +453,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  */
 static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 		   unsigned long end, unsigned long gpa, struct kvm *kvm,
-		   unsigned long page_shift, bool *downgrade)
+		   unsigned long page_shift)
 {
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
@@ -400,18 +469,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
 
-	/*
-	 * We come here with mmap_lock write lock held just for
-	 * ksm_madvise(), otherwise we only need read mmap_lock.
-	 * Hence downgrade to read lock once ksm_madvise() is done.
-	 */
-	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-			  MADV_UNMERGEABLE, &vma->vm_flags);
-	mmap_write_downgrade(kvm->mm);
-	*downgrade = true;
-	if (ret)
-		return ret;
-
 	ret = migrate_vma_setup(&mig);
 	if (ret)
 		return ret;
@@ -503,7 +560,6 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 		unsigned long flags,
 		unsigned long page_shift)
 {
-	bool downgrade = false;
 	unsigned long start, end;
 	struct vm_area_struct *vma;
 	int srcu_idx;
@@ -524,7 +580,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 
 	ret = H_PARAMETER;
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	mmap_write_lock(kvm->mm);
+	mmap_read_lock(kvm->mm);
 
 	start = gfn_to_hva(kvm, gfn);
 	if (kvm_is_error_hva(start))
@@ -540,16 +596,12 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out_unlock;
 
-	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
-				&downgrade))
+	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift))
 		ret = H_SUCCESS;
 out_unlock:
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
-	if (downgrade)
-		mmap_read_unlock(kvm->mm);
-	else
-		mmap_write_unlock(kvm->mm);
+	mmap_read_unlock(kvm->mm);
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return ret;
 }
-- 
1.8.3.1


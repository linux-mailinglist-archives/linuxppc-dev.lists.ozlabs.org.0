Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAAF201E3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 00:51:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pYvp6mvpzDrTY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 08:51:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pYlH6pWtzDrTP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 08:44:27 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JMWKYq153124; Fri, 19 Jun 2020 18:44:19 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31s0pag6ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 18:44:19 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JMZ3Cm018174;
 Fri, 19 Jun 2020 22:44:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 31r1kq19cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 22:44:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JMiEpJ50331734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 22:44:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50B3FAE085;
 Fri, 19 Jun 2020 22:44:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC1C3AE086;
 Fri, 19 Jun 2020 22:44:10 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.71.42])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 22:44:10 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] KVM: PPC: Book3S HV: migrate remaining normal-GFNs to
 secure-GFNs in H_SVM_INIT_DONE
Date: Fri, 19 Jun 2020 15:43:41 -0700
Message-Id: <1592606622-29884-4-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1592606622-29884-1-git-send-email-linuxram@us.ibm.com>
References: <1592606622-29884-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_22:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2
 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 cotscore=-2147483648 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190155
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

H_SVM_INIT_DONE incorrectly assumes that the Ultravisor has explicitly
called H_SVM_PAGE_IN for all secure pages. These GFNs continue to be
normal GFNs associated with normal PFNs; when infact, these GFNs should
have been secure GFNs, associated with device PFNs.

Move all the PFNs associated with the SVM's GFNs, to secure-PFNs, in
H_SVM_INIT_DONE. Skip the GFNs that are already Paged-in or Shared
through H_SVM_PAGE_IN, or Paged-in followed by a Paged-out through
UV_PAGE_OUT.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 Documentation/powerpc/ultravisor.rst        |   2 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |   2 +
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 154 +++++++++++++++++++++++-----
 3 files changed, 132 insertions(+), 26 deletions(-)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index 363736d..3bc8957 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -933,6 +933,8 @@ Return values
 	* H_UNSUPPORTED		if called from the wrong context (e.g.
 				from an SVM or before an H_SVM_INIT_START
 				hypercall).
+	* H_STATE		if the hypervisor could not successfully
+                                transition the VM to Secure VM.
 
 Description
 ~~~~~~~~~~~
diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index 5a9834e..b9cd7eb 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -22,6 +22,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 			     struct kvm *kvm, bool skip_page_out);
+int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
+			const struct kvm_memory_slot *memslot);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index c8c0290..449e8a7 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -93,6 +93,7 @@
 #include <asm/ultravisor.h>
 #include <asm/mman.h>
 #include <asm/kvm_ppc.h>
+#include <asm/kvm_book3s_uvmem.h>
 
 static struct dev_pagemap kvmppc_uvmem_pgmap;
 static unsigned long *kvmppc_uvmem_bitmap;
@@ -339,6 +340,21 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 	return false;
 }
 
+/* return true, if the GFN is a shared-GFN, or a secure-GFN */
+bool kvmppc_gfn_has_transitioned(unsigned long gfn, struct kvm *kvm)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			unsigned long index = gfn - p->base_pfn;
+
+			return (p->pfns[index] & KVMPPC_GFN_FLAG_MASK);
+		}
+	}
+	return false;
+}
+
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
@@ -379,12 +395,31 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 {
+	struct kvm_memslots *slots;
+	struct kvm_memory_slot *memslot;
+	int srcu_idx;
+	long ret = H_SUCCESS;
+
 	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
 		return H_UNSUPPORTED;
 
+	/* migrate any unmoved normal pfn to device pfns*/
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(memslot, slots) {
+		ret = kvmppc_uv_migrate_mem_slot(kvm, memslot);
+		if (ret) {
+			ret = H_STATE;
+			goto out;
+		}
+	}
+
 	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
 	pr_info("LPID %d went secure\n", kvm->arch.lpid);
-	return H_SUCCESS;
+
+out:
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	return ret;
 }
 
 /*
@@ -505,12 +540,14 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 }
 
 /*
- * Alloc a PFN from private device memory pool and copy page from normal
- * memory to secure memory using UV_PAGE_IN uvcall.
+ * Alloc a PFN from private device memory pool. If @pagein is true,
+ * copy page from normal memory to secure memory using UV_PAGE_IN uvcall.
  */
-static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
-		   unsigned long end, unsigned long gpa, struct kvm *kvm,
-		   unsigned long page_shift, bool *downgrade)
+static int kvmppc_svm_migrate_page(struct vm_area_struct *vma,
+		unsigned long start,
+		unsigned long end, unsigned long gpa, struct kvm *kvm,
+		unsigned long page_shift,
+		bool pagein)
 {
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
@@ -526,18 +563,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
 
-	/*
-	 * We come here with mmap_sem write lock held just for
-	 * ksm_madvise(), otherwise we only need read mmap_sem.
-	 * Hence downgrade to read lock once ksm_madvise() is done.
-	 */
-	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
-			  MADV_UNMERGEABLE, &vma->vm_flags);
-	downgrade_write(&kvm->mm->mmap_sem);
-	*downgrade = true;
-	if (ret)
-		return ret;
-
 	ret = migrate_vma_setup(&mig);
 	if (ret)
 		return ret;
@@ -553,11 +578,16 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 		goto out_finalize;
 	}
 
-	pfn = *mig.src >> MIGRATE_PFN_SHIFT;
-	spage = migrate_pfn_to_page(*mig.src);
-	if (spage)
-		uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
-			   page_shift);
+	if (pagein) {
+		pfn = *mig.src >> MIGRATE_PFN_SHIFT;
+		spage = migrate_pfn_to_page(*mig.src);
+		if (spage) {
+			ret = uv_page_in(kvm->arch.lpid, pfn << page_shift,
+					gpa, 0, page_shift);
+			if (ret)
+				goto out_finalize;
+		}
+	}
 
 	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 	migrate_vma_pages(&mig);
@@ -566,6 +596,66 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	return ret;
 }
 
+int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
+		const struct kvm_memory_slot *memslot)
+{
+	unsigned long gfn = memslot->base_gfn;
+	unsigned long end;
+	bool downgrade = false;
+	struct vm_area_struct *vma;
+	int i, ret = 0;
+	unsigned long start = gfn_to_hva(kvm, gfn);
+
+	if (kvm_is_error_hva(start))
+		return H_STATE;
+
+	end = start + (memslot->npages << PAGE_SHIFT);
+
+	down_write(&kvm->mm->mmap_sem);
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end) {
+		ret = H_STATE;
+		goto out_unlock;
+	}
+
+	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
+			  MADV_UNMERGEABLE, &vma->vm_flags);
+	downgrade_write(&kvm->mm->mmap_sem);
+	downgrade = true;
+	if (ret) {
+		ret = H_STATE;
+		goto out_unlock;
+	}
+
+	for (i = 0; i < memslot->npages; i++, ++gfn) {
+		/*
+		 * skip GFNs that have already tranistioned.
+		 * paged-in GFNs, shared GFNs, paged-in GFNs
+		 * that were later paged-out.
+		 */
+		if (kvmppc_gfn_has_transitioned(gfn, kvm))
+			continue;
+
+		start = gfn_to_hva(kvm, gfn);
+		end = start + (1UL << PAGE_SHIFT);
+		ret = kvmppc_svm_migrate_page(vma, start, end,
+			(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
+
+		if (ret)
+			goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&kvm->arch.uvmem_lock);
+	if (downgrade)
+		up_read(&kvm->mm->mmap_sem);
+	else
+		up_write(&kvm->mm->mmap_sem);
+	return ret;
+}
+
 /*
  * Shares the page with HV, thus making it a normal page.
  *
@@ -671,9 +761,21 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out_unlock;
 
-	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
-				&downgrade))
-		ret = H_SUCCESS;
+	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
+			  MADV_UNMERGEABLE, &vma->vm_flags);
+	downgrade_write(&kvm->mm->mmap_sem);
+	downgrade = true;
+	if (ret) {
+		ret = H_PARAMETER;
+		goto out_unlock;
+	}
+
+	ret = H_PARAMETER;
+	if (kvmppc_svm_migrate_page(vma, start, end, gpa, kvm, page_shift,
+				true))
+		goto out_unlock;
+
+	ret = H_SUCCESS;
 
 out_unlock:
 	mutex_unlock(&kvm->arch.uvmem_lock);
-- 
1.8.3.1


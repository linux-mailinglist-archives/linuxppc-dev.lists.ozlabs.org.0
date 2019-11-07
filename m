Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5618F357C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 18:12:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47891s664vzF6XL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 04:12:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4788qc6LfpzF6NZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2019 04:03:24 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA7GsEfp042405; Thu, 7 Nov 2019 12:03:15 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w4pgdjdh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2019 12:03:13 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA7H1cNu006927;
 Thu, 7 Nov 2019 17:03:09 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2w41uka623-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2019 17:03:09 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA7H35GY43712900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Nov 2019 17:03:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58153AE060;
 Thu,  7 Nov 2019 17:03:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4353BAE05C;
 Thu,  7 Nov 2019 17:03:04 +0000 (GMT)
Received: from LeoBras.br.ibm.com (unknown [9.18.235.40])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Nov 2019 17:03:04 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] powerpc/kvm/book3s: Replace current->mm by kvm->mm
Date: Thu,  7 Nov 2019 14:02:56 -0300
Message-Id: <20191107170258.36379-3-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107170258.36379-1-leonardo@linux.ibm.com>
References: <20191107170258.36379-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=665 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911070159
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Given that in kvm_create_vm() there is:
kvm->mm = current->mm;

And that on every kvm_*_ioctl we have:
if (kvm->mm != current->mm)
	return -EIO;

I see no reason to keep using current->mm instead of kvm->mm.

By doing so, we would reduce the use of 'global' variables on code, relying
more in the contents of kvm struct.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 10 +++++-----
 arch/powerpc/kvm/book3s_64_vio.c    | 10 ++++++----
 arch/powerpc/kvm/book3s_hv.c        | 10 +++++-----
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 9a75f0e1933b..43b3cdf011bd 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -296,7 +296,7 @@ static long kvmppc_virtmode_do_h_enter(struct kvm *kvm, unsigned long flags,
 	/* Protect linux PTE lookup from page table destruction */
 	rcu_read_lock_sched();	/* this disables preemption too */
 	ret = kvmppc_do_h_enter(kvm, flags, pte_index, pteh, ptel,
-				current->mm->pgd, false, pte_idx_ret);
+				kvm->mm->pgd, false, pte_idx_ret);
 	rcu_read_unlock_sched();
 	if (ret == H_TOO_HARD) {
 		/* this can't happen */
@@ -592,8 +592,8 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	npages = get_user_pages_fast(hva, 1, writing ? FOLL_WRITE : 0, pages);
 	if (npages < 1) {
 		/* Check if it's an I/O mapping */
-		down_read(&current->mm->mmap_sem);
-		vma = find_vma(current->mm, hva);
+		down_read(&kvm->mm->mmap_sem);
+		vma = find_vma(kvm->mm, hva);
 		if (vma && vma->vm_start <= hva && hva + psize <= vma->vm_end &&
 		    (vma->vm_flags & VM_PFNMAP)) {
 			pfn = vma->vm_pgoff +
@@ -602,7 +602,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			is_ci = pte_ci(__pte((pgprot_val(vma->vm_page_prot))));
 			write_ok = vma->vm_flags & VM_WRITE;
 		}
-		up_read(&current->mm->mmap_sem);
+		up_read(&kvm->mm->mmap_sem);
 		if (!pfn)
 			goto out_put;
 	} else {
@@ -621,7 +621,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 			 * hugepage split and collapse.
 			 */
 			local_irq_save(flags);
-			ptep = find_current_mm_pte(current->mm->pgd,
+			ptep = find_current_mm_pte(kvm->mm->pgd,
 						   hva, NULL, NULL);
 			if (ptep) {
 				pte = kvmppc_read_update_linux_pte(ptep, 1);
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index a402ead833b6..308aa3a639a5 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -253,10 +253,11 @@ static int kvm_spapr_tce_release(struct inode *inode, struct file *filp)
 		}
 	}
 
+	account_locked_vm(kvm->mm,
+		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
+
 	kvm_put_kvm(stt->kvm);
 
-	account_locked_vm(current->mm,
-		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
 	call_rcu(&stt->rcu, release_spapr_tce_table);
 
 	return 0;
@@ -272,6 +273,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 {
 	struct kvmppc_spapr_tce_table *stt = NULL;
 	struct kvmppc_spapr_tce_table *siter;
+	struct mm_struct *mm = kvm->mm;
 	unsigned long npages, size = args->size;
 	int ret = -ENOMEM;
 
@@ -280,7 +282,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		return -EINVAL;
 
 	npages = kvmppc_tce_pages(size);
-	ret = account_locked_vm(current->mm, kvmppc_stt_pages(npages), true);
+	ret = account_locked_vm(mm, kvmppc_stt_pages(npages), true);
 	if (ret)
 		return ret;
 
@@ -325,7 +327,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 	kvm_put_kvm(kvm);
 	kfree(stt);
  fail_acct:
-	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
+	account_locked_vm(mm, kvmppc_stt_pages(npages), false);
 	return ret;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 709cf1fd4cf4..679008c511e4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4280,7 +4280,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	user_vrsave = mfspr(SPRN_VRSAVE);
 
 	vcpu->arch.wqp = &vcpu->arch.vcore->wq;
-	vcpu->arch.pgdir = current->mm->pgd;
+	vcpu->arch.pgdir = kvm->mm->pgd;
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
@@ -4612,14 +4612,14 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 
 	/* Look up the VMA for the start of this memory slot */
 	hva = memslot->userspace_addr;
-	down_read(&current->mm->mmap_sem);
-	vma = find_vma(current->mm, hva);
+	down_read(&kvm->mm->mmap_sem);
+	vma = find_vma(kvm->mm, hva);
 	if (!vma || vma->vm_start > hva || (vma->vm_flags & VM_IO))
 		goto up_out;
 
 	psize = vma_kernel_pagesize(vma);
 
-	up_read(&current->mm->mmap_sem);
+	up_read(&kvm->mm->mmap_sem);
 
 	/* We can handle 4k, 64k or 16M pages in the VRMA */
 	if (psize >= 0x1000000)
@@ -4652,7 +4652,7 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 	return err;
 
  up_out:
-	up_read(&current->mm->mmap_sem);
+	up_read(&kvm->mm->mmap_sem);
 	goto out_srcu;
 }
 
-- 
2.23.0


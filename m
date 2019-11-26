Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A26410A6B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 23:41:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MzQf3gh7zDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 09:41:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MzKd6H7PzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 09:36:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQMX3Ea055152; Tue, 26 Nov 2019 17:36:46 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whcxng341-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:36:45 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQMYwEZ009446;
 Tue, 26 Nov 2019 22:36:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2wevd679pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 22:36:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQMaijY45220286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 22:36:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E04FFAC05B;
 Tue, 26 Nov 2019 22:36:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C342FAC059;
 Tue, 26 Nov 2019 22:36:43 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.137])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 26 Nov 2019 22:36:43 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 1/2] powerpc/kvm/book3s: Replace current->mm by kvm->mm
Date: Tue, 26 Nov 2019 19:36:30 -0300
Message-Id: <20191126223631.389779-2-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126223631.389779-1-leonardo@linux.ibm.com>
References: <20191126223631.389779-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_07:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=873 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911260191
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
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
 arch/powerpc/kvm/book3s_64_mmu_hv.c |  4 ++--
 arch/powerpc/kvm/book3s_64_vio.c    | 10 ++++++----
 arch/powerpc/kvm/book3s_hv.c        | 10 +++++-----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index d381526c5c9b..6c372f5c61b6 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -284,7 +284,7 @@ static long kvmppc_virtmode_do_h_enter(struct kvm *kvm, unsigned long flags,
 	/* Protect linux PTE lookup from page table destruction */
 	rcu_read_lock_sched();	/* this disables preemption too */
 	ret = kvmppc_do_h_enter(kvm, flags, pte_index, pteh, ptel,
-				current->mm->pgd, false, pte_idx_ret);
+				kvm->mm->pgd, false, pte_idx_ret);
 	rcu_read_unlock_sched();
 	if (ret == H_TOO_HARD) {
 		/* this can't happen */
@@ -573,7 +573,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	is_ci = false;
 	pfn = 0;
 	page = NULL;
-	mm = current->mm;
+	mm = kvm->mm;
 	pte_size = PAGE_SIZE;
 	writing = (dsisr & DSISR_ISSTORE) != 0;
 	/* If writing != 0, then the HPTE must allow writing, if we get here */
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 883a66e76638..ee6c103bb7d5 100644
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
 
@@ -326,7 +328,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 
 	kfree(stt);
  fail_acct:
-	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
+	account_locked_vm(mm, kvmppc_stt_pages(npages), false);
 	return ret;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ec5c0379296a..d3baa23396e6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4263,7 +4263,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	user_vrsave = mfspr(SPRN_VRSAVE);
 
 	vcpu->arch.wqp = &vcpu->arch.vcore->wq;
-	vcpu->arch.pgdir = current->mm->pgd;
+	vcpu->arch.pgdir = kvm->mm->pgd;
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
@@ -4595,14 +4595,14 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 
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
@@ -4635,7 +4635,7 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 	return err;
 
  up_out:
-	up_read(&current->mm->mmap_sem);
+	up_read(&kvm->mm->mmap_sem);
 	goto out_srcu;
 }
 
-- 
2.23.0


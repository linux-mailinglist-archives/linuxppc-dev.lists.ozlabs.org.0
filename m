Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B7BBBCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 20:48:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cYH94nyxzDqG9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 04:48:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cYBT4MvBzDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 04:44:01 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8NIbV51084128; Mon, 23 Sep 2019 14:43:56 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v71cdvhr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 14:43:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8NIf3Gu009091;
 Mon, 23 Sep 2019 18:43:55 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2v5bg7375v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 18:43:54 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8NIhsP449611114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 18:43:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 332B2112062;
 Mon, 23 Sep 2019 18:43:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F185112061;
 Mon, 23 Sep 2019 18:43:53 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.184])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 18:43:53 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] powerpc/kvm/book3s: Replace current->mm by kvm->mm
Date: Mon, 23 Sep 2019 15:43:30 -0300
Message-Id: <20190923184332.412-2-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923184332.412-1-leonardo@linux.ibm.com>
References: <20190923184332.412-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=917 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230160
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
 arch/powerpc/kvm/book3s_64_mmu_hv.c |  4 ++--
 arch/powerpc/kvm/book3s_64_vio.c    |  6 +++---
 arch/powerpc/kvm/book3s_hv.c        | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index f2b9aea43216..2f23cbc6c23e 100644
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
@@ -585,7 +585,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
 	is_ci = false;
 	pfn = 0;
 	page = NULL;
-	mm = current->mm;
+	mm = kvm->mm;
 	pte_size = PAGE_SIZE;
 	writing = (dsisr & DSISR_ISSTORE) != 0;
 	/* If writing != 0, then the HPTE must allow writing, if we get here */
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index c4b606fe73eb..8069b35f2905 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -255,7 +255,7 @@ static int kvm_spapr_tce_release(struct inode *inode, struct file *filp)
 
 	kvm_put_kvm(stt->kvm);
 
-	account_locked_vm(current->mm,
+	account_locked_vm(kvm->mm,
 		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
 	call_rcu(&stt->rcu, release_spapr_tce_table);
 
@@ -280,7 +280,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		return -EINVAL;
 
 	npages = kvmppc_tce_pages(size);
-	ret = account_locked_vm(current->mm, kvmppc_stt_pages(npages), true);
+	ret = account_locked_vm(kvm->mm, kvmppc_stt_pages(npages), true);
 	if (ret)
 		return ret;
 
@@ -326,7 +326,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 
 	kfree(stt);
  fail_acct:
-	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
+	account_locked_vm(kvm->mm, kvmppc_stt_pages(npages), false);
 	return ret;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cde3f5a4b3e4..c5b6081b6de0 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4265,7 +4265,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_run *run, struct kvm_vcpu *vcpu)
 	user_vrsave = mfspr(SPRN_VRSAVE);
 
 	vcpu->arch.wqp = &vcpu->arch.vcore->wq;
-	vcpu->arch.pgdir = current->mm->pgd;
+	vcpu->arch.pgdir = kvm->mm->pgd;
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
@@ -4597,14 +4597,14 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 
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
@@ -4637,7 +4637,7 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
 	return err;
 
  up_out:
-	up_read(&current->mm->mmap_sem);
+	up_read(&kvm->mm->mmap_sem);
 	goto out_srcu;
 }
 
-- 
2.20.1


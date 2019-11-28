Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0710C35B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 06:06:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Nlwf05f0zDqBP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:06:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NltM31khzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 16:04:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAS50bmm020219
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 00:04:21 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxrm8eh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 00:04:21 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 28 Nov 2019 05:04:19 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Nov 2019 05:04:17 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAS53agB30736702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Nov 2019 05:03:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 579EBA4062;
 Thu, 28 Nov 2019 05:04:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E6A5A4065;
 Thu, 28 Nov 2019 05:04:13 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.59.121])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Nov 2019 05:04:13 +0000 (GMT)
Date: Thu, 28 Nov 2019 10:34:11 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v11 0/7] KVM: PPC: Driver to manage pages of secure guest
References: <20191125030631.7716-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125030631.7716-1-bharata@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19112805-0028-0000-0000-000003C0F216
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112805-0029-0000-0000-00002483FB30
Message-Id: <20191128050411.GF23438@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_07:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280042
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
Reply-To: bharata@linux.ibm.com
Cc: Hugh Dickins <hughd@google.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 25, 2019 at 08:36:24AM +0530, Bharata B Rao wrote:
> Hi,
> 
> This is the next version of the patchset that adds required support
> in the KVM hypervisor to run secure guests on PEF-enabled POWER platforms.
> 

Here is a fix for the issue Hugh identified with the usage of ksm_madvise()
in this patchset. It applies on top of this patchset.
----

From 8a4d769bf4c61f921c79ce68923be3c403bd5862 Mon Sep 17 00:00:00 2001
From: Bharata B Rao <bharata@linux.ibm.com>
Date: Thu, 28 Nov 2019 09:31:54 +0530
Subject: [PATCH 1/1] KVM: PPC: Book3S HV: Take write mmap_sem when calling
 ksm_madvise

In order to prevent the device private pages (that correspond to
pages of secure guest) from participating in KSM merging, H_SVM_PAGE_IN
calls ksm_madvise() under read version of mmap_sem. However ksm_madvise()
needs to be under write lock, fix this.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index f24ac3cfb34c..2de264fc3156 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -46,11 +46,10 @@
  *
  * Locking order
  *
- * 1. srcu_read_lock(&kvm->srcu) - Protects KVM memslots
- * 2. down_read(&kvm->mm->mmap_sem) - find_vma, migrate_vma_pages and helpers
- * 3. mutex_lock(&kvm->arch.uvmem_lock) - protects read/writes to uvmem slots
- *					  thus acting as sync-points
- *					  for page-in/out
+ * 1. kvm->srcu - Protects KVM memslots
+ * 2. kvm->mm->mmap_sem - find_vma, migrate_vma_pages and helpers, ksm_madvise
+ * 3. kvm->arch.uvmem_lock - protects read/writes to uvmem slots thus acting
+ *			     as sync-points for page-in/out
  */
 
 /*
@@ -344,7 +343,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 static int
 kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 		   unsigned long end, unsigned long gpa, struct kvm *kvm,
-		   unsigned long page_shift)
+		   unsigned long page_shift, bool *downgrade)
 {
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
@@ -360,8 +359,15 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
 
+	/*
+	 * We come here with mmap_sem write lock held just for
+	 * ksm_madvise(), otherwise we only need read mmap_sem.
+	 * Hence downgrade to read lock once ksm_madvise() is done.
+	 */
 	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
 			  MADV_UNMERGEABLE, &vma->vm_flags);
+	downgrade_write(&kvm->mm->mmap_sem);
+	*downgrade = true;
 	if (ret)
 		return ret;
 
@@ -456,6 +462,7 @@ unsigned long
 kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 		     unsigned long flags, unsigned long page_shift)
 {
+	bool downgrade = false;
 	unsigned long start, end;
 	struct vm_area_struct *vma;
 	int srcu_idx;
@@ -476,7 +483,7 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 
 	ret = H_PARAMETER;
 	srcu_idx = srcu_read_lock(&kvm->srcu);
-	down_read(&kvm->mm->mmap_sem);
+	down_write(&kvm->mm->mmap_sem);
 
 	start = gfn_to_hva(kvm, gfn);
 	if (kvm_is_error_hva(start))
@@ -492,12 +499,16 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out_unlock;
 
-	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift))
+	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
+				&downgrade))
 		ret = H_SUCCESS;
 out_unlock:
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
-	up_read(&kvm->mm->mmap_sem);
+	if (downgrade)
+		up_read(&kvm->mm->mmap_sem);
+	else
+		up_write(&kvm->mm->mmap_sem);
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return ret;
 }
-- 
2.21.0


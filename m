Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776022F915
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 21:32:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFqgy35dVzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 05:32:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFqYS6MFPzF1dp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 05:26:36 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RJFHo6179490; Mon, 27 Jul 2020 15:26:30 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1c7bc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 15:26:30 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RJLWOk011848;
 Mon, 27 Jul 2020 19:26:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 32gcye9hpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 19:26:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RJQPcC32964866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 19:26:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC9514C040;
 Mon, 27 Jul 2020 19:26:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E060B4C044;
 Mon, 27 Jul 2020 19:26:21 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.163.69.7])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 19:26:21 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] KVM: PPC: Book3S HV: rework secure mem slot dropping
Date: Mon, 27 Jul 2020 12:24:29 -0700
Message-Id: <1595877869-2746-3-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595877869-2746-1-git-send-email-linuxram@us.ibm.com>
References: <1595877869-2746-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_13:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=2 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=815 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270129
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

From: Laurent Dufour <ldufour@linux.ibm.com>

When a secure memslot is dropped, all the pages backed in the secure
device (aka really backed by secure memory by the Ultravisor)
should be paged out to a normal page. Previously, this was
achieved by triggering the page fault mechanism which is calling
kvmppc_svm_page_out() on each pages.

This can't work when hot unplugging a memory slot because the memory
slot is flagged as invalid and gfn_to_pfn() is then not trying to access
the page, so the page fault mechanism is not triggered.

Since the final goal is to make a call to kvmppc_svm_page_out() it seems
simpler to call directly instead of triggering such a mechanism. This
way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
memslot.

Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
the call to __kvmppc_svm_page_out() is made.  As
__kvmppc_svm_page_out needs the vma pointer to migrate the pages,
the VMA is fetched in a lazy way, to not trigger find_vma() all
the time. In addition, the mmap_sem is held in read mode during
that time, not in write mode since the virual memory layout is not
impacted, and kvm->arch.uvmem_lock prevents concurrent operation
on the secure device.

Cc: Ram Pai <linuxram@us.ibm.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>
Cc: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
	[modified the changelog description]
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
        [modified check on the VMA in kvmppc_uvmem_drop_pages]
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 52 +++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 565f24b..0d49e34 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -594,35 +594,53 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
  * fault on them, do fault time migration to replace the device PTEs in
  * QEMU page table with normal PTEs from newly allocated pages.
  */
-void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
+void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 			     struct kvm *kvm, bool skip_page_out)
 {
 	int i;
 	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn, uvmem_pfn;
-	unsigned long gfn = free->base_gfn;
+	struct page *uvmem_page;
+	struct vm_area_struct *vma = NULL;
+	unsigned long uvmem_pfn, gfn;
+	unsigned long addr;
+
+	mmap_read_lock(kvm->mm);
+
+	addr = slot->userspace_addr;
 
-	for (i = free->npages; i; --i, ++gfn) {
-		struct page *uvmem_page;
+	gfn = slot->base_gfn;
+	for (i = slot->npages; i; --i, ++gfn, addr += PAGE_SIZE) {
+
+		/* Fetch the VMA if addr is not in the latest fetched one */
+		if (!vma || addr >= vma->vm_end) {
+			vma = find_vma_intersection(kvm->mm, addr, addr+1);
+			if (!vma) {
+				pr_err("Can't find VMA for gfn:0x%lx\n", gfn);
+				break;
+			}
+		}
 
 		mutex_lock(&kvm->arch.uvmem_lock);
-		if (!kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+
+		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+			uvmem_page = pfn_to_page(uvmem_pfn);
+			pvt = uvmem_page->zone_device_data;
+			pvt->skip_page_out = skip_page_out;
+			pvt->remove_gfn = true;
+
+			if (__kvmppc_svm_page_out(vma, addr, addr + PAGE_SIZE,
+						  PAGE_SHIFT, kvm, pvt->gpa))
+				pr_err("Can't page out gpa:0x%lx addr:0x%lx\n",
+				       pvt->gpa, addr);
+		} else {
+			/* Remove the shared flag if any */
 			kvmppc_gfn_remove(gfn, kvm);
-			mutex_unlock(&kvm->arch.uvmem_lock);
-			continue;
 		}
 
-		uvmem_page = pfn_to_page(uvmem_pfn);
-		pvt = uvmem_page->zone_device_data;
-		pvt->skip_page_out = skip_page_out;
-		pvt->remove_gfn = true;
 		mutex_unlock(&kvm->arch.uvmem_lock);
-
-		pfn = gfn_to_pfn(kvm, gfn);
-		if (is_error_noslot_pfn(pfn))
-			continue;
-		kvm_release_pfn_clean(pfn);
 	}
+
+	mmap_read_unlock(kvm->mm);
 }
 
 unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
-- 
1.8.3.1


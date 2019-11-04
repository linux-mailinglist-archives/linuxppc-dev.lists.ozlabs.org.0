Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C127ED83B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:26:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47609h6mKFzDqvj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600H42QlzF3qs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA44E3s1023901
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 3 Nov 2019 23:18:20 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w27g37xj5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:18:20 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 4 Nov 2019 04:18:18 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 04:18:15 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA44Hc0h34144608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 04:17:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78ED952050;
 Mon,  4 Nov 2019 04:18:13 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A2E545204E;
 Mon,  4 Nov 2019 04:18:11 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v10 3/8] KVM: PPC: Shared pages support for secure guests
Date: Mon,  4 Nov 2019 09:47:55 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104041800.24527-1-bharata@linux.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110404-0028-0000-0000-000003B25DA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110404-0029-0000-0000-00002474AF6A
Message-Id: <20191104041800.24527-4-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-04_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911040039
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 Bharata B Rao <bharata@linux.ibm.com>, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A secure guest will share some of its pages with hypervisor (Eg. virtio
bounce buffers etc). Support sharing of pages between hypervisor and
ultravisor.

Shared page is reachable via both HV and UV side page tables. Once a
secure page is converted to shared page, the device page that represents
the secure page is unmapped from the HV side page tables.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h  |  3 ++
 arch/powerpc/kvm/book3s_hv_uvmem.c | 85 ++++++++++++++++++++++++++++--
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 4150732c81a0..13bd870609c3 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -342,6 +342,9 @@
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
 
+/* Flags for H_SVM_PAGE_IN */
+#define H_PAGE_IN_SHARED        0x1
+
 /* Platform-specific hcalls used by the Ultravisor */
 #define H_SVM_PAGE_IN		0xEF00
 #define H_SVM_PAGE_OUT		0xEF04
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index fe456fd07c74..d9395a23b10d 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -19,7 +19,10 @@
  * available in the platform for running secure guests is hotplugged.
  * Whenever a page belonging to the guest becomes secure, a page from this
  * private device memory is used to represent and track that secure page
- * on the HV side.
+ * on the HV side. Some pages (like virtio buffers, VPA pages etc) are
+ * shared between UV and HV. However such pages aren't represented by
+ * device private memory and mappings to shared memory exist in both
+ * UV and HV page tables.
  */
 
 /*
@@ -64,6 +67,9 @@
  * UV splits and remaps the 2MB page if necessary and copies out the
  * required 64K page contents.
  *
+ * Shared pages: Whenever guest shares a secure page, UV will split and
+ * remap the 2MB page if required and issue H_SVM_PAGE_IN with 64K page size.
+ *
  * In summary, the current secure pages handling code in HV assumes
  * 64K page size and in fact fails any page-in/page-out requests of
  * non-64K size upfront. If and when UV starts supporting multiple
@@ -93,6 +99,7 @@ struct kvmppc_uvmem_slot {
 struct kvmppc_uvmem_page_pvt {
 	struct kvm *kvm;
 	unsigned long gpa;
+	bool skip_page_out;
 };
 
 int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
@@ -329,8 +336,64 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	return ret;
 }
 
+/*
+ * Shares the page with HV, thus making it a normal page.
+ *
+ * - If the page is already secure, then provision a new page and share
+ * - If the page is a normal page, share the existing page
+ *
+ * In the former case, uses dev_pagemap_ops.migrate_to_ram handler
+ * to unmap the device page from QEMU's page tables.
+ */
+static unsigned long
+kvmppc_share_page(struct kvm *kvm, unsigned long gpa, unsigned long page_shift)
+{
+
+	int ret = H_PARAMETER;
+	struct page *uvmem_page;
+	struct kvmppc_uvmem_page_pvt *pvt;
+	unsigned long pfn;
+	unsigned long gfn = gpa >> page_shift;
+	int srcu_idx;
+	unsigned long uvmem_pfn;
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	mutex_lock(&kvm->arch.uvmem_lock);
+	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+		uvmem_page = pfn_to_page(uvmem_pfn);
+		pvt = uvmem_page->zone_device_data;
+		pvt->skip_page_out = true;
+	}
+
+retry:
+	mutex_unlock(&kvm->arch.uvmem_lock);
+	pfn = gfn_to_pfn(kvm, gfn);
+	if (is_error_noslot_pfn(pfn))
+		goto out;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+		uvmem_page = pfn_to_page(uvmem_pfn);
+		pvt = uvmem_page->zone_device_data;
+		pvt->skip_page_out = true;
+		kvm_release_pfn_clean(pfn);
+		goto retry;
+	}
+
+	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0, page_shift))
+		ret = H_SUCCESS;
+	kvm_release_pfn_clean(pfn);
+	mutex_unlock(&kvm->arch.uvmem_lock);
+out:
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	return ret;
+}
+
 /*
  * H_SVM_PAGE_IN: Move page from normal memory to secure memory.
+ *
+ * H_PAGE_IN_SHARED flag makes the page shared which means that the same
+ * memory in is visible from both UV and HV.
  */
 unsigned long
 kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
@@ -345,9 +408,12 @@ kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (page_shift != PAGE_SHIFT)
 		return H_P3;
 
-	if (flags)
+	if (flags & ~H_PAGE_IN_SHARED)
 		return H_P2;
 
+	if (flags & H_PAGE_IN_SHARED)
+		return kvmppc_share_page(kvm, gpa, page_shift);
+
 	ret = H_PARAMETER;
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	down_read(&kvm->mm->mmap_sem);
@@ -388,6 +454,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
 	struct page *dpage, *spage;
+	struct kvmppc_uvmem_page_pvt *pvt;
 	unsigned long pfn;
 	int ret = U_SUCCESS;
 
@@ -421,10 +488,20 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	}
 
 	lock_page(dpage);
+	pvt = spage->zone_device_data;
 	pfn = page_to_pfn(dpage);
 
-	ret = uv_page_out(kvm->arch.lpid, pfn << page_shift,
-			  gpa, 0, page_shift);
+	/*
+	 * This function is used in two cases:
+	 * - When HV touches a secure page, for which we do UV_PAGE_OUT
+	 * - When a secure page is converted to shared page, we *get*
+	 *   the page to essentially unmap the device page. In this
+	 *   case we skip page-out.
+	 */
+	if (!pvt->skip_page_out)
+		ret = uv_page_out(kvm->arch.lpid, pfn << page_shift,
+				  gpa, 0, page_shift);
+
 	if (ret == U_SUCCESS)
 		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
 	else {
-- 
2.21.0


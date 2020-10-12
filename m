Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16628AF17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 09:32:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8r423S74zDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 18:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FflmIhKq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8qzD4wdtzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 18:28:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09C7QmY0183282; Mon, 12 Oct 2020 03:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Cs3WAJjF4glDOr9ImFAe1X9S34sQ9JDjpkCs9DWNGEI=;
 b=FflmIhKqopEholMkef6GAd/QESvbmWYOEQgWzb47MfiLb/dZRoI1fjFzRTfwBlTbbqL3
 CfugM/jplcAW03TpIHcLew87DGGCePBgPLe4oS3SA2YYnDxystuntQUYqkb3LLoXWt5G
 q26wfHRaH2Fcl6k0vp8hnJeotu5bZ/S5iN4ShdjZwH24CR1ASyx8TFuGzFKagQi923iP
 ekZ9h4Ks0k5QsTPM1eUx9rlYS65FFhPTGyi4c1RoipfRj43CJX36n4Bfz73GDMZAx3ob
 q/F97hSFdF93BsKsW1zwwCfw+tbHPbPZkLIPUqgyhr+AEpAhHUtObJxdZE+gVak7pF38 Og== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344jrwg0mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 03:28:21 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09C7R31N009570;
 Mon, 12 Oct 2020 07:28:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 34347h0w88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 07:28:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09C7SFjL20316566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 07:28:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81DF2A404D;
 Mon, 12 Oct 2020 07:28:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6380A4053;
 Mon, 12 Oct 2020 07:28:13 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.85.204.94])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 07:28:13 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC v1 1/2] KVM: PPC: Book3S HV: rename all variables in
 book3s_hv_uvmem.c
Date: Mon, 12 Oct 2020 00:27:42 -0700
Message-Id: <1602487663-7321-2-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
References: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_03:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=893 priorityscore=1501
 spamscore=0 bulkscore=0 suspectscore=2 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120056
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
Cc: farosas@linux.ibm.com, linuxram@us.ibm.com, bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Preparing this file to be one of the many backends. Since this file
supports Ultravisor backend, renaming all variable from kvmppc_*
to uvmem_*.  This is to avoid clash with some generic top level
functions to be defined in the next patch.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 210 ++++++++++++++++++-------------------
 1 file changed, 105 insertions(+), 105 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 7705d55..b79affc 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -95,9 +95,9 @@
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s_uvmem.h>
 
-static struct dev_pagemap kvmppc_uvmem_pgmap;
-static unsigned long *kvmppc_uvmem_bitmap;
-static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
+static struct dev_pagemap uvmem_pgmap;
+static unsigned long *uvmem_bitmap;
+static DEFINE_SPINLOCK(uvmem_bitmap_lock);
 
 /*
  * States of a GFN
@@ -221,13 +221,13 @@
 #define KVMPPC_GFN_FLAG_MASK	(KVMPPC_GFN_SECURE | KVMPPC_GFN_SHARED)
 #define KVMPPC_GFN_PFN_MASK	(~KVMPPC_GFN_FLAG_MASK)
 
-struct kvmppc_uvmem_slot {
+struct uvmem_slot {
 	struct list_head list;
 	unsigned long nr_pfns;
 	unsigned long base_pfn;
 	unsigned long *pfns;
 };
-struct kvmppc_uvmem_page_pvt {
+struct uvmem_page_pvt {
 	struct kvm *kvm;
 	unsigned long gpa;
 	bool skip_page_out;
@@ -237,15 +237,15 @@ struct kvmppc_uvmem_page_pvt {
 bool kvmppc_uvmem_available(void)
 {
 	/*
-	 * If kvmppc_uvmem_bitmap != NULL, then there is an ultravisor
+	 * If uvmem_bitmap != NULL, then there is an ultravisor
 	 * and our data structures have been initialized successfully.
 	 */
-	return !!kvmppc_uvmem_bitmap;
+	return !!uvmem_bitmap;
 }
 
-int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
+static int uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
 {
-	struct kvmppc_uvmem_slot *p;
+	struct uvmem_slot *p;
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
@@ -268,9 +268,9 @@ int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
 /*
  * All device PFNs are already released by the time we come here.
  */
-void kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot)
+static void uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot)
 {
-	struct kvmppc_uvmem_slot *p, *next;
+	struct uvmem_slot *p, *next;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	list_for_each_entry_safe(p, next, &kvm->arch.uvmem_pfns, list) {
@@ -284,10 +284,10 @@ void kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot)
 	mutex_unlock(&kvm->arch.uvmem_lock);
 }
 
-static void kvmppc_mark_gfn(unsigned long gfn, struct kvm *kvm,
+static void uvmem_mark_gfn(unsigned long gfn, struct kvm *kvm,
 			unsigned long flag, unsigned long uvmem_pfn)
 {
-	struct kvmppc_uvmem_slot *p;
+	struct uvmem_slot *p;
 
 	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
 		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
@@ -303,35 +303,35 @@ static void kvmppc_mark_gfn(unsigned long gfn, struct kvm *kvm,
 }
 
 /* mark the GFN as secure-GFN associated with @uvmem pfn device-PFN. */
-static void kvmppc_gfn_secure_uvmem_pfn(unsigned long gfn,
+static void uvmem_gfn_secure_uvmem_pfn(unsigned long gfn,
 			unsigned long uvmem_pfn, struct kvm *kvm)
 {
-	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_UVMEM_PFN, uvmem_pfn);
+	uvmem_mark_gfn(gfn, kvm, KVMPPC_GFN_UVMEM_PFN, uvmem_pfn);
 }
 
 /* mark the GFN as secure-GFN associated with a memory-PFN. */
-static void kvmppc_gfn_secure_mem_pfn(unsigned long gfn, struct kvm *kvm)
+static void uvmem_gfn_secure_mem_pfn(unsigned long gfn, struct kvm *kvm)
 {
-	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_MEM_PFN, 0);
+	uvmem_mark_gfn(gfn, kvm, KVMPPC_GFN_MEM_PFN, 0);
 }
 
 /* mark the GFN as a shared GFN. */
-static void kvmppc_gfn_shared(unsigned long gfn, struct kvm *kvm)
+static void uvmem_gfn_shared(unsigned long gfn, struct kvm *kvm)
 {
-	kvmppc_mark_gfn(gfn, kvm, KVMPPC_GFN_SHARED, 0);
+	uvmem_mark_gfn(gfn, kvm, KVMPPC_GFN_SHARED, 0);
 }
 
 /* mark the GFN as a non-existent GFN. */
-static void kvmppc_gfn_remove(unsigned long gfn, struct kvm *kvm)
+static void uvmem_gfn_remove(unsigned long gfn, struct kvm *kvm)
 {
-	kvmppc_mark_gfn(gfn, kvm, 0, 0);
+	uvmem_mark_gfn(gfn, kvm, 0, 0);
 }
 
 /* return true, if the GFN is a secure-GFN backed by a secure-PFN */
-static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
+static bool uvmem_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 				    unsigned long *uvmem_pfn)
 {
-	struct kvmppc_uvmem_slot *p;
+	struct uvmem_slot *p;
 
 	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
 		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
@@ -356,10 +356,10 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
  *
  * Must be called with kvm->arch.uvmem_lock  held.
  */
-static bool kvmppc_next_nontransitioned_gfn(const struct kvm_memory_slot *memslot,
+static bool uvmem_next_nontransitioned_gfn(const struct kvm_memory_slot *memslot,
 		struct kvm *kvm, unsigned long *gfn)
 {
-	struct kvmppc_uvmem_slot *p;
+	struct uvmem_slot *p;
 	bool ret = false;
 	unsigned long i;
 
@@ -370,7 +370,7 @@ static bool kvmppc_next_nontransitioned_gfn(const struct kvm_memory_slot *memslo
 		return ret;
 	/*
 	 * The code below assumes, one to one correspondence between
-	 * kvmppc_uvmem_slot and memslot.
+	 * uvmem_slot and memslot.
 	 */
 	for (i = *gfn; i < p->base_pfn + p->nr_pfns; i++) {
 		unsigned long index = i - p->base_pfn;
@@ -384,7 +384,7 @@ static bool kvmppc_next_nontransitioned_gfn(const struct kvm_memory_slot *memslo
 	return ret;
 }
 
-static int kvmppc_memslot_page_merge(struct kvm *kvm,
+static int uvmem_memslot_page_merge(struct kvm *kvm,
 		const struct kvm_memory_slot *memslot, bool merge)
 {
 	unsigned long gfn = memslot->base_gfn;
@@ -418,23 +418,23 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
 	return ret;
 }
 
-static void __kvmppc_uvmem_memslot_delete(struct kvm *kvm,
+static void __uvmem_memslot_delete(struct kvm *kvm,
 		const struct kvm_memory_slot *memslot)
 {
 	uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
-	kvmppc_uvmem_slot_free(kvm, memslot);
-	kvmppc_memslot_page_merge(kvm, memslot, true);
+	uvmem_slot_free(kvm, memslot);
+	uvmem_memslot_page_merge(kvm, memslot, true);
 }
 
-static int __kvmppc_uvmem_memslot_create(struct kvm *kvm,
+static int __uvmem_memslot_create(struct kvm *kvm,
 		const struct kvm_memory_slot *memslot)
 {
 	int ret = H_PARAMETER;
 
-	if (kvmppc_memslot_page_merge(kvm, memslot, false))
+	if (uvmem_memslot_page_merge(kvm, memslot, false))
 		return ret;
 
-	if (kvmppc_uvmem_slot_init(kvm, memslot))
+	if (uvmem_slot_init(kvm, memslot))
 		goto out1;
 
 	ret = uv_register_mem_slot(kvm->arch.lpid,
@@ -447,9 +447,9 @@ static int __kvmppc_uvmem_memslot_create(struct kvm *kvm,
 	}
 	return 0;
 out:
-	kvmppc_uvmem_slot_free(kvm, memslot);
+	uvmem_slot_free(kvm, memslot);
 out1:
-	kvmppc_memslot_page_merge(kvm, memslot, true);
+	uvmem_memslot_page_merge(kvm, memslot, true);
 	return ret;
 }
 
@@ -462,7 +462,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 
 	kvm->arch.secure_guest = KVMPPC_SECURE_INIT_START;
 
-	if (!kvmppc_uvmem_bitmap)
+	if (!uvmem_bitmap)
 		return H_UNSUPPORTED;
 
 	/* Only radix guests can be secure guests */
@@ -478,7 +478,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 	/* register the memslot */
 	slots = kvm_memslots(kvm);
 	kvm_for_each_memslot(memslot, slots) {
-		ret = __kvmppc_uvmem_memslot_create(kvm, memslot);
+		ret = __uvmem_memslot_create(kvm, memslot);
 		if (ret)
 			break;
 	}
@@ -488,7 +488,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 		kvm_for_each_memslot(m, slots) {
 			if (m == memslot)
 				break;
-			__kvmppc_uvmem_memslot_delete(kvm, memslot);
+			__uvmem_memslot_delete(kvm, memslot);
 		}
 	}
 
@@ -501,7 +501,7 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
  * from secure memory using UV_PAGE_OUT uvcall.
  * Caller must held kvm->arch.uvmem_lock.
  */
-static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
+static int __uvmem_svm_page_out(struct vm_area_struct *vma,
 		unsigned long start,
 		unsigned long end, unsigned long page_shift,
 		struct kvm *kvm, unsigned long gpa)
@@ -509,7 +509,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	unsigned long src_pfn, dst_pfn = 0;
 	struct migrate_vma mig;
 	struct page *dpage, *spage;
-	struct kvmppc_uvmem_page_pvt *pvt;
+	struct uvmem_page_pvt *pvt;
 	unsigned long pfn;
 	int ret = U_SUCCESS;
 
@@ -519,11 +519,11 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
-	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
+	mig.pgmap_owner = &uvmem_pgmap;
 	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	/* The requested page is already paged-out, nothing to do */
-	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
+	if (!uvmem_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
 		return ret;
 
 	ret = migrate_vma_setup(&mig);
@@ -573,7 +573,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 	return ret;
 }
 
-static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
+static inline int uvmem_svm_page_out(struct vm_area_struct *vma,
 				      unsigned long start, unsigned long end,
 				      unsigned long page_shift,
 				      struct kvm *kvm, unsigned long gpa)
@@ -581,7 +581,7 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
 	int ret;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
-	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
+	ret = __uvmem_svm_page_out(vma, start, end, page_shift, kvm, gpa);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 
 	return ret;
@@ -599,7 +599,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 			     struct kvm *kvm, bool skip_page_out)
 {
 	int i;
-	struct kvmppc_uvmem_page_pvt *pvt;
+	struct uvmem_page_pvt *pvt;
 	struct page *uvmem_page;
 	struct vm_area_struct *vma = NULL;
 	unsigned long uvmem_pfn, gfn;
@@ -623,19 +623,19 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 
 		mutex_lock(&kvm->arch.uvmem_lock);
 
-		if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+		if (uvmem_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
 			uvmem_page = pfn_to_page(uvmem_pfn);
 			pvt = uvmem_page->zone_device_data;
 			pvt->skip_page_out = skip_page_out;
 			pvt->remove_gfn = true;
 
-			if (__kvmppc_svm_page_out(vma, addr, addr + PAGE_SIZE,
+			if (__uvmem_svm_page_out(vma, addr, addr + PAGE_SIZE,
 						  PAGE_SHIFT, kvm, pvt->gpa))
 				pr_err("Can't page out gpa:0x%lx addr:0x%lx\n",
 				       pvt->gpa, addr);
 		} else {
 			/* Remove the shared flag if any */
-			kvmppc_gfn_remove(gfn, kvm);
+			uvmem_gfn_remove(gfn, kvm);
 		}
 
 		mutex_unlock(&kvm->arch.uvmem_lock);
@@ -680,31 +680,31 @@ unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
  *
  * Called with kvm->arch.uvmem_lock held
  */
-static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
+static struct page *uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 {
 	struct page *dpage = NULL;
 	unsigned long bit, uvmem_pfn;
-	struct kvmppc_uvmem_page_pvt *pvt;
+	struct uvmem_page_pvt *pvt;
 	unsigned long pfn_last, pfn_first;
 
-	pfn_first = kvmppc_uvmem_pgmap.res.start >> PAGE_SHIFT;
+	pfn_first = uvmem_pgmap.res.start >> PAGE_SHIFT;
 	pfn_last = pfn_first +
-		   (resource_size(&kvmppc_uvmem_pgmap.res) >> PAGE_SHIFT);
+		   (resource_size(&uvmem_pgmap.res) >> PAGE_SHIFT);
 
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bit = find_first_zero_bit(kvmppc_uvmem_bitmap,
+	spin_lock(&uvmem_bitmap_lock);
+	bit = find_first_zero_bit(uvmem_bitmap,
 				  pfn_last - pfn_first);
 	if (bit >= (pfn_last - pfn_first))
 		goto out;
-	bitmap_set(kvmppc_uvmem_bitmap, bit, 1);
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	bitmap_set(uvmem_bitmap, bit, 1);
+	spin_unlock(&uvmem_bitmap_lock);
 
 	pvt = kzalloc(sizeof(*pvt), GFP_KERNEL);
 	if (!pvt)
 		goto out_clear;
 
 	uvmem_pfn = bit + pfn_first;
-	kvmppc_gfn_secure_uvmem_pfn(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
+	uvmem_gfn_secure_uvmem_pfn(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
 
 	pvt->gpa = gpa;
 	pvt->kvm = kvm;
@@ -715,10 +715,10 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 	lock_page(dpage);
 	return dpage;
 out_clear:
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bitmap_clear(kvmppc_uvmem_bitmap, bit, 1);
+	spin_lock(&uvmem_bitmap_lock);
+	bitmap_clear(uvmem_bitmap, bit, 1);
 out:
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	spin_unlock(&uvmem_bitmap_lock);
 	return NULL;
 }
 
@@ -726,7 +726,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
  * Alloc a PFN from private device memory pool. If @pagein is true,
  * copy page from normal memory to secure memory using UV_PAGE_IN uvcall.
  */
-static int kvmppc_svm_page_in(struct vm_area_struct *vma,
+static int uvmem_svm_page_in(struct vm_area_struct *vma,
 		unsigned long start,
 		unsigned long end, unsigned long gpa, struct kvm *kvm,
 		unsigned long page_shift,
@@ -756,7 +756,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		goto out_finalize;
 	}
 
-	dpage = kvmppc_uvmem_get_page(gpa, kvm);
+	dpage = uvmem_get_page(gpa, kvm);
 	if (!dpage) {
 		ret = -1;
 		goto out_finalize;
@@ -780,7 +780,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 	return ret;
 }
 
-static int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
+static int uvmem_uv_migrate_mem_slot(struct kvm *kvm,
 		const struct kvm_memory_slot *memslot)
 {
 	unsigned long gfn = memslot->base_gfn;
@@ -790,7 +790,7 @@ static int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
 
 	mmap_read_lock(kvm->mm);
 	mutex_lock(&kvm->arch.uvmem_lock);
-	while (kvmppc_next_nontransitioned_gfn(memslot, kvm, &gfn)) {
+	while (uvmem_next_nontransitioned_gfn(memslot, kvm, &gfn)) {
 		ret = H_STATE;
 		start = gfn_to_hva(kvm, gfn);
 		if (kvm_is_error_hva(start))
@@ -801,7 +801,7 @@ static int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
 		if (!vma || vma->vm_start > start || vma->vm_end < end)
 			break;
 
-		ret = kvmppc_svm_page_in(vma, start, end,
+		ret = uvmem_svm_page_in(vma, start, end,
 				(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
 		if (ret) {
 			ret = H_STATE;
@@ -830,7 +830,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	slots = kvm_memslots(kvm);
 	kvm_for_each_memslot(memslot, slots) {
-		ret = kvmppc_uv_migrate_mem_slot(kvm, memslot);
+		ret = uvmem_uv_migrate_mem_slot(kvm, memslot);
 		if (ret) {
 			/*
 			 * The pages will remain transitioned.
@@ -863,13 +863,13 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
  * In the former case, uses dev_pagemap_ops.migrate_to_ram handler
  * to unmap the device page from QEMU's page tables.
  */
-static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
+static unsigned long uvmem_share_page(struct kvm *kvm, unsigned long gpa,
 		unsigned long page_shift)
 {
 
 	int ret = H_PARAMETER;
 	struct page *uvmem_page;
-	struct kvmppc_uvmem_page_pvt *pvt;
+	struct uvmem_page_pvt *pvt;
 	unsigned long pfn;
 	unsigned long gfn = gpa >> page_shift;
 	int srcu_idx;
@@ -877,7 +877,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	mutex_lock(&kvm->arch.uvmem_lock);
-	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+	if (uvmem_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
@@ -895,7 +895,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		goto out;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
-	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+	if (uvmem_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
@@ -906,7 +906,7 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
 				page_shift)) {
-		kvmppc_gfn_shared(gfn, kvm);
+		uvmem_gfn_shared(gfn, kvm);
 		ret = H_SUCCESS;
 	}
 	kvm_release_pfn_clean(pfn);
@@ -942,7 +942,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 		return H_P2;
 
 	if (flags & H_PAGE_IN_SHARED)
-		return kvmppc_share_page(kvm, gpa, page_shift);
+		return uvmem_share_page(kvm, gpa, page_shift);
 
 	ret = H_PARAMETER;
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -954,7 +954,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* Fail the page-in request of an already paged-in page */
-	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
+	if (uvmem_gfn_is_uvmem_pfn(gfn, kvm, NULL))
 		goto out_unlock;
 
 	end = start + (1UL << page_shift);
@@ -962,7 +962,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out_unlock;
 
-	if (kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
+	if (uvmem_svm_page_in(vma, start, end, gpa, kvm, page_shift,
 				true))
 		goto out_unlock;
 
@@ -987,9 +987,9 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
  */
 static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 {
-	struct kvmppc_uvmem_page_pvt *pvt = vmf->page->zone_device_data;
+	struct uvmem_page_pvt *pvt = vmf->page->zone_device_data;
 
-	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
+	if (uvmem_svm_page_out(vmf->vma, vmf->address,
 				vmf->address + PAGE_SIZE, PAGE_SHIFT,
 				pvt->kvm, pvt->gpa))
 		return VM_FAULT_SIGBUS;
@@ -1007,23 +1007,23 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
 static void kvmppc_uvmem_page_free(struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page) -
-			(kvmppc_uvmem_pgmap.res.start >> PAGE_SHIFT);
-	struct kvmppc_uvmem_page_pvt *pvt;
+			(uvmem_pgmap.res.start >> PAGE_SHIFT);
+	struct uvmem_page_pvt *pvt;
 
-	spin_lock(&kvmppc_uvmem_bitmap_lock);
-	bitmap_clear(kvmppc_uvmem_bitmap, pfn, 1);
-	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	spin_lock(&uvmem_bitmap_lock);
+	bitmap_clear(uvmem_bitmap, pfn, 1);
+	spin_unlock(&uvmem_bitmap_lock);
 
 	pvt = page->zone_device_data;
 	page->zone_device_data = NULL;
 	if (pvt->remove_gfn)
-		kvmppc_gfn_remove(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
+		uvmem_gfn_remove(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
 	else
-		kvmppc_gfn_secure_mem_pfn(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
+		uvmem_gfn_secure_mem_pfn(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
 	kfree(pvt);
 }
 
-static const struct dev_pagemap_ops kvmppc_uvmem_ops = {
+static const struct dev_pagemap_ops uvmem_ops = {
 	.page_free = kvmppc_uvmem_page_free,
 	.migrate_to_ram	= kvmppc_uvmem_migrate_to_ram,
 };
@@ -1062,7 +1062,7 @@ static void kvmppc_uvmem_page_free(struct page *page)
 	if (!vma || vma->vm_start > start || vma->vm_end < end)
 		goto out;
 
-	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa))
+	if (!uvmem_svm_page_out(vma, start, end, page_shift, kvm, gpa))
 		ret = H_SUCCESS;
 out:
 	mmap_read_unlock(kvm->mm);
@@ -1080,7 +1080,7 @@ int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 		return -EFAULT;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
-	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
+	if (uvmem_gfn_is_uvmem_pfn(gfn, kvm, NULL))
 		goto out;
 
 	ret = uv_page_in(kvm->arch.lpid, pfn << PAGE_SHIFT, gfn << PAGE_SHIFT,
@@ -1093,20 +1093,20 @@ int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 
 int kvmppc_uvmem_memslot_create(struct kvm *kvm, const struct kvm_memory_slot *new)
 {
-	int ret = __kvmppc_uvmem_memslot_create(kvm, new);
+	int ret = __uvmem_memslot_create(kvm, new);
 
 	if (!ret)
-		ret = kvmppc_uv_migrate_mem_slot(kvm, new);
+		ret = uvmem_uv_migrate_mem_slot(kvm, new);
 
 	return ret;
 }
 
 void kvmppc_uvmem_memslot_delete(struct kvm *kvm, const struct kvm_memory_slot *old)
 {
-	__kvmppc_uvmem_memslot_delete(kvm, old);
+	__uvmem_memslot_delete(kvm, old);
 }
 
-static u64 kvmppc_get_secmem_size(void)
+static u64 uvmem_get_secmem_size(void)
 {
 	struct device_node *np;
 	int i, len;
@@ -1152,7 +1152,7 @@ int kvmppc_uvmem_init(void)
 	void *addr;
 	unsigned long pfn_last, pfn_first;
 
-	size = kvmppc_get_secmem_size();
+	size = uvmem_get_secmem_size();
 	if (!size) {
 		/*
 		 * Don't fail the initialization of kvm-hv module if
@@ -1163,18 +1163,18 @@ int kvmppc_uvmem_init(void)
 		goto out;
 	}
 
-	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
+	res = request_free_mem_region(&iomem_resource, size, "uvmem");
 	if (IS_ERR(res)) {
 		ret = PTR_ERR(res);
 		goto out;
 	}
 
-	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
-	kvmppc_uvmem_pgmap.res = *res;
-	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
+	uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
+	uvmem_pgmap.res = *res;
+	uvmem_pgmap.ops = &uvmem_ops;
 	/* just one global instance: */
-	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
-	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
+	uvmem_pgmap.owner = &uvmem_pgmap;
+	addr = memremap_pages(&uvmem_pgmap, NUMA_NO_NODE);
 	if (IS_ERR(addr)) {
 		ret = PTR_ERR(addr);
 		goto out_free_region;
@@ -1182,9 +1182,9 @@ int kvmppc_uvmem_init(void)
 
 	pfn_first = res->start >> PAGE_SHIFT;
 	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
-	kvmppc_uvmem_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
+	uvmem_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
 				      sizeof(unsigned long), GFP_KERNEL);
-	if (!kvmppc_uvmem_bitmap) {
+	if (!uvmem_bitmap) {
 		ret = -ENOMEM;
 		goto out_unmap;
 	}
@@ -1192,7 +1192,7 @@ int kvmppc_uvmem_init(void)
 	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
 	return ret;
 out_unmap:
-	memunmap_pages(&kvmppc_uvmem_pgmap);
+	memunmap_pages(&uvmem_pgmap);
 out_free_region:
 	release_mem_region(res->start, size);
 out:
@@ -1201,11 +1201,11 @@ int kvmppc_uvmem_init(void)
 
 void kvmppc_uvmem_free(void)
 {
-	if (!kvmppc_uvmem_bitmap)
+	if (!uvmem_bitmap)
 		return;
 
-	memunmap_pages(&kvmppc_uvmem_pgmap);
-	release_mem_region(kvmppc_uvmem_pgmap.res.start,
-			   resource_size(&kvmppc_uvmem_pgmap.res));
-	kfree(kvmppc_uvmem_bitmap);
+	memunmap_pages(&uvmem_pgmap);
+	release_mem_region(uvmem_pgmap.res.start,
+			   resource_size(&uvmem_pgmap.res));
+	kfree(uvmem_bitmap);
 }
-- 
1.8.3.1


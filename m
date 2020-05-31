Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA31E9502
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 04:33:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZMmX4cMszDqnT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 12:33:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZMgB1NFDzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 12:28:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04V227qm149750; Sat, 30 May 2020 22:28:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31bgdsv5m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 May 2020 22:28:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04V2RsDI027265;
 Sun, 31 May 2020 02:28:30 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 31bf47rmdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 31 May 2020 02:28:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04V2SRE36095192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 31 May 2020 02:28:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D08FAE053;
 Sun, 31 May 2020 02:28:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DF8BAE045;
 Sun, 31 May 2020 02:28:24 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.70.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 31 May 2020 02:28:24 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/4] KVM: PPC: Book3S HV: track shared GFNs of secure VMs
Date: Sat, 30 May 2020 19:27:49 -0700
Message-Id: <1590892071-25549-3-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-30_21:2020-05-28,
 2020-05-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=2 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005310010
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
 bharata@linux.ibm.com, aneesh.kumar@linux.ibm.com, sukadev@linux.vnet.ibm.com,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During the life of SVM, its GFNs can transition from secure to shared
state and vice-versa. Since the kernel does not track GFNs that are
shared, it is not possible to disambiguate a shared GFN from a GFN whose
PFN has not yet been migrated to a device-PFN.

The ability to identify a shared GFN is needed to skip migrating its PFN
to device PFN. This functionality is leveraged in a subsequent patch.

Add the ability to identify the state of a GFN.

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
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |   6 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |   2 +-
 arch/powerpc/kvm/book3s_hv.c                |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 115 ++++++++++++++++++++++++++--
 4 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index 5a9834e..f0c5708 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -21,7 +21,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
 unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm, bool skip_page_out);
+			     struct kvm *kvm, bool skip_page_out,
+			     bool purge_gfn);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
@@ -75,6 +76,7 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 
 static inline void
 kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			struct kvm *kvm, bool skip_page_out) { }
+			struct kvm *kvm, bool skip_page_out,
+			bool purge_gfn) { }
 #endif /* CONFIG_PPC_UV */
 #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 803940d..3448459 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1100,7 +1100,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	unsigned int shift;
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
-		kvmppc_uvmem_drop_pages(memslot, kvm, true);
+		kvmppc_uvmem_drop_pages(memslot, kvm, true, false);
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 103d13e..4c62bfe 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5467,7 +5467,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 			continue;
 
 		kvm_for_each_memslot(memslot, slots) {
-			kvmppc_uvmem_drop_pages(memslot, kvm, true);
+			kvmppc_uvmem_drop_pages(memslot, kvm, true, true);
 			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
 		}
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index ea4a1f1..2ef1e03 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -99,14 +99,56 @@
 static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
 
 #define KVMPPC_UVMEM_PFN	(1UL << 63)
+#define KVMPPC_UVMEM_SHARED	(1UL << 62)
+#define KVMPPC_UVMEM_FLAG_MASK	(KVMPPC_UVMEM_PFN | KVMPPC_UVMEM_SHARED)
+#define KVMPPC_UVMEM_PFN_MASK	(~KVMPPC_UVMEM_FLAG_MASK)
 
 struct kvmppc_uvmem_slot {
 	struct list_head list;
 	unsigned long nr_pfns;
 	unsigned long base_pfn;
+	/*
+	 * pfns array has an entry for each GFN of the memory slot.
+	 *
+	 * The GFN can be in one of the following states.
+	 *
+	 * (a) Secure - The GFN is secure. Only Ultravisor can access it.
+	 * (b) Shared - The GFN is shared. Both Hypervisor and Ultravisor
+	 *		can access it.
+	 * (c) Normal - The GFN is a normal.  Only Hypervisor can access it.
+	 *
+	 * Secure GFN is associated with a devicePFN. Its pfn[] has
+	 * KVMPPC_UVMEM_PFN flag set, and has the value of the device PFN
+	 * KVMPPC_UVMEM_SHARED flag unset, and has the value of the device PFN
+	 *
+	 * Shared GFN is associated with a memoryPFN. Its pfn[] has
+	 * KVMPPC_UVMEM_SHARED flag set. But its KVMPPC_UVMEM_PFN is not set,
+	 * and there is no PFN value stored.
+	 *
+	 * Normal GFN is not associated with memoryPFN. Its pfn[] has
+	 * KVMPPC_UVMEM_SHARED and KVMPPC_UVMEM_PFN flag unset, and no PFN
+	 * value is stored.
+	 *
+	 * Any other combination of values in pfn[] leads to undefined
+	 * behavior.
+	 *
+	 * Life cycle of a GFN --
+	 *
+	 * ---------------------------------------------------------
+	 * |        |     Share	 |  Unshare | SVM	|slot      |
+	 * |	    |		 |	    | abort/	|flush	   |
+	 * |	    |		 |	    | terminate	|	   |
+	 * ---------------------------------------------------------
+	 * |        |            |          |           |          |
+	 * | Secure |     Shared | Secure   |Normal	|Secure    |
+	 * |        |            |          |           |          |
+	 * | Shared |     Shared | Secure   |Normal     |Shared    |
+	 * |        |            |          |           |          |
+	 * | Normal |     Shared | Secure   |Normal     |Normal    |
+	 * ---------------------------------------------------------
+	 */
 	unsigned long *pfns;
 };
-
 struct kvmppc_uvmem_page_pvt {
 	struct kvm *kvm;
 	unsigned long gpa;
@@ -175,7 +217,12 @@ static void kvmppc_uvmem_pfn_remove(unsigned long gfn, struct kvm *kvm)
 
 	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
 		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
-			p->pfns[gfn - p->base_pfn] = 0;
+			/*
+			 * Reset everything, but keep the KVMPPC_UVMEM_SHARED
+			 * flag intact.  A gfn continues to be shared or
+			 * unshared, with or without an associated device pfn.
+			 */
+			p->pfns[gfn - p->base_pfn] &= KVMPPC_UVMEM_SHARED;
 			return;
 		}
 	}
@@ -193,7 +240,7 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 			if (p->pfns[index] & KVMPPC_UVMEM_PFN) {
 				if (uvmem_pfn)
 					*uvmem_pfn = p->pfns[index] &
-						     ~KVMPPC_UVMEM_PFN;
+						     KVMPPC_UVMEM_PFN_MASK;
 				return true;
 			} else
 				return false;
@@ -202,6 +249,38 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 	return false;
 }
 
+static void kvmppc_gfn_uvmem_shared(unsigned long gfn, struct kvm *kvm,
+		bool set)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			unsigned long index = gfn - p->base_pfn;
+
+			if (set)
+				p->pfns[index] |= KVMPPC_UVMEM_SHARED;
+			else
+				p->pfns[index] &= ~KVMPPC_UVMEM_SHARED;
+			return;
+		}
+	}
+}
+
+bool kvmppc_gfn_is_uvmem_shared(unsigned long gfn, struct kvm *kvm)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			unsigned long index = gfn - p->base_pfn;
+
+			return (p->pfns[index] & KVMPPC_UVMEM_SHARED);
+		}
+	}
+	return false;
+}
+
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
@@ -256,9 +335,13 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
  * is HV side fault on these pages. Next we *get* these pages, forcing
  * fault on them, do fault time migration to replace the device PTEs in
  * QEMU page table with normal PTEs from newly allocated pages.
+ *
+ * if @purge_gfn is set, cleanup any information related to each of
+ * the GFNs associated with this memory slot.
  */
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm, bool skip_page_out)
+			     struct kvm *kvm, bool skip_page_out,
+			     bool purge_gfn)
 {
 	int i;
 	struct kvmppc_uvmem_page_pvt *pvt;
@@ -269,11 +352,22 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 		struct page *uvmem_page;
 
 		mutex_lock(&kvm->arch.uvmem_lock);
+
+		if (purge_gfn) {
+			/*
+			 * cleanup the shared status of the GFN here.
+			 * Any device PFN associated with the GFN shall
+			 * be cleaned up later, in kvmppc_uvmem_page_free()
+			 * when the device PFN is actually disassociated
+			 * from the GFN.
+			 */
+			kvmppc_gfn_uvmem_shared(gfn, kvm, false);
+		}
+
 		if (!kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
 			mutex_unlock(&kvm->arch.uvmem_lock);
 			continue;
 		}
-
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = skip_page_out;
@@ -304,7 +398,7 @@ unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
 	kvm_for_each_memslot(memslot, kvm_memslots(kvm))
-		kvmppc_uvmem_drop_pages(memslot, kvm, false);
+		kvmppc_uvmem_drop_pages(memslot, kvm, false, true);
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
@@ -470,8 +564,11 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		goto retry;
 	}
 
-	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0, page_shift))
+	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+				page_shift)) {
+		kvmppc_gfn_uvmem_shared(gfn, kvm, true);
 		ret = H_SUCCESS;
+	}
 	kvm_release_pfn_clean(pfn);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
@@ -527,8 +624,10 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 		goto out_unlock;
 
 	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift,
-				&downgrade))
+				&downgrade)) {
+		kvmppc_gfn_uvmem_shared(gfn, kvm, false);
 		ret = H_SUCCESS;
+	}
 out_unlock:
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
-- 
1.8.3.1


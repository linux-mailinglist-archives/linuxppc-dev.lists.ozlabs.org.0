Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A243F9911B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 12:41:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dh0k3qcFzDrTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 20:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dggm6lllzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 20:27:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MAPFmJ083893
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:26:58 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhs9gg2e6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 06:26:57 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 22 Aug 2019 11:26:55 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 11:26:53 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MAQpFY60293126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 10:26:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E9C1AE058;
 Thu, 22 Aug 2019 10:26:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C643AE053;
 Thu, 22 Aug 2019 10:26:49 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.57.57])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 10:26:49 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 6/7] kvmppc: Support reset of secure guest
Date: Thu, 22 Aug 2019 15:56:19 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822102620.21897-1-bharata@linux.ibm.com>
References: <20190822102620.21897-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082210-0028-0000-0000-000003926BDC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082210-0029-0000-0000-000024549685
Message-Id: <20190822102620.21897-7-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220112
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org, jglisse@redhat.com,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for reset of secure guest via a new ioctl KVM_PPC_SVM_OFF.
This ioctl will be issued by QEMU during reset and includes the
the following steps:

- Ask UV to terminate the guest via UV_SVM_TERMINATE ucall
- Unpin the VPA pages so that they can be migrated back to secure
  side when guest becomes secure again. This is required because
  pinned pages can't be migrated.
- Reinitialize guest's partitioned scoped page tables. These are
  freed when guest becomes secure (H_SVM_INIT_DONE)
- Release all device pages of the secure guest.

After these steps, guest is ready to issue UV_ESM call once again
to switch to secure mode.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
	[Implementation of uv_svm_terminate() and its call from
	guest shutdown path]
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
	[Unpinning of VPA pages]
---
 Documentation/virtual/kvm/api.txt          | 19 ++++++
 arch/powerpc/include/asm/kvm_book3s_devm.h |  6 ++
 arch/powerpc/include/asm/kvm_ppc.h         |  2 +
 arch/powerpc/include/asm/ultravisor-api.h  |  1 +
 arch/powerpc/include/asm/ultravisor.h      |  5 ++
 arch/powerpc/kvm/book3s_hv.c               | 70 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_devm.c          | 60 +++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                 | 12 ++++
 include/uapi/linux/kvm.h                   |  1 +
 9 files changed, 176 insertions(+)

diff --git a/Documentation/virtual/kvm/api.txt b/Documentation/virtual/kvm/api.txt
index e54a3f51ddc5..531562e01343 100644
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@ -4111,6 +4111,25 @@ Valid values for 'action':
 #define KVM_PMU_EVENT_ALLOW 0
 #define KVM_PMU_EVENT_DENY 1
 
+4.121 KVM_PPC_SVM_OFF
+
+Capability: basic
+Architectures: powerpc
+Type: vm ioctl
+Parameters: none
+Returns: 0 on successful completion,
+Errors:
+  EINVAL:    if ultravisor failed to terminate the secure guest
+  ENOMEM:    if hypervisor failed to allocate new radix page tables for guest
+
+This ioctl is used to turn off the secure mode of the guest or transition
+the guest from secure mode to normal mode. This is invoked when the guest
+is reset. This has no effect if called for a normal guest.
+
+This ioctl issues an ultravisor call to terminate the secure guest,
+unpins the VPA pages, reinitializes guest's partition scoped page
+tables and releases all the device pages that are used to track the
+secure pages by hypervisor.
 
 5. The kvm_run structure
 ------------------------
diff --git a/arch/powerpc/include/asm/kvm_book3s_devm.h b/arch/powerpc/include/asm/kvm_book3s_devm.h
index fc924ef00b91..62e1992cbac7 100644
--- a/arch/powerpc/include/asm/kvm_book3s_devm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_devm.h
@@ -13,6 +13,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 				    unsigned long page_shift);
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
+void kvmppc_devm_free_memslot_pfns(struct kvm *kvm, struct kvm_memslots *slots);
 #else
 static inline unsigned long
 kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gra,
@@ -37,5 +38,10 @@ static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 {
 	return H_UNSUPPORTED;
 }
+
+static inline void kvmppc_devm_free_memslot_pfns(struct kvm *kvm,
+						 struct kvm_memslots *slots)
+{
+}
 #endif /* CONFIG_PPC_UV */
 #endif /* __POWERPC_KVM_PPC_HMM_H__ */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 2484e6a8f5ca..e4093d067354 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -177,6 +177,7 @@ extern void kvm_spapr_tce_release_iommu_group(struct kvm *kvm,
 extern int kvmppc_switch_mmu_to_hpt(struct kvm *kvm);
 extern int kvmppc_switch_mmu_to_radix(struct kvm *kvm);
 extern void kvmppc_setup_partition_table(struct kvm *kvm);
+extern int kvmppc_reinit_partition_table(struct kvm *kvm);
 
 extern long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 				struct kvm_create_spapr_tce_64 *args);
@@ -321,6 +322,7 @@ struct kvmppc_ops {
 			       int size);
 	int (*store_to_eaddr)(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
 			      int size);
+	int (*svm_off)(struct kvm *kvm);
 };
 
 extern struct kvmppc_ops *kvmppc_hv_ops;
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index cf200d4ce703..3a27a0c0be05 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -30,5 +30,6 @@
 #define UV_PAGE_IN			0xF128
 #define UV_PAGE_OUT			0xF12C
 #define UV_PAGE_INVAL			0xF138
+#define UV_SVM_TERMINATE		0xF13C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index b333241bbe4c..754a37de646d 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -62,4 +62,9 @@ static inline int uv_page_inval(u64 lpid, u64 gpa, u64 page_shift)
 	return ucall_norets(UV_PAGE_INVAL, lpid, gpa, page_shift);
 }
 
+static inline int uv_svm_terminate(u64 lpid)
+{
+	return ucall_norets(UV_SVM_TERMINATE, lpid);
+}
+
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 57f8b0b1c703..4d16121fda86 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2433,6 +2433,15 @@ static void unpin_vpa(struct kvm *kvm, struct kvmppc_vpa *vpa)
 					vpa->dirty);
 }
 
+static void unpin_vpa_reset(struct kvm *kvm, struct kvmppc_vpa *vpa)
+{
+	unpin_vpa(kvm, vpa);
+	vpa->gpa = 0;
+	vpa->pinned_addr = NULL;
+	vpa->dirty = false;
+	vpa->update_pending = 0;
+}
+
 static void kvmppc_core_vcpu_free_hv(struct kvm_vcpu *vcpu)
 {
 	spin_lock(&vcpu->arch.vpa_update_lock);
@@ -4576,6 +4585,22 @@ void kvmppc_setup_partition_table(struct kvm *kvm)
 	kvmhv_set_ptbl_entry(kvm->arch.lpid, dw0, dw1);
 }
 
+/*
+ * Called from KVM_PPC_SVM_OFF ioctl at guest reset time when secure
+ * guest is converted back to normal guest.
+ */
+int kvmppc_reinit_partition_table(struct kvm *kvm)
+{
+	int ret;
+
+	ret = kvmppc_init_vm_radix(kvm);
+	if (ret)
+		return ret;
+
+	kvmppc_setup_partition_table(kvm);
+	return 0;
+}
+
 /*
  * Set up HPT (hashed page table) and RMA (real-mode area).
  * Must be called with kvm->arch.mmu_setup_lock held.
@@ -4963,6 +4988,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		if (nesting_enabled(kvm))
 			kvmhv_release_all_nested(kvm);
 		kvm->arch.process_table = 0;
+		uv_svm_terminate(kvm->arch.lpid);
 		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 	kvmppc_free_lpid(kvm->arch.lpid);
@@ -5404,6 +5430,49 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
 	return rc;
 }
 
+/*
+ *  IOCTL handler to turn off secure mode of guest
+ *
+ * - Issue ucall to terminate the guest on the UV side
+ * - Unpin the VPA pages (Enables these pages to be migrated back
+ *   when VM becomes secure again)
+ * - Recreate partition table as the guest is transitioning back to
+ *   normal mode
+ * - Release all device pages
+ */
+static int kvmhv_svm_off(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	int ret = 0;
+	int i;
+
+	if (kvmppc_is_guest_secure(kvm)) {
+		ret = uv_svm_terminate(kvm->arch.lpid);
+		if (ret != U_SUCCESS) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		kvm_for_each_vcpu(i, vcpu, kvm) {
+			spin_lock(&vcpu->arch.vpa_update_lock);
+			unpin_vpa_reset(kvm, &vcpu->arch.dtl);
+			unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
+			unpin_vpa_reset(kvm, &vcpu->arch.vpa);
+			spin_unlock(&vcpu->arch.vpa_update_lock);
+		}
+
+		ret = kvmppc_reinit_partition_table(kvm);
+		if (ret)
+			goto out;
+		kvm->arch.secure_guest = 0;
+		for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++)
+			kvmppc_devm_free_memslot_pfns(kvm,
+			__kvm_memslots(kvm, i));
+	}
+out:
+	return ret;
+}
+
 static struct kvmppc_ops kvm_ops_hv = {
 	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
 	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
@@ -5446,6 +5515,7 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.enable_nested = kvmhv_enable_nested,
 	.load_from_eaddr = kvmhv_load_from_eaddr,
 	.store_to_eaddr = kvmhv_store_to_eaddr,
+	.svm_off = kvmhv_svm_off,
 };
 
 static int kvm_init_subcore_bitmap(void)
diff --git a/arch/powerpc/kvm/book3s_hv_devm.c b/arch/powerpc/kvm/book3s_hv_devm.c
index 19cfad340a51..6509caf9b926 100644
--- a/arch/powerpc/kvm/book3s_hv_devm.c
+++ b/arch/powerpc/kvm/book3s_hv_devm.c
@@ -37,6 +37,7 @@
 #include <linux/migrate.h>
 #include <linux/kvm_host.h>
 #include <asm/ultravisor.h>
+#include <asm/kvm_ppc.h>
 
 static struct dev_pagemap kvmppc_devm_pgmap;
 static unsigned long *kvmppc_devm_pfn_bitmap;
@@ -85,9 +86,68 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 		return H_UNSUPPORTED;
 
 	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
+	if (kvm_is_radix(kvm)) {
+		pr_info("LPID %d went secure, freeing HV side radix pgtables\n",
+			kvm->arch.lpid);
+		kvmppc_free_radix(kvm);
+	}
+
 	return H_SUCCESS;
 }
 
+/*
+ * Drop device pages that we maintain for the secure guest
+ *
+ * We first mark the pages to be skipped from UV_PAGE_OUT when there
+ * is HV side fault on these pages. Next we *get* these pages, forcing
+ * fault on them, do fault time migration to replace the device PTEs in
+ * QEMU page table with normal PTEs from newly allocated pages.
+ */
+static void kvmppc_devm_drop_pages(struct kvm_memory_slot *free,
+				   struct kvm *kvm)
+{
+	int i;
+	struct kvmppc_devm_page_pvt *pvt;
+	unsigned long pfn;
+
+	for (i = 0; i < free->npages; i++) {
+		unsigned long *rmap = &free->arch.rmap[i];
+		struct page *devm_page;
+
+		if (kvmppc_rmap_is_devm_pfn(*rmap)) {
+			devm_page = pfn_to_page(*rmap & ~KVMPPC_RMAP_DEVM_PFN);
+			pvt = (struct kvmppc_devm_page_pvt *)
+				devm_page->zone_device_data;
+			pvt->skip_page_out = true;
+
+			pfn = gfn_to_pfn(kvm, pvt->gpa >> PAGE_SHIFT);
+			if (is_error_noslot_pfn(pfn))
+				continue;
+			kvm_release_pfn_clean(pfn);
+		}
+	}
+}
+
+/*
+ * Called from KVM_PPC_SVM_OFF ioctl when secure guest is reset
+ *
+ * UV has already cleaned up the guest, we release any device pages
+ * that we maintain
+ */
+void kvmppc_devm_free_memslot_pfns(struct kvm *kvm, struct kvm_memslots *slots)
+{
+	struct kvm_memory_slot *memslot;
+	int srcu_idx;
+
+	if (!slots)
+		return;
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	kvm_for_each_memslot(memslot, slots)
+		kvmppc_devm_drop_pages(memslot, kvm);
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+}
+
 /*
  * Get a free device PFN from the pool
  *
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 0dba7eb24f92..77dceaa8fb55 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -31,6 +31,8 @@
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
 #endif
+#include <asm/ultravisor.h>
+#include <asm/kvm_host.h>
 
 #include "timing.h"
 #include "irq.h"
@@ -2415,6 +2417,16 @@ long kvm_arch_vm_ioctl(struct file *filp,
 			r = -EFAULT;
 		break;
 	}
+	case KVM_PPC_SVM_OFF: {
+		struct kvm *kvm = filp->private_data;
+
+		r = 0;
+		if (!kvm->arch.kvm_ops->svm_off)
+			goto out;
+
+		r = kvm->arch.kvm_ops->svm_off(kvm);
+		break;
+	}
 	default: {
 		struct kvm *kvm = filp->private_data;
 		r = kvm->arch.kvm_ops->arch_vm_ioctl(filp, ioctl, arg);
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index a7c19540ce21..07041a64e21f 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1332,6 +1332,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_GET_CPU_CHAR	  _IOR(KVMIO,  0xb1, struct kvm_ppc_cpu_char)
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
+#define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.21.0


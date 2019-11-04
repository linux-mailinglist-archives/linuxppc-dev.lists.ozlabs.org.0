Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A068ED840
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:32:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4760Jy28vBzF3Zg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:32:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600N6phMzF4xB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA44E3Wi023881
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 3 Nov 2019 23:18:26 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w27g37xm6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:18:25 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 4 Nov 2019 04:18:23 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 04:18:21 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA44HjkF40305126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 04:17:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2577052052;
 Mon,  4 Nov 2019 04:18:20 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50BE55204E;
 Mon,  4 Nov 2019 04:18:18 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v10 6/8] KVM: PPC: Support reset of secure guest
Date: Mon,  4 Nov 2019 09:47:58 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104041800.24527-1-bharata@linux.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110404-0028-0000-0000-000003B25DA5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110404-0029-0000-0000-00002474AF6C
Message-Id: <20191104041800.24527-7-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-04_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
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
 Documentation/virt/kvm/api.txt            | 19 +++++
 arch/powerpc/include/asm/kvm_ppc.h        |  2 +
 arch/powerpc/include/asm/ultravisor-api.h |  1 +
 arch/powerpc/include/asm/ultravisor.h     |  5 ++
 arch/powerpc/kvm/book3s_hv.c              | 88 +++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv_uvmem.c        |  6 ++
 arch/powerpc/kvm/powerpc.c                | 12 ++++
 include/uapi/linux/kvm.h                  |  1 +
 8 files changed, 134 insertions(+)

diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.txt
index 4833904d32a5..1b2e1d2002ba 100644
--- a/Documentation/virt/kvm/api.txt
+++ b/Documentation/virt/kvm/api.txt
@@ -4126,6 +4126,25 @@ Valid values for 'action':
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
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index ee62776e5433..6d1bb597fe95 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -177,6 +177,7 @@ extern void kvm_spapr_tce_release_iommu_group(struct kvm *kvm,
 extern int kvmppc_switch_mmu_to_hpt(struct kvm *kvm);
 extern int kvmppc_switch_mmu_to_radix(struct kvm *kvm);
 extern void kvmppc_setup_partition_table(struct kvm *kvm);
+int kvmppc_reinit_partition_table(struct kvm *kvm);
 
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
index 4b0d044caa2a..b66f6db7be6c 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -34,5 +34,6 @@
 #define UV_UNSHARE_PAGE			0xF134
 #define UV_UNSHARE_ALL_PAGES		0xF140
 #define UV_PAGE_INVAL			0xF138
+#define UV_SVM_TERMINATE		0xF13C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index b8e59b7b4ac8..790b0e63681f 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -77,4 +77,9 @@ static inline int uv_page_inval(u64 lpid, u64 gpa, u64 page_shift)
 	return ucall_norets(UV_PAGE_INVAL, lpid, gpa, page_shift);
 }
 
+static inline int uv_svm_terminate(u64 lpid)
+{
+	return ucall_norets(UV_SVM_TERMINATE, lpid);
+}
+
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cb7ae1e9e4f2..d2bc4e9bbe7e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2443,6 +2443,15 @@ static void unpin_vpa(struct kvm *kvm, struct kvmppc_vpa *vpa)
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
@@ -4611,6 +4620,25 @@ void kvmppc_setup_partition_table(struct kvm *kvm)
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
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE))
+		return 0;
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
@@ -5000,6 +5028,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		if (nesting_enabled(kvm))
 			kvmhv_release_all_nested(kvm);
 		kvm->arch.process_table = 0;
+		uv_svm_terminate(kvm->arch.lpid);
 		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 
@@ -5442,6 +5471,64 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
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
+	int srcu_idx;
+	int ret = 0;
+	int i;
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return ret;
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+		struct kvm_memory_slot *memslot;
+		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
+
+		if (!slots)
+			continue;
+
+		kvm_for_each_memslot(memslot, slots) {
+			kvmppc_uvmem_drop_pages(memslot, kvm, true);
+			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
+		}
+	}
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+
+	ret = uv_svm_terminate(kvm->arch.lpid);
+	if (ret != U_SUCCESS) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		spin_lock(&vcpu->arch.vpa_update_lock);
+		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
+		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
+		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
+		spin_unlock(&vcpu->arch.vpa_update_lock);
+	}
+
+	ret = kvmppc_reinit_partition_table(kvm);
+	if (ret)
+		goto out;
+
+	kvm->arch.secure_guest = 0;
+out:
+	return ret;
+}
+
 static struct kvmppc_ops kvm_ops_hv = {
 	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
 	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
@@ -5484,6 +5571,7 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.enable_nested = kvmhv_enable_nested,
 	.load_from_eaddr = kvmhv_load_from_eaddr,
 	.store_to_eaddr = kvmhv_store_to_eaddr,
+	.svm_off = kvmhv_svm_off,
 };
 
 static int kvm_init_subcore_bitmap(void)
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 6f26a0351a31..2df0d3f80c60 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -93,6 +93,7 @@
 #include <linux/ksm.h>
 #include <asm/ultravisor.h>
 #include <asm/mman.h>
+#include <asm/kvm_ppc.h>
 
 static struct dev_pagemap kvmppc_uvmem_pgmap;
 static unsigned long *kvmppc_uvmem_bitmap;
@@ -237,6 +238,11 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
 		return H_UNSUPPORTED;
 
+	if (kvm_is_radix(kvm)) {
+		kvmppc_free_radix(kvm);
+		pr_info("LPID %d went secure, freed HV side radix pgtables\n",
+			kvm->arch.lpid);
+	}
 	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
 	return H_SUCCESS;
 }
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 3a77bb643452..ec9713c1d928 100644
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
@@ -2411,6 +2413,16 @@ long kvm_arch_vm_ioctl(struct file *filp,
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
index 52641d8ca9e8..efa8ad88cbd2 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1337,6 +1337,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_GET_CPU_CHAR	  _IOR(KVMIO,  0xb1, struct kvm_ppc_cpu_char)
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
+#define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.21.0


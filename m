Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A11086C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 04:19:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lsj15FHGzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 14:19:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LsQC66rPzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 14:06:59 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP32LM8064680
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 22:06:56 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wfju89q3k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 22:06:56 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 25 Nov 2019 03:06:54 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Nov 2019 03:06:51 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAP36oad50987186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 03:06:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 523B24C040;
 Mon, 25 Nov 2019 03:06:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D15B4C044;
 Mon, 25 Nov 2019 03:06:48 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.39])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Nov 2019 03:06:48 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v11 6/7] KVM: PPC: Support reset of secure guest
Date: Mon, 25 Nov 2019 08:36:30 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125030631.7716-1-bharata@linux.ibm.com>
References: <20191125030631.7716-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112503-0028-0000-0000-000003BF0223
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112503-0029-0000-0000-00002482341D
Message-Id: <20191125030631.7716-7-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-24_04:2019-11-21,2019-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250026
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

- Release all device pages of the secure guest.
- Ask UV to terminate the guest via UV_SVM_TERMINATE ucall
- Unpin the VPA pages so that they can be migrated back to secure
  side when guest becomes secure again. This is required because
  pinned pages can't be migrated.
- Reinit the partition scoped page tables

After these steps, guest is ready to issue UV_ESM call once again
to switch to secure mode.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
	[Implementation of uv_svm_terminate() and its call from
	guest shutdown path]
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
	[Unpinning of VPA pages]
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
	[Prevent any vpus from running when unpinng VPAs]
---
 Documentation/virt/kvm/api.txt            | 18 +++++
 arch/powerpc/include/asm/kvm_ppc.h        |  1 +
 arch/powerpc/include/asm/ultravisor-api.h |  1 +
 arch/powerpc/include/asm/ultravisor.h     |  5 ++
 arch/powerpc/kvm/book3s_hv.c              | 90 +++++++++++++++++++++++
 arch/powerpc/kvm/powerpc.c                | 12 +++
 include/uapi/linux/kvm.h                  |  1 +
 7 files changed, 128 insertions(+)

diff --git a/Documentation/virt/kvm/api.txt b/Documentation/virt/kvm/api.txt
index 4833904d32a5..5a773bd3e686 100644
--- a/Documentation/virt/kvm/api.txt
+++ b/Documentation/virt/kvm/api.txt
@@ -4126,6 +4126,24 @@ Valid values for 'action':
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
+unpins the VPA pages and releases all the device pages that are used to
+track the secure pages by hypervisor.
 
 5. The kvm_run structure
 ------------------------
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index ee62776e5433..3713e8e4d7ea 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -321,6 +321,7 @@ struct kvmppc_ops {
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
index cb7ae1e9e4f2..a0bc1722dec1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5000,6 +5000,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		if (nesting_enabled(kvm))
 			kvmhv_release_all_nested(kvm);
 		kvm->arch.process_table = 0;
+		uv_svm_terminate(kvm->arch.lpid);
 		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 
@@ -5442,6 +5443,94 @@ static int kvmhv_store_to_eaddr(struct kvm_vcpu *vcpu, ulong *eaddr, void *ptr,
 	return rc;
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
+/*
+ *  IOCTL handler to turn off secure mode of guest
+ *
+ * - Release all device pages
+ * - Issue ucall to terminate the guest on the UV side
+ * - Unpin the VPA pages.
+ * - Reinit the partition scoped page tables
+ */
+static int kvmhv_svm_off(struct kvm *kvm)
+{
+	struct kvm_vcpu *vcpu;
+	int mmu_was_ready;
+	int srcu_idx;
+	int ret = 0;
+	int i;
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return ret;
+
+	mutex_lock(&kvm->arch.mmu_setup_lock);
+	mmu_was_ready = kvm->arch.mmu_ready;
+	if (kvm->arch.mmu_ready) {
+		kvm->arch.mmu_ready = 0;
+		/* order mmu_ready vs. vcpus_running */
+		smp_mb();
+		if (atomic_read(&kvm->arch.vcpus_running)) {
+			kvm->arch.mmu_ready = 1;
+			ret = -EBUSY;
+			goto out;
+		}
+	}
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
+			kvmppc_uvmem_drop_pages(memslot, kvm);
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
+	/*
+	 * When secure guest is reset, all the guest pages are sent
+	 * to UV via UV_PAGE_IN before the non-boot vcpus get a
+	 * chance to run and unpin their VPA pages. Unpinning of all
+	 * VPA pages is done here explicitly so that VPA pages
+	 * can be migrated to the secure side.
+	 *
+	 * This is required to for the secure SMP guest to reboot
+	 * correctly.
+	 */
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		spin_lock(&vcpu->arch.vpa_update_lock);
+		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
+		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
+		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
+		spin_unlock(&vcpu->arch.vpa_update_lock);
+	}
+
+	kvmppc_setup_partition_table(kvm);
+	kvm->arch.secure_guest = 0;
+	kvm->arch.mmu_ready = mmu_was_ready;
+out:
+	mutex_unlock(&kvm->arch.mmu_setup_lock);
+	return ret;
+}
+
 static struct kvmppc_ops kvm_ops_hv = {
 	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
 	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
@@ -5484,6 +5573,7 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.enable_nested = kvmhv_enable_nested,
 	.load_from_eaddr = kvmhv_load_from_eaddr,
 	.store_to_eaddr = kvmhv_store_to_eaddr,
+	.svm_off = kvmhv_svm_off,
 };
 
 static int kvm_init_subcore_bitmap(void)
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


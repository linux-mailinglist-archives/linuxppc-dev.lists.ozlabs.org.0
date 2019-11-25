Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8F1086C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 04:12:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LsXd5tsvzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 14:12:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LsQ311FVzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 14:06:50 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP34IT7047526
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 22:06:48 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wfk3n1eph-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2019 22:06:48 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 25 Nov 2019 03:06:46 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Nov 2019 03:06:43 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAP36fuT65732774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 03:06:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2094C04A;
 Mon, 25 Nov 2019 03:06:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB5C4C044;
 Mon, 25 Nov 2019 03:06:39 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.39])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Nov 2019 03:06:39 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v11 2/7] KVM: PPC: Support for running secure guests
Date: Mon, 25 Nov 2019 08:36:26 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125030631.7716-1-bharata@linux.ibm.com>
References: <20191125030631.7716-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112503-0016-0000-0000-000002CBC896
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112503-0017-0000-0000-0000332D999C
Message-Id: <20191125030631.7716-3-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-24_04:2019-11-21,2019-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=2 classifier=spam adjust=0 reason=mlx
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

A pseries guest can be run as secure guest on Ultravisor-enabled
POWER platforms. On such platforms, this driver will be used to manage
the movement of guest pages between the normal memory managed by
hypervisor (HV) and secure memory managed by Ultravisor (UV).

HV is informed about the guest's transition to secure mode via hcalls:

H_SVM_INIT_START: Initiate securing a VM
H_SVM_INIT_DONE: Conclude securing a VM

As part of H_SVM_INIT_START, register all existing memslots with
the UV. H_SVM_INIT_DONE call by UV informs HV that transition of
the guest to secure mode is complete.

These two states (transition to secure mode STARTED and transition
to secure mode COMPLETED) are recorded in kvm->arch.secure_guest.
Setting these states will cause the assembly code that enters the
guest to call the UV_RETURN ucall instead of trying to enter the
guest directly.

Migration of pages betwen normal and secure memory of secure
guest is implemented in H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.

H_SVM_PAGE_IN: Move the content of a normal page to secure page
H_SVM_PAGE_OUT: Move the content of a secure page to normal page

Private ZONE_DEVICE memory equal to the amount of secure memory
available in the platform for running secure guests is created.
Whenever a page belonging to the guest becomes secure, a page from
this private device memory is used to represent and track that secure
page on the HV side. The movement of pages between normal and secure
memory is done via migrate_vma_pages() using UV_PAGE_IN and
UV_PAGE_OUT ucalls.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h           |   6 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  62 ++
 arch/powerpc/include/asm/kvm_host.h         |   6 +
 arch/powerpc/include/asm/ultravisor-api.h   |   3 +
 arch/powerpc/include/asm/ultravisor.h       |  21 +
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_hv.c                |  29 +
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 628 ++++++++++++++++++++
 8 files changed, 758 insertions(+)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 11112023e327..4150732c81a0 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -342,6 +342,12 @@
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
 
+/* Platform-specific hcalls used by the Ultravisor */
+#define H_SVM_PAGE_IN		0xEF00
+#define H_SVM_PAGE_OUT		0xEF04
+#define H_SVM_INIT_START	0xEF08
+#define H_SVM_INIT_DONE		0xEF0C
+
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR		1
 #define H_SET_MODE_RESOURCE_SET_DAWR		2
diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
new file mode 100644
index 000000000000..95f389c2937b
--- /dev/null
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KVM_BOOK3S_UVMEM_H__
+#define __ASM_KVM_BOOK3S_UVMEM_H__
+
+#ifdef CONFIG_PPC_UV
+int kvmppc_uvmem_init(void);
+void kvmppc_uvmem_free(void);
+int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot);
+void kvmppc_uvmem_slot_free(struct kvm *kvm,
+			    const struct kvm_memory_slot *slot);
+unsigned long kvmppc_h_svm_page_in(struct kvm *kvm,
+				   unsigned long gra,
+				   unsigned long flags,
+				   unsigned long page_shift);
+unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
+				    unsigned long gra,
+				    unsigned long flags,
+				    unsigned long page_shift);
+unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
+unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
+#else
+static inline int kvmppc_uvmem_init(void)
+{
+	return 0;
+}
+
+static inline void kvmppc_uvmem_free(void) { }
+
+static inline int
+kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
+{
+	return 0;
+}
+
+static inline void
+kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot) { }
+
+static inline unsigned long
+kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gra,
+		     unsigned long flags, unsigned long page_shift)
+{
+	return H_UNSUPPORTED;
+}
+
+static inline unsigned long
+kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gra,
+		      unsigned long flags, unsigned long page_shift)
+{
+	return H_UNSUPPORTED;
+}
+
+static inline unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
+{
+	return H_UNSUPPORTED;
+}
+
+static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
+{
+	return H_UNSUPPORTED;
+}
+#endif /* CONFIG_PPC_UV */
+#endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6fe6ad64cba5..577ca95fac7c 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -275,6 +275,10 @@ struct kvm_hpt_info {
 
 struct kvm_resize_hpt;
 
+/* Flag values for kvm_arch.secure_guest */
+#define KVMPPC_SECURE_INIT_START 0x1 /* H_SVM_INIT_START has been called */
+#define KVMPPC_SECURE_INIT_DONE  0x2 /* H_SVM_INIT_DONE completed */
+
 struct kvm_arch {
 	unsigned int lpid;
 	unsigned int smt_mode;		/* # vcpus per virtual core */
@@ -330,6 +334,8 @@ struct kvm_arch {
 #endif
 	struct kvmppc_ops *kvm_ops;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	struct mutex uvmem_lock;
+	struct list_head uvmem_pfns;
 	struct mutex mmu_setup_lock;	/* nests inside vcpu mutexes */
 	u64 l1_ptcr;
 	int max_nested_lpid;
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index 4fcda1d5793d..2483f15bd71a 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -26,6 +26,9 @@
 #define UV_WRITE_PATE			0xF104
 #define UV_RETURN			0xF11C
 #define UV_ESM				0xF110
+#define UV_REGISTER_MEM_SLOT		0xF120
+#define UV_PAGE_IN			0xF128
+#define UV_PAGE_OUT			0xF12C
 #define UV_SHARE_PAGE			0xF130
 #define UV_UNSHARE_PAGE			0xF134
 #define UV_UNSHARE_ALL_PAGES		0xF140
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index b1bc2e043ed4..79bb005e8ee9 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -46,4 +46,25 @@ static inline int uv_unshare_all_pages(void)
 	return ucall_norets(UV_UNSHARE_ALL_PAGES);
 }
 
+static inline int uv_page_in(u64 lpid, u64 src_ra, u64 dst_gpa, u64 flags,
+			     u64 page_shift)
+{
+	return ucall_norets(UV_PAGE_IN, lpid, src_ra, dst_gpa, flags,
+			    page_shift);
+}
+
+static inline int uv_page_out(u64 lpid, u64 dst_ra, u64 src_gpa, u64 flags,
+			      u64 page_shift)
+{
+	return ucall_norets(UV_PAGE_OUT, lpid, dst_ra, src_gpa, flags,
+			    page_shift);
+}
+
+static inline int uv_register_mem_slot(u64 lpid, u64 start_gpa, u64 size,
+				       u64 flags, u64 slotid)
+{
+	return ucall_norets(UV_REGISTER_MEM_SLOT, lpid, start_gpa,
+			    size, flags, slotid);
+}
+
 #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4c67cc79de7c..2bfeaa13befb 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -71,6 +71,9 @@ kvm-hv-y += \
 	book3s_64_mmu_radix.o \
 	book3s_hv_nested.o
 
+kvm-hv-$(CONFIG_PPC_UV) += \
+	book3s_hv_uvmem.o
+
 kvm-hv-$(CONFIG_PPC_TRANSACTIONAL_MEM) += \
 	book3s_hv_tm.o
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 709cf1fd4cf4..80e84277d11f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -72,6 +72,8 @@
 #include <asm/xics.h>
 #include <asm/xive.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/kvm_host.h>
+#include <asm/kvm_book3s_uvmem.h>
 
 #include "book3s.h"
 
@@ -1078,6 +1080,25 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 					 kvmppc_get_gpr(vcpu, 5),
 					 kvmppc_get_gpr(vcpu, 6));
 		break;
+	case H_SVM_PAGE_IN:
+		ret = kvmppc_h_svm_page_in(vcpu->kvm,
+					   kvmppc_get_gpr(vcpu, 4),
+					   kvmppc_get_gpr(vcpu, 5),
+					   kvmppc_get_gpr(vcpu, 6));
+		break;
+	case H_SVM_PAGE_OUT:
+		ret = kvmppc_h_svm_page_out(vcpu->kvm,
+					    kvmppc_get_gpr(vcpu, 4),
+					    kvmppc_get_gpr(vcpu, 5),
+					    kvmppc_get_gpr(vcpu, 6));
+		break;
+	case H_SVM_INIT_START:
+		ret = kvmppc_h_svm_init_start(vcpu->kvm);
+		break;
+	case H_SVM_INIT_DONE:
+		ret = kvmppc_h_svm_init_done(vcpu->kvm);
+		break;
+
 	default:
 		return RESUME_HOST;
 	}
@@ -4784,6 +4805,8 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	char buf[32];
 	int ret;
 
+	mutex_init(&kvm->arch.uvmem_lock);
+	INIT_LIST_HEAD(&kvm->arch.uvmem_pfns);
 	mutex_init(&kvm->arch.mmu_setup_lock);
 
 	/* Allocate the guest's logical partition ID */
@@ -4955,6 +4978,7 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		kvm->arch.process_table = 0;
 		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
+
 	kvmppc_free_lpid(kvm->arch.lpid);
 
 	kvmppc_free_pimap(kvm);
@@ -5544,11 +5568,16 @@ static int kvmppc_book3s_init_hv(void)
 			no_mixing_hpt_and_radix = true;
 	}
 
+	r = kvmppc_uvmem_init();
+	if (r < 0)
+		pr_err("KVM-HV: kvmppc_uvmem_init failed %d\n", r);
+
 	return r;
 }
 
 static void kvmppc_book3s_exit_hv(void)
 {
+	kvmppc_uvmem_free();
 	kvmppc_free_host_rm_ops();
 	if (kvmppc_radix_possible())
 		kvmppc_radix_exit();
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
new file mode 100644
index 000000000000..1b8f4a3ceb12
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -0,0 +1,628 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Secure pages management: Migration of pages between normal and secure
+ * memory of KVM guests.
+ *
+ * Copyright 2018 Bharata B Rao, IBM Corp. <bharata@linux.ibm.com>
+ */
+
+/*
+ * A pseries guest can be run as secure guest on Ultravisor-enabled
+ * POWER platforms. On such platforms, this driver will be used to manage
+ * the movement of guest pages between the normal memory managed by
+ * hypervisor (HV) and secure memory managed by Ultravisor (UV).
+ *
+ * The page-in or page-out requests from UV will come to HV as hcalls and
+ * HV will call back into UV via ultracalls to satisfy these page requests.
+ *
+ * Private ZONE_DEVICE memory equal to the amount of secure memory
+ * available in the platform for running secure guests is hotplugged.
+ * Whenever a page belonging to the guest becomes secure, a page from this
+ * private device memory is used to represent and track that secure page
+ * on the HV side.
+ */
+
+/*
+ * Notes on locking
+ *
+ * kvm->arch.uvmem_lock is a per-guest lock that prevents concurrent
+ * page-in and page-out requests for the same GPA. Concurrent accesses
+ * can either come via UV (guest vCPUs requesting for same page)
+ * or when HV and guest simultaneously access the same page.
+ * This mutex serializes the migration of page from HV(normal) to
+ * UV(secure) and vice versa. So the serialization points are around
+ * migrate_vma routines and page-in/out routines.
+ *
+ * Per-guest mutex comes with a cost though. Mainly it serializes the
+ * fault path as page-out can occur when HV faults on accessing secure
+ * guest pages. Currently UV issues page-in requests for all the guest
+ * PFNs one at a time during early boot (UV_ESM uvcall), so this is
+ * not a cause for concern. Also currently the number of page-outs caused
+ * by HV touching secure pages is very very low. If an when UV supports
+ * overcommitting, then we might see concurrent guest driven page-outs.
+ *
+ * Locking order
+ *
+ * 1. srcu_read_lock(&kvm->srcu) - Protects KVM memslots
+ * 2. down_read(&kvm->mm->mmap_sem) - find_vma, migrate_vma_pages and helpers
+ * 3. mutex_lock(&kvm->arch.uvmem_lock) - protects read/writes to uvmem slots
+ *					  thus acting as sync-points
+ *					  for page-in/out
+ */
+
+/*
+ * Notes on page size
+ *
+ * Currently UV uses 2MB mappings internally, but will issue H_SVM_PAGE_IN
+ * and H_SVM_PAGE_OUT hcalls in PAGE_SIZE(64K) granularity. HV tracks
+ * secure GPAs at 64K page size and maintains one device PFN for each
+ * 64K secure GPA. UV_PAGE_IN and UV_PAGE_OUT calls by HV are also issued
+ * for 64K page at a time.
+ *
+ * HV faulting on secure pages: When HV touches any secure page, it
+ * faults and issues a UV_PAGE_OUT request with 64K page size. Currently
+ * UV splits and remaps the 2MB page if necessary and copies out the
+ * required 64K page contents.
+ *
+ * In summary, the current secure pages handling code in HV assumes
+ * 64K page size and in fact fails any page-in/page-out requests of
+ * non-64K size upfront. If and when UV starts supporting multiple
+ * page-sizes, we need to break this assumption.
+ */
+
+#include <linux/pagemap.h>
+#include <linux/migrate.h>
+#include <linux/kvm_host.h>
+#include <linux/ksm.h>
+#include <asm/ultravisor.h>
+#include <asm/mman.h>
+#include <asm/kvm_ppc.h>
+
+static struct dev_pagemap kvmppc_uvmem_pgmap;
+static unsigned long *kvmppc_uvmem_bitmap;
+static DEFINE_SPINLOCK(kvmppc_uvmem_bitmap_lock);
+
+#define KVMPPC_UVMEM_PFN	(1UL << 63)
+
+struct kvmppc_uvmem_slot {
+	struct list_head list;
+	unsigned long nr_pfns;
+	unsigned long base_pfn;
+	unsigned long *pfns;
+};
+
+struct kvmppc_uvmem_page_pvt {
+	struct kvm *kvm;
+	unsigned long gpa;
+};
+
+int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+	p->pfns = vzalloc(array_size(slot->npages, sizeof(*p->pfns)));
+	if (!p->pfns) {
+		kfree(p);
+		return -ENOMEM;
+	}
+	p->nr_pfns = slot->npages;
+	p->base_pfn = slot->base_gfn;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	list_add(&p->list, &kvm->arch.uvmem_pfns);
+	mutex_unlock(&kvm->arch.uvmem_lock);
+
+	return 0;
+}
+
+/*
+ * All device PFNs are already released by the time we come here.
+ */
+void kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot)
+{
+	struct kvmppc_uvmem_slot *p, *next;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	list_for_each_entry_safe(p, next, &kvm->arch.uvmem_pfns, list) {
+		if (p->base_pfn == slot->base_gfn) {
+			vfree(p->pfns);
+			list_del(&p->list);
+			kfree(p);
+			break;
+		}
+	}
+	mutex_unlock(&kvm->arch.uvmem_lock);
+}
+
+static void kvmppc_uvmem_pfn_insert(unsigned long gfn, unsigned long uvmem_pfn,
+				    struct kvm *kvm)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			unsigned long index = gfn - p->base_pfn;
+
+			p->pfns[index] = uvmem_pfn | KVMPPC_UVMEM_PFN;
+			return;
+		}
+	}
+}
+
+static void kvmppc_uvmem_pfn_remove(unsigned long gfn, struct kvm *kvm)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			p->pfns[gfn - p->base_pfn] = 0;
+			return;
+		}
+	}
+}
+
+static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
+				    unsigned long *uvmem_pfn)
+{
+	struct kvmppc_uvmem_slot *p;
+
+	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list) {
+		if (gfn >= p->base_pfn && gfn < p->base_pfn + p->nr_pfns) {
+			unsigned long index = gfn - p->base_pfn;
+
+			if (p->pfns[index] & KVMPPC_UVMEM_PFN) {
+				if (uvmem_pfn)
+					*uvmem_pfn = p->pfns[index] &
+						     ~KVMPPC_UVMEM_PFN;
+				return true;
+			} else
+				return false;
+		}
+	}
+	return false;
+}
+
+unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
+{
+	struct kvm_memslots *slots;
+	struct kvm_memory_slot *memslot;
+	int ret = H_SUCCESS;
+	int srcu_idx;
+
+	if (!kvmppc_uvmem_bitmap)
+		return H_UNSUPPORTED;
+
+	/* Only radix guests can be secure guests */
+	if (!kvm_is_radix(kvm))
+		return H_UNSUPPORTED;
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(memslot, slots) {
+		if (kvmppc_uvmem_slot_init(kvm, memslot)) {
+			ret = H_PARAMETER;
+			goto out;
+		}
+		ret = uv_register_mem_slot(kvm->arch.lpid,
+					   memslot->base_gfn << PAGE_SHIFT,
+					   memslot->npages * PAGE_SIZE,
+					   0, memslot->id);
+		if (ret < 0) {
+			kvmppc_uvmem_slot_free(kvm, memslot);
+			ret = H_PARAMETER;
+			goto out;
+		}
+	}
+	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_START;
+out:
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	return ret;
+}
+
+unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
+{
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return H_UNSUPPORTED;
+
+	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_DONE;
+	pr_info("LPID %d went secure\n", kvm->arch.lpid);
+	return H_SUCCESS;
+}
+
+/*
+ * Get a free device PFN from the pool
+ *
+ * Called when a normal page is moved to secure memory (UV_PAGE_IN). Device
+ * PFN will be used to keep track of the secure page on HV side.
+ *
+ * Called with kvm->arch.uvmem_lock held
+ */
+static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
+{
+	struct page *dpage = NULL;
+	unsigned long bit, uvmem_pfn;
+	struct kvmppc_uvmem_page_pvt *pvt;
+	unsigned long pfn_last, pfn_first;
+
+	pfn_first = kvmppc_uvmem_pgmap.res.start >> PAGE_SHIFT;
+	pfn_last = pfn_first +
+		   (resource_size(&kvmppc_uvmem_pgmap.res) >> PAGE_SHIFT);
+
+	spin_lock(&kvmppc_uvmem_bitmap_lock);
+	bit = find_first_zero_bit(kvmppc_uvmem_bitmap,
+				  pfn_last - pfn_first);
+	if (bit >= (pfn_last - pfn_first))
+		goto out;
+	bitmap_set(kvmppc_uvmem_bitmap, bit, 1);
+	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+
+	pvt = kzalloc(sizeof(*pvt), GFP_KERNEL);
+	if (!pvt)
+		goto out_clear;
+
+	uvmem_pfn = bit + pfn_first;
+	kvmppc_uvmem_pfn_insert(gpa >> PAGE_SHIFT, uvmem_pfn, kvm);
+
+	pvt->gpa = gpa;
+	pvt->kvm = kvm;
+
+	dpage = pfn_to_page(uvmem_pfn);
+	dpage->zone_device_data = pvt;
+	get_page(dpage);
+	lock_page(dpage);
+	return dpage;
+out_clear:
+	spin_lock(&kvmppc_uvmem_bitmap_lock);
+	bitmap_clear(kvmppc_uvmem_bitmap, bit, 1);
+out:
+	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+	return NULL;
+}
+
+/*
+ * Alloc a PFN from private device memory pool and copy page from normal
+ * memory to secure memory using UV_PAGE_IN uvcall.
+ */
+static int
+kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
+		   unsigned long end, unsigned long gpa, struct kvm *kvm,
+		   unsigned long page_shift)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma mig;
+	struct page *spage;
+	unsigned long pfn;
+	struct page *dpage;
+	int ret = 0;
+
+	memset(&mig, 0, sizeof(mig));
+	mig.vma = vma;
+	mig.start = start;
+	mig.end = end;
+	mig.src = &src_pfn;
+	mig.dst = &dst_pfn;
+
+	ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
+			  MADV_UNMERGEABLE, &vma->vm_flags);
+	if (ret)
+		return ret;
+
+	ret = migrate_vma_setup(&mig);
+	if (ret)
+		return ret;
+
+	if (!(*mig.src & MIGRATE_PFN_MIGRATE)) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	dpage = kvmppc_uvmem_get_page(gpa, kvm);
+	if (!dpage) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	pfn = *mig.src >> MIGRATE_PFN_SHIFT;
+	spage = migrate_pfn_to_page(*mig.src);
+	if (spage)
+		uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+			   page_shift);
+
+	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	migrate_vma_pages(&mig);
+out_finalize:
+	migrate_vma_finalize(&mig);
+	return ret;
+}
+
+/*
+ * H_SVM_PAGE_IN: Move page from normal memory to secure memory.
+ */
+unsigned long
+kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
+		     unsigned long flags, unsigned long page_shift)
+{
+	unsigned long start, end;
+	struct vm_area_struct *vma;
+	int srcu_idx;
+	unsigned long gfn = gpa >> page_shift;
+	int ret;
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return H_UNSUPPORTED;
+
+	if (page_shift != PAGE_SHIFT)
+		return H_P3;
+
+	if (flags)
+		return H_P2;
+
+	ret = H_PARAMETER;
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	down_read(&kvm->mm->mmap_sem);
+
+	start = gfn_to_hva(kvm, gfn);
+	if (kvm_is_error_hva(start))
+		goto out;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	/* Fail the page-in request of an already paged-in page */
+	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
+		goto out_unlock;
+
+	end = start + (1UL << page_shift);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end)
+		goto out_unlock;
+
+	if (!kvmppc_svm_page_in(vma, start, end, gpa, kvm, page_shift))
+		ret = H_SUCCESS;
+out_unlock:
+	mutex_unlock(&kvm->arch.uvmem_lock);
+out:
+	up_read(&kvm->mm->mmap_sem);
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	return ret;
+}
+
+/*
+ * Provision a new page on HV side and copy over the contents
+ * from secure memory using UV_PAGE_OUT uvcall.
+ */
+static int
+kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
+		    unsigned long end, unsigned long page_shift,
+		    struct kvm *kvm, unsigned long gpa)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma mig;
+	struct page *dpage, *spage;
+	unsigned long pfn;
+	int ret = U_SUCCESS;
+
+	memset(&mig, 0, sizeof(mig));
+	mig.vma = vma;
+	mig.start = start;
+	mig.end = end;
+	mig.src = &src_pfn;
+	mig.dst = &dst_pfn;
+
+	mutex_lock(&kvm->arch.uvmem_lock);
+	/* The requested page is already paged-out, nothing to do */
+	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
+		goto out;
+
+	ret = migrate_vma_setup(&mig);
+	if (ret)
+		return ret;
+
+	spage = migrate_pfn_to_page(*mig.src);
+	if (!spage || !(*mig.src & MIGRATE_PFN_MIGRATE))
+		goto out_finalize;
+
+	if (!is_zone_device_page(spage))
+		goto out_finalize;
+
+	dpage = alloc_page_vma(GFP_HIGHUSER, vma, start);
+	if (!dpage) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	lock_page(dpage);
+	pfn = page_to_pfn(dpage);
+
+	ret = uv_page_out(kvm->arch.lpid, pfn << page_shift,
+			  gpa, 0, page_shift);
+	if (ret == U_SUCCESS)
+		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
+	else {
+		unlock_page(dpage);
+		__free_page(dpage);
+		goto out_finalize;
+	}
+
+	migrate_vma_pages(&mig);
+out_finalize:
+	migrate_vma_finalize(&mig);
+out:
+	mutex_unlock(&kvm->arch.uvmem_lock);
+	return ret;
+}
+
+/*
+ * Fault handler callback that gets called when HV touches any page that
+ * has been moved to secure memory, we ask UV to give back the page by
+ * issuing UV_PAGE_OUT uvcall.
+ *
+ * This eventually results in dropping of device PFN and the newly
+ * provisioned page/PFN gets populated in QEMU page tables.
+ */
+static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
+{
+	struct kvmppc_uvmem_page_pvt *pvt = vmf->page->zone_device_data;
+
+	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
+				vmf->address + PAGE_SIZE, PAGE_SHIFT,
+				pvt->kvm, pvt->gpa))
+		return VM_FAULT_SIGBUS;
+	else
+		return 0;
+}
+
+/*
+ * Release the device PFN back to the pool
+ *
+ * Gets called when secure page becomes a normal page during H_SVM_PAGE_OUT.
+ * Gets called with kvm->arch.uvmem_lock held.
+ */
+static void kvmppc_uvmem_page_free(struct page *page)
+{
+	unsigned long pfn = page_to_pfn(page) -
+			(kvmppc_uvmem_pgmap.res.start >> PAGE_SHIFT);
+	struct kvmppc_uvmem_page_pvt *pvt;
+
+	spin_lock(&kvmppc_uvmem_bitmap_lock);
+	bitmap_clear(kvmppc_uvmem_bitmap, pfn, 1);
+	spin_unlock(&kvmppc_uvmem_bitmap_lock);
+
+	pvt = page->zone_device_data;
+	page->zone_device_data = NULL;
+	kvmppc_uvmem_pfn_remove(pvt->gpa >> PAGE_SHIFT, pvt->kvm);
+	kfree(pvt);
+}
+
+static const struct dev_pagemap_ops kvmppc_uvmem_ops = {
+	.page_free = kvmppc_uvmem_page_free,
+	.migrate_to_ram	= kvmppc_uvmem_migrate_to_ram,
+};
+
+/*
+ * H_SVM_PAGE_OUT: Move page from secure memory to normal memory.
+ */
+unsigned long
+kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
+		      unsigned long flags, unsigned long page_shift)
+{
+	unsigned long gfn = gpa >> page_shift;
+	unsigned long start, end;
+	struct vm_area_struct *vma;
+	int srcu_idx;
+	int ret;
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return H_UNSUPPORTED;
+
+	if (page_shift != PAGE_SHIFT)
+		return H_P3;
+
+	if (flags)
+		return H_P2;
+
+	ret = H_PARAMETER;
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+	down_read(&kvm->mm->mmap_sem);
+	start = gfn_to_hva(kvm, gfn);
+	if (kvm_is_error_hva(start))
+		goto out;
+
+	end = start + (1UL << page_shift);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end)
+		goto out;
+
+	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa))
+		ret = H_SUCCESS;
+out:
+	up_read(&kvm->mm->mmap_sem);
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+	return ret;
+}
+
+static u64 kvmppc_get_secmem_size(void)
+{
+	struct device_node *np;
+	int i, len;
+	const __be32 *prop;
+	u64 size = 0;
+
+	np = of_find_compatible_node(NULL, NULL, "ibm,uv-firmware");
+	if (!np)
+		goto out;
+
+	prop = of_get_property(np, "secure-memory-ranges", &len);
+	if (!prop)
+		goto out_put;
+
+	for (i = 0; i < len / (sizeof(*prop) * 4); i++)
+		size += of_read_number(prop + (i * 4) + 2, 2);
+
+out_put:
+	of_node_put(np);
+out:
+	return size;
+}
+
+int kvmppc_uvmem_init(void)
+{
+	int ret = 0;
+	unsigned long size;
+	struct resource *res;
+	void *addr;
+	unsigned long pfn_last, pfn_first;
+
+	size = kvmppc_get_secmem_size();
+	if (!size) {
+		/*
+		 * Don't fail the initialization of kvm-hv module if
+		 * the platform doesn't export ibm,uv-firmware node.
+		 * Let normal guests run on such PEF-disabled platform.
+		 */
+		pr_info("KVMPPC-UVMEM: No support for secure guests\n");
+		goto out;
+	}
+
+	res = request_free_mem_region(&iomem_resource, size, "kvmppc_uvmem");
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		goto out;
+	}
+
+	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
+	kvmppc_uvmem_pgmap.res = *res;
+	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
+	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
+	if (IS_ERR(addr)) {
+		ret = PTR_ERR(addr);
+		goto out_free_region;
+	}
+
+	pfn_first = res->start >> PAGE_SHIFT;
+	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
+	kvmppc_uvmem_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
+				      sizeof(unsigned long), GFP_KERNEL);
+	if (!kvmppc_uvmem_bitmap) {
+		ret = -ENOMEM;
+		goto out_unmap;
+	}
+
+	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
+	return ret;
+out_unmap:
+	memunmap_pages(&kvmppc_uvmem_pgmap);
+out_free_region:
+	release_mem_region(res->start, size);
+out:
+	return ret;
+}
+
+void kvmppc_uvmem_free(void)
+{
+	memunmap_pages(&kvmppc_uvmem_pgmap);
+	release_mem_region(kvmppc_uvmem_pgmap.res.start,
+			   resource_size(&kvmppc_uvmem_pgmap.res));
+	kfree(kvmppc_uvmem_bitmap);
+}
-- 
2.21.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F318ABD7A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 07:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dR626w7PzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 15:13:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dQz12NKGzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 15:07:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8P52k21079256
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 01:07:06 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v80gnahv0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 01:07:06 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 25 Sep 2019 06:07:04 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Sep 2019 06:07:00 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8P56wHU56557656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 05:06:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2C76A4040;
 Wed, 25 Sep 2019 05:06:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D0EDA4053;
 Wed, 25 Sep 2019 05:06:56 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.52.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Sep 2019 05:06:56 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 2/8] KVM: PPC: Move pages between normal and secure memory
Date: Wed, 25 Sep 2019 10:36:43 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925050649.14926-1-bharata@linux.ibm.com>
References: <20190925050649.14926-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092505-0020-0000-0000-00000371422F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092505-0021-0000-0000-000021C70606
Message-Id: <20190925050649.14926-3-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909250050
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

Manage migration of pages betwen normal and secure memory of secure
guest by implementing H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.

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
 arch/powerpc/include/asm/hvcall.h           |   4 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  29 ++
 arch/powerpc/include/asm/kvm_host.h         |  13 +
 arch/powerpc/include/asm/ultravisor-api.h   |   2 +
 arch/powerpc/include/asm/ultravisor.h       |  14 +
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_hv.c                |  20 +
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 481 ++++++++++++++++++++
 8 files changed, 566 insertions(+)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_uvmem.c

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 11112023e327..2595d0144958 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -342,6 +342,10 @@
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
 
+/* Platform-specific hcalls used by the Ultravisor */
+#define H_SVM_PAGE_IN		0xEF00
+#define H_SVM_PAGE_OUT		0xEF04
+
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR		1
 #define H_SET_MODE_RESOURCE_SET_DAWR		2
diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
new file mode 100644
index 000000000000..9603c2b48d67
--- /dev/null
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __POWERPC_KVM_PPC_HMM_H__
+#define __POWERPC_KVM_PPC_HMM_H__
+
+#ifdef CONFIG_PPC_UV
+unsigned long kvmppc_h_svm_page_in(struct kvm *kvm,
+				   unsigned long gra,
+				   unsigned long flags,
+				   unsigned long page_shift);
+unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
+				    unsigned long gra,
+				    unsigned long flags,
+				    unsigned long page_shift);
+#else
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
+#endif /* CONFIG_PPC_UV */
+#endif /* __POWERPC_KVM_PPC_HMM_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 81cd221ccc04..a2e7502346a3 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -336,6 +336,7 @@ struct kvm_arch {
 #endif
 	struct kvmppc_ops *kvm_ops;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	struct mutex uvmem_lock;
 	struct mutex mmu_setup_lock;	/* nests inside vcpu mutexes */
 	u64 l1_ptcr;
 	int max_nested_lpid;
@@ -869,4 +870,16 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
+#ifdef CONFIG_PPC_UV
+int kvmppc_uvmem_init(void);
+void kvmppc_uvmem_free(void);
+#else
+static inline int kvmppc_uvmem_init(void)
+{
+	return 0;
+}
+
+static inline void kvmppc_uvmem_free(void) {}
+#endif /* CONFIG_PPC_UV */
+
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index 6a0f9c74f959..1cd1f595fd81 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -25,5 +25,7 @@
 /* opcodes */
 #define UV_WRITE_PATE			0xF104
 #define UV_RETURN			0xF11C
+#define UV_PAGE_IN			0xF128
+#define UV_PAGE_OUT			0xF12C
 
 #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index d7aa97aa7834..0fc4a974b2e8 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -31,4 +31,18 @@ static inline int uv_register_pate(u64 lpid, u64 dw0, u64 dw1)
 	return ucall_norets(UV_WRITE_PATE, lpid, dw0, dw1);
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
index cde3f5a4b3e4..ef532cce85f9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -72,6 +72,8 @@
 #include <asm/xics.h>
 #include <asm/xive.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/kvm_host.h>
+#include <asm/kvm_book3s_uvmem.h>
 
 #include "book3s.h"
 
@@ -1075,6 +1077,18 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
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
 	default:
 		return RESUME_HOST;
 	}
@@ -4769,6 +4783,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 	char buf[32];
 	int ret;
 
+	mutex_init(&kvm->arch.uvmem_lock);
 	mutex_init(&kvm->arch.mmu_setup_lock);
 
 	/* Allocate the guest's logical partition ID */
@@ -5523,11 +5538,16 @@ static int kvmppc_book3s_init_hv(void)
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
index 000000000000..312f0fedde0b
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -0,0 +1,481 @@
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
+ *
+ * For each page that gets moved into secure memory, a device PFN is used
+ * on the HV side and migration PTE corresponding to that PFN would be
+ * populated in the QEMU page tables. Device PFNs are stored in the rmap
+ * array. Whenever a guest page becomes secure, device PFN allocated for
+ * the same will be populated in the corresponding slot in the rmap
+ * array. The overloading of rmap array's usage which otherwise is
+ * used primarily by HPT guests means that this feature (secure
+ * guest on PEF platforms) is available only for Radix MMU guests.
+ * Also since the same rmap array is used differently by nested
+ * guests, a secure guest can't have further nested guests.
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
+ * It would have been desirable to use lock_rmap() which essentially
+ * is spinlock at guest PFN granularity. However migrate_vma_pages() and
+ * helpers can sleep and hence using spinlock across these routines is not
+ * possible. This first attempt uses a per-guest mutex though per-guest-PFN
+ * mutex would have been ideal and preferrable.
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
+ * 3. mutex_lock(&kvm->arch.uvmem_lock) - protects read/writes to rmap[] slots
+ *					thus acting as sync-points for
+ *					page-in/out
+ */
+
+#include <linux/pagemap.h>
+#include <linux/migrate.h>
+#include <linux/kvm_host.h>
+#include <asm/ultravisor.h>
+
+static struct dev_pagemap kvmppc_uvmem_pgmap;
+static unsigned long *kvmppc_uvmem_pfn_bitmap;
+static DEFINE_SPINLOCK(kvmppc_uvmem_pfn_lock);
+
+struct kvmppc_uvmem_page_pvt {
+	unsigned long *rmap;
+	struct kvm *kvm;
+	unsigned long gpa;
+};
+
+/*
+ * Get a free device PFN from the pool
+ *
+ * Called when a normal page is moved to secure memory (UV_PAGE_IN). Device
+ * PFN will be used to keep track of the secure page on HV side.
+ *
+ * @rmap here is the slot in the rmap array that corresponds to @gpa.
+ * An rmap entry of type KVMPPC_RMAP_UVMEM_PFN indicates that the
+ * corresponding guest page has become secure, and is not mapped on
+ * the HV side.
+ *
+ * Called with kvm->arch.uvmem_lock held
+ */
+static struct page *kvmppc_uvmem_get_page(unsigned long *rmap,
+					  unsigned long gpa, struct kvm *kvm)
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
+	spin_lock(&kvmppc_uvmem_pfn_lock);
+	bit = find_first_zero_bit(kvmppc_uvmem_pfn_bitmap,
+				  pfn_last - pfn_first);
+	if (bit >= (pfn_last - pfn_first))
+		goto out;
+	bitmap_set(kvmppc_uvmem_pfn_bitmap, bit, 1);
+	spin_unlock(&kvmppc_uvmem_pfn_lock);
+
+	pvt = kzalloc(sizeof(*pvt), GFP_KERNEL);
+	if (!pvt)
+		goto out_clear;
+
+	uvmem_pfn = bit + pfn_first;
+	dpage = pfn_to_page(uvmem_pfn);
+	*rmap = uvmem_pfn | KVMPPC_RMAP_UVMEM_PFN;
+	pvt->rmap = rmap;
+	pvt->gpa = gpa;
+	pvt->kvm = kvm;
+	dpage->zone_device_data = pvt;
+
+	get_page(dpage);
+	lock_page(dpage);
+	return dpage;
+out_clear:
+	spin_lock(&kvmppc_uvmem_pfn_lock);
+	bitmap_clear(kvmppc_uvmem_pfn_bitmap, bit, 1);
+out:
+	spin_unlock(&kvmppc_uvmem_pfn_lock);
+	return NULL;
+}
+
+/*
+ * Alloc a PFN from private device memory pool and copy page from normal
+ * memory to secure memory using UV_PAGE_IN uvcall.
+ */
+static int
+kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
+		   unsigned long end, unsigned long *rmap,
+		   unsigned long gpa, struct kvm *kvm,
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
+	ret = migrate_vma_setup(&mig);
+	if (ret)
+		return ret;
+
+	if (!(*mig.src & MIGRATE_PFN_MIGRATE)) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	dpage = kvmppc_uvmem_get_page(rmap, gpa, kvm);
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
+	struct kvm_memory_slot *slot;
+	unsigned long *rmap;
+	int ret;
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
+	slot = gfn_to_memslot(kvm, gfn);
+	if (!slot)
+		goto out;
+
+	start = gfn_to_hva(kvm, gfn);
+	if (kvm_is_error_hva(start))
+		goto out;
+
+	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
+	mutex_lock(&kvm->arch.uvmem_lock);
+	/* Fail the page-in request of an already paged-in page */
+	if (kvmppc_rmap_type(rmap) == KVMPPC_RMAP_UVMEM_PFN)
+		goto out_unlock;
+
+	end = start + (1UL << page_shift);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end)
+		goto out_unlock;
+
+	if (!kvmppc_svm_page_in(vma, start, end, rmap, gpa, kvm, page_shift))
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
+		    struct kvm *kvm, unsigned long *rmap)
+{
+	unsigned long src_pfn, dst_pfn = 0;
+	struct migrate_vma mig;
+	struct page *dpage, *spage;
+	struct kvmppc_uvmem_page_pvt *pvt;
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
+	if (kvmppc_rmap_type(rmap) != KVMPPC_RMAP_UVMEM_PFN)
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
+	pvt = spage->zone_device_data;
+	pfn = page_to_pfn(dpage);
+
+	ret = uv_page_out(pvt->kvm->arch.lpid, pfn << page_shift,
+			  pvt->gpa, 0, page_shift);
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
+				pvt->kvm, pvt->rmap))
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
+	spin_lock(&kvmppc_uvmem_pfn_lock);
+	bitmap_clear(kvmppc_uvmem_pfn_bitmap, pfn, 1);
+	spin_unlock(&kvmppc_uvmem_pfn_lock);
+
+	pvt = page->zone_device_data;
+	page->zone_device_data = NULL;
+	*pvt->rmap = 0;
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
+	struct kvm_memory_slot *slot;
+	unsigned long *rmap;
+	unsigned long start, end;
+	struct vm_area_struct *vma;
+	int srcu_idx;
+	int ret;
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
+	slot = gfn_to_memslot(kvm, gfn);
+	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
+	if (!kvmppc_svm_page_out(vma, start, end, page_shift, kvm, rmap))
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
+		ret = -ENODEV;
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
+	kvmppc_uvmem_pfn_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
+					  sizeof(unsigned long), GFP_KERNEL);
+	if (!kvmppc_uvmem_pfn_bitmap) {
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
+	kfree(kvmppc_uvmem_pfn_bitmap);
+}
-- 
2.21.0


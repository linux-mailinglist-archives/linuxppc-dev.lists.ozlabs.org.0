Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B818AE752
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SL0Y1XT4zDrgV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 19:51:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SKgG1ML6zDrQW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 19:36:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A9WZOl053774
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 05:36:53 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ux91x0n8w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 05:36:53 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 10 Sep 2019 10:36:51 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 10:36:48 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A9akFA25493730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 09:36:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76FEF11C05E;
 Tue, 10 Sep 2019 09:36:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E47511C052;
 Tue, 10 Sep 2019 09:36:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.35.217])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 10 Sep 2019 09:36:44 +0000 (GMT)
Date: Tue, 10 Sep 2019 15:06:42 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 2/8] kvmppc: Movement of pages between normal and
 secure memory
References: <20190910082946.7849-1-bharata@linux.ibm.com>
 <20190910082946.7849-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910082946.7849-3-bharata@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19091009-0012-0000-0000-000003496FE3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091009-0013-0000-0000-00002183D3A9
Message-Id: <20190910093642.GA1972@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100096
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 01:59:40PM +0530, Bharata B Rao wrote:
> +static struct page *kvmppc_uvmem_get_page(unsigned long *rmap,
> +					  unsigned long gpa, unsigned int lpid)
> +{
> +	struct page *dpage = NULL;
> +	unsigned long bit, uvmem_pfn;
> +	struct kvmppc_uvmem_page_pvt *pvt;
> +	unsigned long pfn_last, pfn_first;
> +
> +	pfn_first = kvmppc_uvmem_pgmap.res.start >> PAGE_SHIFT;
> +	pfn_last = pfn_first +
> +		   (resource_size(&kvmppc_uvmem_pgmap.res) >> PAGE_SHIFT);
> +
> +	spin_lock(&kvmppc_uvmem_pfn_lock);
> +	bit = find_first_zero_bit(kvmppc_uvmem_pfn_bitmap,
> +				  pfn_last - pfn_first);
> +	if (bit >= (pfn_last - pfn_first))
> +		goto out;
> +	bitmap_set(kvmppc_uvmem_pfn_bitmap, bit, 1);
> +
> +	uvmem_pfn = bit + pfn_first;
> +	dpage = pfn_to_page(uvmem_pfn);
> +	if (!trylock_page(dpage))
> +		goto out_clear;
> +
> +	pvt = kzalloc(sizeof(*pvt), GFP_KERNEL);

While re-arraging the code, I had moved this allocation to outside
of spinlock and changed from GFP_ATOMIC to GFP_KERNEL. But later
realized that error path exit would be cleaner with allocation under
the lock. So moved it back but missed changing it back to ATOMIC.

Here is the updated patch.

From a97e34cdb7e9bc411627690602c6fa484aa16c56 Mon Sep 17 00:00:00 2001
From: Bharata B Rao <bharata@linux.ibm.com>
Date: Wed, 22 May 2019 10:13:19 +0530
Subject: [PATCH v8 2/8] kvmppc: Movement of pages between normal and secure
 memory

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
 arch/powerpc/include/asm/kvm_host.h         |  12 +
 arch/powerpc/include/asm/ultravisor-api.h   |   2 +
 arch/powerpc/include/asm/ultravisor.h       |  14 +
 arch/powerpc/kvm/Makefile                   |   3 +
 arch/powerpc/kvm/book3s_hv.c                |  19 +
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 431 ++++++++++++++++++++
 8 files changed, 514 insertions(+)
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
index 81cd221ccc04..16633ad3be45 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -869,4 +869,16 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
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
index cde3f5a4b3e4..c5404db8f0cd 100644
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
@@ -5523,11 +5537,16 @@ static int kvmppc_book3s_init_hv(void)
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
index 000000000000..a4a038647650
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -0,0 +1,431 @@
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
+	unsigned int lpid;
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
+ * Thus a non-zero rmap entry indicates that the corresponding guest
+ * page has become secure, and is not mapped on the HV side.
+ *
+ * NOTE: lock_rmap() could be used to prevent concurrent page-in and
+ * page-out on the same GPA.
+ */
+static struct page *kvmppc_uvmem_get_page(unsigned long *rmap,
+					  unsigned long gpa, unsigned int lpid)
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
+
+	uvmem_pfn = bit + pfn_first;
+	dpage = pfn_to_page(uvmem_pfn);
+	if (!trylock_page(dpage))
+		goto out_clear;
+
+	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
+	if (!pvt)
+		goto out_unlock;
+	spin_unlock(&kvmppc_uvmem_pfn_lock);
+
+	*rmap = uvmem_pfn | KVMPPC_RMAP_UVMEM_PFN;
+	pvt->rmap = rmap;
+	pvt->gpa = gpa;
+	pvt->lpid = lpid;
+	dpage->zone_device_data = pvt;
+
+	get_page(dpage);
+	return dpage;
+
+out_unlock:
+	unlock_page(dpage);
+out_clear:
+	bitmap_clear(kvmppc_uvmem_pfn_bitmap, uvmem_pfn - pfn_first, 1);
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
+		   unsigned long gpa, unsigned int lpid,
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
+	spage = migrate_pfn_to_page(*mig.src);
+	pfn = *mig.src >> MIGRATE_PFN_SHIFT;
+	if (!spage || !(*mig.src & MIGRATE_PFN_MIGRATE)) {
+		ret = 0;
+		goto out_finalize;
+	}
+
+	dpage = kvmppc_uvmem_get_page(rmap, gpa, lpid);
+	if (!dpage) {
+		ret = -1;
+		goto out_finalize;
+	}
+
+	if (spage)
+		uv_page_in(lpid, pfn << page_shift, gpa, 0, page_shift);
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
+	rmap = &slot->arch.rmap[gfn - slot->base_gfn];
+	start = gfn_to_hva(kvm, gfn);
+	if (kvm_is_error_hva(start))
+		goto out;
+
+	if (kvmppc_rmap_type(rmap) == KVMPPC_RMAP_UVMEM_PFN)
+		goto out;
+
+	end = start + (1UL << page_shift);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end)
+		goto out;
+
+	if (!kvmppc_svm_page_in(vma, start, end, rmap, gpa, kvm->arch.lpid,
+				page_shift))
+		ret = H_SUCCESS;
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
+		    unsigned long end, unsigned long page_shift)
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
+	ret = uv_page_out(pvt->lpid, pfn << page_shift, pvt->gpa, 0,
+			  page_shift);
+
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
+	return ret;
+}
+
+/*
+ * Fault handler callback when HV touches any page that has been
+ * moved to secure memory, we ask UV to give back the page by
+ * issuing UV_PAGE_OUT uvcall.
+ *
+ * This eventually results in dropping of device PFN and the newly
+ * provisioned page/PFN gets populated in QEMU page tables.
+ */
+static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
+{
+	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
+				vmf->address + PAGE_SIZE, PAGE_SHIFT))
+		return VM_FAULT_SIGBUS;
+	else
+		return 0;
+}
+
+/*
+ * Release the device PFN back to the pool
+ *
+ * Gets called when secure page becomes a normal page during H_SVM_PAGE_OUT.
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
+	start = gfn_to_hva(kvm, gpa >> page_shift);
+	if (kvm_is_error_hva(start))
+		goto out;
+
+	end = start + (1UL << page_shift);
+	vma = find_vma_intersection(kvm->mm, start, end);
+	if (!vma || vma->vm_start > start || vma->vm_end < end)
+		goto out;
+
+	if (!kvmppc_svm_page_out(vma, start, end, page_shift))
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


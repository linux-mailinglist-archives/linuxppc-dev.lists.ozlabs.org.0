Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A16ED83F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:30:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4760Gb3ZKczF5Dj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:30:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600L6D6CzF4xB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:26 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA44CoYj023413
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 3 Nov 2019 23:18:25 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w28q1pd4u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:18:25 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 4 Nov 2019 04:18:22 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 04:18:19 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA44II1J50856088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 04:18:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17CC85204F;
 Mon,  4 Nov 2019 04:18:18 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C18915204E;
 Mon,  4 Nov 2019 04:18:15 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v10 5/8] KVM: PPC: Handle memory plug/unplug to secure VM
Date: Mon,  4 Nov 2019 09:47:57 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104041800.24527-1-bharata@linux.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110404-4275-0000-0000-0000037A759E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110404-4276-0000-0000-0000388DBA6A
Message-Id: <20191104041800.24527-6-bharata@linux.ibm.com>
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
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxram@us.ibm.com,
 cclaudio@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Register the new memslot with UV during plug and unregister
the memslot during unplug. In addition, release all the
device pages during unplug.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
	[Added skip_page_out arg to kvmppc_uvmem_drop_pages()]
---
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  6 ++++
 arch/powerpc/include/asm/ultravisor-api.h   |  1 +
 arch/powerpc/include/asm/ultravisor.h       |  5 +++
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |  3 ++
 arch/powerpc/kvm/book3s_hv.c                | 24 +++++++++++++
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 37 +++++++++++++++++++++
 6 files changed, 76 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index 3033a9585b43..3cf8425b9838 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -19,6 +19,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
+void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
+			     struct kvm *kvm, bool skip_page_out);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
@@ -64,5 +66,9 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
 	return -EFAULT;
 }
+
+static inline void
+kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
+			struct kvm *kvm, bool skip_page_out) { }
 #endif /* CONFIG_PPC_UV */
 #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
index e774274ab30e..4b0d044caa2a 100644
--- a/arch/powerpc/include/asm/ultravisor-api.h
+++ b/arch/powerpc/include/asm/ultravisor-api.h
@@ -27,6 +27,7 @@
 #define UV_RETURN			0xF11C
 #define UV_ESM				0xF110
 #define UV_REGISTER_MEM_SLOT		0xF120
+#define UV_UNREGISTER_MEM_SLOT		0xF124
 #define UV_PAGE_IN			0xF128
 #define UV_PAGE_OUT			0xF12C
 #define UV_SHARE_PAGE			0xF130
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
index 40cc8bace654..b8e59b7b4ac8 100644
--- a/arch/powerpc/include/asm/ultravisor.h
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -67,6 +67,11 @@ static inline int uv_register_mem_slot(u64 lpid, u64 start_gpa, u64 size,
 			    size, flags, slotid);
 }
 
+static inline int uv_unregister_mem_slot(u64 lpid, u64 slotid)
+{
+	return ucall_norets(UV_UNREGISTER_MEM_SLOT, lpid, slotid);
+}
+
 static inline int uv_page_inval(u64 lpid, u64 gpa, u64 page_shift)
 {
 	return ucall_norets(UV_PAGE_INVAL, lpid, gpa, page_shift);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 4aec55a0ebc7..ee70bfc28c82 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1101,6 +1101,9 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	unsigned long gpa;
 	unsigned int shift;
 
+	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
+		kvmppc_uvmem_drop_pages(memslot, kvm, true);
+
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return;
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 80e84277d11f..cb7ae1e9e4f2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -74,6 +74,7 @@
 #include <asm/hw_breakpoint.h>
 #include <asm/kvm_host.h>
 #include <asm/kvm_book3s_uvmem.h>
+#include <asm/ultravisor.h>
 
 #include "book3s.h"
 
@@ -4532,6 +4533,29 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
 	if (change == KVM_MR_FLAGS_ONLY && kvm_is_radix(kvm) &&
 	    ((new->flags ^ old->flags) & KVM_MEM_LOG_DIRTY_PAGES))
 		kvmppc_radix_flush_memslot(kvm, old);
+	/*
+	 * If UV hasn't yet called H_SVM_INIT_START, don't register memslots.
+	 */
+	if (!kvm->arch.secure_guest)
+		return;
+
+	switch (change) {
+	case KVM_MR_CREATE:
+		if (kvmppc_uvmem_slot_init(kvm, new))
+			return;
+		uv_register_mem_slot(kvm->arch.lpid,
+				     new->base_gfn << PAGE_SHIFT,
+				     new->npages * PAGE_SIZE,
+				     0, new->id);
+		break;
+	case KVM_MR_DELETE:
+		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
+		kvmppc_uvmem_slot_free(kvm, old);
+		break;
+	default:
+		/* TODO: Handle KVM_MR_MOVE */
+		break;
+	}
 }
 
 /*
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 6dbb11ee4bc0..6f26a0351a31 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -241,6 +241,43 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
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
+void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
+			     struct kvm *kvm, bool skip_page_out)
+{
+	int i;
+	struct kvmppc_uvmem_page_pvt *pvt;
+	unsigned long pfn, uvmem_pfn;
+	unsigned long gfn = free->base_gfn;
+
+	for (i = free->npages; i; --i, ++gfn) {
+		struct page *uvmem_page;
+
+		mutex_lock(&kvm->arch.uvmem_lock);
+		if (!kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
+			mutex_unlock(&kvm->arch.uvmem_lock);
+			continue;
+		}
+
+		uvmem_page = pfn_to_page(uvmem_pfn);
+		pvt = uvmem_page->zone_device_data;
+		pvt->skip_page_out = skip_page_out;
+		mutex_unlock(&kvm->arch.uvmem_lock);
+
+		pfn = gfn_to_pfn(kvm, gfn);
+		if (is_error_noslot_pfn(pfn))
+			continue;
+		kvm_release_pfn_clean(pfn);
+	}
+}
+
 /*
  * Get a free device PFN from the pool
  *
-- 
2.21.0


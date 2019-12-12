Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEB11D92A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 23:16:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yp6b3qF6zDr8r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 09:16:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yp4N3lBvzDr7x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 09:14:22 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCM2jsS061710; Thu, 12 Dec 2019 17:14:06 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuq3wpewn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 17:14:06 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBCM5FZh027340;
 Thu, 12 Dec 2019 22:14:10 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 2wr3q71rrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 22:14:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBCME5uk51184072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 22:14:05 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 306A71245CC;
 Thu, 12 Dec 2019 22:14:05 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 041351245C6;
 Thu, 12 Dec 2019 22:14:04 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.70.94.45])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 22:14:04 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 66D6D2E2101; Thu, 12 Dec 2019 14:14:03 -0800 (PST)
Date: Thu, 12 Dec 2019 14:14:03 -0800
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/1] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Message-ID: <20191212221402.GA3575@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_07:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120170
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
Cc: Paul Mackerras <pmac@au1.ibm.com>, linuxram@us.ibm.com,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This patch is based on Bharata's v11 KVM patches for secure guests:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-November/200918.html

---
From c0826bac72a658312f3d87e0bb18ecaf08ac2b2e Mon Sep 17 00:00:00 2001
From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Date: Fri, 27 Sep 2019 14:30:36 -0500
Subject: [PATCH v2 1/1] KVM: PPC: Implement H_SVM_INIT_ABORT hcall

Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
abort an SVM after it has issued the H_SVM_INIT_START and before the
H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
encounters security violations or other errors when starting an SVM.

Note that this hcall is different from UV_SVM_TERMINATE ucall which
is used by HV to terminate/cleanup an VM that has becore secure.

The H_SVM_INIT_ABORT should basically undo operations that were done
since the H_SVM_INIT_START hcall - i.e page-out all the VM pages back
to normal memory, unregister memslots etc.

(If we do not bring the pages back to normal memory, the text/data
of the VM would be stuck in secure memory and since the SVM did not
go secure, its MSR_S bit will be clear and the VM wont be able to
access its pages even to do a clean exit).

Based on patches and discussion with Paul Mackerras, Ram Pai and
Bharata Rao.

Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
Changelog[v2]:
	[Paul Mackerras] avoid returning to UV "one last time" after
	the state is cleaned up.  So, we now have H_SVM_INIT_ABORT:
	- take the VM's NIP/MSR register states as parameters
	- inherit the state of other registers as at UV_ESM call.
	After cleaning up the partial state, HV uses these to return
	directly to the VM with a failed UV_ESM call.
---
 Documentation/powerpc/ultravisor.rst        | 56 +++++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h           |  1 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h | 10 +++-
 arch/powerpc/include/asm/kvm_host.h         |  1 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c      |  2 +-
 arch/powerpc/kvm/book3s_hv.c                |  5 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 48 +++++++++++++++++-
 7 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index 730854f73830..ef49c9192775 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -948,6 +948,62 @@ Use cases
     up its internal state for this virtual machine.
 
 
+H_SVM_INIT_ABORT
+----------------
+
+    Abort the process of securing an SVM.
+
+Syntax
+~~~~~~
+
+.. code-block:: c
+
+	uint64_t hypercall(const uint64_t H_SVM_INIT_ABORT,
+		uint64_t guest_pc,      /* guest NIP to return to */
+		uint64_t guest_msr,     /* guest MSR value */
+
+Return values
+~~~~~~~~~~~~~
+
+    One of the following values:
+
+	* H_PARAMETER 		on successfully cleaning up the state, Hypervisor will
+	  return this value to the **guest**, to indicate that the underlying
+	  UV_ESM ultra call failed.
+
+	* H_UNSUPPORTED		if called from the wrong context (e.g. from an SVM
+	  or before an H_SVM_INIT_START hypercall). This will return to the
+	  Ultravisor which incorrectly issued the hcall.
+
+
+Description
+~~~~~~~~~~~
+
+    Abort the process of securing a virtual machine. This call must
+    be made after a prior call to ``H_SVM_INIT_START`` hypercall and
+    before a call to ``H_SVM_INIT_DONE``.
+
+    This hcall will cleanup any partial state that was established for
+    the VM since the prior ``H_SVM_INIT_START hcall`` including paging
+    out pages that were paged-into secure memory, unregistering memory
+    slots etc.
+
+    After the partial state is cleaned up, control returns to the address
+    specified in ``guest_pc`` with the MSR values set to ``guest_msr``.
+    These parameters are expected to match the state of NIP and MSR
+    registers of the VM at the time it issued the ``UV_ESM`` ultra call
+    to transition to a secure VM.
+
+Use cases
+~~~~~~~~~
+
+    If after a successful call to ``H_SVM_INIT_START``, the Ultravisor
+    encounters an error while securing a virtual machine, either due
+    to lack of resources or because the VM's security information could
+    not be validated, Ultravisor informs the Hypervisor about it.
+    Hypervisor should use this call to clean up any internal state for
+    this virtual machine and return to the VM.
+
 H_SVM_PAGE_IN
 -------------
 
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 13bd870609c3..e90c073e437e 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -350,6 +350,7 @@
 #define H_SVM_PAGE_OUT		0xEF04
 #define H_SVM_INIT_START	0xEF08
 #define H_SVM_INIT_DONE		0xEF0C
+#define H_SVM_INIT_ABORT	0xEF14
 
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR		1
diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
index 50204e228f16..2453bed88b97 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -19,8 +19,9 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
+unsigned long kvmppc_h_svm_init_abort(struct kvm_vcpu *vcpu);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm);
+			     struct kvm *kvm, bool skip_page_out);
 #else
 static inline int kvmppc_uvmem_init(void)
 {
@@ -62,6 +63,11 @@ static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	return H_UNSUPPORTED;
 }
 
+static inline unsigned long kvmppc_h_svm_init_abort(struct kvm_vcpu *vcpu)
+{
+	return H_UNSUPPORTED;
+}
+
 static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
 	return -EFAULT;
@@ -69,6 +75,6 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 
 static inline void
 kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			struct kvm *kvm) { }
+			struct kvm *kvm, bool skip_page_out) { }
 #endif /* CONFIG_PPC_UV */
 #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 577ca95fac7c..8310c0407383 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -278,6 +278,7 @@ struct kvm_resize_hpt;
 /* Flag values for kvm_arch.secure_guest */
 #define KVMPPC_SECURE_INIT_START 0x1 /* H_SVM_INIT_START has been called */
 #define KVMPPC_SECURE_INIT_DONE  0x2 /* H_SVM_INIT_DONE completed */
+#define KVMPPC_SECURE_INIT_ABORT 0x4 /* H_SVM_INIT_ABORT issued */
 
 struct kvm_arch {
 	unsigned int lpid;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index da857c8ba6e4..744dba98e5d1 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -1102,7 +1102,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	unsigned int shift;
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
-		kvmppc_uvmem_drop_pages(memslot, kvm);
+		kvmppc_uvmem_drop_pages(memslot, kvm, true);
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 597f4bfecf0e..b883d947d038 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1099,6 +1099,9 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_INIT_DONE:
 		ret = kvmppc_h_svm_init_done(vcpu->kvm);
 		break;
+	case H_SVM_INIT_ABORT:
+		ret = kvmppc_h_svm_init_abort(vcpu);
+		break;
 
 	default:
 		return RESUME_HOST;
@@ -5493,7 +5496,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 			continue;
 
 		kvm_for_each_memslot(memslot, slots) {
-			kvmppc_uvmem_drop_pages(memslot, kvm);
+			kvmppc_uvmem_drop_pages(memslot, kvm, true);
 			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
 		}
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index f24ac3cfb34c..881017dc8ff1 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -259,7 +259,7 @@ unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
  * QEMU page table with normal PTEs from newly allocated pages.
  */
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm)
+			     struct kvm *kvm, bool skip_page_out)
 {
 	int i;
 	struct kvmppc_uvmem_page_pvt *pvt;
@@ -277,7 +277,8 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 
 		uvmem_page = pfn_to_page(uvmem_pfn);
 		pvt = uvmem_page->zone_device_data;
-		pvt->skip_page_out = true;
+		pvt->skip_page_out = skip_page_out;
+
 		mutex_unlock(&kvm->arch.uvmem_lock);
 
 		pfn = gfn_to_pfn(kvm, gfn);
@@ -287,6 +288,49 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 	}
 }
 
+unsigned long kvmppc_h_svm_init_abort(struct kvm_vcpu *vcpu)
+{
+	int i;
+	ulong pc, msr;
+	struct kvm *kvm = vcpu->kvm;
+
+	pc = kvmppc_get_gpr(vcpu, 4);
+	msr = kvmppc_get_gpr(vcpu, 5);
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return H_UNSUPPORTED;
+
+	/*
+	 * we expect a guest address and guest MSR, so MSR_HV should
+	 * not be set. Warn and proceed to terminate the VM.
+	 */
+	if (msr & MSR_HV) {
+		pr_warning("MSR_HV set on H_SVM_INIT_ABORT call!\n");
+		msr &= ~MSR_HV;
+	}
+
+	for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
+		struct kvm_memory_slot *memslot;
+		struct kvm_memslots *slots = __kvm_memslots(kvm, i);
+
+		if (!slots)
+			continue;
+
+		kvm_for_each_memslot(memslot, slots) {
+			kvmppc_uvmem_drop_pages(memslot, kvm, false);
+			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
+		}
+	}
+
+	kvm->arch.secure_guest = 0;
+
+	/* Return to the point where VM issued UV_ESM ucall */
+	kvmppc_set_pc(vcpu, pc);
+	kvmppc_set_msr(vcpu, msr);
+
+	return H_PARAMETER;
+}
+
 /*
  * Get a free device PFN from the pool
  *
-- 
2.17.2


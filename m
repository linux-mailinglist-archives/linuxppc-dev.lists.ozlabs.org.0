Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12964ED841
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 05:35:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4760MX191RzF5Hs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:35:04 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600V15lVzF53W
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:33 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA44CvFp030397
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 3 Nov 2019 23:18:29 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w27mb846j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:18:28 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 4 Nov 2019 04:18:26 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 04:18:24 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA44IMjP32833772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 04:18:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 781DE5205A;
 Mon,  4 Nov 2019 04:18:22 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5F55052050;
 Mon,  4 Nov 2019 04:18:20 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v10 7/8] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Date: Mon,  4 Nov 2019 09:47:59 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104041800.24527-1-bharata@linux.ibm.com>
References: <20191104041800.24527-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110404-0012-0000-0000-000003606165
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110404-0013-0000-0000-0000219BB44F
Message-Id: <20191104041800.24527-8-bharata@linux.ibm.com>
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
 jglisse@redhat.com, Ram Pai <linuxram@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>

Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
abort an SVM after it has issued the H_SVM_INIT_START and before the
H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
encounters security violations or other errors when starting an SVM.

Note that this hcall is different from UV_SVM_TERMINATE ucall which
is used by HV to terminate/cleanup an SVM.

In case of H_SVM_INIT_ABORT, we should page-out all the pages back to
HV (i.e., we should not skip the page-out). Otherwise the VM's pages,
possibly including its text/data would be stuck in secure memory.
Since the SVM did not go secure, its MSR_S bit will be clear and the
VM wont be able to access its pages even to do a clean exit.

Based on patches and discussion with Ram Pai and Bharata Rao.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 Documentation/powerpc/ultravisor.rst        | 39 +++++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h           |  1 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  6 ++++
 arch/powerpc/include/asm/kvm_host.h         |  1 +
 arch/powerpc/kvm/book3s_hv.c                |  3 ++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S     | 23 ++++++++++--
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 29 +++++++++++++++
 7 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index 730854f73830..286cabadc566 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -948,6 +948,45 @@ Use cases
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
+	uint64_t hypercall(const uint64_t H_SVM_INIT_ABORT)
+
+Return values
+~~~~~~~~~~~~~
+
+    One of the following values:
+
+	* H_SUCCESS 		on success.
+	* H_UNSUPPORTED		if called from the wrong context (e.g.
+				from an SVM or before an H_SVM_INIT_START
+				hypercall).
+
+Description
+~~~~~~~~~~~
+
+    Abort the process of securing a virtual machine. This call must
+    be made after a prior call to ``H_SVM_INIT_START`` hypercall.
+
+Use cases
+~~~~~~~~~
+
+
+    On successfully securing a virtual machine, the Ultravisor informs
+    If the Ultravisor is unable to secure a virtual machine either due
+    to lack of resources or because the VM's security information could
+    not be validated, Ultravisor informs the Hypervisor about it.
+    Hypervisor can use this call to clean up any internal state for this
+    virtual machine.
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
index 3cf8425b9838..eaea400ea715 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -18,6 +18,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 				    unsigned long page_shift);
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
+unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 			     struct kvm *kvm, bool skip_page_out);
@@ -62,6 +63,11 @@ static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
 	return H_UNSUPPORTED;
 }
 
+static inline unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
+{
+	return H_UNSUPPORTED;
+}
+
 static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
 	return -EFAULT;
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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d2bc4e9bbe7e..ad4e38ce7b55 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1099,6 +1099,9 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_INIT_DONE:
 		ret = kvmppc_h_svm_init_done(vcpu->kvm);
 		break;
+	case H_SVM_INIT_ABORT:
+		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
+		break;
 
 	default:
 		return RESUME_HOST;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index faebcbb8c4db..8d192c9947cd 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1112,10 +1112,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	ld	r6, VCPU_KVM(r4)
 	lbz	r7, KVM_SECURE_GUEST(r6)
 	cmpdi	r7, 0
+	bne	check_svm_abort
+
 	ld	r6, VCPU_GPR(R6)(r4)
 	ld	r7, VCPU_GPR(R7)(r4)
-	bne	ret_to_ultra
-
 	lwz	r0, VCPU_CR(r4)
 	mtcr	r0
 
@@ -1125,6 +1125,21 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	ld	r4, VCPU_GPR(R4)(r4)
 	HRFI_TO_GUEST
 	b	.
+
+/*
+ * If SVM is about to abort, return to UV one last time but clear the
+ * secure_guest state so future fast_guest_returns return to the normal
+ * VM. We expect following state and we will restore the state.
+ *   R6 = kvm
+ *   R7 = kvm->secure_guest
+ */
+check_svm_abort:
+
+	cmpdi	r7, 4	/* KVMPPC_SECURE_INIT_ABORT */
+	bne	ret_to_ultra
+	li	r7, 0
+	stb	r7, KVM_SECURE_GUEST(r6)
+
 /*
  * Use UV_RETURN ultracall to return control back to the Ultravisor after
  * processing an hypercall or interrupt that was forwarded (a.k.a. reflected)
@@ -1134,8 +1149,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
  *   R0 = hcall result
  *   R2 = SRR1, so UV can detect a synthesized interrupt (if any)
  *   R3 = UV_RETURN
+ *   R6 = kvm (to be restored)
+ *   R7 = kvm->secure_guest (to be restored)
  */
 ret_to_ultra:
+	ld	r6, VCPU_GPR(R6)(r4)
+	ld	r7, VCPU_GPR(R7)(r4)
 	lwz	r0, VCPU_CR(r4)
 	mtcr	r0
 
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 2df0d3f80c60..627dfe4abf08 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -284,6 +284,35 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 	}
 }
 
+unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
+{
+	int i;
+	int srcu_idx;
+
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
+		return H_UNSUPPORTED;
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
+			kvmppc_uvmem_drop_pages(memslot, kvm, false);
+			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
+			kvmppc_uvmem_slot_free(kvm, memslot);
+		}
+	}
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+
+	kvm->arch.secure_guest = KVMPPC_SECURE_INIT_ABORT;
+	pr_info("LPID %d: Switching to secure aborted\n", kvm->arch.lpid);
+	return H_SUCCESS;
+}
+
 /*
  * Get a free device PFN from the pool
  *
-- 
2.21.0


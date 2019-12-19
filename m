Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF9F127014
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:56:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f5LP72dhzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 08:56:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f5F84J0bzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 08:51:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47f5F74sLXz8t9C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 08:51:55 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47f5F73rp9z9sRX; Fri, 20 Dec 2019 08:51:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47f5F66n8Nz9sRD;
 Fri, 20 Dec 2019 08:51:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJLlUBu113783; Thu, 19 Dec 2019 16:51:49 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x08cg9sjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 16:51:49 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBJLjm8p006582;
 Thu, 19 Dec 2019 21:51:48 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2wvqc7ed5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Dec 2019 21:51:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJLpmYc38928882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 21:51:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A376112064;
 Thu, 19 Dec 2019 21:51:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C2B112061;
 Thu, 19 Dec 2019 21:51:47 +0000 (GMT)
Received: from suka-w540.usor.ibm.com (unknown [9.70.94.45])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 21:51:47 +0000 (GMT)
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>, 
 linuxram@us.ibm.com
Subject: [PATCH v4 2/2] KVM: PPC: Implement H_SVM_INIT_ABORT hcall
Date: Thu, 19 Dec 2019 13:51:46 -0800
Message-Id: <20191219215146.27278-2-sukadev@linux.ibm.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191219215146.27278-1-sukadev@linux.ibm.com>
References: <20191219215146.27278-1-sukadev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_07:2019-12-17,2019-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190162
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
Cc: linux-mm@kvack.org, linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement the H_SVM_INIT_ABORT hcall which the Ultravisor can use to
abort an SVM after it has issued the H_SVM_INIT_START and before the
H_SVM_INIT_DONE hcalls. This hcall could be used when Ultravisor
encounters security violations or other errors when starting an SVM.

Note that this hcall is different from UV_SVM_TERMINATE ucall which
is used by HV to terminate/cleanup an VM that has becore secure.

The H_SVM_INIT_ABORT should basically undo operations that were done
since the H_SVM_INIT_START hcall - i.e page-out all the VM pages back
to normal memory, and terminate the SVM.

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
Changelog[v4]:
	- [Bharata Rao] Add missing rcu locking
	- [Paul Mackerras] simplify code that walks memslots
	- Add a check to ensure that H_SVM_INIT_ABORT is called before
	  H_SVM_INIT_DONE hcall (i.e the SVM is not already secure).

Changelog[v3]:
	- Rather than pass the NIP/MSR as parameters, load them into
	  SRR0/SRR1 (like we do with other registers) and terminate
	  the VM after paging out pages
	- Move the code to add a skip_page_out parameter into a
	  separate patch.

Changelog[v2]:
	[Paul Mackerras] avoid returning to UV "one last time" after
	the state is cleaned up.  So, we now have H_SVM_INIT_ABORT:
	- take the VM's NIP/MSR register states as parameters
	- inherit the state of other registers as at UV_ESM call.
	After cleaning up the partial state, HV uses these to return
	directly to the VM with a failed UV_ESM call.
---
 Documentation/powerpc/ultravisor.rst        | 57 +++++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h           |  1 +
 arch/powerpc/include/asm/kvm_book3s_uvmem.h |  6 +++
 arch/powerpc/include/asm/kvm_host.h         |  1 +
 arch/powerpc/kvm/book3s_hv.c                |  3 ++
 arch/powerpc/kvm/book3s_hv_uvmem.c          | 26 ++++++++++
 6 files changed, 94 insertions(+)

diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index 730854f73830..8c114c071bfa 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -948,6 +948,63 @@ Use cases
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
+	* H_PARAMETER 		on successfully cleaning up the state,
+				Hypervisor will return this value to the
+				**guest**, to indicate that the underlying
+				UV_ESM ultracall failed.
+
+	* H_UNSUPPORTED		if called from the wrong context (e.g. from
+				an SVM or before an H_SVM_INIT_START hypercall).
+
+Description
+~~~~~~~~~~~
+
+    Abort the process of securing a virtual machine. This call must
+    be made after a prior call to ``H_SVM_INIT_START`` hypercall and
+    before a call to ``H_SVM_INIT_DONE``.
+
+    On entry into this hypercall the non-volatile GPRs and FPRs are
+    expected to contain the values they had at the time the VM issued
+    the UV_ESM ultracall. Further ``SRR0`` is expected to contain the
+    address of the instruction after the ``UV_ESM`` ultracall and ``SRR1``
+    the MSR value with which to return to the VM.
+
+    This hypercall will cleanup any partial state that was established for
+    the VM since the prior ``H_SVM_INIT_START`` hypercall, including paging
+    out pages that were paged-into secure memory, and issue the
+    ``UV_SVM_TERMINATE`` ultracall to terminate the VM.
+
+    After the partial state is cleaned up, control returns to the VM
+    (**not Ultravisor**), at the address specified in ``SRR0`` with the
+    MSR values set to the value in ``SRR1``.
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
index 3cf8425b9838..5a9834e0e2d1 100644
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
@@ -19,6 +19,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
 unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
 unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
+unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
 void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 			     struct kvm *kvm, bool skip_page_out);
 #else
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
index 66d5312be16b..1b22f2c7ad1b 100644
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
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 9a5bbad7d87e..31484a861117 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -287,6 +287,32 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
 	}
 }
 
+unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
+{
+	int srcu_idx;
+	struct kvm_memory_slot *memslot;
+
+	/*
+	 * Expect to be called only after INIT_START and before INIT_DONE.
+	 * If INIT_DONE was completed, use normal VM termination sequence.
+	 */
+	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START) ||
+			(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE))
+		return H_UNSUPPORTED;
+
+	srcu_idx = srcu_read_lock(&kvm->srcu);
+
+	kvm_for_each_memslot(memslot, kvm_memslots(kvm))
+		kvmppc_uvmem_drop_pages(memslot, kvm, false);
+
+	srcu_read_unlock(&kvm->srcu, srcu_idx);
+
+	kvm->arch.secure_guest = 0;
+	uv_svm_terminate(kvm->arch.lpid);
+
+	return H_PARAMETER;
+}
+
 /*
  * Get a free device PFN from the pool
  *
-- 
2.17.2


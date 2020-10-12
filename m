Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6D28AF19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 09:34:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8r642Zk2zDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 18:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pvI2nITx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8qzF3SBbzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 18:28:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09C7QoRg183616; Mon, 12 Oct 2020 03:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=NIK5f2UUHuJyNgkERq7s0ziP9CQlS+CiwNvOsX1iegI=;
 b=pvI2nITxQMvXCo612nBtpETZqXjABcjnVs01VrIi0JWChT3r17ZTphviW8gsECZe91iB
 Vej9zDr05HaV61Mz3rQEWRZk0FmGTouZ7Yb8tyVVjzg2fU5LxXvA41piDymX8b0Bdnj9
 tsM4hIH1Nw9DyUk1V04ap5TdOP2wz8+GNbm6+ZE8NmieQ8OOx/z4U7ZWrV/TaGIKIk2b
 PbqU+Yh8JKTGw2RlHdhBWohNe1f1LDHULAvGhbs1NKPsm5Jx8dTLAzdYUw6uM1oAloTY
 NWb3POamuJuFFjJ3gvLKXwbuGrS4CRV6wrDW27KNGB2maUx4LpPZdf+5oQj1l73+mtCB QA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344jrwg0n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 03:28:23 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09C7RL8f009588;
 Mon, 12 Oct 2020 07:28:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 34347h0w89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 07:28:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09C7SHpF33947988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 07:28:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C4ACA4040;
 Mon, 12 Oct 2020 07:28:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E191FA404D;
 Mon, 12 Oct 2020 07:28:15 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.85.204.94])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 07:28:15 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC v1 2/2] KVM: PPC: Book3S HV: abstract secure VM related calls.
Date: Mon, 12 Oct 2020 00:27:43 -0700
Message-Id: <1602487663-7321-3-git-send-email-linuxram@us.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602487663-7321-2-git-send-email-linuxram@us.ibm.com>
References: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
 <1602487663-7321-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_03:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 bulkscore=0 suspectscore=2 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120056
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
Cc: farosas@linux.ibm.com, linuxram@us.ibm.com, bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abstract the secure VM related calls into generic calls.

These generic calls will call the corresponding method of the
backend that prvoides the implementation to support secure VM.

Currently there is only the ultravisor based implementation.
Modify that implementation to act as a backed to the generic calls.

This plumbing will provide the flexibility to add more backends
in the future.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_uvmem.h   | 100 -----------
 arch/powerpc/include/asm/kvmppc_svm_backend.h | 250 ++++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |   6 +-
 arch/powerpc/kvm/book3s_hv.c                  |  28 +--
 arch/powerpc/kvm/book3s_hv_uvmem.c            |  78 ++++++--
 5 files changed, 327 insertions(+), 135 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
 create mode 100644 arch/powerpc/include/asm/kvmppc_svm_backend.h

diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
deleted file mode 100644
index 0a63194..0000000
--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_KVM_BOOK3S_UVMEM_H__
-#define __ASM_KVM_BOOK3S_UVMEM_H__
-
-#ifdef CONFIG_PPC_UV
-int kvmppc_uvmem_init(void);
-void kvmppc_uvmem_free(void);
-bool kvmppc_uvmem_available(void);
-int kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot);
-void kvmppc_uvmem_slot_free(struct kvm *kvm,
-			    const struct kvm_memory_slot *slot);
-unsigned long kvmppc_h_svm_page_in(struct kvm *kvm,
-				   unsigned long gra,
-				   unsigned long flags,
-				   unsigned long page_shift);
-unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
-				    unsigned long gra,
-				    unsigned long flags,
-				    unsigned long page_shift);
-unsigned long kvmppc_h_svm_init_start(struct kvm *kvm);
-unsigned long kvmppc_h_svm_init_done(struct kvm *kvm);
-int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn);
-unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
-void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			     struct kvm *kvm, bool skip_page_out);
-int kvmppc_uvmem_memslot_create(struct kvm *kvm,
-		const struct kvm_memory_slot *new);
-void kvmppc_uvmem_memslot_delete(struct kvm *kvm,
-		const struct kvm_memory_slot *old);
-#else
-static inline int kvmppc_uvmem_init(void)
-{
-	return 0;
-}
-
-static inline void kvmppc_uvmem_free(void) { }
-
-static inline bool kvmppc_uvmem_available(void)
-{
-	return false;
-}
-
-static inline int
-kvmppc_uvmem_slot_init(struct kvm *kvm, const struct kvm_memory_slot *slot)
-{
-	return 0;
-}
-
-static inline void
-kvmppc_uvmem_slot_free(struct kvm *kvm, const struct kvm_memory_slot *slot) { }
-
-static inline unsigned long
-kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gra,
-		     unsigned long flags, unsigned long page_shift)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline unsigned long
-kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gra,
-		      unsigned long flags, unsigned long page_shift)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
-{
-	return -EFAULT;
-}
-
-static inline void
-kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
-			struct kvm *kvm, bool skip_page_out) { }
-
-static inline int  kvmppc_uvmem_memslot_create(struct kvm *kvm,
-		const struct kvm_memory_slot *new)
-{
-	return H_UNSUPPORTED;
-}
-
-static inline void  kvmppc_uvmem_memslot_delete(struct kvm *kvm,
-		const struct kvm_memory_slot *old) { }
-
-#endif /* CONFIG_PPC_UV */
-#endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
diff --git a/arch/powerpc/include/asm/kvmppc_svm_backend.h b/arch/powerpc/include/asm/kvmppc_svm_backend.h
new file mode 100644
index 0000000..be60d80
--- /dev/null
+++ b/arch/powerpc/include/asm/kvmppc_svm_backend.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *
+ * Copyright IBM Corp. 2020
+ *
+ * Authors: Ram Pai <linuxram@us.ibm.com>
+ */
+
+#ifndef __POWERPC_KVMPPC_SVM_BACKEND_H__
+#define __POWERPC_KVMPPC_SVM_BACKEND_H__
+
+#include <linux/mutex.h>
+#include <linux/timer.h>
+#include <linux/types.h>
+#include <linux/kvm_types.h>
+#include <linux/kvm_host.h>
+#include <linux/bug.h>
+#ifdef CONFIG_PPC_BOOK3S
+#include <asm/kvm_book3s.h>
+#else
+#include <asm/kvm_booke.h>
+#endif
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+#include <asm/paca.h>
+#include <asm/xive.h>
+#include <asm/cpu_has_feature.h>
+#endif
+
+struct kvmppc_hmm_backend {
+	/* initialize */
+	int (*kvmppc_secmem_init)(void);
+
+	/* cleanup */
+	void (*kvmppc_secmem_free)(void);
+
+	/* is memory available */
+	bool (*kvmppc_secmem_available)(void);
+
+	/* allocate a protected/secure page for the secure VM */
+	unsigned long (*kvmppc_svm_page_in)(struct kvm *kvm,
+			unsigned long gra,
+			unsigned long flags,
+			unsigned long page_shift);
+
+	/* recover the protected/secure page from the secure VM */
+	unsigned long (*kvmppc_svm_page_out)(struct kvm *kvm,
+			unsigned long gra,
+			unsigned long flags,
+			unsigned long page_shift);
+
+	/* initiate the transition of a VM to secure VM */
+	unsigned long (*kvmppc_svm_init_start)(struct kvm *kvm);
+
+	/* finalize the transition of a secure VM */
+	unsigned long (*kvmppc_svm_init_done)(struct kvm *kvm);
+
+	/* share the page on page fault */
+	int (*kvmppc_svm_page_share)(struct kvm *kvm, unsigned long gfn);
+
+	/* abort the transition to a secure VM */
+	unsigned long (*kvmppc_svm_init_abort)(struct kvm *kvm);
+
+	/* add a memory slot */
+	int (*kvmppc_svm_memslot_create)(struct kvm *kvm,
+		const struct kvm_memory_slot *new);
+
+	/* free a memory slot */
+	void (*kvmppc_svm_memslot_delete)(struct kvm *kvm,
+		const struct kvm_memory_slot *old);
+
+	/* drop pages allocated to the secure VM */
+	void (*kvmppc_svm_drop_pages)(const struct kvm_memory_slot *free,
+			     struct kvm *kvm, bool skip_page_out);
+};
+
+extern const struct kvmppc_hmm_backend *kvmppc_svm_backend;
+
+static inline int kvmppc_svm_page_share(struct kvm *kvm, unsigned long gfn)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_page_share(kvm,
+				gfn);
+}
+
+static inline void kvmppc_svm_drop_pages(const struct kvm_memory_slot *memslot,
+			struct kvm *kvm, bool skip_page_out)
+{
+	if (!kvmppc_svm_backend)
+		return;
+
+	kvmppc_svm_backend->kvmppc_svm_drop_pages(memslot,
+			kvm, skip_page_out);
+}
+
+static inline int kvmppc_svm_page_in(struct kvm *kvm,
+			unsigned long gpa,
+			unsigned long flags,
+			unsigned long page_shift)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_page_in(kvm,
+			gpa, flags, page_shift);
+}
+
+static inline int kvmppc_svm_page_out(struct kvm *kvm,
+			unsigned long gpa,
+			unsigned long flags,
+			unsigned long page_shift)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_page_out(kvm,
+			gpa, flags, page_shift);
+}
+
+static inline int kvmppc_svm_init_start(struct kvm *kvm)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_init_start(kvm);
+}
+
+static inline int kvmppc_svm_init_done(struct kvm *kvm)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_init_done(kvm);
+}
+
+static inline int kvmppc_svm_init_abort(struct kvm *kvm)
+{
+	if (!kvmppc_svm_backend)
+		return -ENODEV;
+
+	return kvmppc_svm_backend->kvmppc_svm_init_abort(kvm);
+}
+
+static inline void kvmppc_svm_memslot_create(struct kvm *kvm,
+		const struct kvm_memory_slot *memslot)
+{
+	if (!kvmppc_svm_backend)
+		return;
+
+	kvmppc_svm_backend->kvmppc_svm_memslot_create(kvm,
+			memslot);
+}
+
+static inline void kvmppc_svm_memslot_delete(struct kvm *kvm,
+		const struct kvm_memory_slot *memslot)
+{
+	if (!kvmppc_svm_backend)
+		return;
+
+	kvmppc_svm_backend->kvmppc_svm_memslot_delete(kvm,
+			memslot);
+}
+
+static inline int kvmppc_secmem_init(void)
+{
+#ifdef CONFIG_PPC_UV
+	extern const struct kvmppc_hmm_backend kvmppc_uvmem_backend;
+
+	kvmppc_svm_backend = NULL;
+	if (kvmhv_on_pseries()) {
+		/* @TODO add the protected memory backend */
+		return 0;
+	}
+
+	kvmppc_svm_backend = &kvmppc_uvmem_backend;
+
+	if (!kvmppc_svm_backend->kvmppc_secmem_init) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no %s\n", __func__);
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_secmem_free) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_secmem_free()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_secmem_available) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_secmem_available()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_page_in) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_in()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_page_out) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_out()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_init_start) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_start()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_init_done) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_done()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_page_share) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_share()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_init_abort) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_abort()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_memslot_create) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_memslot_create()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_memslot_delete) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_memslot_delete()\n");
+		goto err;
+	}
+	if (!kvmppc_svm_backend->kvmppc_svm_drop_pages) {
+		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_drop_pages()\n");
+		goto err;
+	}
+
+	return kvmppc_svm_backend->kvmppc_secmem_init();
+
+err:	kvmppc_svm_backend = NULL;
+	return -ENODEV;
+#endif
+	return 0;
+}
+
+static inline void kvmppc_secmem_free(void)
+{
+	if (!kvmppc_svm_backend)
+		return;
+
+	return kvmppc_svm_backend->kvmppc_secmem_free();
+}
+
+static inline int kvmppc_secmem_available(void)
+{
+	if (!kvmppc_svm_backend)
+		return 0;
+
+	return kvmppc_svm_backend->kvmppc_secmem_available();
+}
+#endif /* __POWERPC_KVMPPC_SVM_BACKEND_H__ */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 22a677b..1a559b3 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -20,7 +20,7 @@
 #include <asm/pgalloc.h>
 #include <asm/pte-walk.h>
 #include <asm/ultravisor.h>
-#include <asm/kvm_book3s_uvmem.h>
+#include <asm/kvmppc_svm_backend.h>
 
 /*
  * Supported radix tree geometry.
@@ -941,7 +941,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 		gpa |= ea & 0xfff;
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
-		return kvmppc_send_page_to_uv(kvm, gfn);
+		return kvmppc_svm_page_share(kvm, gfn);
 
 	/* Get the corresponding memslot */
 	memslot = gfn_to_memslot(kvm, gfn);
@@ -1148,7 +1148,7 @@ void kvmppc_radix_flush_memslot(struct kvm *kvm,
 	unsigned int shift;
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START)
-		kvmppc_uvmem_drop_pages(memslot, kvm, true);
+		kvmppc_svm_drop_pages(memslot, kvm, true);
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE)
 		return;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4ba06a2..9c093b4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -72,7 +72,7 @@
 #include <asm/xics.h>
 #include <asm/xive.h>
 #include <asm/hw_breakpoint.h>
-#include <asm/kvm_book3s_uvmem.h>
+#include <asm/kvmppc_svm_backend.h>
 #include <asm/ultravisor.h>
 #include <asm/dtl.h>
 
@@ -81,6 +81,8 @@
 #define CREATE_TRACE_POINTS
 #include "trace_hv.h"
 
+const struct kvmppc_hmm_backend *kvmppc_svm_backend;
+
 /* #define EXIT_DEBUG */
 /* #define EXIT_DEBUG_SIMPLE */
 /* #define EXIT_DEBUG_INT */
@@ -1079,7 +1081,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_PAGE_IN:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_page_in(vcpu->kvm,
+			ret = kvmppc_svm_page_in(vcpu->kvm,
 						   kvmppc_get_gpr(vcpu, 4),
 						   kvmppc_get_gpr(vcpu, 5),
 						   kvmppc_get_gpr(vcpu, 6));
@@ -1087,7 +1089,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_PAGE_OUT:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_page_out(vcpu->kvm,
+			ret = kvmppc_svm_page_out(vcpu->kvm,
 						    kvmppc_get_gpr(vcpu, 4),
 						    kvmppc_get_gpr(vcpu, 5),
 						    kvmppc_get_gpr(vcpu, 6));
@@ -1095,12 +1097,12 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 	case H_SVM_INIT_START:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_init_start(vcpu->kvm);
+			ret = kvmppc_svm_init_start(vcpu->kvm);
 		break;
 	case H_SVM_INIT_DONE:
 		ret = H_UNSUPPORTED;
 		if (kvmppc_get_srr1(vcpu) & MSR_S)
-			ret = kvmppc_h_svm_init_done(vcpu->kvm);
+			ret = kvmppc_svm_init_done(vcpu->kvm);
 		break;
 	case H_SVM_INIT_ABORT:
 		/*
@@ -1110,7 +1112,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		 * Instead the kvm->arch.secure_guest flag is checked inside
 		 * kvmppc_h_svm_init_abort().
 		 */
-		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
+		ret = kvmppc_svm_init_abort(vcpu->kvm);
 		break;
 
 	default:
@@ -4564,10 +4566,10 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
 		 * @TODO kvmppc_uvmem_memslot_create() can fail and
 		 * return error. Fix this.
 		 */
-		kvmppc_uvmem_memslot_create(kvm, new);
+		kvmppc_svm_memslot_create(kvm, new);
 		break;
 	case KVM_MR_DELETE:
-		kvmppc_uvmem_memslot_delete(kvm, old);
+		kvmppc_svm_memslot_delete(kvm, old);
 		break;
 	default:
 		/* TODO: Handle KVM_MR_MOVE */
@@ -5473,7 +5475,7 @@ static void unpin_vpa_reset(struct kvm *kvm, struct kvmppc_vpa *vpa)
  */
 static int kvmhv_enable_svm(struct kvm *kvm)
 {
-	if (!kvmppc_uvmem_available())
+	if (!kvmppc_secmem_available())
 		return -EINVAL;
 	if (kvm)
 		kvm->arch.svm_enabled = 1;
@@ -5521,7 +5523,7 @@ static int kvmhv_svm_off(struct kvm *kvm)
 			continue;
 
 		kvm_for_each_memslot(memslot, slots) {
-			kvmppc_uvmem_drop_pages(memslot, kvm, true);
+			kvmppc_svm_drop_pages(memslot, kvm, true);
 			uv_unregister_mem_slot(kvm->arch.lpid, memslot->id);
 		}
 	}
@@ -5710,16 +5712,16 @@ static int kvmppc_book3s_init_hv(void)
 			no_mixing_hpt_and_radix = true;
 	}
 
-	r = kvmppc_uvmem_init();
+	r = kvmppc_secmem_init();
 	if (r < 0)
-		pr_err("KVM-HV: kvmppc_uvmem_init failed %d\n", r);
+		pr_err("KVM-HV: kvmppc_secmem_init failed %d\n", r);
 
 	return r;
 }
 
 static void kvmppc_book3s_exit_hv(void)
 {
-	kvmppc_uvmem_free();
+	kvmppc_secmem_free();
 	kvmppc_free_host_rm_ops();
 	if (kvmppc_radix_possible())
 		kvmppc_radix_exit();
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index b79affc..12d10c1 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -93,7 +93,7 @@
 #include <asm/ultravisor.h>
 #include <asm/mman.h>
 #include <asm/kvm_ppc.h>
-#include <asm/kvm_book3s_uvmem.h>
+#include <asm/kvmppc_svm_backend.h>
 
 static struct dev_pagemap uvmem_pgmap;
 static unsigned long *uvmem_bitmap;
@@ -234,7 +234,7 @@ struct uvmem_page_pvt {
 	bool remove_gfn;
 };
 
-bool kvmppc_uvmem_available(void)
+static bool uvmem_available(void)
 {
 	/*
 	 * If uvmem_bitmap != NULL, then there is an ultravisor
@@ -453,7 +453,7 @@ static int __uvmem_memslot_create(struct kvm *kvm,
 	return ret;
 }
 
-unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
+static unsigned long uvmem_h_svm_init_start(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot, *m;
@@ -595,7 +595,7 @@ static inline int uvmem_svm_page_out(struct vm_area_struct *vma,
  * fault on them, do fault time migration to replace the device PTEs in
  * QEMU page table with normal PTEs from newly allocated pages.
  */
-void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
+static void uvmem_drop_pages(const struct kvm_memory_slot *slot,
 			     struct kvm *kvm, bool skip_page_out)
 {
 	int i;
@@ -644,7 +644,7 @@ void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
 	mmap_read_unlock(kvm->mm);
 }
 
-unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
+static unsigned long uvmem_h_svm_init_abort(struct kvm *kvm)
 {
 	int srcu_idx;
 	struct kvm_memory_slot *memslot;
@@ -662,7 +662,7 @@ unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm)
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
 	kvm_for_each_memslot(memslot, kvm_memslots(kvm))
-		kvmppc_uvmem_drop_pages(memslot, kvm, false);
+		uvmem_drop_pages(memslot, kvm, false);
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
@@ -816,7 +816,7 @@ static int uvmem_uv_migrate_mem_slot(struct kvm *kvm,
 	return ret;
 }
 
-unsigned long kvmppc_h_svm_init_done(struct kvm *kvm)
+static unsigned long uvmem_h_svm_init_done(struct kvm *kvm)
 {
 	struct kvm_memslots *slots;
 	struct kvm_memory_slot *memslot;
@@ -922,7 +922,7 @@ static unsigned long uvmem_share_page(struct kvm *kvm, unsigned long gpa,
  * H_PAGE_IN_SHARED flag makes the page shared which means that the same
  * memory in is visible from both UV and HV.
  */
-unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
+static unsigned long uvmem_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
 		unsigned long flags,
 		unsigned long page_shift)
 {
@@ -985,7 +985,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
  * This eventually results in dropping of device PFN and the newly
  * provisioned page/PFN gets populated in QEMU page tables.
  */
-static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
+static vm_fault_t uvmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct uvmem_page_pvt *pvt = vmf->page->zone_device_data;
 
@@ -1004,7 +1004,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
  * to a normal PFN during H_SVM_PAGE_OUT.
  * Gets called with kvm->arch.uvmem_lock held.
  */
-static void kvmppc_uvmem_page_free(struct page *page)
+static void uvmem_page_free(struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page) -
 			(uvmem_pgmap.res.start >> PAGE_SHIFT);
@@ -1024,15 +1024,15 @@ static void kvmppc_uvmem_page_free(struct page *page)
 }
 
 static const struct dev_pagemap_ops uvmem_ops = {
-	.page_free = kvmppc_uvmem_page_free,
-	.migrate_to_ram	= kvmppc_uvmem_migrate_to_ram,
+	.page_free = uvmem_page_free,
+	.migrate_to_ram	= uvmem_migrate_to_ram,
 };
 
 /*
  * H_SVM_PAGE_OUT: Move page from secure memory to normal memory.
  */
-unsigned long
-kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
+static unsigned long
+uvmem_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
 		      unsigned long flags, unsigned long page_shift)
 {
 	unsigned long gfn = gpa >> page_shift;
@@ -1070,7 +1070,7 @@ static void kvmppc_uvmem_page_free(struct page *page)
 	return ret;
 }
 
-int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
+static int uvmem_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
 	unsigned long pfn;
 	int ret = U_SUCCESS;
@@ -1091,7 +1091,8 @@ int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
 }
 
-int kvmppc_uvmem_memslot_create(struct kvm *kvm, const struct kvm_memory_slot *new)
+static int uvmem_memslot_create(struct kvm *kvm,
+		const struct kvm_memory_slot *new)
 {
 	int ret = __uvmem_memslot_create(kvm, new);
 
@@ -1101,7 +1102,8 @@ int kvmppc_uvmem_memslot_create(struct kvm *kvm, const struct kvm_memory_slot *n
 	return ret;
 }
 
-void kvmppc_uvmem_memslot_delete(struct kvm *kvm, const struct kvm_memory_slot *old)
+static void uvmem_memslot_delete(struct kvm *kvm,
+		const struct kvm_memory_slot *old)
 {
 	__uvmem_memslot_delete(kvm, old);
 }
@@ -1144,7 +1146,7 @@ static u64 uvmem_get_secmem_size(void)
 	return size;
 }
 
-int kvmppc_uvmem_init(void)
+static int uvmem_init(void)
 {
 	int ret = 0;
 	unsigned long size;
@@ -1199,7 +1201,7 @@ int kvmppc_uvmem_init(void)
 	return ret;
 }
 
-void kvmppc_uvmem_free(void)
+static void uvmem_free(void)
 {
 	if (!uvmem_bitmap)
 		return;
@@ -1209,3 +1211,41 @@ void kvmppc_uvmem_free(void)
 			   resource_size(&uvmem_pgmap.res));
 	kfree(uvmem_bitmap);
 }
+
+const struct kvmppc_hmm_backend kvmppc_uvmem_backend = {
+	/* initialize */
+	.kvmppc_secmem_init = uvmem_init,
+
+	/* cleanup */
+	.kvmppc_secmem_free = uvmem_free,
+
+	/* is memory available */
+	.kvmppc_secmem_available = uvmem_available,
+
+	/* allocate a protected/secure page for the secure VM */
+	.kvmppc_svm_page_in = uvmem_h_svm_page_in,
+
+	/* recover the protected/secure page from the secure VM */
+	.kvmppc_svm_page_out = uvmem_h_svm_page_out,
+
+	/* initiate the transition of a VM to secure VM */
+	.kvmppc_svm_init_start = uvmem_h_svm_init_start,
+
+	/* finalize the transition of a secure VM */
+	.kvmppc_svm_init_done = uvmem_h_svm_init_done,
+
+	/* send a page to uv on page fault */
+	.kvmppc_svm_page_share = uvmem_send_page_to_uv,
+
+	/* abort the transition to a secure VM */
+	.kvmppc_svm_init_abort = uvmem_h_svm_init_abort,
+
+	/* add a memory slot */
+	.kvmppc_svm_memslot_create = uvmem_memslot_create,
+
+	/* free a memory slot */
+	.kvmppc_svm_memslot_delete = uvmem_memslot_delete,
+
+	/* drop pages allocated to the secure VM */
+	.kvmppc_svm_drop_pages = uvmem_drop_pages,
+};
-- 
1.8.3.1


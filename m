Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13FC3E0F27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgKtd4SRvz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:27:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QkVXouRY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QkVXouRY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgKrS2gkvz3cHr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:25:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1757AqPq140665; Thu, 5 Aug 2021 03:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MdCheDWnBppDIy9sh3oS7YgKj6laB9rFnnhYQlgJHeU=;
 b=QkVXouRYZSQYRHQBo5I2huLTy5UQNYB8dGL5fOtS7lo0S69ldHWcUpP6F+F7z0TkTBqc
 hYHj2pb1iVxkG1pm0r5NENy8zOcbW040Ct6/VVNgwHDSTO3XOpkjayDLGsyKvqTdrz8K
 +mw74/IyNoZlpz4avBLOKznZx0FCMosWWkOeEzbH6v/1xFZ9c+X/JA/HzbEwrHIA1gGM
 wC8ee5yt+j6j5ddxhDHOXvmLueHxgIP8260wdcMon8UZxq6WiuQugHcdViSvC6FWm+HY
 LuZSptOaFWKwacARQClFUM1w5cbz9tyCH1Rq73kX1eqi0gH25wQalrKSjwMQVfNHAPEO Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a89p12m8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:10 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1757BlCd144086;
 Thu, 5 Aug 2021 03:25:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a89p12m7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:25:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17576adW004901;
 Thu, 5 Aug 2021 07:25:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3a4x58sncn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:25:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1757M40760752134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:22:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A615A4069;
 Thu,  5 Aug 2021 07:25:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA87BA4070;
 Thu,  5 Aug 2021 07:24:58 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 07:24:58 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v0 4/5] KVM: PPC: BOOK3S HV: Async PF support
Date: Thu,  5 Aug 2021 12:54:38 +0530
Message-Id: <20210805072439.501481-5-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805072439.501481-1-bharata@linux.ibm.com>
References: <20210805072439.501481-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H-uWUjMlLWAlrVjX87LEPxxgpQKmQjIP
X-Proofpoint-ORIG-GUID: okt15hAaFT4Hd5RpHjqE3TaQAJmXMWUM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050041
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add asynchronous page fault support for PowerKVM by making
use of the Expropriation/Subvention Notification Option
defined by PAPR specifications.

1. When guest accessed page isn't immediately available in the
host, update the vcpu's VPA with a unique expropriation correlation
number and inject a DSI to the guest with SRR1_PROGTRAP bit set in
SRR1. This informs the guest vcpu to put the process to wait and
schedule a different process.
   - Async PF is supported for data pages in this implementation
     though PAPR allows it for code pages too.
   - Async PF is supported only for user pages here.
   - The feature is currently limited only to radix guests.

2. When the page becomes available, update the Subvention Notification
Structure  with the corresponding expropriation correlation number and
and inform the guest via subvention interrupt.
   - Subvention Notification Structure (SNS) is a region of memory
     shared between host and guest via which the communication related
     to expropriated and subvened pages happens between guest and host.
   - SNS region is registered by the guest via H_REG_SNS hcall which
     is implemented in QEMU.
   - H_REG_SNS implementation in QEMU needs a new ioctl KVM_PPC_SET_SNS.
     This ioctl is used to map and pin the guest page containing SNS
     in the host.
   - Subvention notification interrupt is raised to the guest by
     QEMU in response to the guest exit via KVM_REQ_ESN_EXIT. This
     interrupt informs the guest about the availability of the
     pages.

TODO:
- H_REG_SNS is implemented in QEMU because this hcall needs to return
  the interrupt source number associated with the subvention interrupt.
  Claiming of IRQ line and raising an external interrupt seem to be
  straightforward from QEMU. Figure out the in-kernel equivalents for
  these two so that, we can save on guest exit for each expropriated
  page and move the entire hcall implementation into the host kernel.
- The code is pretty much experimental and is barely able to boot a
  guest. I do see some requests for expropriated pages not getting
  fulfilled by host leading the long delays in guest. This needs some
  debugging.
- A few other aspects recommended by PAPR around this feature(like
  setting of page state flags) need to be evaluated and incorporated
  into the implementation if found appropriate.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst            |  15 ++
 arch/powerpc/include/asm/hvcall.h         |   1 +
 arch/powerpc/include/asm/kvm_book3s_esn.h |  24 +++
 arch/powerpc/include/asm/kvm_host.h       |  21 +++
 arch/powerpc/include/asm/kvm_ppc.h        |   1 +
 arch/powerpc/include/asm/lppaca.h         |  12 +-
 arch/powerpc/include/uapi/asm/kvm.h       |   6 +
 arch/powerpc/kvm/Kconfig                  |   2 +
 arch/powerpc/kvm/Makefile                 |   5 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c    |   3 +
 arch/powerpc/kvm/book3s_hv.c              |  25 +++
 arch/powerpc/kvm/book3s_hv_esn.c          | 189 ++++++++++++++++++++++
 include/uapi/linux/kvm.h                  |   1 +
 tools/include/uapi/linux/kvm.h            |   1 +
 14 files changed, 303 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_book3s_esn.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_esn.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index dae68e68ca23..512f078b9d02 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5293,6 +5293,21 @@ the trailing ``'\0'``, is indicated by ``name_size`` in the header.
 The Stats Data block contains an array of 64-bit values in the same order
 as the descriptors in Descriptors block.
 
+4.134 KVM_PPC_SET_SNS
+---------------------
+
+:Capability: basic
+:Architectures: powerpc
+:Type: vm ioctl
+:Parameters: none
+:Returns: 0 on successful completion,
+
+As part of H_REG_SNS hypercall, this ioctl is used to map and pin
+the guest provided SNS structure in the host.
+
+This is used for providing asynchronous page fault support for
+powerpc pseries KVM guests.
+
 5. The kvm_run structure
 ========================
 
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 9bcf345cb208..9e33500c1723 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -321,6 +321,7 @@
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
+#define H_REG_SNS		0x41C
 #define H_RPT_INVALIDATE	0x448
 #define H_SCM_FLUSH		0x44C
 #define MAX_HCALL_OPCODE	H_SCM_FLUSH
diff --git a/arch/powerpc/include/asm/kvm_book3s_esn.h b/arch/powerpc/include/asm/kvm_book3s_esn.h
new file mode 100644
index 000000000000..d79a441ea31d
--- /dev/null
+++ b/arch/powerpc/include/asm/kvm_book3s_esn.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_KVM_BOOK3S_ESN_H__
+#define __ASM_KVM_BOOK3S_ESN_H__
+
+/* SNS buffer EQ state flags */
+#define SNS_EQ_STATE_OPERATIONAL 0X0
+#define SNS_EQ_STATE_OVERFLOW 0x1
+
+/* SNS buffer Notification control bits */
+#define SNS_EQ_CNTRL_TRIGGER 0x1
+
+struct kvmppc_sns {
+	unsigned long gpa;
+	unsigned long len;
+	void *hva;
+	uint16_t exp_corr_nr;
+	uint16_t *eq;
+	uint8_t *eq_cntrl;
+	uint8_t *eq_state;
+	unsigned long next_eq_entry;
+	unsigned long nr_eq_entries;
+};
+
+#endif /* __ASM_KVM_BOOK3S_ESN_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 204dc2d91388..8d7f73085ef5 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -25,6 +25,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hvcall.h>
 #include <asm/mce.h>
+#include <asm/kvm_book3s_esn.h>
 
 #define KVM_MAX_VCPUS		NR_CPUS
 #define KVM_MAX_VCORES		NR_CPUS
@@ -325,6 +326,7 @@ struct kvm_arch {
 #endif
 	struct kvmppc_ops *kvm_ops;
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	struct kvmppc_sns sns;
 	struct mutex uvmem_lock;
 	struct list_head uvmem_pfns;
 	struct mutex mmu_setup_lock;	/* nests inside vcpu mutexes */
@@ -855,6 +857,25 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_ARCH_WQP
 #define __KVM_HAVE_CREATE_DEVICE
 
+/* Async pf */
+#define ASYNC_PF_PER_VCPU       64
+struct kvm_arch_async_pf {
+	unsigned long exp_token;
+};
+int kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu,
+			       unsigned long gpa, unsigned long hva);
+
+void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu,
+			       struct kvm_async_pf *work);
+
+bool kvm_arch_async_page_not_present(struct kvm_vcpu *vcpu,
+				     struct kvm_async_pf *work);
+
+void kvm_arch_async_page_present(struct kvm_vcpu *vcpu,
+				 struct kvm_async_pf *work);
+bool kvm_arch_can_dequeue_async_page_present(struct kvm_vcpu *vcpu);
+static inline void kvm_arch_async_page_present_queued(struct kvm_vcpu *vcpu) {}
+
 static inline void kvm_arch_hardware_disable(void) {}
 static inline void kvm_arch_hardware_unsetup(void) {}
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 09235bdfd4ac..c14a84041d0e 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -228,6 +228,7 @@ extern long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
 int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq);
 
 extern int kvm_vm_ioctl_rtas_define_token(struct kvm *kvm, void __user *argp);
+long kvm_vm_ioctl_set_sns(struct kvm *kvm, struct kvm_ppc_sns_reg *sns_reg);
 extern int kvmppc_rtas_hcall(struct kvm_vcpu *vcpu);
 extern void kvmppc_rtas_tokens_free(struct kvm *kvm);
 
diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 57e432766f3e..17e89c3865e8 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -104,7 +104,17 @@ struct lppaca {
 	volatile __be32 dispersion_count; /* dispatch changed physical cpu */
 	volatile __be64 cmo_faults;	/* CMO page fault count */
 	volatile __be64 cmo_fault_time;	/* CMO page fault time */
-	u8	reserved10[104];
+
+	/*
+	 * TODO: Insert this at correct offset
+	 * 0x17D - Exp flags (1 byte)
+	 * 0x17E - Exp corr number (2 bytes)
+	 *
+	 * Here I am using only exp corr number at an easy to insert
+	 * offset.
+	 */
+	__be16 exp_corr_nr; /* Exproppriation correlation number */
+	u8	reserved10[102];
 
 	/* cacheline 4-5 */
 
diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
index 9f18fa090f1f..d72739126ae5 100644
--- a/arch/powerpc/include/uapi/asm/kvm.h
+++ b/arch/powerpc/include/uapi/asm/kvm.h
@@ -470,6 +470,12 @@ struct kvm_ppc_cpu_char {
 #define KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ULL << 61)
 #define KVM_PPC_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58)
 
+/* For KVM_PPC_SET_SNS */
+struct kvm_ppc_sns_reg {
+	__u64 addr;
+	__u64 len;
+};
+
 /* Per-vcpu XICS interrupt controller state */
 #define KVM_REG_PPC_ICP_STATE	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x8c)
 
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index e45644657d49..4f552649a4b2 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -85,6 +85,8 @@ config KVM_BOOK3S_64_HV
 	depends on KVM_BOOK3S_64 && PPC_POWERNV
 	select KVM_BOOK3S_HV_POSSIBLE
 	select MMU_NOTIFIER
+	select KVM_ASYNC_PF
+	select KVM_ASYNC_PF_SYNC
 	select CMA
 	help
 	  Support running unmodified book3s_64 guest kernels in
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 583c14ef596e..603ab382d021 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -6,7 +6,7 @@
 ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
 KVM := ../../../virt/kvm
 
-common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
+common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o $(KVM)/async_pf.o
 common-objs-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
 common-objs-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 
@@ -70,7 +70,8 @@ kvm-hv-y += \
 	book3s_hv_interrupts.o \
 	book3s_64_mmu_hv.o \
 	book3s_64_mmu_radix.o \
-	book3s_hv_nested.o
+	book3s_hv_nested.o \
+	book3s_hv_esn.o
 
 kvm-hv-$(CONFIG_PPC_UV) += \
 	book3s_hv_uvmem.o
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 618206a504b0..1985f84bfebe 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -837,6 +837,9 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	} else {
 		unsigned long pfn;
 
+		if (kvm_arch_setup_async_pf(vcpu, gpa, hva))
+			return RESUME_GUEST;
+
 		/* Call KVM generic code to do the slow-path check */
 		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
 					   writing, upgrade_p, NULL);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d07e9065f7c1..5cc564321521 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -77,6 +77,7 @@
 #include <asm/ultravisor.h>
 #include <asm/dtl.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/kvm_book3s_esn.h>
 
 #include "book3s.h"
 
@@ -4570,6 +4571,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		return -EINTR;
 	}
 
+	if (kvm_request_pending(vcpu)) {
+		if (!kvmppc_core_check_requests(vcpu))
+			return 0;
+	}
+
 	kvm = vcpu->kvm;
 	atomic_inc(&kvm->arch.vcpus_running);
 	/* Order vcpus_running vs. mmu_ready, see kvmppc_alloc_reset_hpt */
@@ -4591,6 +4597,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
+		kvm_check_async_pf_completion(vcpu);
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
@@ -5257,6 +5264,8 @@ static void kvmppc_free_vcores(struct kvm *kvm)
 
 static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 {
+	struct kvm_ppc_sns_reg sns_reg;
+
 	debugfs_remove_recursive(kvm->arch.debugfs_dir);
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
@@ -5283,6 +5292,11 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 	kvmppc_free_lpid(kvm->arch.lpid);
 
 	kvmppc_free_pimap(kvm);
+
+	/* Needed for de-registering SNS buffer */
+	sns_reg.addr = -1;
+	sns_reg.len = 0;
+	kvm_vm_ioctl_set_sns(kvm, &sns_reg);
 }
 
 /* We don't need to emulate any privileged instructions or dcbz */
@@ -5561,6 +5575,17 @@ static long kvm_arch_vm_ioctl_hv(struct file *filp,
 		break;
 	}
 
+	case KVM_PPC_SET_SNS: {
+		struct kvm_ppc_sns_reg sns_reg;
+
+		r = -EFAULT;
+		if (copy_from_user(&sns_reg, argp, sizeof(sns_reg)))
+			break;
+
+		r = kvm_vm_ioctl_set_sns(kvm, &sns_reg);
+		break;
+	}
+
 	default:
 		r = -ENOTTY;
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_esn.c b/arch/powerpc/kvm/book3s_hv_esn.c
new file mode 100644
index 000000000000..b322a14c1f83
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_esn.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Async page fault support via PAPR Expropriation/Subvention Notification
+ * option(ESN)
+ *
+ * Copyright 2020 Bharata B Rao, IBM Corp. <bharata@linux.ibm.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_ppc.h>
+#include <asm/kvm_book3s_esn.h>
+
+static DEFINE_SPINLOCK(async_exp_lock); /* for updating exp_corr_nr */
+static DEFINE_SPINLOCK(async_sns_lock); /* SNS buffer updated under this lock */
+
+int kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu,
+			       unsigned long gpa, unsigned long hva)
+{
+	struct kvm_arch_async_pf arch;
+	struct lppaca *vpa = vcpu->arch.vpa.pinned_addr;
+	u64 msr = kvmppc_get_msr(vcpu);
+	struct kvmppc_sns *sns = &vcpu->kvm->arch.sns;
+
+	/*
+	 * If VPA hasn't been registered yet, can't support
+	 * async pf.
+	 */
+	if (!vpa)
+		return 0;
+
+	/*
+	 * If SNS memory area hasn't been registered yet,
+	 * can't support async pf.
+	 */
+	if (!vcpu->kvm->arch.sns.eq)
+		return 0;
+
+	/*
+	 * If guest hasn't enabled expropriation interrupt,
+	 * don't try async pf.
+	 */
+	if (!(vpa->byte_b9 & LPPACA_EXP_INT_ENABLED))
+		return 0;
+
+	/*
+	 * If the fault is in the guest kernel, don,t
+	 * try async pf.
+	 */
+	if (!(msr & MSR_PR) && !(msr & MSR_HV))
+		return 0;
+
+	spin_lock(&async_sns_lock);
+	/*
+	 * Check if subvention event queue can
+	 * overflow, if so, don't try async pf.
+	 */
+	if (*(sns->eq + sns->next_eq_entry)) {
+		pr_err("%s: SNS buffer overflow\n", __func__);
+		spin_unlock(&async_sns_lock);
+		return 0;
+	}
+	spin_unlock(&async_sns_lock);
+
+	/*
+	 * TODO:
+	 *
+	 * 1. Update exp flags bit 7 to 1
+	 * ("The Subvened page data will be restored")
+	 *
+	 * 2. Check if request to this page has been
+	 * notified to guest earlier, if so send back
+	 * the same exp corr number.
+	 *
+	 * 3. exp_corr_nr could be a random but non-zero
+	 * number. Not taking care of wrapping here. Fix
+	 * it.
+	 */
+	spin_lock(&async_exp_lock);
+	vpa->exp_corr_nr = cpu_to_be16(vcpu->kvm->arch.sns.exp_corr_nr);
+	arch.exp_token = vcpu->kvm->arch.sns.exp_corr_nr++;
+	spin_unlock(&async_exp_lock);
+
+	return kvm_setup_async_pf(vcpu, gpa, hva, &arch);
+}
+
+bool kvm_arch_async_page_not_present(struct kvm_vcpu *vcpu,
+				     struct kvm_async_pf *work)
+{
+	/* Inject DSI to guest with srr1 bit 46 set */
+	kvmppc_core_queue_data_storage(vcpu, kvmppc_get_dar(vcpu), DSISR_NOHPTE, SRR1_PROGTRAP);
+	return true;
+}
+
+void kvm_arch_async_page_present(struct kvm_vcpu *vcpu,
+				 struct kvm_async_pf *work)
+{
+	struct kvmppc_sns *sns = &vcpu->kvm->arch.sns;
+
+	spin_lock(&async_sns_lock);
+	if (*sns->eq_cntrl != SNS_EQ_CNTRL_TRIGGER) {
+		pr_err("%s: SNS Notification Trigger not set by guest\n", __func__);
+		spin_unlock(&async_sns_lock);
+		/* TODO: Terminate the guest? */
+		return;
+	}
+
+	if (arch_cmpxchg(sns->eq + sns->next_eq_entry, 0,
+	    work->arch.exp_token)) {
+		*sns->eq_state |= SNS_EQ_STATE_OVERFLOW;
+		pr_err("%s: SNS buffer overflow\n", __func__);
+		spin_unlock(&async_sns_lock);
+		/* TODO: Terminate the guest? */
+		return;
+	}
+
+	sns->next_eq_entry = (sns->next_eq_entry + 1) % sns->nr_eq_entries;
+	spin_unlock(&async_sns_lock);
+
+	/*
+	 * Request a guest exit so that ESN virtual interrupt can
+	 * be injected by QEMU.
+	 */
+	kvm_make_request(KVM_REQ_ESN_EXIT, vcpu);
+}
+
+void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
+{
+	/* We will inject the page directly */
+}
+
+bool kvm_arch_can_dequeue_async_page_present(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * PowerPC will always inject the page directly,
+	 * but we still want check_async_completion to cleanup
+	 */
+	return true;
+}
+
+long kvm_vm_ioctl_set_sns(struct kvm *kvm, struct kvm_ppc_sns_reg *sns_reg)
+{
+	unsigned long nb;
+
+	/* Deregister */
+	if (sns_reg->addr == -1) {
+		if (!kvm->arch.sns.hva)
+			return 0;
+
+		pr_info("%s: Deregistering SNS buffer for LPID %d\n",
+			__func__, kvm->arch.lpid);
+		kvmppc_unpin_guest_page(kvm, kvm->arch.sns.hva, kvm->arch.sns.gpa, false);
+		kvm->arch.sns.gpa = -1;
+		kvm->arch.sns.hva = 0;
+		return 0;
+	}
+
+	/*
+	 * Already registered with the same address?
+	 */
+	if (sns_reg->addr == kvm->arch.sns.gpa)
+		return 0;
+
+	/* If previous registration exists, free it */
+	if (kvm->arch.sns.hva) {
+		pr_info("%s: Deregistering Previous SNS buffer for LPID %d\n",
+			__func__, kvm->arch.lpid);
+		kvmppc_unpin_guest_page(kvm, kvm->arch.sns.hva, kvm->arch.sns.gpa, false);
+		kvm->arch.sns.gpa = -1;
+		kvm->arch.sns.hva = 0;
+	}
+
+	kvm->arch.sns.gpa = sns_reg->addr;
+	kvm->arch.sns.hva = kvmppc_pin_guest_page(kvm, kvm->arch.sns.gpa, &nb);
+	kvm->arch.sns.len = sns_reg->len;
+	kvm->arch.sns.nr_eq_entries = (kvm->arch.sns.len - 2) / sizeof(uint16_t);
+	kvm->arch.sns.next_eq_entry = 0;
+	kvm->arch.sns.eq = kvm->arch.sns.hva + 2;
+	kvm->arch.sns.eq_cntrl = kvm->arch.sns.hva;
+	kvm->arch.sns.eq_state = kvm->arch.sns.hva + 1;
+	kvm->arch.sns.exp_corr_nr = 1; /* Should be non-zero */
+
+	*(kvm->arch.sns.eq_state) = SNS_EQ_STATE_OPERATIONAL;
+
+	pr_info("%s: Registering SNS buffer for LPID %d sns_addr %llx eq %lx\n",
+		__func__, kvm->arch.lpid, sns_reg->addr,
+		(unsigned long)kvm->arch.sns.eq);
+
+	return 0;
+}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 47be532ed14b..dbe65e8d68d8 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1459,6 +1459,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
+#define KVM_PPC_SET_SNS		  _IOR(KVMIO, 0xb5, struct kvm_ppc_sns_reg)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index d9e4aabcb31a..e9dea164498f 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1458,6 +1458,7 @@ struct kvm_s390_ucas_mapping {
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
+#define KVM_PPC_SET_SNS		  _IOR(KVMIO, 0xb5, struct kvm_ppc_sns_reg)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.31.1


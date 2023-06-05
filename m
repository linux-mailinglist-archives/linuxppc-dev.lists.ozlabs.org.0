Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA8721E94
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 08:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZPVs3MSyz3fgs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CfEnYl2O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CfEnYl2O;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZPNM3pTGz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 16:49:23 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3556605c009744;
	Mon, 5 Jun 2023 06:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6LJ6rsBZUhiuS/rtOJ6B8nAeTv92TnvuHpmWetYG80g=;
 b=CfEnYl2O8XOaqnGkvAvMcBI1zpnlXBh0KsUlnWgykG02hCYT7a1Bij3FrfqK8+NREIS/
 3xBaShCP0mg9+6Fs8S8EhL6SXKeQJgFBmRqXpC+sTwp7DUowt89w7P01m5hw/3QLwIki
 7/idv/xk8AsaytGWEg29pgIXXL15Rti8e+pvg4cn8UcstFqpB9/Fh2ewDchhJh6/yNix
 1/TifJl/cDk9jBYAIUUcHwzJS6tLC5LJEeeFslYTOxD0zzAcLVS2bMEKH2JsGKw6VK7y
 /twcpI3JYdC/wytzhReW3lVNtDrLri3E1c7Cid70Gp3Sksz1T1g/J18dC7RRDrcK8iIB pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r19x2s3xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:20 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3556kO1u020389;
	Mon, 5 Jun 2023 06:49:20 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r19x2s3x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 354LQYNk000565;
	Mon, 5 Jun 2023 06:49:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qyxku16r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3556nEvw56033714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 06:49:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCB6E2004B;
	Mon,  5 Jun 2023 06:49:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6435A20040;
	Mon,  5 Jun 2023 06:49:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 06:49:13 +0000 (GMT)
Received: from pwon.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 62717605AD;
	Mon,  5 Jun 2023 16:49:08 +1000 (AEST)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 5/6] KVM: PPC: Add support for nested PAPR guests
Date: Mon,  5 Jun 2023 16:48:47 +1000
Message-Id: <20230605064848.12319-6-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CLPOctAGS7maeQg3fssMnayI6sHut60F
X-Proofpoint-GUID: 8zQjWtYPVYNuZ32rh4ds8YQC-aQfjFIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306050058
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A series of hcalls have been added to the PAPR which allow a regular
guest partition to create and manage guest partitions of its own. Add
support to KVM to utilize these hcalls to enable running nested guests.

Overview of the new hcall usage:

- L1 and L0 negotiate capabilities with
  H_GUEST_{G,S}ET_CAPABILITIES()

- L1 requests the L0 create a L2 with
  H_GUEST_CREATE() and receives a handle to use in future hcalls

- L1 requests the L0 create a L2 vCPU with
  H_GUEST_CREATE_VCPU()

- L1 sets up the L2 using H_GUEST_SET and the
  H_GUEST_VCPU_RUN input buffer

- L1 requests the L0 runs the L2 vCPU using H_GUEST_VCPU_RUN()

- L2 returns to L1 with an exit reason and L1 reads the
  H_GUEST_VCPU_RUN output buffer populated by the L0

- L1 handles the exit using H_GET_STATE if necessary

- L1 reruns L2 vCPU with H_GUEST_VCPU_RUN

- L1 frees the L2 in the L0 with H_GUEST_DELETE()

Support for the new API is determined by trying
H_GUEST_GET_CAPABILITIES. On a successful return, the new API will then
be used.

Use the vcpu register state setters for tracking modified guest state
elements and copy the thread wide values into the H_GUEST_VCPU_RUN input
buffer immediately before running a L2. The guest wide
elements can not be added to the input buffer so send them with a
separate H_GUEST_SET call if necessary.

Make the vcpu register getter load the corresponding value from the real
host with H_GUEST_GET. To avoid unnecessarily calling H_GUEST_GET, track
which values have already been loaded between H_GUEST_VCPU_RUN calls. If
an element is present in the H_GUEST_VCPU_RUN output buffer it also does
not need to be loaded again.

There is existing support for running nested guests on KVM
with powernv. However the interface used for this is not supported by
other PAPR hosts. This existing API is still supported.

Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
v2:
  - Declare op structs as static
  - Use expressions in switch case with local variables
  - Do not use the PVR for the LOGICAL PVR ID
  - Handle emul_inst as now a double word
  - Use new GPR(), etc macros
  - Determine PAPR nested capabilities from cpu features
---
 arch/powerpc/include/asm/guest-state-buffer.h | 105 +-
 arch/powerpc/include/asm/hvcall.h             |  30 +
 arch/powerpc/include/asm/kvm_book3s.h         | 122 ++-
 arch/powerpc/include/asm/kvm_book3s_64.h      |   6 +
 arch/powerpc/include/asm/kvm_host.h           |  21 +
 arch/powerpc/include/asm/kvm_ppc.h            |  64 +-
 arch/powerpc/include/asm/plpar_wrappers.h     | 198 ++++
 arch/powerpc/kvm/Makefile                     |   1 +
 arch/powerpc/kvm/book3s_hv.c                  | 126 ++-
 arch/powerpc/kvm/book3s_hv.h                  |  74 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  38 +-
 arch/powerpc/kvm/book3s_hv_papr.c             | 940 ++++++++++++++++++
 arch/powerpc/kvm/emulate_loadstore.c          |   4 +-
 arch/powerpc/kvm/guest-state-buffer.c         |  49 +
 14 files changed, 1684 insertions(+), 94 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_papr.c

diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
index 65a840abf1bb..116126edd8e2 100644
--- a/arch/powerpc/include/asm/guest-state-buffer.h
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
 #define _ASM_POWERPC_GUEST_STATE_BUFFER_H
 
+#include "asm/hvcall.h"
 #include <linux/gfp.h>
 #include <linux/bitmap.h>
 #include <asm/plpar_wrappers.h>
@@ -14,16 +15,16 @@
  **************************************************************************/
 #define GSID_BLANK			0x0000
 
-#define GSID_HOST_STATE_SIZE		0x0001 /* Size of Hypervisor Internal Format VCPU state */
-#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002 /* Minimum size of the Run VCPU output buffer */
-#define GSID_LOGICAL_PVR		0x0003 /* Logical PVR */
-#define GSID_TB_OFFSET			0x0004 /* Timebase Offset */
-#define GSID_PARTITION_TABLE		0x0005 /* Partition Scoped Page Table */
-#define GSID_PROCESS_TABLE		0x0006 /* Process Table */
+#define GSID_HOST_STATE_SIZE		0x0001
+#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002
+#define GSID_LOGICAL_PVR		0x0003
+#define GSID_TB_OFFSET			0x0004
+#define GSID_PARTITION_TABLE		0x0005
+#define GSID_PROCESS_TABLE		0x0006
 
-#define GSID_RUN_INPUT			0x0C00 /* Run VCPU Input Buffer */
-#define GSID_RUN_OUTPUT			0x0C01 /* Run VCPU Out Buffer */
-#define GSID_VPA			0x0C02 /* HRA to Guest VCPU VPA */
+#define GSID_RUN_INPUT			0x0C00
+#define GSID_RUN_OUTPUT			0x0C01
+#define GSID_VPA			0x0C02
 
 #define GSID_GPR(x)			(0x1000 + (x))
 #define GSID_HDEC_EXPIRY_TB		0x1020
@@ -300,6 +301,8 @@ struct gs_buff *gsb_new(size_t size, unsigned long guest_id,
 			unsigned long vcpu_id, gfp_t flags);
 void gsb_free(struct gs_buff *gsb);
 void *gsb_put(struct gs_buff *gsb, size_t size);
+int gsb_send(struct gs_buff *gsb, unsigned long flags);
+int gsb_recv(struct gs_buff *gsb, unsigned long flags);
 
 /**
  * gsb_header() - the header of a guest state buffer
@@ -898,4 +901,88 @@ static inline void gsm_reset(struct gs_msg *gsm)
 	gsbm_zero(&gsm->bitmap);
 }
 
+/**
+ * gsb_receive_data - flexibly update values from a guest state buffer
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ *
+ * Requests updated values for the guest state values included in the guest
+ * state message. The guest state message will then deserialize the guest state
+ * buffer.
+ */
+static inline int gsb_receive_data(struct gs_buff *gsb, struct gs_msg *gsm)
+{
+	int rc;
+
+	rc = gsm_fill_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+
+	rc = gsb_recv(gsb, gsm->flags);
+	if (rc < 0)
+		return rc;
+
+	rc = gsm_refresh_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+
+/**
+ * gsb_recv - receive a single guest state ID
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ * @iden: guest state identity
+ */
+static inline int gsb_receive_datum(struct gs_buff *gsb, struct gs_msg *gsm,
+				    u16 iden)
+{
+	int rc;
+
+	gsm_include(gsm, iden);
+	rc = gsb_receive_data(gsb, gsm);
+	if (rc < 0)
+		return rc;
+	gsm_reset(gsm);
+	return 0;
+}
+
+/**
+ * gsb_send_data - flexibly send values from a guest state buffer
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ *
+ * Sends the guest state values included in the guest state message.
+ */
+static inline int gsb_send_data(struct gs_buff *gsb, struct gs_msg *gsm)
+{
+	int rc;
+
+	rc = gsm_fill_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+	rc = gsb_send(gsb, gsm->flags);
+
+	return rc;
+}
+
+/**
+ * gsb_recv - send a single guest state ID
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ * @iden: guest state identity
+ */
+static inline int gsb_send_datum(struct gs_buff *gsb, struct gs_msg *gsm,
+				 u16 iden)
+{
+	int rc;
+
+	gsm_include(gsm, iden);
+	rc = gsb_send_data(gsb, gsm);
+	if (rc < 0)
+		return rc;
+	gsm_reset(gsm);
+	return 0;
+}
+
 #endif /* _ASM_POWERPC_GUEST_STATE_BUFFER_H */
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index c099780385dd..ddb99e982917 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -100,6 +100,18 @@
 #define H_COP_HW	-74
 #define H_STATE		-75
 #define H_IN_USE	-77
+
+#define H_INVALID_ELEMENT_ID			-79
+#define H_INVALID_ELEMENT_SIZE			-80
+#define H_INVALID_ELEMENT_VALUE			-81
+#define H_INPUT_BUFFER_NOT_DEFINED		-82
+#define H_INPUT_BUFFER_TOO_SMALL		-83
+#define H_OUTPUT_BUFFER_NOT_DEFINED		-84
+#define H_OUTPUT_BUFFER_TOO_SMALL		-85
+#define H_PARTITION_PAGE_TABLE_NOT_DEFINED	-86
+#define H_GUEST_VCPU_STATE_NOT_HV_OWNED		-87
+
+
 #define H_UNSUPPORTED_FLAG_START	-256
 #define H_UNSUPPORTED_FLAG_END		-511
 #define H_MULTI_THREADS_ACTIVE	-9005
@@ -381,6 +393,15 @@
 #define H_ENTER_NESTED		0xF804
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
+#define H_GUEST_GET_CAPABILITIES 0x460
+#define H_GUEST_SET_CAPABILITIES 0x464
+#define H_GUEST_CREATE		0x470
+#define H_GUEST_CREATE_VCPU	0x474
+#define H_GUEST_GET_STATE	0x478
+#define H_GUEST_SET_STATE	0x47C
+#define H_GUEST_RUN_VCPU	0x480
+#define H_GUEST_COPY_MEMORY	0x484
+#define H_GUEST_DELETE		0x488
 
 /* Flags for H_SVM_PAGE_IN */
 #define H_PAGE_IN_SHARED        0x1
@@ -467,6 +488,15 @@
 #define H_RPTI_PAGE_1G	0x08
 #define H_RPTI_PAGE_ALL (-1UL)
 
+/* Flags for H_GUEST_{S,G}_STATE */
+#define H_GUEST_FLAGS_WIDE     (1UL<<(63-0))
+
+/* Flag values used for H_{S,G}SET_GUEST_CAPABILITIES */
+#define H_GUEST_CAP_COPY_MEM	(1UL<<(63-0))
+#define H_GUEST_CAP_POWER9	(1UL<<(63-1))
+#define H_GUEST_CAP_POWER10	(1UL<<(63-2))
+#define H_GUEST_CAP_BITMAP2	(1UL<<(63-63))
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 0ca2d8b37b42..c5c57552b447 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_book3s_asm.h>
+#include <asm/guest-state-buffer.h>
 
 struct kvmppc_bat {
 	u64 raw;
@@ -316,6 +317,57 @@ long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu);
 
 void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac);
 
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+
+extern bool __kvmhv_on_papr;
+
+static inline bool kvmhv_on_papr(void)
+{
+	return __kvmhv_on_papr;
+}
+
+#else
+
+static inline bool kvmhv_on_papr(void)
+{
+	return false;
+}
+
+#endif
+
+int __kvmhv_papr_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
+int __kvmhv_papr_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
+int __kvmhv_papr_mark_dirty(struct kvm_vcpu *vcpu, u16 iden);
+int __kvmhv_papr_cached_reload(struct kvm_vcpu *vcpu, u16 iden);
+
+static inline int kvmhv_papr_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	if (kvmhv_on_papr())
+		return __kvmhv_papr_reload_ptregs(vcpu, regs);
+	return 0;
+}
+static inline int kvmhv_papr_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	if (kvmhv_on_papr())
+		return __kvmhv_papr_mark_dirty_ptregs(vcpu, regs);
+	return 0;
+}
+
+static inline int kvmhv_papr_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	if (kvmhv_on_papr())
+		return __kvmhv_papr_mark_dirty(vcpu, iden);
+	return 0;
+}
+
+static inline int kvmhv_papr_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	if (kvmhv_on_papr())
+		return __kvmhv_papr_cached_reload(vcpu, iden);
+	return 0;
+}
+
 extern int kvm_irq_bypass;
 
 static inline struct kvmppc_vcpu_book3s *to_book3s(struct kvm_vcpu *vcpu)
@@ -335,70 +387,84 @@ static inline struct kvmppc_vcpu_book3s *to_book3s(struct kvm_vcpu *vcpu)
 static inline void kvmppc_set_gpr(struct kvm_vcpu *vcpu, int num, ulong val)
 {
 	vcpu->arch.regs.gpr[num] = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_GPR(num));
 }
 
 static inline ulong kvmppc_get_gpr(struct kvm_vcpu *vcpu, int num)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_GPR(num));
 	return vcpu->arch.regs.gpr[num];
 }
 
 static inline void kvmppc_set_cr(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.regs.ccr = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_CR);
 }
 
 static inline u32 kvmppc_get_cr(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_CR);
 	return vcpu->arch.regs.ccr;
 }
 
 static inline void kvmppc_set_xer(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.xer = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_XER);
 }
 
 static inline ulong kvmppc_get_xer(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_XER);
 	return vcpu->arch.regs.xer;
 }
 
 static inline void kvmppc_set_ctr(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.ctr = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_CTR);
 }
 
 static inline ulong kvmppc_get_ctr(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_CTR);
 	return vcpu->arch.regs.ctr;
 }
 
 static inline void kvmppc_set_lr(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.link = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_LR);
 }
 
 static inline ulong kvmppc_get_lr(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_LR);
 	return vcpu->arch.regs.link;
 }
 
 static inline void kvmppc_set_pc(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.nip = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_NIA);
 }
 
 static inline ulong kvmppc_get_pc(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_NIA);
 	return vcpu->arch.regs.nip;
 }
 
 static inline void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.pid = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_PIDR);
 }
 
 static inline u32 kvmppc_get_pid(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_PIDR);
 	return vcpu->arch.pid;
 }
 
@@ -415,111 +481,129 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 
 static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_VSRS(i));
 	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
 }
 
 static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
 {
 	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_VSRS(i));
 }
 
 static inline u64 kvmppc_get_fpscr(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_FPSCR);
 	return vcpu->arch.fp.fpscr;
 }
 
 static inline void kvmppc_set_fpscr(struct kvm_vcpu *vcpu, u64 val)
 {
 	vcpu->arch.fp.fpscr = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_FPSCR);
 }
 
 
 static inline u64 kvmppc_get_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_VSRS(i));
 	return vcpu->arch.fp.fpr[i][j];
 }
 
 static inline void kvmppc_set_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j, u64 val)
 {
 	vcpu->arch.fp.fpr[i][j] = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_VSRS(i));
 }
 
 #ifdef CONFIG_VSX
 static inline vector128 kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_VSRS(32 + i));
 	return vcpu->arch.vr.vr[i];
 }
 
 static inline void kvmppc_set_vsx_vr(struct kvm_vcpu *vcpu, int i, vector128 val)
 {
 	vcpu->arch.vr.vr[i] = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_VSRS(32 + i));
 }
 
 static inline u32 kvmppc_get_vscr(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_VSCR);
 	return vcpu->arch.vr.vscr.u[3];
 }
 
 static inline void kvmppc_set_vscr(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.vr.vscr.u[3] = val;
+	kvmhv_papr_mark_dirty(vcpu, GSID_VSCR);
 }
 #endif
 
-#define BOOK3S_WRAPPER_SET(reg, size)					\
+#define BOOK3S_WRAPPER_SET(reg, size, iden)				\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 									\
 	vcpu->arch.reg = val;						\
+	kvmhv_papr_mark_dirty(vcpu, iden);				\
 }
 
-#define BOOK3S_WRAPPER_GET(reg, size)					\
+#define BOOK3S_WRAPPER_GET(reg, size, iden)				\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	kvmhv_papr_cached_reload(vcpu, iden);				\
 	return vcpu->arch.reg;						\
 }
 
-#define BOOK3S_WRAPPER(reg, size)					\
-	BOOK3S_WRAPPER_SET(reg, size)					\
-	BOOK3S_WRAPPER_GET(reg, size)					\
+#define BOOK3S_WRAPPER(reg, size, iden)					\
+	BOOK3S_WRAPPER_SET(reg, size, iden)				\
+	BOOK3S_WRAPPER_GET(reg, size, iden)				\
 
-BOOK3S_WRAPPER(tar, 64)
-BOOK3S_WRAPPER(ebbhr, 64)
-BOOK3S_WRAPPER(ebbrr, 64)
-BOOK3S_WRAPPER(bescr, 64)
-BOOK3S_WRAPPER(ic, 64)
-BOOK3S_WRAPPER(vrsave, 64)
+BOOK3S_WRAPPER(tar, 64, GSID_TAR)
+BOOK3S_WRAPPER(ebbhr, 64, GSID_EBBHR)
+BOOK3S_WRAPPER(ebbrr, 64, GSID_EBBRR)
+BOOK3S_WRAPPER(bescr, 64, GSID_BESCR)
+BOOK3S_WRAPPER(ic, 64, GSID_IC)
+BOOK3S_WRAPPER(vrsave, 64, GSID_VRSAVE)
 
 
-#define VCORE_WRAPPER_SET(reg, size)					\
+#define VCORE_WRAPPER_SET(reg, size, iden)				\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	vcpu->arch.vcore->reg = val;					\
+	kvmhv_papr_mark_dirty(vcpu, iden);				\
 }
 
-#define VCORE_WRAPPER_GET(reg, size)					\
+#define VCORE_WRAPPER_GET(reg, size, iden)				\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
 {									\
+	kvmhv_papr_cached_reload(vcpu, iden);				\
 	return vcpu->arch.vcore->reg;					\
 }
 
-#define VCORE_WRAPPER(reg, size)					\
-	VCORE_WRAPPER_SET(reg, size)					\
-	VCORE_WRAPPER_GET(reg, size)					\
+#define VCORE_WRAPPER(reg, size, iden)					\
+	VCORE_WRAPPER_SET(reg, size, iden)				\
+	VCORE_WRAPPER_GET(reg, size, iden)				\
 
 
-VCORE_WRAPPER(vtb, 64)
-VCORE_WRAPPER(tb_offset, 64)
-VCORE_WRAPPER(lpcr, 64)
+VCORE_WRAPPER(vtb, 64, GSID_VTB)
+VCORE_WRAPPER(tb_offset, 64, GSID_TB_OFFSET)
+VCORE_WRAPPER(lpcr, 64, GSID_LPCR)
 
 static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
 {
+	kvmhv_papr_cached_reload(vcpu, GSID_TB_OFFSET);
+	kvmhv_papr_cached_reload(vcpu, GSID_DEC_EXPIRY_TB);
 	return vcpu->arch.dec_expires;
 }
 
 static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val)
 {
 	vcpu->arch.dec_expires = val;
+	kvmhv_papr_cached_reload(vcpu, GSID_TB_OFFSET);
+	kvmhv_papr_mark_dirty(vcpu, GSID_DEC_EXPIRY_TB);
 }
 
 /* Expiry time of vcpu DEC relative to host TB */
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index d49065af08e9..689e14284127 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -677,6 +677,12 @@ static inline pte_t *find_kvm_host_pte(struct kvm *kvm, unsigned long mmu_seq,
 extern pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
 					unsigned long ea, unsigned *hshift);
 
+int kvmhv_papr_vcpu_create(struct kvm_vcpu *vcpu, struct kvmhv_papr_host *nested_state);
+void kvmhv_papr_vcpu_free(struct kvm_vcpu *vcpu, struct kvmhv_papr_host *nested_state);
+int kvmhv_papr_flush_vcpu(struct kvm_vcpu *vcpu, u64 time_limit);
+int kvmhv_papr_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1);
+int kvmhv_papr_parse_output(struct kvm_vcpu *vcpu);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 14ee0dece853..21e8bf9e530a 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -25,6 +25,7 @@
 #include <asm/cacheflush.h>
 #include <asm/hvcall.h>
 #include <asm/mce.h>
+#include <asm/guest-state-buffer.h>
 
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
 
@@ -509,6 +510,23 @@ union xive_tma_w01 {
 	__be64 w01;
 };
 
+ /* Nested PAPR host H_GUEST_RUN_VCPU configuration */
+struct kvmhv_papr_config {
+	struct gs_buff_info vcpu_run_output_cfg;
+	struct gs_buff_info vcpu_run_input_cfg;
+	u64 vcpu_run_output_size;
+};
+
+ /* Nested PAPR host state */
+struct kvmhv_papr_host {
+	struct kvmhv_papr_config cfg;
+	struct gs_buff *vcpu_run_output;
+	struct gs_buff *vcpu_run_input;
+	struct gs_msg *vcpu_message;
+	struct gs_msg *vcore_message;
+	struct gs_bitmap valids;
+};
+
 struct kvm_vcpu_arch {
 	ulong host_stack;
 	u32 host_pid;
@@ -575,6 +593,7 @@ struct kvm_vcpu_arch {
 	ulong dscr;
 	ulong amr;
 	ulong uamor;
+	ulong amor;
 	ulong iamr;
 	u32 ctrl;
 	u32 dabrx;
@@ -829,6 +848,8 @@ struct kvm_vcpu_arch {
 	u64 nested_hfscr;	/* HFSCR that the L1 requested for the nested guest */
 	u32 nested_vcpu_id;
 	gpa_t nested_io_gpr;
+	/* For nested APIv2 guests*/
+	struct kvmhv_papr_host papr_host;
 #endif
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index fbac353ac46b..4d43bb29ba7c 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -615,6 +615,35 @@ static inline bool kvmhv_on_pseries(void)
 {
 	return false;
 }
+
+#endif
+
+#ifndef CONFIG_PPC_BOOK3S
+
+static inline bool kvmhv_on_papr(void)
+{
+	return false;
+}
+
+static inline int kvmhv_papr_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	return 0;
+}
+static inline int kvmhv_papr_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	return 0;
+}
+
+static inline int kvmhv_papr_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	return 0;
+}
+
+static inline int kvmhv_papr_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	return 0;
+}
+
 #endif
 
 #ifdef CONFIG_KVM_XICS
@@ -957,31 +986,33 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
 }									\
 
-#define SHARED_CACHE_WRAPPER_GET(reg, size)				\
+#define SHARED_CACHE_WRAPPER_GET(reg, size, iden)			\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	kvmhv_papr_cached_reload(vcpu, iden);				\
 	if (kvmppc_shared_big_endian(vcpu))				\
 	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
 	else								\
 	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
 }									\
 
-#define SHARED_CACHE_WRAPPER_SET(reg, size)				\
+#define SHARED_CACHE_WRAPPER_SET(reg, size, iden)			\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
 	       vcpu->arch.shared->reg = cpu_to_be##size(val);		\
 	else								\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
+	kvmhv_papr_mark_dirty(vcpu, iden);				\
 }									\
 
 #define SHARED_WRAPPER(reg, size)					\
 	SHARED_WRAPPER_GET(reg, size)					\
 	SHARED_WRAPPER_SET(reg, size)					\
 
-#define SHARED_CACHE_WRAPPER(reg, size)					\
-	SHARED_CACHE_WRAPPER_GET(reg, size)				\
-	SHARED_CACHE_WRAPPER_SET(reg, size)				\
+#define SHARED_CACHE_WRAPPER(reg, size, iden)				\
+	SHARED_CACHE_WRAPPER_GET(reg, size, iden)			\
+	SHARED_CACHE_WRAPPER_SET(reg, size, iden)			\
 
 #define SPRNG_WRAPPER(reg, bookehv_spr)					\
 	SPRNG_WRAPPER_GET(reg, bookehv_spr)				\
@@ -1000,29 +1031,30 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 #define SHARED_SPRNG_WRAPPER(reg, size, bookehv_spr)			\
 	SHARED_WRAPPER(reg, size)					\
 
-#define SHARED_SPRNG_CACHE_WRAPPER(reg, size, bookehv_spr)		\
-	SHARED_CACHE_WRAPPER(reg, size)					\
+#define SHARED_SPRNG_CACHE_WRAPPER(reg, size, bookehv_spr, iden)	\
+	SHARED_CACHE_WRAPPER(reg, size, iden)				\
 
 #endif
 
 SHARED_WRAPPER(critical, 64)
-SHARED_SPRNG_CACHE_WRAPPER(sprg0, 64, SPRN_GSPRG0)
-SHARED_SPRNG_CACHE_WRAPPER(sprg1, 64, SPRN_GSPRG1)
-SHARED_SPRNG_CACHE_WRAPPER(sprg2, 64, SPRN_GSPRG2)
-SHARED_SPRNG_CACHE_WRAPPER(sprg3, 64, SPRN_GSPRG3)
-SHARED_SPRNG_CACHE_WRAPPER(srr0, 64, SPRN_GSRR0)
-SHARED_SPRNG_CACHE_WRAPPER(srr1, 64, SPRN_GSRR1)
-SHARED_SPRNG_CACHE_WRAPPER(dar, 64, SPRN_GDEAR)
+SHARED_SPRNG_CACHE_WRAPPER(sprg0, 64, SPRN_GSPRG0, GSID_SPRG0)
+SHARED_SPRNG_CACHE_WRAPPER(sprg1, 64, SPRN_GSPRG1, GSID_SPRG1)
+SHARED_SPRNG_CACHE_WRAPPER(sprg2, 64, SPRN_GSPRG2, GSID_SPRG2)
+SHARED_SPRNG_CACHE_WRAPPER(sprg3, 64, SPRN_GSPRG3, GSID_SPRG3)
+SHARED_SPRNG_CACHE_WRAPPER(srr0, 64, SPRN_GSRR0, GSID_SRR0)
+SHARED_SPRNG_CACHE_WRAPPER(srr1, 64, SPRN_GSRR1, GSID_SRR1)
+SHARED_SPRNG_CACHE_WRAPPER(dar, 64, SPRN_GDEAR, GSID_DAR)
 SHARED_SPRNG_WRAPPER(esr, 64, SPRN_GESR)
-SHARED_CACHE_WRAPPER_GET(msr, 64)
+SHARED_CACHE_WRAPPER_GET(msr, 64, GSID_MSR)
 static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 {
 	if (kvmppc_shared_big_endian(vcpu))
 	       vcpu->arch.shared->msr = cpu_to_be64(val);
 	else
 	       vcpu->arch.shared->msr = cpu_to_le64(val);
+	kvmhv_papr_mark_dirty(vcpu, GSID_MSR);
 }
-SHARED_CACHE_WRAPPER(dsisr, 32)
+SHARED_CACHE_WRAPPER(dsisr, 32, GSID_DSISR)
 SHARED_WRAPPER(int_pending, 32)
 SHARED_WRAPPER(sprg4, 64)
 SHARED_WRAPPER(sprg5, 64)
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 8239c0af5eb2..b48f90884522 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -6,6 +6,7 @@
 
 #include <linux/string.h>
 #include <linux/irqflags.h>
+#include <linux/delay.h>
 
 #include <asm/hvcall.h>
 #include <asm/paca.h>
@@ -342,6 +343,203 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
 	return rc;
 }
 
+static inline long plpar_guest_create(unsigned long flags, unsigned long *guest_id)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	unsigned long token;
+	long rc;
+
+	token = -1UL;
+	while (true) {
+		rc = plpar_hcall(H_GUEST_CREATE, retbuf, flags, token);
+		if (rc == H_SUCCESS) {
+			*guest_id = retbuf[0];
+			break;
+		}
+
+		if (rc == H_BUSY) {
+			token = retbuf[0];
+			cpu_relax();
+			continue;
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			token = retbuf[0];
+			mdelay(get_longbusy_msecs(rc));
+			continue;
+		}
+
+		break;
+	}
+
+	return rc;
+}
+
+static inline long plpar_guest_create_vcpu(unsigned long flags,
+					   unsigned long guest_id,
+					   unsigned long vcpu_id)
+{
+	long rc;
+
+	while (true) {
+		rc = plpar_hcall_norets(H_GUEST_CREATE_VCPU, 0, guest_id, vcpu_id);
+
+		if (rc == H_BUSY) {
+			cpu_relax();
+			continue;
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			mdelay(get_longbusy_msecs(rc));
+			continue;
+		}
+
+		break;
+	}
+
+	return rc;
+}
+
+static inline long plpar_guest_set_state(unsigned long flags,
+					 unsigned long guest_id,
+					 unsigned long vcpu_id,
+					 unsigned long data_buffer,
+					 unsigned long data_size,
+					 unsigned long *failed_index)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	while (true) {
+		rc = plpar_hcall(H_GUEST_SET_STATE, retbuf, flags, guest_id,
+				 vcpu_id, data_buffer, data_size);
+
+		if (rc == H_BUSY) {
+			cpu_relax();
+			continue;
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			mdelay(get_longbusy_msecs(rc));
+			continue;
+		}
+
+		if (rc == H_INVALID_ELEMENT_ID)
+			*failed_index = retbuf[0];
+		else if (rc == H_INVALID_ELEMENT_SIZE)
+			*failed_index = retbuf[0];
+		else if (rc == H_INVALID_ELEMENT_VALUE)
+			*failed_index = retbuf[0];
+
+		break;
+	}
+
+	return rc;
+}
+
+static inline long plpar_guest_get_state(unsigned long flags,
+					 unsigned long guest_id,
+					 unsigned long vcpu_id,
+					 unsigned long data_buffer,
+					 unsigned long data_size,
+					 unsigned long *failed_index)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	while (true) {
+		rc = plpar_hcall(H_GUEST_GET_STATE, retbuf, flags, guest_id,
+				 vcpu_id, data_buffer, data_size);
+
+		if (rc == H_BUSY) {
+			cpu_relax();
+			continue;
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			mdelay(get_longbusy_msecs(rc));
+			continue;
+		}
+
+		if (rc == H_INVALID_ELEMENT_ID)
+			*failed_index = retbuf[0];
+		else if (rc == H_INVALID_ELEMENT_SIZE)
+			*failed_index = retbuf[0];
+		else if (rc == H_INVALID_ELEMENT_VALUE)
+			*failed_index = retbuf[0];
+
+		break;
+	}
+
+	return rc;
+}
+
+static inline long plpar_guest_run_vcpu(unsigned long flags, unsigned long guest_id,
+					unsigned long vcpu_id, int *trap,
+					unsigned long *failed_index)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	rc = plpar_hcall(H_GUEST_RUN_VCPU, retbuf, flags, guest_id, vcpu_id);
+	if (rc == H_SUCCESS)
+		*trap = retbuf[0];
+	else if (rc == H_INVALID_ELEMENT_ID)
+		*failed_index = retbuf[0];
+	else if (rc == H_INVALID_ELEMENT_SIZE)
+		*failed_index = retbuf[0];
+	else if (rc == H_INVALID_ELEMENT_VALUE)
+		*failed_index = retbuf[0];
+
+	return rc;
+}
+
+static inline long plpar_guest_delete(unsigned long flags, u64 guest_id)
+{
+	long rc;
+
+	while (true) {
+		rc = plpar_hcall_norets(H_GUEST_DELETE, flags, guest_id);
+		if (rc == H_BUSY) {
+			cpu_relax();
+			continue;
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			mdelay(get_longbusy_msecs(rc));
+			continue;
+		}
+
+		break;
+	}
+
+	return rc;
+}
+
+static inline long plpar_guest_set_capabilities(unsigned long flags,
+						unsigned long capabilities)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	rc = plpar_hcall(H_GUEST_SET_CAPABILITIES, retbuf, flags, capabilities);
+
+	return rc;
+}
+
+static inline long plpar_guest_get_capabilities(unsigned long flags,
+						unsigned long *capabilities)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	long rc;
+
+	rc = plpar_hcall(H_GUEST_GET_CAPABILITIES, retbuf, flags);
+	if (rc == H_SUCCESS)
+		*capabilities = retbuf[0];
+
+	return rc;
+}
+
 /*
  * Wrapper to H_RPT_INVALIDATE hcall that handles return values appropriately
  *
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index eb8445e71c14..9bb0876521ee 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -87,6 +87,7 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_hv_ras.o \
 	book3s_hv_builtin.o \
 	book3s_hv_p9_perf.o \
+	book3s_hv_papr.o \
 	guest-state-buffer.o \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 521d84621422..f22ee582e209 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -383,6 +383,11 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
 	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
 }
 
+static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
+{
+	vcpu->arch.pvr = pvr;
+}
+
 /* Dummy value used in computing PCR value below */
 #define PCR_ARCH_31    (PCR_ARCH_300 << 1)
 
@@ -1262,13 +1267,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 			return RESUME_HOST;
 		break;
 #endif
-	case H_RANDOM:
+	case H_RANDOM: {
 		unsigned long rand;
 
 		if (!arch_get_random_seed_longs(&rand, 1))
 			ret = H_HARDWARE;
 		kvmppc_set_gpr(vcpu, 4, rand);
 		break;
+	}
 	case H_RPT_INVALIDATE:
 		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
 					      kvmppc_get_gpr(vcpu, 5),
@@ -2921,14 +2927,21 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.shared_big_endian = false;
 #endif
 #endif
-	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
 
+	if (kvmhv_on_papr()) {
+		err = kvmhv_papr_vcpu_create(vcpu, &vcpu->arch.papr_host);
+		if (err < 0)
+			return err;
+	}
+
+	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
 		kvmppc_set_mmcr_hv(vcpu, 0, kvmppc_get_mmcr_hv(vcpu, 0) | MMCR0_PMCCEXT);
 		kvmppc_set_mmcra_hv(vcpu, MMCRA_BHRB_DISABLE);
 	}
 
 	kvmppc_set_ctrl_hv(vcpu, CTRL_RUNLATCH);
+	kvmppc_set_amor_hv(vcpu, ~0);
 	/* default to host PVR, since we can't spoof it */
 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
 	spin_lock_init(&vcpu->arch.vpa_update_lock);
@@ -3006,6 +3019,8 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 			kvm->arch.vcores[core] = vcore;
 			kvm->arch.online_vcores++;
 			mutex_unlock(&kvm->arch.mmu_setup_lock);
+			if (kvmhv_on_papr())
+				kvmppc_set_lpcr_hv(vcpu, vcpu->arch.vcore->lpcr);
 		}
 	}
 	mutex_unlock(&kvm->lock);
@@ -3078,6 +3093,8 @@ static void kvmppc_core_vcpu_free_hv(struct kvm_vcpu *vcpu)
 	unpin_vpa(vcpu->kvm, &vcpu->arch.slb_shadow);
 	unpin_vpa(vcpu->kvm, &vcpu->arch.vpa);
 	spin_unlock(&vcpu->arch.vpa_update_lock);
+	if (kvmhv_on_papr())
+		kvmhv_papr_vcpu_free(vcpu, &vcpu->arch.papr_host);
 }
 
 static int kvmppc_core_check_requests_hv(struct kvm_vcpu *vcpu)
@@ -4042,6 +4059,50 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 	}
 }
 
+static int kvmhv_vcpu_entry_papr(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
+{
+	struct kvmhv_papr_host *ph;
+	unsigned long msr, i;
+	int trap;
+	long rc;
+
+	ph = &vcpu->arch.papr_host;
+
+	msr = mfmsr();
+	kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
+	if (lazy_irq_pending())
+		return 0;
+
+	kvmhv_papr_flush_vcpu(vcpu, time_limit);
+
+	accumulate_time(vcpu, &vcpu->arch.in_guest);
+	rc = plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
+				  &trap, &i);
+
+	if (rc != H_SUCCESS) {
+		pr_err("KVM Guest Run VCPU hcall failed\n");
+		if (rc == H_INVALID_ELEMENT_ID)
+			pr_err("KVM: Guest Run VCPU invalid element id at %ld\n", i);
+		else if (rc == H_INVALID_ELEMENT_SIZE)
+			pr_err("KVM: Guest Run VCPU invalid element size at %ld\n", i);
+		else if (rc == H_INVALID_ELEMENT_VALUE)
+			pr_err("KVM: Guest Run VCPU invalid element value at %ld\n", i);
+		return 0;
+	}
+	accumulate_time(vcpu, &vcpu->arch.guest_exit);
+
+	*tb = mftb();
+	gsm_reset(ph->vcpu_message);
+	gsm_reset(ph->vcore_message);
+	gsbm_zero(&ph->valids);
+
+	kvmhv_papr_parse_output(vcpu);
+
+	timer_rearm_host_dec(*tb);
+
+	return trap;
+}
+
 /* call our hypervisor to load up HV regs and go */
 static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
@@ -4159,7 +4220,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
-		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
+		if (!kvmhv_on_papr())
+			trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
+		else
+			trap = kvmhv_vcpu_entry_papr(vcpu, time_limit, lpcr, tb);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !nested &&
@@ -5119,6 +5183,7 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
  */
 void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
 {
+	struct kvm_vcpu *vcpu;
 	long int i;
 	u32 cores_done = 0;
 
@@ -5139,6 +5204,12 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
 		if (++cores_done >= kvm->arch.online_vcores)
 			break;
 	}
+
+	if (kvmhv_on_papr()) {
+		kvm_for_each_vcpu(i, vcpu, kvm) {
+			kvmppc_set_lpcr_hv(vcpu, vcpu->arch.vcore->lpcr);
+		}
+	}
 }
 
 void kvmppc_setup_partition_table(struct kvm *kvm)
@@ -5405,15 +5476,43 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 
 	/* Allocate the guest's logical partition ID */
 
-	lpid = kvmppc_alloc_lpid();
-	if ((long)lpid < 0)
-		return -ENOMEM;
-	kvm->arch.lpid = lpid;
+	if (!kvmhv_on_papr()) {
+		lpid = kvmppc_alloc_lpid();
+		if ((long)lpid < 0)
+			return -ENOMEM;
+		kvm->arch.lpid = lpid;
+	}
 
 	kvmppc_alloc_host_rm_ops();
 
 	kvmhv_vm_nested_init(kvm);
 
+	if (kvmhv_on_papr()) {
+		long rc;
+		unsigned long guest_id;
+
+		rc = plpar_guest_create(0, &guest_id);
+
+		if (rc != H_SUCCESS)
+			pr_err("KVM: Create Guest hcall failed, rc=%ld\n", rc);
+
+		switch (rc) {
+		case H_PARAMETER:
+		case H_FUNCTION:
+		case H_STATE:
+			return -EINVAL;
+		case H_NOT_ENOUGH_RESOURCES:
+		case H_ABORTED:
+			return -ENOMEM;
+		case H_AUTHORITY:
+			return -EPERM;
+		case H_NOT_AVAILABLE:
+			return -EBUSY;
+		}
+		kvm->arch.lpid = guest_id;
+	}
+
+
 	/*
 	 * Since we don't flush the TLB when tearing down a VM,
 	 * and this lpid might have previously been used,
@@ -5483,7 +5582,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 			lpcr |= LPCR_HAIL;
 		ret = kvmppc_init_vm_radix(kvm);
 		if (ret) {
-			kvmppc_free_lpid(kvm->arch.lpid);
+			if (kvmhv_on_papr())
+				plpar_guest_delete(0, kvm->arch.lpid);
+			else
+				kvmppc_free_lpid(kvm->arch.lpid);
 			return ret;
 		}
 		kvmppc_setup_partition_table(kvm);
@@ -5573,10 +5675,14 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		kvm->arch.process_table = 0;
 		if (kvm->arch.secure_guest)
 			uv_svm_terminate(kvm->arch.lpid);
-		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
+		if (!kvmhv_on_papr())
+			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 
-	kvmppc_free_lpid(kvm->arch.lpid);
+	if (kvmhv_on_papr())
+		plpar_guest_delete(0, kvm->arch.lpid);
+	else
+		kvmppc_free_lpid(kvm->arch.lpid);
 
 	kvmppc_free_pimap(kvm);
 }
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index 7a7005189ab1..61d2c2b8d084 100644
--- a/arch/powerpc/kvm/book3s_hv.h
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -3,6 +3,8 @@
 /*
  * Privileged (non-hypervisor) host registers to save.
  */
+#include "asm/guest-state-buffer.h"
+
 struct p9_host_os_sprs {
 	unsigned long iamr;
 	unsigned long amr;
@@ -51,61 +53,65 @@ void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
 #define end_timing(vcpu) do {} while (0)
 #endif
 
-#define HV_WRAPPER_SET(reg, size)					\
+#define HV_WRAPPER_SET(reg, size, iden)					\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	vcpu->arch.reg = val;						\
+	kvmhv_papr_mark_dirty(vcpu, iden);				\
 }
 
-#define HV_WRAPPER_GET(reg, size)					\
+#define HV_WRAPPER_GET(reg, size, iden)					\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
 {									\
+	kvmhv_papr_cached_reload(vcpu, iden);				\
 	return vcpu->arch.reg;						\
 }
 
-#define HV_WRAPPER(reg, size)						\
-	HV_WRAPPER_SET(reg, size)					\
-	HV_WRAPPER_GET(reg, size)					\
+#define HV_WRAPPER(reg, size, iden)					\
+	HV_WRAPPER_SET(reg, size, iden)					\
+	HV_WRAPPER_GET(reg, size, iden)					\
 
-#define HV_ARRAY_WRAPPER_SET(reg, size)					\
+#define HV_ARRAY_WRAPPER_SET(reg, size, iden)				\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, int i, u##size val)	\
 {									\
 	vcpu->arch.reg[i] = val;					\
+	kvmhv_papr_mark_dirty(vcpu, iden(i));				\
 }
 
-#define HV_ARRAY_WRAPPER_GET(reg, size)					\
+#define HV_ARRAY_WRAPPER_GET(reg, size, iden)				\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu, int i)	\
 {									\
+	kvmhv_papr_cached_reload(vcpu, iden(i));			\
 	return vcpu->arch.reg[i];					\
 }
 
-#define HV_ARRAY_WRAPPER(reg, size)					\
-	HV_ARRAY_WRAPPER_SET(reg, size)					\
-	HV_ARRAY_WRAPPER_GET(reg, size)					\
+#define HV_ARRAY_WRAPPER(reg, size, iden)				\
+	HV_ARRAY_WRAPPER_SET(reg, size, iden)				\
+	HV_ARRAY_WRAPPER_GET(reg, size, iden)				\
 
-HV_WRAPPER(mmcra, 64)
-HV_WRAPPER(hfscr, 64)
-HV_WRAPPER(fscr, 64)
-HV_WRAPPER(dscr, 64)
-HV_WRAPPER(purr, 64)
-HV_WRAPPER(spurr, 64)
-HV_WRAPPER(amr, 64)
-HV_WRAPPER(uamor, 64)
-HV_WRAPPER(siar, 64)
-HV_WRAPPER(sdar, 64)
-HV_WRAPPER(iamr, 64)
-HV_WRAPPER(dawr0, 64)
-HV_WRAPPER(dawr1, 64)
-HV_WRAPPER(dawrx0, 64)
-HV_WRAPPER(dawrx1, 64)
-HV_WRAPPER(ciabr, 64)
-HV_WRAPPER(wort, 64)
-HV_WRAPPER(ppr, 64)
-HV_WRAPPER(ctrl, 64)
+HV_WRAPPER(mmcra, 64, GSID_MMCRA)
+HV_WRAPPER(hfscr, 64, GSID_HFSCR)
+HV_WRAPPER(fscr, 64, GSID_FSCR)
+HV_WRAPPER(dscr, 64, GSID_DSCR)
+HV_WRAPPER(purr, 64, GSID_PURR)
+HV_WRAPPER(spurr, 64, GSID_SPURR)
+HV_WRAPPER(amr, 64, GSID_AMR)
+HV_WRAPPER(uamor, 64, GSID_UAMOR)
+HV_WRAPPER(siar, 64, GSID_SIAR)
+HV_WRAPPER(sdar, 64, GSID_SDAR)
+HV_WRAPPER(iamr, 64, GSID_IAMR)
+HV_WRAPPER(dawr0, 64, GSID_DAWR0)
+HV_WRAPPER(dawr1, 64, GSID_DAWR1)
+HV_WRAPPER(dawrx0, 64, GSID_DAWRX0)
+HV_WRAPPER(dawrx1, 64, GSID_DAWRX1)
+HV_WRAPPER(ciabr, 64, GSID_CIABR)
+HV_WRAPPER(wort, 64, GSID_WORT)
+HV_WRAPPER(ppr, 64, GSID_PPR)
+HV_WRAPPER(ctrl, 64, GSID_CTRL);
+HV_WRAPPER(amor, 64, GSID_AMOR)
 
-HV_ARRAY_WRAPPER(mmcr, 64)
-HV_ARRAY_WRAPPER(sier, 64)
-HV_ARRAY_WRAPPER(pmc, 32)
+HV_ARRAY_WRAPPER(mmcr, 64, GSID_MMCR)
+HV_ARRAY_WRAPPER(sier, 64, GSID_SIER)
+HV_ARRAY_WRAPPER(pmc, 32, GSID_PMC)
 
-HV_WRAPPER(pvr, 32)
-HV_WRAPPER(pspb, 32)
+HV_WRAPPER(pspb, 32, GSID_PSPB)
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 377d0b4a05ee..62e011d1e912 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -428,10 +428,12 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	return vcpu->arch.trap;
 }
 
+static unsigned long nested_capabilities;
+
 long kvmhv_nested_init(void)
 {
 	long int ptb_order;
-	unsigned long ptcr;
+	unsigned long ptcr, host_capabilities;
 	long rc;
 
 	if (!kvmhv_on_pseries())
@@ -439,6 +441,27 @@ long kvmhv_nested_init(void)
 	if (!radix_enabled())
 		return -ENODEV;
 
+	rc = plpar_guest_get_capabilities(0, &host_capabilities);
+	if (rc == H_SUCCESS) {
+		unsigned long capabilities = 0;
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31))
+			capabilities |= H_GUEST_CAP_POWER10;
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
+			capabilities |= H_GUEST_CAP_POWER9;
+
+		nested_capabilities = capabilities & host_capabilities;
+		rc = plpar_guest_set_capabilities(0, nested_capabilities);
+		if (rc != H_SUCCESS) {
+			pr_err("kvm-hv: Could not configure parent hypervisor capabilities (rc=%ld)",
+			       rc);
+			return -ENODEV;
+		}
+
+		__kvmhv_on_papr = true;
+		return 0;
+	}
+
 	/* Partition table entry is 1<<4 bytes in size, hence the 4. */
 	ptb_order = KVM_MAX_NESTED_GUESTS_SHIFT + 4;
 	/* Minimum partition table size is 1<<12 bytes */
@@ -507,10 +530,15 @@ void kvmhv_set_ptbl_entry(unsigned int lpid, u64 dw0, u64 dw1)
 		return;
 	}
 
-	pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
-	pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
-	/* L0 will do the necessary barriers */
-	kvmhv_flush_lpid(lpid);
+	if (!kvmhv_on_papr()) {
+		pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
+		pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
+		/* L0 will do the necessary barriers */
+		kvmhv_flush_lpid(lpid);
+	}
+
+	if (kvmhv_on_papr())
+		kvmhv_papr_set_ptbl_entry(lpid, dw0, dw1);
 }
 
 static void kvmhv_set_nested_ptbl(struct kvm_nested_guest *gp)
diff --git a/arch/powerpc/kvm/book3s_hv_papr.c b/arch/powerpc/kvm/book3s_hv_papr.c
new file mode 100644
index 000000000000..05d8e735e2a9
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_papr.c
@@ -0,0 +1,940 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2023 Jordan Niethe, IBM Corp. <jniethe5@gmail.com>
+ *
+ * Authors:
+ *    Jordan Niethe <jniethe5@gmail.com>
+ *
+ * Description: KVM functions specific to running on Book 3S
+ * processors as a PAPR guest.
+ *
+ */
+
+#include "linux/blk-mq.h"
+#include "linux/console.h"
+#include "linux/gfp_types.h"
+#include "linux/signal.h"
+#include <linux/kernel.h>
+#include <linux/kvm_host.h>
+#include <linux/pgtable.h>
+
+#include <asm/kvm_ppc.h>
+#include <asm/kvm_book3s.h>
+#include <asm/hvcall.h>
+#include <asm/pgalloc.h>
+#include <asm/reg.h>
+#include <asm/plpar_wrappers.h>
+#include <asm/guest-state-buffer.h>
+#include "trace_hv.h"
+
+bool __kvmhv_on_papr __read_mostly;
+EXPORT_SYMBOL_GPL(__kvmhv_on_papr);
+
+
+static size_t gs_msg_ops_kvmhv_papr_config_get_size(struct gs_msg *gsm)
+{
+	u16 ids[] = {
+		GSID_RUN_OUTPUT_MIN_SIZE,
+		GSID_RUN_INPUT,
+		GSID_RUN_OUTPUT,
+
+	};
+	size_t size = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += gse_total_size(gsid_size(ids[i]));
+	return size;
+}
+
+static int gs_msg_ops_kvmhv_papr_config_fill_info(struct gs_buff *gsb,
+						  struct gs_msg *gsm)
+{
+	struct kvmhv_papr_config *cfg;
+	int rc;
+
+	cfg = gsm->data;
+
+	if (gsm_includes(gsm, GSID_RUN_OUTPUT_MIN_SIZE)) {
+		rc = gse_put(gsb, GSID_RUN_OUTPUT_MIN_SIZE,
+			     cfg->vcpu_run_output_size);
+		if (rc < 0)
+			return rc;
+	}
+
+	if (gsm_includes(gsm, GSID_RUN_INPUT)) {
+		rc = gse_put(gsb, GSID_RUN_INPUT, cfg->vcpu_run_input_cfg);
+		if (rc < 0)
+			return rc;
+	}
+
+	if (gsm_includes(gsm, GSID_RUN_OUTPUT)) {
+		gse_put(gsb, GSID_RUN_OUTPUT, cfg->vcpu_run_output_cfg);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int gs_msg_ops_kvmhv_papr_config_refresh_info(struct gs_msg *gsm,
+						     struct gs_buff *gsb)
+{
+	struct kvmhv_papr_config *cfg;
+	struct gs_parser gsp = { 0 };
+	struct gs_elem *gse;
+	int rc;
+
+	cfg = gsm->data;
+
+	rc = gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = gsp_lookup(&gsp, GSID_RUN_OUTPUT_MIN_SIZE);
+	if (gse)
+		gse_get(gse, &cfg->vcpu_run_output_size);
+	return 0;
+}
+
+static struct gs_msg_ops config_msg_ops = {
+	.get_size = gs_msg_ops_kvmhv_papr_config_get_size,
+	.fill_info = gs_msg_ops_kvmhv_papr_config_fill_info,
+	.refresh_info = gs_msg_ops_kvmhv_papr_config_refresh_info,
+};
+
+static size_t gs_msg_ops_vcpu_get_size(struct gs_msg *gsm)
+{
+	struct gs_bitmap gsbm = { 0 };
+	size_t size = 0;
+	u16 iden;
+
+	gsbm_fill(&gsbm);
+	gsbm_for_each(&gsbm, iden) {
+		switch (iden) {
+		case GSID_HOST_STATE_SIZE:
+		case GSID_RUN_OUTPUT_MIN_SIZE:
+		case GSID_PARTITION_TABLE:
+		case GSID_PROCESS_TABLE:
+		case GSID_RUN_INPUT:
+		case GSID_RUN_OUTPUT:
+			break;
+		default:
+			size += gse_total_size(gsid_size(iden));
+		}
+	}
+	return size;
+}
+
+static int gs_msg_ops_vcpu_fill_info(struct gs_buff *gsb, struct gs_msg *gsm)
+{
+	struct kvm_vcpu *vcpu;
+	vector128 v;
+	int rc, i;
+	u16 iden;
+
+	vcpu = gsm->data;
+
+	gsm_for_each(gsm, iden)
+	{
+		rc = 0;
+
+		if ((gsm->flags & GS_FLAGS_WIDE) !=
+		    (gsid_flags(iden) & GS_FLAGS_WIDE))
+			continue;
+
+		switch (iden) {
+		case GSID_DSCR:
+			rc = gse_put(gsb, iden, vcpu->arch.dscr);
+			break;
+		case GSID_MMCRA:
+			rc = gse_put(gsb, iden, vcpu->arch.mmcra);
+			break;
+		case GSID_HFSCR:
+			rc = gse_put(gsb, iden, vcpu->arch.hfscr);
+			break;
+		case GSID_PURR:
+			rc = gse_put(gsb, iden, vcpu->arch.purr);
+			break;
+		case GSID_SPURR:
+			rc = gse_put(gsb, iden, vcpu->arch.spurr);
+			break;
+		case GSID_AMR:
+			rc = gse_put(gsb, iden, vcpu->arch.amr);
+			break;
+		case GSID_UAMOR:
+			rc = gse_put(gsb, iden, vcpu->arch.uamor);
+			break;
+		case GSID_SIAR:
+			rc = gse_put(gsb, iden, vcpu->arch.siar);
+			break;
+		case GSID_SDAR:
+			rc = gse_put(gsb, iden, vcpu->arch.sdar);
+			break;
+		case GSID_IAMR:
+			rc = gse_put(gsb, iden, vcpu->arch.iamr);
+			break;
+		case GSID_DAWR0:
+			rc = gse_put(gsb, iden, vcpu->arch.dawr0);
+			break;
+		case GSID_DAWR1:
+			rc = gse_put(gsb, iden, vcpu->arch.dawr1);
+			break;
+		case GSID_DAWRX0:
+			rc = gse_put(gsb, iden, vcpu->arch.dawrx0);
+			break;
+		case GSID_DAWRX1:
+			rc = gse_put(gsb, iden, vcpu->arch.dawrx1);
+			break;
+		case GSID_CIABR:
+			rc = gse_put(gsb, iden, vcpu->arch.ciabr);
+			break;
+		case GSID_WORT:
+			rc = gse_put(gsb, iden, vcpu->arch.wort);
+			break;
+		case GSID_PPR:
+			rc = gse_put(gsb, iden, vcpu->arch.ppr);
+			break;
+		case GSID_PSPB:
+			rc = gse_put(gsb, iden, vcpu->arch.pspb);
+			break;
+		case GSID_TAR:
+			rc = gse_put(gsb, iden, vcpu->arch.tar);
+			break;
+		case GSID_FSCR:
+			rc = gse_put(gsb, iden, vcpu->arch.fscr);
+			break;
+		case GSID_EBBHR:
+			rc = gse_put(gsb, iden, vcpu->arch.ebbhr);
+			break;
+		case GSID_EBBRR:
+			rc = gse_put(gsb, iden, vcpu->arch.ebbrr);
+			break;
+		case GSID_BESCR:
+			rc = gse_put(gsb, iden, vcpu->arch.bescr);
+			break;
+		case GSID_IC:
+			rc = gse_put(gsb, iden, vcpu->arch.ic);
+			break;
+		case GSID_CTRL:
+			rc = gse_put(gsb, iden, vcpu->arch.ctrl);
+			break;
+		case GSID_PIDR:
+			rc = gse_put(gsb, iden, vcpu->arch.pid);
+			break;
+		case GSID_AMOR:
+			rc = gse_put(gsb, iden, vcpu->arch.amor);
+			break;
+		case GSID_VRSAVE:
+			rc = gse_put(gsb, iden, vcpu->arch.vrsave);
+			break;
+		case GSID_MMCR(0) ... GSID_MMCR(3):
+			i = iden - GSID_MMCR(0);
+			rc = gse_put(gsb, iden, vcpu->arch.mmcr[i]);
+			break;
+		case GSID_SIER(0) ... GSID_SIER(2):
+			i = iden - GSID_SIER(0);
+			rc = gse_put(gsb, iden, vcpu->arch.sier[i]);
+			break;
+		case GSID_PMC(0) ... GSID_PMC(5):
+			i = iden - GSID_PMC(0);
+			rc = gse_put(gsb, iden, vcpu->arch.pmc[i]);
+			break;
+		case GSID_GPR(0) ... GSID_GPR(31):
+			i = iden - GSID_GPR(0);
+			rc = gse_put(gsb, iden, vcpu->arch.regs.gpr[i]);
+			break;
+		case GSID_CR:
+			rc = gse_put(gsb, iden, vcpu->arch.regs.ccr);
+			break;
+		case GSID_XER:
+			rc = gse_put(gsb, iden, vcpu->arch.regs.xer);
+			break;
+		case GSID_CTR:
+			rc = gse_put(gsb, iden, vcpu->arch.regs.ctr);
+			break;
+		case GSID_LR:
+			rc = gse_put(gsb, iden, vcpu->arch.regs.link);
+			break;
+		case GSID_NIA:
+			rc = gse_put(gsb, iden, vcpu->arch.regs.nip);
+			break;
+		case GSID_SRR0:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.srr0);
+			break;
+		case GSID_SRR1:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.srr1);
+			break;
+		case GSID_SPRG0:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.sprg0);
+			break;
+		case GSID_SPRG1:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.sprg1);
+			break;
+		case GSID_SPRG2:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.sprg2);
+			break;
+		case GSID_SPRG3:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.sprg3);
+			break;
+		case GSID_DAR:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.dar);
+			break;
+		case GSID_DSISR:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.dsisr);
+			break;
+		case GSID_MSR:
+			rc = gse_put(gsb, iden, vcpu->arch.shregs.msr);
+			break;
+		case GSID_VTB:
+			rc = gse_put(gsb, iden, vcpu->arch.vcore->vtb);
+			break;
+		case GSID_LPCR:
+			rc = gse_put(gsb, iden, vcpu->arch.vcore->lpcr);
+			break;
+		case GSID_TB_OFFSET:
+			rc = gse_put(gsb, iden, vcpu->arch.vcore->tb_offset);
+			break;
+		case GSID_FPSCR:
+			rc = gse_put(gsb, iden, vcpu->arch.fp.fpscr);
+			break;
+		case GSID_VSRS(0) ... GSID_VSRS(31):
+			i = iden - GSID_VSRS(0);
+			memcpy(&v, &vcpu->arch.fp.fpr[i],
+			       sizeof(vcpu->arch.fp.fpr[i]));
+			rc = gse_put(gsb, iden, v);
+			break;
+#ifdef CONFIG_VSX
+		case GSID_VSCR:
+			rc = gse_put(gsb, iden, vcpu->arch.vr.vscr.u[3]);
+			break;
+		case GSID_VSRS(32) ... GSID_VSRS(63):
+			i = iden - GSID_VSRS(32);
+			rc = gse_put(gsb, iden, vcpu->arch.vr.vr[i]);
+			break;
+#endif
+		case GSID_DEC_EXPIRY_TB: {
+			u64 dw;
+
+			dw = vcpu->arch.dec_expires -
+			     vcpu->arch.vcore->tb_offset;
+			rc = gse_put(gsb, iden, dw);
+		}
+			break;
+		}
+
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int gs_msg_ops_vcpu_refresh_info(struct gs_msg *gsm, struct gs_buff *gsb)
+{
+	struct gs_parser gsp = { 0 };
+	struct kvmhv_papr_host *ph;
+	struct gs_bitmap *valids;
+	struct kvm_vcpu *vcpu;
+	struct gs_elem *gse;
+	vector128 v;
+	int rc, i;
+	u16 iden;
+
+	vcpu = gsm->data;
+
+	rc = gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	ph = &vcpu->arch.papr_host;
+	valids = &ph->valids;
+
+	gsp_for_each(&gsp, iden, gse)
+	{
+		switch (iden) {
+		case GSID_DSCR:
+			gse_get(gse, &vcpu->arch.dscr);
+			break;
+		case GSID_MMCRA:
+			gse_get(gse, &vcpu->arch.mmcra);
+			break;
+		case GSID_HFSCR:
+			gse_get(gse, &vcpu->arch.hfscr);
+			break;
+		case GSID_PURR:
+			gse_get(gse, &vcpu->arch.purr);
+			break;
+		case GSID_SPURR:
+			gse_get(gse, &vcpu->arch.spurr);
+			break;
+		case GSID_AMR:
+			gse_get(gse, &vcpu->arch.amr);
+			break;
+		case GSID_UAMOR:
+			gse_get(gse, &vcpu->arch.uamor);
+			break;
+		case GSID_SIAR:
+			gse_get(gse, &vcpu->arch.siar);
+			break;
+		case GSID_SDAR:
+			gse_get(gse, &vcpu->arch.sdar);
+			break;
+		case GSID_IAMR:
+			gse_get(gse, &vcpu->arch.iamr);
+			break;
+		case GSID_DAWR0:
+			gse_get(gse, &vcpu->arch.dawr0);
+			break;
+		case GSID_DAWR1:
+			gse_get(gse, &vcpu->arch.dawr1);
+			break;
+		case GSID_DAWRX0:
+			gse_get(gse, &vcpu->arch.dawrx0);
+			break;
+		case GSID_DAWRX1:
+			gse_get(gse, &vcpu->arch.dawrx1);
+			break;
+		case GSID_CIABR:
+			gse_get(gse, &vcpu->arch.ciabr);
+			break;
+		case GSID_WORT:
+			gse_get(gse, &vcpu->arch.wort);
+			break;
+		case GSID_PPR:
+			gse_get(gse, &vcpu->arch.ppr);
+			break;
+		case GSID_PSPB:
+			gse_get(gse, &vcpu->arch.pspb);
+			break;
+		case GSID_TAR:
+			gse_get(gse, &vcpu->arch.tar);
+			break;
+		case GSID_FSCR:
+			gse_get(gse, &vcpu->arch.fscr);
+			break;
+		case GSID_EBBHR:
+			gse_get(gse, &vcpu->arch.ebbhr);
+			break;
+		case GSID_EBBRR:
+			gse_get(gse, &vcpu->arch.ebbrr);
+			break;
+		case GSID_BESCR:
+			gse_get(gse, &vcpu->arch.bescr);
+			break;
+		case GSID_IC:
+			gse_get(gse, &vcpu->arch.ic);
+			break;
+		case GSID_CTRL:
+			gse_get(gse, &vcpu->arch.ctrl);
+			break;
+		case GSID_PIDR:
+			gse_get(gse, &vcpu->arch.pid);
+			break;
+		case GSID_AMOR:
+			gse_get(gse, &vcpu->arch.amor);
+			break;
+		case GSID_VRSAVE:
+			gse_get(gse, &vcpu->arch.vrsave);
+			break;
+		case GSID_MMCR(0) ... GSID_MMCR(3):
+			i = iden - GSID_MMCR(0);
+			gse_get(gse, &vcpu->arch.mmcr[i]);
+			break;
+		case GSID_SIER(0) ... GSID_SIER(2):
+			i = iden - GSID_SIER(0);
+			gse_get(gse, &vcpu->arch.sier[i]);
+			break;
+		case GSID_PMC(0) ... GSID_PMC(5):
+			i = iden - GSID_PMC(0);
+			gse_get(gse, &vcpu->arch.pmc[i]);
+			break;
+		case GSID_GPR(0) ... GSID_GPR(31):
+			i = iden - GSID_GPR(0);
+			gse_get(gse, &vcpu->arch.regs.gpr[i]);
+			break;
+		case GSID_CR:
+			gse_get(gse, &vcpu->arch.regs.ccr);
+			break;
+		case GSID_XER:
+			gse_get(gse, &vcpu->arch.regs.xer);
+			break;
+		case GSID_CTR:
+			gse_get(gse, &vcpu->arch.regs.ctr);
+			break;
+		case GSID_LR:
+			gse_get(gse, &vcpu->arch.regs.link);
+			break;
+		case GSID_NIA:
+			gse_get(gse, &vcpu->arch.regs.nip);
+			break;
+		case GSID_SRR0:
+			gse_get(gse, &vcpu->arch.shregs.srr0);
+			break;
+		case GSID_SRR1:
+			gse_get(gse, &vcpu->arch.shregs.srr1);
+			break;
+		case GSID_SPRG0:
+			gse_get(gse, &vcpu->arch.shregs.sprg0);
+			break;
+		case GSID_SPRG1:
+			gse_get(gse, &vcpu->arch.shregs.sprg1);
+			break;
+		case GSID_SPRG2:
+			gse_get(gse, &vcpu->arch.shregs.sprg2);
+			break;
+		case GSID_SPRG3:
+			gse_get(gse, &vcpu->arch.shregs.sprg3);
+			break;
+		case GSID_DAR:
+			gse_get(gse, &vcpu->arch.shregs.dar);
+			break;
+		case GSID_DSISR:
+			gse_get(gse, &vcpu->arch.shregs.dsisr);
+			break;
+		case GSID_MSR:
+			gse_get(gse, &vcpu->arch.shregs.msr);
+			break;
+		case GSID_VTB:
+			gse_get(gse, &vcpu->arch.vcore->vtb);
+			break;
+		case GSID_LPCR:
+			gse_get(gse, &vcpu->arch.vcore->lpcr);
+			break;
+		case GSID_TB_OFFSET:
+			gse_get(gse, &vcpu->arch.vcore->tb_offset);
+			break;
+		case GSID_FPSCR:
+			gse_get(gse, &vcpu->arch.fp.fpscr);
+			break;
+		case GSID_VSRS(0) ... GSID_VSRS(31):
+			gse_get(gse, &v);
+			i = iden - GSID_VSRS(0);
+			memcpy(&vcpu->arch.fp.fpr[i], &v,
+			       sizeof(vcpu->arch.fp.fpr[i]));
+			break;
+#ifdef CONFIG_VSX
+		case GSID_VSCR:
+			gse_get(gse, &vcpu->arch.vr.vscr.u[3]);
+			break;
+		case GSID_VSRS(32) ... GSID_VSRS(63):
+			i = iden - GSID_VSRS(32);
+			gse_get(gse, &vcpu->arch.vr.vr[i]);
+			break;
+#endif
+		case GSID_HDAR:
+			gse_get(gse, &vcpu->arch.fault_dar);
+			break;
+		case GSID_HDSISR:
+			gse_get(gse, &vcpu->arch.fault_dsisr);
+			break;
+		case GSID_ASDR:
+			gse_get(gse, &vcpu->arch.fault_gpa);
+			break;
+		case GSID_HEIR:
+			gse_get(gse, &vcpu->arch.emul_inst);
+			break;
+		case GSID_DEC_EXPIRY_TB: {
+			u64 dw;
+
+			gse_get(gse, &dw);
+			vcpu->arch.dec_expires =
+				dw + vcpu->arch.vcore->tb_offset;
+			break;
+		}
+		default:
+			continue;
+		}
+		gsbm_set(valids, iden);
+	}
+
+	return 0;
+}
+
+static struct gs_msg_ops vcpu_message_ops = {
+	.get_size = gs_msg_ops_vcpu_get_size,
+	.fill_info = gs_msg_ops_vcpu_fill_info,
+	.refresh_info = gs_msg_ops_vcpu_refresh_info,
+};
+
+static int kvmhv_papr_host_create(struct kvm_vcpu *vcpu,
+				  struct kvmhv_papr_host *ph)
+{
+	struct kvmhv_papr_config *cfg;
+	struct gs_buff *gsb, *vcpu_run_output, *vcpu_run_input;
+	unsigned long guest_id, vcpu_id;
+	struct gs_msg *gsm, *vcpu_message, *vcore_message;
+	int rc;
+
+	cfg = &ph->cfg;
+	guest_id = vcpu->kvm->arch.lpid;
+	vcpu_id = vcpu->vcpu_id;
+
+	gsm = gsm_new(&config_msg_ops, cfg, GS_FLAGS_WIDE, GFP_KERNEL);
+	if (!gsm) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	gsb = gsb_new(gsm_size(gsm), guest_id, vcpu_id, GFP_KERNEL);
+	if (!gsb) {
+		rc = -ENOMEM;
+		goto free_gsm;
+	}
+
+	rc = gsb_receive_datum(gsb, gsm, GSID_RUN_OUTPUT_MIN_SIZE);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't get vcpu run output buffer minimum size\n");
+		goto free_gsb;
+	}
+
+	vcpu_run_output = gsb_new(cfg->vcpu_run_output_size, guest_id, vcpu_id, GFP_KERNEL);
+	if (!vcpu_run_output) {
+		rc = -ENOMEM;
+		goto free_gsb;
+	}
+
+	cfg->vcpu_run_output_cfg.address = gsb_paddress(vcpu_run_output);
+	cfg->vcpu_run_output_cfg.size = gsb_capacity(vcpu_run_output);
+	ph->vcpu_run_output = vcpu_run_output;
+
+	gsm->flags = 0;
+	rc = gsb_send_datum(gsb, gsm, GSID_RUN_OUTPUT);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't set vcpu run output buffer\n");
+		goto free_gs_out;
+	}
+
+	vcpu_message = gsm_new(&vcpu_message_ops, vcpu, 0, GFP_KERNEL);
+	if (!vcpu_message) {
+		rc = -ENOMEM;
+		goto free_gs_out;
+	}
+	gsm_include_all(vcpu_message);
+
+	ph->vcpu_message = vcpu_message;
+
+	vcpu_run_input = gsb_new(gsm_size(vcpu_message), guest_id, vcpu_id, GFP_KERNEL);
+	if (!vcpu_run_input) {
+		rc = -ENOMEM;
+		goto free_vcpu_message;
+	}
+
+	ph->vcpu_run_input = vcpu_run_input;
+	cfg->vcpu_run_input_cfg.address = gsb_paddress(vcpu_run_input);
+	cfg->vcpu_run_input_cfg.size = gsb_capacity(vcpu_run_input);
+	rc = gsb_send_datum(gsb, gsm, GSID_RUN_INPUT);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't set vcpu run input buffer\n");
+		goto free_vcpu_run_input;
+	}
+
+	vcore_message =
+		gsm_new(&vcpu_message_ops, vcpu, GS_FLAGS_WIDE, GFP_KERNEL);
+	if (!vcore_message) {
+		rc = -ENOMEM;
+		goto free_vcpu_run_input;
+	}
+
+	gsm_include_all(vcore_message);
+	ph->vcore_message = vcore_message;
+
+	gsbm_fill(&ph->valids);
+	gsm_free(gsm);
+	gsb_free(gsb);
+	return 0;
+
+free_vcpu_run_input:
+	gsb_free(vcpu_run_input);
+free_vcpu_message:
+	gsm_free(vcpu_message);
+free_gs_out:
+	gsb_free(vcpu_run_output);
+free_gsb:
+	gsb_free(gsb);
+free_gsm:
+	gsm_free(gsm);
+err:
+	return rc;
+}
+
+/**
+ * __kvmhv_papr_mark_dirty() - mark a Guest State ID to be sent to the host
+ * @vcpu: vcpu
+ * @iden: guest state ID
+ *
+ * Mark a guest state ID as having been changed by the L1 host and thus
+ * the new value must be sent to the L0 hypervisor. See kvmhv_papr_flush_vcpu()
+ */
+int __kvmhv_papr_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	struct kvmhv_papr_host *ph;
+	struct gs_bitmap *valids;
+	struct gs_msg *gsm;
+
+	if (!iden)
+		return 0;
+
+	ph = &vcpu->arch.papr_host;
+	valids = &ph->valids;
+	gsm = ph->vcpu_message;
+	gsm_include(gsm, iden);
+	gsm = ph->vcore_message;
+	gsm_include(gsm, iden);
+	gsbm_set(valids, iden);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_papr_mark_dirty);
+
+/**
+ * __kvmhv_papr_cached_reload() - reload a Guest State ID from the host
+ * @vcpu: vcpu
+ * @iden: guest state ID
+ *
+ * Reload the value for the guest state ID from the L0 host into the L1 host.
+ * This is cached so that going out to the L0 host only happens if necessary.
+ */
+int __kvmhv_papr_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	struct kvmhv_papr_host *ph;
+	struct gs_bitmap *valids;
+	struct gs_buff *gsb;
+	struct gs_msg gsm;
+	int rc;
+
+	if (!iden)
+		return 0;
+
+	ph = &vcpu->arch.papr_host;
+	valids = &ph->valids;
+	if (gsbm_test(valids, iden))
+		return 0;
+
+	gsb = ph->vcpu_run_input;
+	gsm_init(&gsm, &vcpu_message_ops, vcpu, gsid_flags(iden));
+	rc = gsb_receive_datum(gsb, &gsm, iden);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't get GSID: 0x%x\n", iden);
+		return rc;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_papr_cached_reload);
+
+/**
+ * kvmhv_papr_flush_vcpu() - send modified Guest State IDs to the host
+ * @vcpu: vcpu
+ * @time_limit: hdec expiry tb
+ *
+ * Send the values marked by __kvmhv_papr_mark_dirty() to the L0 host. Thread
+ * wide values are copied to the H_GUEST_RUN_VCPU input buffer. Guest wide
+ * values need to be sent with H_GUEST_SET first.
+ *
+ * The hdec tb offset is always sent to L0 host.
+ */
+int kvmhv_papr_flush_vcpu(struct kvm_vcpu *vcpu, u64 time_limit)
+{
+	struct kvmhv_papr_host *ph;
+	struct gs_buff *gsb;
+	struct gs_msg *gsm;
+	int rc;
+
+	ph = &vcpu->arch.papr_host;
+	gsb = ph->vcpu_run_input;
+	gsm = ph->vcore_message;
+	rc = gsb_send_data(gsb, gsm);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't set guest wide elements\n");
+		return rc;
+	}
+
+	gsm = ph->vcpu_message;
+	rc = gsm_fill_info(gsm, gsb);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't fill vcpu run input buffer\n");
+		return rc;
+	}
+
+	rc = gse_put(gsb, GSID_HDEC_EXPIRY_TB, time_limit);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmhv_papr_flush_vcpu);
+
+
+/**
+ * kvmhv_papr_set_ptbl_entry() - send partition and process table state to L0 host
+ * @lpid: guest id
+ * @dw0: partition table double word
+ * @dw1: process table double word
+ */
+int kvmhv_papr_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1)
+{
+	struct gs_part_table patbl;
+	struct gs_proc_table prtbl;
+	struct gs_buff *gsb;
+	size_t size;
+	int rc;
+
+	size = gse_total_size(gsid_size(GSID_PARTITION_TABLE)) +
+	       gse_total_size(gsid_size(GSID_PROCESS_TABLE)) +
+	       sizeof(struct gs_header);
+	gsb = gsb_new(size, lpid, 0, GFP_KERNEL);
+	if (!gsb)
+		return -ENOMEM;
+
+	patbl.address = dw0 & RPDB_MASK;
+	patbl.ea_bits = ((((dw0 & RTS1_MASK) >> (RTS1_SHIFT - 3)) |
+			  ((dw0 & RTS2_MASK) >> RTS2_SHIFT)) +
+			 31);
+	patbl.gpd_size = 1ul << ((dw0 & RPDS_MASK) + 3);
+	rc = gse_put(gsb, GSID_PARTITION_TABLE, patbl);
+	if (rc < 0)
+		goto free_gsb;
+
+	prtbl.address = dw1 & PRTB_MASK;
+	prtbl.gpd_size = 1ul << ((dw1 & PRTS_MASK) + 12);
+	rc = gse_put(gsb, GSID_PROCESS_TABLE, prtbl);
+	if (rc < 0)
+		goto free_gsb;
+
+	rc = gsb_send(gsb, GS_FLAGS_WIDE);
+	if (rc < 0) {
+		pr_err("KVM-PAPR: couldn't set the PATE\n");
+		goto free_gsb;
+	}
+
+	gsb_free(gsb);
+	return 0;
+
+free_gsb:
+	gsb_free(gsb);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmhv_papr_set_ptbl_entry);
+
+/**
+ * kvmhv_papr_parse_output() - receive values from H_GUEST_RUN_VCPU output
+ * @vcpu: vcpu
+ *
+ * Parse the output buffer from H_GUEST_RUN_VCPU to update vcpu.
+ */
+int kvmhv_papr_parse_output(struct kvm_vcpu *vcpu)
+{
+	struct kvmhv_papr_host *ph;
+	struct gs_buff *gsb;
+	struct gs_msg gsm;
+
+	ph = &vcpu->arch.papr_host;
+	gsb = ph->vcpu_run_output;
+
+	vcpu->arch.fault_dar = 0;
+	vcpu->arch.fault_dsisr = 0;
+	vcpu->arch.fault_gpa = 0;
+	vcpu->arch.emul_inst = KVM_INST_FETCH_FAILED;
+
+	gsm_init(&gsm, &vcpu_message_ops, vcpu, 0);
+	gsm_refresh_info(&gsm, gsb);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmhv_papr_parse_output);
+
+static void kvmhv_papr_host_free(struct kvm_vcpu *vcpu,
+				 struct kvmhv_papr_host *ph)
+{
+	gsm_free(ph->vcpu_message);
+	gsm_free(ph->vcore_message);
+	gsb_free(ph->vcpu_run_input);
+	gsb_free(ph->vcpu_run_output);
+}
+
+int __kvmhv_papr_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	int rc;
+
+	for (int i = 0; i < 32; i++) {
+		rc = kvmhv_papr_cached_reload(vcpu, GSID_GPR(i));
+		if (rc < 0)
+			return rc;
+	}
+
+	rc = kvmhv_papr_cached_reload(vcpu, GSID_CR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_papr_cached_reload(vcpu, GSID_XER);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_papr_cached_reload(vcpu, GSID_CTR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_papr_cached_reload(vcpu, GSID_LR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_papr_cached_reload(vcpu, GSID_NIA);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_papr_reload_ptregs);
+
+int __kvmhv_papr_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	for (int i = 0; i < 32; i++)
+		kvmhv_papr_mark_dirty(vcpu, GSID_GPR(i));
+
+	kvmhv_papr_mark_dirty(vcpu, GSID_CR);
+	kvmhv_papr_mark_dirty(vcpu, GSID_XER);
+	kvmhv_papr_mark_dirty(vcpu, GSID_CTR);
+	kvmhv_papr_mark_dirty(vcpu, GSID_LR);
+	kvmhv_papr_mark_dirty(vcpu, GSID_NIA);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_papr_mark_dirty_ptregs);
+
+/**
+ * kvmhv_papr_vcpu_create() - create nested vcpu for the PAPR API
+ * @vcpu: vcpu
+ * @ph: PAPR nested host state
+ *
+ * Parse the output buffer from H_GUEST_RUN_VCPU to update vcpu.
+ */
+int kvmhv_papr_vcpu_create(struct kvm_vcpu *vcpu,
+			   struct kvmhv_papr_host *ph)
+{
+	long rc;
+
+	rc = plpar_guest_create_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id);
+
+	if (rc != H_SUCCESS) {
+		pr_err("KVM: Create Guest vcpu hcall failed, rc=%ld\n", rc);
+		switch (rc) {
+		case H_NOT_ENOUGH_RESOURCES:
+		case H_ABORTED:
+			return -ENOMEM;
+		case H_AUTHORITY:
+			return -EPERM;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	rc = kvmhv_papr_host_create(vcpu, ph);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmhv_papr_vcpu_create);
+
+/**
+ * kvmhv_papr_vcpu_free() - free the PAPR host state
+ * @vcpu: vcpu
+ * @ph: PAPR nested host state
+ */
+void kvmhv_papr_vcpu_free(struct kvm_vcpu *vcpu,
+			  struct kvmhv_papr_host *ph)
+{
+	kvmhv_papr_host_free(vcpu, ph);
+}
+EXPORT_SYMBOL_GPL(kvmhv_papr_vcpu_free);
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index e6e66c3792f8..663403fa86d4 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -92,7 +92,8 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmio_host_swabbed = 0;
 
 	emulated = EMULATE_FAIL;
-	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
+	vcpu->arch.regs.msr = kvmppc_get_msr(vcpu);
+	kvmhv_papr_reload_ptregs(vcpu, &vcpu->arch.regs);
 	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
@@ -357,6 +358,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 	}
 
 	trace_kvm_ppc_instr(ppc_inst_val(inst), kvmppc_get_pc(vcpu), emulated);
+	kvmhv_papr_mark_dirty_ptregs(vcpu, &vcpu->arch.regs);
 
 	/* Advance past emulated instruction. */
 	if (emulated != EMULATE_FAIL)
diff --git a/arch/powerpc/kvm/guest-state-buffer.c b/arch/powerpc/kvm/guest-state-buffer.c
index db4a79bfcaf1..cc3a7a416867 100644
--- a/arch/powerpc/kvm/guest-state-buffer.c
+++ b/arch/powerpc/kvm/guest-state-buffer.c
@@ -561,3 +561,52 @@ int gsm_refresh_info(struct gs_msg *gsm, struct gs_buff *gsb)
 	return gsm->ops->refresh_info(gsm, gsb);
 }
 EXPORT_SYMBOL(gsm_refresh_info);
+
+/**
+ * gsb_send - send all elements in the buffer to the hypervisor.
+ * @gsb: guest state buffer
+ * @flags: guest wide or thread wide
+ *
+ * Performs the H_GUEST_SET_STATE hcall for the guest state buffer.
+ */
+int gsb_send(struct gs_buff *gsb, unsigned long flags)
+{
+	unsigned long hflags = 0;
+	unsigned long i;
+	int rc;
+
+	if (gsb_nelems(gsb) == 0)
+		return 0;
+
+	if (flags & GS_FLAGS_WIDE)
+		hflags |= H_GUEST_FLAGS_WIDE;
+
+	rc = plpar_guest_set_state(hflags, gsb->guest_id, gsb->vcpu_id,
+				   __pa(gsb->hdr), gsb->capacity, &i);
+	return rc;
+}
+EXPORT_SYMBOL(gsb_send);
+
+/**
+ * gsb_recv - request all elements in the buffer have their value updated.
+ * @gsb: guest state buffer
+ * @flags: guest wide or thread wide
+ *
+ * Performs the H_GUEST_GET_STATE hcall for the guest state buffer.
+ * After returning from the hcall the guest state elements that were
+ * present in the buffer will have updated values from the hypervisor.
+ */
+int gsb_recv(struct gs_buff *gsb, unsigned long flags)
+{
+	unsigned long hflags = 0;
+	unsigned long i;
+	int rc;
+
+	if (flags & GS_FLAGS_WIDE)
+		hflags |= H_GUEST_FLAGS_WIDE;
+
+	rc = plpar_guest_get_state(hflags, gsb->guest_id, gsb->vcpu_id,
+				   __pa(gsb->hdr), gsb->capacity, &i);
+	return rc;
+}
+EXPORT_SYMBOL(gsb_recv);
-- 
2.31.1


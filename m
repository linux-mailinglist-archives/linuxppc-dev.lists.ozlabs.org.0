Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA477181A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 03:53:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxnlVmu+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJzqM2cw6z3cWr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 11:53:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OxnlVmu+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJzgs1xwpz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 11:46:33 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bc6624623cso8418835ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Aug 2023 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691372790; x=1691977590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH4d/N5VYIyBD7Hq6wYvJu7yJKs2fHQu4H7S0zwzcqc=;
        b=OxnlVmu+JY8j/47vjkWcLtQ6CAFl/Fs2a244iq0ZPkyrxDRwwbLuDJszPMb+VUOaIC
         Kx7UAnppj3rYgaFl+9lNf6+3rULV6DaU3esrsbnoLMHWLnOEAANwJXf1GfYuEY6THBls
         AUcjwg7mRGV7WgQ3D7cLk9mMEpkjQOe1c4oeoFH2WTkQiAaBQx43i9ksyif0oPQShVn3
         Xo3+V0IdMU01r6mvCV5SujxEJ6mjg1bHW8TaPy3uUizft2wbJon8omc3uy8APRkiwmuq
         DKAyBzUXrw3+skf03Q2DecbnyalyorZyy0AXGdxfKM3Uj9NYySpSbPg3UFS8qbxX+hIg
         wZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691372790; x=1691977590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH4d/N5VYIyBD7Hq6wYvJu7yJKs2fHQu4H7S0zwzcqc=;
        b=fVZ5xoEpt2rOTHT0nGlLsaovq0/3OrFIStr0d5HJ1XLGYOW+21U7vsHcTRKYjpeifx
         oN2h5kir1JtRfN9BRKu9V2Flbq7BwOn+umyJTWMNXOIVDFdsCfQzILueWQlj+MzbgbeC
         DniZd04Aa1j8jAoNx45g5ulVi3Fnvra30qTrGgVVPvpicbr90L/hSzSki0IbAJi33x+q
         s/5AfIWUgEk+cNA8br0ij1SypvjeiLCvOp1q4rHuHoyDGmQuxhfCCeFuTMXg9SvQTyvw
         FyiIfj7TgcJNQ9KGqSmApELDQb2Tzq/Mv3/q2psIc0DafK8Mb6MWdsKCgbEaGi8maRbC
         fX1g==
X-Gm-Message-State: AOJu0Yz5KpxAywUG8SDr4RzSp1mPUHplrbtm2cweEr519ipcqReX+mIX
	8odeazzUIlROOmzCFFvbEcdnPYy7qerYRQ==
X-Google-Smtp-Source: AGHT+IGffOUid5daUYIe8vovYf8ejzJIuVODcjEY5SPdqEfckSIdnhg21etyBWbzfVP9K2/D6Pzfww==
X-Received: by 2002:a17:903:268e:b0:1b8:a54c:6183 with SMTP id jf14-20020a170903268e00b001b8a54c6183mr8240443plb.46.1691372789580;
        Sun, 06 Aug 2023 18:46:29 -0700 (PDT)
Received: from pwon.ibmuc.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001b9e0918b0asm5485139plb.169.2023.08.06.18.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 18:46:29 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/6] KVM: PPC: Add support for nestedv2 guests
Date: Mon,  7 Aug 2023 11:45:52 +1000
Message-Id: <20230807014553.1168699-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230807014553.1168699-1-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A series of hcalls have been added to the PAPR which allow a regular
guest partition to create and manage guest partitions of its own. KVM
already had an interface that allowed this on powernv platforms. This
existing interface will now be called "nestedv1". The newly added PAPR
interface will be called "nestedv2".  PHYP will support the nestedv2
interface. At this time the host side of the nestedv2 interface has not
been implemented on powernv but there is no technical reason why it
could not be added.

The nestedv1 interface is still supported.

Add support to KVM to utilize these hcalls to enable running nested
guests as a pseries guest on PHYP.

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
H_GUEST_GET_CAPABILITIES. On a successful return, use the nestedv2
interface.

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

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Signed-off-by: Amit Machhiwal <amachhiw@linux.vnet.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2:
  - Declare op structs as static
  - Guatam: Use expressions in switch case with local variables
  - Do not use the PVR for the LOGICAL PVR ID
  - Kautuk: Handle emul_inst as now a double word, init correctly
  - Use new GPR(), etc macros
  - Amit: Determine PAPR nested capabilities from cpu features
v3:
  - Use EXPORT_SYMBOL_GPL()
  - Change to kvmhv_nestedv2 namespace
  - Make kvmhv_enable_nested() return -ENODEV on NESTEDv2 L1 hosts
  - s/kvmhv_on_papr/kvmhv_is_nestedv2/
  - mv book3s_hv_papr.c book3s_hv_nestedv2.c
  - Handle shared regs without a guest state id in the same wrapper
  - Vaibhav: Use a static key for API version
  - Add a positive test for NESTEDv1
  - Give the amor a static value
  - s/struct kvmhv_nestedv2_host/struct kvmhv_nestedv2_io/
  - Propagate failure in kvmhv_vcpu_entry_nestedv2()
  - WARN if getters and setters fail
  - Progagate failure from kvmhv_nestedv2_parse_output()
  - Replace delay with sleep in plpar_guest_{create,delete,create_vcpu}()
  - Amit: Add logical PVR handling
  - Replace kvmppc_gse_{get,put} with specific version
---
 arch/powerpc/include/asm/guest-state-buffer.h |  91 ++
 arch/powerpc/include/asm/hvcall.h             |  30 +
 arch/powerpc/include/asm/kvm_book3s.h         | 136 ++-
 arch/powerpc/include/asm/kvm_book3s_64.h      |   6 +
 arch/powerpc/include/asm/kvm_host.h           |  20 +
 arch/powerpc/include/asm/kvm_ppc.h            |  96 +-
 arch/powerpc/include/asm/plpar_wrappers.h     | 188 ++++
 arch/powerpc/kvm/Makefile                     |   1 +
 arch/powerpc/kvm/book3s_hv.c                  | 136 ++-
 arch/powerpc/kvm/book3s_hv.h                  |  72 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  38 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c         | 985 ++++++++++++++++++
 arch/powerpc/kvm/emulate_loadstore.c          |   4 +-
 arch/powerpc/kvm/guest-state-buffer.c         |  50 +
 14 files changed, 1757 insertions(+), 96 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv_nestedv2.c

diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
index aaefe1075fc4..808149f31576 100644
--- a/arch/powerpc/include/asm/guest-state-buffer.h
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
 #define _ASM_POWERPC_GUEST_STATE_BUFFER_H
 
+#include "asm/hvcall.h"
 #include <linux/gfp.h>
 #include <linux/bitmap.h>
 #include <asm/plpar_wrappers.h>
@@ -313,6 +314,8 @@ struct kvmppc_gs_buff *kvmppc_gsb_new(size_t size, unsigned long guest_id,
 				      unsigned long vcpu_id, gfp_t flags);
 void kvmppc_gsb_free(struct kvmppc_gs_buff *gsb);
 void *kvmppc_gsb_put(struct kvmppc_gs_buff *gsb, size_t size);
+int kvmppc_gsb_send(struct kvmppc_gs_buff *gsb, unsigned long flags);
+int kvmppc_gsb_recv(struct kvmppc_gs_buff *gsb, unsigned long flags);
 
 /**
  * kvmppc_gsb_header() - the header of a guest state buffer
@@ -901,4 +904,92 @@ static inline void kvmppc_gsm_reset(struct kvmppc_gs_msg *gsm)
 	kvmppc_gsbm_zero(&gsm->bitmap);
 }
 
+/**
+ * kvmppc_gsb_receive_data - flexibly update values from a guest state buffer
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ *
+ * Requests updated values for the guest state values included in the guest
+ * state message. The guest state message will then deserialize the guest state
+ * buffer.
+ */
+static inline int kvmppc_gsb_receive_data(struct kvmppc_gs_buff *gsb,
+					  struct kvmppc_gs_msg *gsm)
+{
+	int rc;
+
+	kvmppc_gsb_reset(gsb);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+
+	rc = kvmppc_gsb_recv(gsb, gsm->flags);
+	if (rc < 0)
+		return rc;
+
+	rc = kvmppc_gsm_refresh_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+
+/**
+ * kvmppc_gsb_recv - receive a single guest state ID
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ * @iden: guest state identity
+ */
+static inline int kvmppc_gsb_receive_datum(struct kvmppc_gs_buff *gsb,
+					   struct kvmppc_gs_msg *gsm, u16 iden)
+{
+	int rc;
+
+	kvmppc_gsm_include(gsm, iden);
+	rc = kvmppc_gsb_receive_data(gsb, gsm);
+	if (rc < 0)
+		return rc;
+	kvmppc_gsm_reset(gsm);
+	return 0;
+}
+
+/**
+ * kvmppc_gsb_send_data - flexibly send values from a guest state buffer
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ *
+ * Sends the guest state values included in the guest state message.
+ */
+static inline int kvmppc_gsb_send_data(struct kvmppc_gs_buff *gsb,
+				       struct kvmppc_gs_msg *gsm)
+{
+	int rc;
+
+	kvmppc_gsb_reset(gsb);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc < 0)
+		return rc;
+	rc = kvmppc_gsb_send(gsb, gsm->flags);
+
+	return rc;
+}
+
+/**
+ * kvmppc_gsb_recv - send a single guest state ID
+ * @gsb: guest state buffer
+ * @gsm: guest state message
+ * @iden: guest state identity
+ */
+static inline int kvmppc_gsb_send_datum(struct kvmppc_gs_buff *gsb,
+					struct kvmppc_gs_msg *gsm, u16 iden)
+{
+	int rc;
+
+	kvmppc_gsm_include(gsm, iden);
+	rc = kvmppc_gsb_send_data(gsb, gsm);
+	if (rc < 0)
+		return rc;
+	kvmppc_gsm_reset(gsm);
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
index 98d4870ec4b3..486a5eb16d03 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_book3s_asm.h>
+#include <asm/guest-state-buffer.h>
 
 struct kvmppc_bat {
 	u64 raw;
@@ -295,6 +296,7 @@ static inline void kvmppc_save_tm_sprs(struct kvm_vcpu *vcpu) {}
 static inline void kvmppc_restore_tm_sprs(struct kvm_vcpu *vcpu) {}
 #endif
 
+extern unsigned long nested_capabilities;
 long kvmhv_nested_init(void);
 void kvmhv_nested_exit(void);
 void kvmhv_vm_nested_init(struct kvm *kvm);
@@ -316,6 +318,69 @@ long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu);
 
 void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac);
 
+
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+
+extern struct static_key_false __kvmhv_is_nestedv2;
+
+static inline bool kvmhv_is_nestedv2(void)
+{
+	return static_branch_unlikely(&__kvmhv_is_nestedv2);
+}
+
+static inline bool kvmhv_is_nestedv1(void)
+{
+	return !static_branch_likely(&__kvmhv_is_nestedv2);
+}
+
+#else
+
+static inline bool kvmhv_is_nestedv2(void)
+{
+	return false;
+}
+
+static inline bool kvmhv_is_nestedv1(void)
+{
+	return false;
+}
+
+#endif
+
+int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
+int __kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
+int __kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden);
+int __kvmhv_nestedv2_cached_reload(struct kvm_vcpu *vcpu, u16 iden);
+
+static inline int kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu,
+					       struct pt_regs *regs)
+{
+	if (kvmhv_is_nestedv2())
+		return __kvmhv_nestedv2_reload_ptregs(vcpu, regs);
+	return 0;
+}
+static inline int kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu,
+						   struct pt_regs *regs)
+{
+	if (kvmhv_is_nestedv2())
+		return __kvmhv_nestedv2_mark_dirty_ptregs(vcpu, regs);
+	return 0;
+}
+
+static inline int kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	if (kvmhv_is_nestedv2())
+		return __kvmhv_nestedv2_mark_dirty(vcpu, iden);
+	return 0;
+}
+
+static inline int kvmhv_nestedv2_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	if (kvmhv_is_nestedv2())
+		return __kvmhv_nestedv2_cached_reload(vcpu, iden);
+	return 0;
+}
+
 extern int kvm_irq_bypass;
 
 static inline struct kvmppc_vcpu_book3s *to_book3s(struct kvm_vcpu *vcpu)
@@ -335,70 +400,84 @@ static inline struct kvmppc_vcpu_book3s *to_book3s(struct kvm_vcpu *vcpu)
 static inline void kvmppc_set_gpr(struct kvm_vcpu *vcpu, int num, ulong val)
 {
 	vcpu->arch.regs.gpr[num] = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_GPR(num));
 }
 
 static inline ulong kvmppc_get_gpr(struct kvm_vcpu *vcpu, int num)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_GPR(num)) < 0);
 	return vcpu->arch.regs.gpr[num];
 }
 
 static inline void kvmppc_set_cr(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.regs.ccr = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_CR);
 }
 
 static inline u32 kvmppc_get_cr(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_CR) < 0);
 	return vcpu->arch.regs.ccr;
 }
 
 static inline void kvmppc_set_xer(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.xer = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_XER);
 }
 
 static inline ulong kvmppc_get_xer(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_XER) < 0);
 	return vcpu->arch.regs.xer;
 }
 
 static inline void kvmppc_set_ctr(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.ctr = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_CTR);
 }
 
 static inline ulong kvmppc_get_ctr(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_CTR) < 0);
 	return vcpu->arch.regs.ctr;
 }
 
 static inline void kvmppc_set_lr(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.link = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_LR);
 }
 
 static inline ulong kvmppc_get_lr(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_LR) < 0);
 	return vcpu->arch.regs.link;
 }
 
 static inline void kvmppc_set_pc(struct kvm_vcpu *vcpu, ulong val)
 {
 	vcpu->arch.regs.nip = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_NIA);
 }
 
 static inline ulong kvmppc_get_pc(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_NIA) < 0);
 	return vcpu->arch.regs.nip;
 }
 
 static inline void kvmppc_set_pid(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.pid = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_PIDR);
 }
 
 static inline u32 kvmppc_get_pid(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_PIDR) < 0);
 	return vcpu->arch.pid;
 }
 
@@ -415,27 +494,32 @@ static inline ulong kvmppc_get_fault_dar(struct kvm_vcpu *vcpu)
 
 static inline u64 kvmppc_get_fpr(struct kvm_vcpu *vcpu, int i)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_VSRS(i)) < 0);
 	return vcpu->arch.fp.fpr[i][TS_FPROFFSET];
 }
 
 static inline void kvmppc_set_fpr(struct kvm_vcpu *vcpu, int i, u64 val)
 {
 	vcpu->arch.fp.fpr[i][TS_FPROFFSET] = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_VSRS(i));
 }
 
 static inline u64 kvmppc_get_fpscr(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_FPSCR) < 0);
 	return vcpu->arch.fp.fpscr;
 }
 
 static inline void kvmppc_set_fpscr(struct kvm_vcpu *vcpu, u64 val)
 {
 	vcpu->arch.fp.fpscr = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_FPSCR);
 }
 
 
 static inline u64 kvmppc_get_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_VSRS(i)) < 0);
 	return vcpu->arch.fp.fpr[i][j];
 }
 
@@ -443,11 +527,13 @@ static inline void kvmppc_set_vsx_fpr(struct kvm_vcpu *vcpu, int i, int j,
 				      u64 val)
 {
 	vcpu->arch.fp.fpr[i][j] = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_VSRS(i));
 }
 
 #ifdef CONFIG_VSX
 static inline void kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i, vector128 *v)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_VSRS(32 + i)) < 0);
 	*v =  vcpu->arch.vr.vr[i];
 }
 
@@ -455,73 +541,85 @@ static inline void kvmppc_set_vsx_vr(struct kvm_vcpu *vcpu, int i,
 				     vector128 *val)
 {
 	vcpu->arch.vr.vr[i] = *val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_VSRS(32 + i));
 }
 
 static inline u32 kvmppc_get_vscr(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_VSCR) < 0);
 	return vcpu->arch.vr.vscr.u[3];
 }
 
 static inline void kvmppc_set_vscr(struct kvm_vcpu *vcpu, u32 val)
 {
 	vcpu->arch.vr.vscr.u[3] = val;
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_VSCR);
 }
 #endif
 
-#define KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size)			\
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size, iden)		\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 									\
 	vcpu->arch.reg = val;						\
+	kvmhv_nestedv2_mark_dirty(vcpu, iden);				\
 }
 
-#define KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden) < 0);		\
 	return vcpu->arch.reg;						\
 }
 
-#define KVMPPC_BOOK3S_VCPU_ACCESSOR(reg, size)				\
-	KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size)			\
-	KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_VCPU_ACCESSOR(reg, size, iden)			\
+	KVMPPC_BOOK3S_VCPU_ACCESSOR_SET(reg, size, iden)		\
+	KVMPPC_BOOK3S_VCPU_ACCESSOR_GET(reg, size, iden)		\
 
-KVMPPC_BOOK3S_VCPU_ACCESSOR(tar, 64)
-KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbhr, 64)
-KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbrr, 64)
-KVMPPC_BOOK3S_VCPU_ACCESSOR(bescr, 64)
-KVMPPC_BOOK3S_VCPU_ACCESSOR(ic, 64)
-KVMPPC_BOOK3S_VCPU_ACCESSOR(vrsave, 64)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(tar, 64, KVMPPC_GSID_TAR)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbhr, 64, KVMPPC_GSID_EBBHR)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ebbrr, 64, KVMPPC_GSID_EBBRR)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(bescr, 64, KVMPPC_GSID_BESCR)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(ic, 64, KVMPPC_GSID_IC)
+KVMPPC_BOOK3S_VCPU_ACCESSOR(vrsave, 64, KVMPPC_GSID_VRSAVE)
 
 
-#define KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size)			\
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size, iden)		\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	vcpu->arch.vcore->reg = val;					\
+	kvmhv_nestedv2_mark_dirty(vcpu, iden);				\
 }
 
-#define KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
 {									\
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden) < 0);		\
 	return vcpu->arch.vcore->reg;					\
 }
 
-#define KVMPPC_BOOK3S_VCORE_ACCESSOR(reg, size)				\
-	KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size)			\
-	KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_VCORE_ACCESSOR(reg, size, iden)			\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(reg, size, iden)		\
+	KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(reg, size, iden)		\
 
 
-KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64)
-KVMPPC_BOOK3S_VCORE_ACCESSOR(tb_offset, 64)
-KVMPPC_BOOK3S_VCORE_ACCESSOR(lpcr, 64)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64, KVMPPC_GSID_VTB)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(tb_offset, 64, KVMPPC_GSID_TB_OFFSET)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(lpcr, 64, KVMPPC_GSID_LPCR)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(arch_compat, 32, KVMPPC_GSID_LOGICAL_PVR)
 
 static inline u64 kvmppc_get_dec_expires(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_TB_OFFSET) < 0);
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_DEC_EXPIRY_TB) < 0);
 	return vcpu->arch.dec_expires;
 }
 
 static inline void kvmppc_set_dec_expires(struct kvm_vcpu *vcpu, u64 val)
 {
 	vcpu->arch.dec_expires = val;
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_TB_OFFSET) < 0);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_DEC_EXPIRY_TB);
 }
 
 /* Expiry time of vcpu DEC relative to host TB */
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 9fc3ad3990f7..f4007ab31b41 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -677,6 +677,12 @@ static inline pte_t *find_kvm_host_pte(struct kvm *kvm, unsigned long mmu_seq,
 extern pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
 					unsigned long ea, unsigned *hshift);
 
+int kvmhv_nestedv2_vcpu_create(struct kvm_vcpu *vcpu, struct kvmhv_nestedv2_io *io);
+void kvmhv_nestedv2_vcpu_free(struct kvm_vcpu *vcpu, struct kvmhv_nestedv2_io *io);
+int kvmhv_nestedv2_flush_vcpu(struct kvm_vcpu *vcpu, u64 time_limit);
+int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1);
+int kvmhv_nestedv2_parse_output(struct kvm_vcpu *vcpu);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 67dd3e749cac..c761299dfc94 100644
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
 
+ /* Nestedv2 H_GUEST_RUN_VCPU configuration */
+struct kvmhv_nestedv2_config {
+	struct kvmppc_gs_buff_info vcpu_run_output_cfg;
+	struct kvmppc_gs_buff_info vcpu_run_input_cfg;
+	u64 vcpu_run_output_size;
+};
+
+ /* Nestedv2 L1<->L0 communication state */
+struct kvmhv_nestedv2_io {
+	struct kvmhv_nestedv2_config cfg;
+	struct kvmppc_gs_buff *vcpu_run_output;
+	struct kvmppc_gs_buff *vcpu_run_input;
+	struct kvmppc_gs_msg *vcpu_message;
+	struct kvmppc_gs_msg *vcore_message;
+	struct kvmppc_gs_bitmap valids;
+};
+
 struct kvm_vcpu_arch {
 	ulong host_stack;
 	u32 host_pid;
@@ -829,6 +847,8 @@ struct kvm_vcpu_arch {
 	u64 nested_hfscr;	/* HFSCR that the L1 requested for the nested guest */
 	u32 nested_vcpu_id;
 	gpa_t nested_io_gpr;
+	/* For nested APIv2 guests*/
+	struct kvmhv_nestedv2_io nestedv2_io;
 #endif
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b66084a81dd0..a6aaa5812946 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -615,6 +615,42 @@ static inline bool kvmhv_on_pseries(void)
 {
 	return false;
 }
+
+#endif
+
+#ifndef CONFIG_PPC_BOOK3S
+
+static inline bool kvmhv_is_nestedv2(void)
+{
+	return false;
+}
+
+static inline bool kvmhv_is_nestedv1(void)
+{
+	return false;
+}
+
+static inline int kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu,
+					       struct pt_regs *regs)
+{
+	return 0;
+}
+static inline int kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu,
+						   struct pt_regs *regs)
+{
+	return 0;
+}
+
+static inline int kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	return 0;
+}
+
+static inline int kvmhv_nestedv2_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	return 0;
+}
+
 #endif
 
 #ifdef CONFIG_KVM_XICS
@@ -939,67 +975,73 @@ static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, ulong val)	\
 	mtspr(bookehv_spr, val);						\
 }									\
 
-#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)			\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 {									\
+	if (iden)							\
+		WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden) < 0);	\
 	if (kvmppc_shared_big_endian(vcpu))				\
 	       return be##size##_to_cpu(vcpu->arch.shared->reg);	\
 	else								\
 	       return le##size##_to_cpu(vcpu->arch.shared->reg);	\
 }									\
 
-#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)			\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size, iden)		\
 static inline void kvmppc_set_##reg(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	if (kvmppc_shared_big_endian(vcpu))				\
 	       vcpu->arch.shared->reg = cpu_to_be##size(val);		\
 	else								\
 	       vcpu->arch.shared->reg = cpu_to_le##size(val);		\
+									\
+	if (iden)							\
+		kvmhv_nestedv2_mark_dirty(vcpu, iden);			\
 }									\
 
-#define KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)					\
-	KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size)					\
-	KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size)					\
+#define KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size, iden)		\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(reg, size, iden)		\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR_SET(reg, size, iden)		\
 
-#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)					\
-	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)				\
-	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)				\
+#define KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)			\
+	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_GET(reg, bookehv_spr)		\
+	KVMPPC_BOOKE_HV_SPRNG_ACESSOR_SET(reg, bookehv_spr)		\
 
 #ifdef CONFIG_KVM_BOOKE_HV
 
-#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr, iden)	\
 	KVMPPC_BOOKE_HV_SPRNG_ACESSOR(reg, bookehv_spr)			\
 
 #else
 
-#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr)	\
-	KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size)			\
+#define KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(reg, size, bookehv_spr, iden)	\
+	KVMPPC_VCPU_SHARED_REGS_ACESSOR(reg, size, iden)		\
 
 #endif
 
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(critical, 64)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg0, 64, SPRN_GSPRG0)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg1, 64, SPRN_GSPRG1)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg2, 64, SPRN_GSPRG2)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg3, 64, SPRN_GSPRG3)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr0, 64, SPRN_GSRR0)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr1, 64, SPRN_GSRR1)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(dar, 64, SPRN_GDEAR)
-KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(esr, 64, SPRN_GESR)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(msr, 64)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(critical, 64, 0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg0, 64, SPRN_GSPRG0, KVMPPC_GSID_SPRG0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg1, 64, SPRN_GSPRG1, KVMPPC_GSID_SPRG1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg2, 64, SPRN_GSPRG2, KVMPPC_GSID_SPRG2)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(sprg3, 64, SPRN_GSPRG3, KVMPPC_GSID_SPRG3)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr0, 64, SPRN_GSRR0, KVMPPC_GSID_SRR0)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(srr1, 64, SPRN_GSRR1, KVMPPC_GSID_SRR1)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(dar, 64, SPRN_GDEAR, KVMPPC_GSID_DAR)
+KVMPPC_BOOKE_HV_SPRNG_OR_VCPU_SHARED_REGS_ACCESSOR(esr, 64, SPRN_GESR, 0)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR_GET(msr, 64, KVMPPC_GSID_MSR)
 static inline void kvmppc_set_msr_fast(struct kvm_vcpu *vcpu, u64 val)
 {
 	if (kvmppc_shared_big_endian(vcpu))
 	       vcpu->arch.shared->msr = cpu_to_be64(val);
 	else
 	       vcpu->arch.shared->msr = cpu_to_le64(val);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_MSR);
 }
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(dsisr, 32)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(int_pending, 32)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg4, 64)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg5, 64)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg6, 64)
-KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg7, 64)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(dsisr, 32, KVMPPC_GSID_DSISR)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(int_pending, 32, 0)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg4, 64, 0)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg5, 64, 0)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg6, 64, 0)
+KVMPPC_VCPU_SHARED_REGS_ACESSOR(sprg7, 64, 0)
 
 static inline u32 kvmppc_get_sr(struct kvm_vcpu *vcpu, int nr)
 {
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index efd9b8b7fb8f..d6860546039d 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -6,6 +6,7 @@
 
 #include <linux/string.h>
 #include <linux/irqflags.h>
+#include <linux/delay.h>
 
 #include <asm/hvcall.h>
 #include <asm/paca.h>
@@ -342,6 +343,193 @@ static inline long plpar_get_cpu_characteristics(struct h_cpu_char_result *p)
 	return rc;
 }
 
+static inline long plpar_guest_create(unsigned long flags, unsigned long *guest_id)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
+	unsigned long token;
+	long rc;
+
+	token = -1UL;
+	do {
+		rc = plpar_hcall(H_GUEST_CREATE, retbuf, flags, token);
+		if (rc == H_SUCCESS)
+			*guest_id = retbuf[0];
+
+		if (rc == H_BUSY) {
+			token = retbuf[0];
+			cond_resched();
+		}
+
+		if (H_IS_LONG_BUSY(rc)) {
+			token = retbuf[0];
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+		}
+
+	} while (rc == H_BUSY);
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
+	do {
+		rc = plpar_hcall_norets(H_GUEST_CREATE_VCPU, 0, guest_id, vcpu_id);
+
+		if (rc == H_BUSY)
+			cond_resched();
+
+		if (H_IS_LONG_BUSY(rc)) {
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+		}
+
+	} while (rc == H_BUSY);
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
+	do {
+		rc = plpar_hcall_norets(H_GUEST_DELETE, flags, guest_id);
+		if (rc == H_BUSY)
+			cond_resched();
+
+		if (H_IS_LONG_BUSY(rc)) {
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+		}
+
+	} while (rc == H_BUSY);
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
index eb8445e71c14..4bd9d1230869 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -87,6 +87,7 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_hv_ras.o \
 	book3s_hv_builtin.o \
 	book3s_hv_p9_perf.o \
+	book3s_hv_nestedv2.o \
 	guest-state-buffer.o \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2357545dffd7..7d5edbc6ecd9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -393,7 +393,7 @@ static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
 
 static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 {
-	unsigned long host_pcr_bit = 0, guest_pcr_bit = 0;
+	unsigned long host_pcr_bit = 0, guest_pcr_bit = 0, cap = 0;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
 	/* We can (emulate) our own architecture version and anything older */
@@ -424,9 +424,11 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 			break;
 		case PVR_ARCH_300:
 			guest_pcr_bit = PCR_ARCH_300;
+			cap = H_GUEST_CAP_POWER9;
 			break;
 		case PVR_ARCH_31:
 			guest_pcr_bit = PCR_ARCH_31;
+			cap = H_GUEST_CAP_POWER10;
 			break;
 		default:
 			return -EINVAL;
@@ -437,8 +439,13 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
 	if (guest_pcr_bit > host_pcr_bit)
 		return -EINVAL;
 
+	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
+		if (!(cap & nested_capabilities))
+			return -EINVAL;
+	}
+
 	spin_lock(&vc->lock);
-	vc->arch_compat = arch_compat;
+	kvmppc_set_arch_compat_hv(vcpu, arch_compat);
 	/*
 	 * Set all PCR bits for which guest_pcr_bit <= bit < host_pcr_bit
 	 * Also set all reserved PCR bits
@@ -2927,8 +2934,14 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.shared_big_endian = false;
 #endif
 #endif
-	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
 
+	if (kvmhv_is_nestedv2()) {
+		err = kvmhv_nestedv2_vcpu_create(vcpu, &vcpu->arch.nestedv2_io);
+		if (err < 0)
+			return err;
+	}
+
+	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
 	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
 		kvmppc_set_mmcr_hv(vcpu, 0, kvmppc_get_mmcr_hv(vcpu, 0) | MMCR0_PMCCEXT);
 		kvmppc_set_mmcra_hv(vcpu, MMCRA_BHRB_DISABLE);
@@ -3012,6 +3025,8 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 			kvm->arch.vcores[core] = vcore;
 			kvm->arch.online_vcores++;
 			mutex_unlock(&kvm->arch.mmu_setup_lock);
+			if (kvmhv_is_nestedv2())
+				kvmppc_set_lpcr_hv(vcpu, vcpu->arch.vcore->lpcr);
 		}
 	}
 	mutex_unlock(&kvm->lock);
@@ -3084,6 +3099,8 @@ static void kvmppc_core_vcpu_free_hv(struct kvm_vcpu *vcpu)
 	unpin_vpa(vcpu->kvm, &vcpu->arch.slb_shadow);
 	unpin_vpa(vcpu->kvm, &vcpu->arch.vpa);
 	spin_unlock(&vcpu->arch.vpa_update_lock);
+	if (kvmhv_is_nestedv2())
+		kvmhv_nestedv2_vcpu_free(vcpu, &vcpu->arch.nestedv2_io);
 }
 
 static int kvmppc_core_check_requests_hv(struct kvm_vcpu *vcpu)
@@ -4048,6 +4065,55 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 	}
 }
 
+static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
+				     unsigned long lpcr, u64 *tb)
+{
+	struct kvmhv_nestedv2_io *io;
+	unsigned long msr, i;
+	int trap;
+	long rc;
+
+	io = &vcpu->arch.nestedv2_io;
+
+	msr = mfmsr();
+	kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
+	if (lazy_irq_pending())
+		return 0;
+
+	rc = kvmhv_nestedv2_flush_vcpu(vcpu, time_limit);
+	if (rc < 0)
+		return -EINVAL;
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
+		return -EINVAL;
+	}
+	accumulate_time(vcpu, &vcpu->arch.guest_exit);
+
+	*tb = mftb();
+	kvmppc_gsm_reset(io->vcpu_message);
+	kvmppc_gsm_reset(io->vcore_message);
+	kvmppc_gsbm_zero(&io->valids);
+
+	rc = kvmhv_nestedv2_parse_output(vcpu);
+	if (rc < 0)
+		return -EINVAL;
+
+	timer_rearm_host_dec(*tb);
+
+	return trap;
+}
+
 /* call our hypervisor to load up HV regs and go */
 static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
@@ -4165,7 +4231,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu_vpa_increment_dispatch(vcpu);
 
 	if (kvmhv_on_pseries()) {
-		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
+		if (kvmhv_is_nestedv1())
+			trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
+		else if (kvmhv_is_nestedv2())
+			trap = kvmhv_vcpu_entry_nestedv2(vcpu, time_limit, lpcr, tb);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !nested &&
@@ -5145,6 +5214,14 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned long mask)
 		if (++cores_done >= kvm->arch.online_vcores)
 			break;
 	}
+
+	if (kvmhv_is_nestedv2()) {
+		struct kvm_vcpu *vcpu;
+
+		kvm_for_each_vcpu(i, vcpu, kvm) {
+			kvmppc_set_lpcr_hv(vcpu, vcpu->arch.vcore->lpcr);
+		}
+	}
 }
 
 void kvmppc_setup_partition_table(struct kvm *kvm)
@@ -5411,15 +5488,43 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 
 	/* Allocate the guest's logical partition ID */
 
-	lpid = kvmppc_alloc_lpid();
-	if ((long)lpid < 0)
-		return -ENOMEM;
-	kvm->arch.lpid = lpid;
+	if (!kvmhv_is_nestedv2()) {
+		lpid = kvmppc_alloc_lpid();
+		if ((long)lpid < 0)
+			return -ENOMEM;
+		kvm->arch.lpid = lpid;
+	}
 
 	kvmppc_alloc_host_rm_ops();
 
 	kvmhv_vm_nested_init(kvm);
 
+	if (kvmhv_is_nestedv2()) {
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
@@ -5489,7 +5594,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 			lpcr |= LPCR_HAIL;
 		ret = kvmppc_init_vm_radix(kvm);
 		if (ret) {
-			kvmppc_free_lpid(kvm->arch.lpid);
+			if (kvmhv_is_nestedv2())
+				plpar_guest_delete(0, kvm->arch.lpid);
+			else
+				kvmppc_free_lpid(kvm->arch.lpid);
 			return ret;
 		}
 		kvmppc_setup_partition_table(kvm);
@@ -5579,10 +5687,14 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 		kvm->arch.process_table = 0;
 		if (kvm->arch.secure_guest)
 			uv_svm_terminate(kvm->arch.lpid);
-		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
+		if (!kvmhv_is_nestedv2())
+			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 
-	kvmppc_free_lpid(kvm->arch.lpid);
+	if (kvmhv_is_nestedv2())
+		plpar_guest_delete(0, kvm->arch.lpid);
+	else
+		kvmppc_free_lpid(kvm->arch.lpid);
 
 	kvmppc_free_pimap(kvm);
 }
@@ -5994,6 +6106,8 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 		return -ENODEV;
 	if (!radix_enabled())
 		return -ENODEV;
+	if (kvmhv_is_nestedv2())
+		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
 	if (kvm)
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
index acd9a7a95bbf..3d827e47a922 100644
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
@@ -51,60 +53,64 @@ void accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next);
 #define end_timing(vcpu) do {} while (0)
 #endif
 
-#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size)			\
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size, iden)		\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, u##size val)	\
 {									\
 	vcpu->arch.reg = val;						\
+	kvmhv_nestedv2_mark_dirty(vcpu, iden);				\
 }
 
-#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size, iden)		\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu)	\
 {									\
+	kvmhv_nestedv2_cached_reload(vcpu, iden);			\
 	return vcpu->arch.reg;						\
 }
 
-#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(reg, size)			\
-	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size)			\
-	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size)			\
+#define KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(reg, size, iden)			\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_SET(reg, size, iden)		\
+	KVMPPC_BOOK3S_HV_VCPU_ACCESSOR_GET(reg, size, iden)		\
 
-#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size)		\
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size, iden)	\
 static inline void kvmppc_set_##reg ##_hv(struct kvm_vcpu *vcpu, int i, u##size val)	\
 {									\
 	vcpu->arch.reg[i] = val;					\
+	kvmhv_nestedv2_mark_dirty(vcpu, iden(i));			\
 }
 
-#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size)		\
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size, iden)	\
 static inline u##size kvmppc_get_##reg ##_hv(struct kvm_vcpu *vcpu, int i)	\
 {									\
+	WARN_ON(kvmhv_nestedv2_cached_reload(vcpu, iden(i)) < 0);	\
 	return vcpu->arch.reg[i];					\
 }
 
-#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(reg, size)			\
-	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size)		\
-	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size)		\
+#define KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(reg, size, iden)		\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_SET(reg, size, iden)	\
+	KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR_GET(reg, size, iden)	\
 
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(mmcra, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hfscr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(fscr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dscr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(purr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(spurr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(amr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(uamor, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(siar, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(sdar, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(iamr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr0, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ctrl, 64)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(mmcra, 64, KVMPPC_GSID_MMCRA)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(hfscr, 64, KVMPPC_GSID_HFSCR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(fscr, 64, KVMPPC_GSID_FSCR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dscr, 64, KVMPPC_GSID_DSCR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(purr, 64, KVMPPC_GSID_PURR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(spurr, 64, KVMPPC_GSID_SPURR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(amr, 64, KVMPPC_GSID_AMR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(uamor, 64, KVMPPC_GSID_UAMOR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(siar, 64, KVMPPC_GSID_SIAR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(sdar, 64, KVMPPC_GSID_SDAR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(iamr, 64, KVMPPC_GSID_IAMR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr0, 64, KVMPPC_GSID_DAWR0)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawr1, 64, KVMPPC_GSID_DAWR1)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx0, 64, KVMPPC_GSID_DAWRX0)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(dawrx1, 64, KVMPPC_GSID_DAWRX1)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ciabr, 64, KVMPPC_GSID_CIABR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(wort, 64, KVMPPC_GSID_WORT)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ppr, 64, KVMPPC_GSID_PPR)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(ctrl, 64, KVMPPC_GSID_CTRL);
 
-KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(mmcr, 64)
-KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(sier, 64)
-KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(pmc, 32)
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(mmcr, 64, KVMPPC_GSID_MMCR)
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(sier, 64, KVMPPC_GSID_SIER)
+KVMPPC_BOOK3S_HV_VCPU_ARRAY_ACCESSOR(pmc, 32, KVMPPC_GSID_PMC)
 
-KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(pspb, 32)
+KVMPPC_BOOK3S_HV_VCPU_ACCESSOR(pspb, 32, KVMPPC_GSID_PSPB)
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 20490dd4708f..51010e8f7ea9 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -428,10 +428,12 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	return vcpu->arch.trap;
 }
 
+unsigned long nested_capabilities;
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
+		static_branch_enable(&__kvmhv_is_nestedv2);
+		return 0;
+	}
+
 	/* Partition table entry is 1<<4 bytes in size, hence the 4. */
 	ptb_order = KVM_MAX_NESTED_GUESTS_SHIFT + 4;
 	/* Minimum partition table size is 1<<12 bytes */
@@ -507,10 +530,15 @@ void kvmhv_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1)
 		return;
 	}
 
-	pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
-	pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
-	/* L0 will do the necessary barriers */
-	kvmhv_flush_lpid(lpid);
+	if (kvmhv_is_nestedv1()) {
+		pseries_partition_tb[lpid].patb0 = cpu_to_be64(dw0);
+		pseries_partition_tb[lpid].patb1 = cpu_to_be64(dw1);
+		/* L0 will do the necessary barriers */
+		kvmhv_flush_lpid(lpid);
+	}
+
+	if (kvmhv_is_nestedv2())
+		kvmhv_nestedv2_set_ptbl_entry(lpid, dw0, dw1);
 }
 
 static void kvmhv_set_nested_ptbl(struct kvm_nested_guest *gp)
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
new file mode 100644
index 000000000000..5dd37439ab58
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -0,0 +1,985 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2023 Jordan Niethe, IBM Corp. <jniethe5@gmail.com>
+ *
+ * Authors:
+ *    Jordan Niethe <jniethe5@gmail.com>
+ *
+ * Description: KVM functions specific to running on Book 3S
+ * processors as a NESTEDv2 guest.
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
+struct static_key_false __kvmhv_is_nestedv2 __read_mostly;
+EXPORT_SYMBOL_GPL(__kvmhv_is_nestedv2);
+
+
+static size_t
+gs_msg_ops_kvmhv_nestedv2_config_get_size(struct kvmppc_gs_msg *gsm)
+{
+	u16 ids[] = {
+		KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE,
+		KVMPPC_GSID_RUN_INPUT,
+		KVMPPC_GSID_RUN_OUTPUT,
+
+	};
+	size_t size = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
+	return size;
+}
+
+static int
+gs_msg_ops_kvmhv_nestedv2_config_fill_info(struct kvmppc_gs_buff *gsb,
+					   struct kvmppc_gs_msg *gsm)
+{
+	struct kvmhv_nestedv2_config *cfg;
+	int rc;
+
+	cfg = gsm->data;
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE)) {
+		rc = kvmppc_gse_put_u64(gsb, KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE,
+					cfg->vcpu_run_output_size);
+		if (rc < 0)
+			return rc;
+	}
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_INPUT)) {
+		rc = kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_INPUT,
+					      cfg->vcpu_run_input_cfg);
+		if (rc < 0)
+			return rc;
+	}
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_OUTPUT)) {
+		kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_OUTPUT,
+					 cfg->vcpu_run_output_cfg);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
+static int
+gs_msg_ops_kvmhv_nestedv2_config_refresh_info(struct kvmppc_gs_msg *gsm,
+					      struct kvmppc_gs_buff *gsb)
+{
+	struct kvmhv_nestedv2_config *cfg;
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmppc_gs_elem *gse;
+	int rc;
+
+	cfg = gsm->data;
+
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE);
+	if (gse)
+		cfg->vcpu_run_output_size = kvmppc_gse_get_u64(gse);
+	return 0;
+}
+
+static struct kvmppc_gs_msg_ops config_msg_ops = {
+	.get_size = gs_msg_ops_kvmhv_nestedv2_config_get_size,
+	.fill_info = gs_msg_ops_kvmhv_nestedv2_config_fill_info,
+	.refresh_info = gs_msg_ops_kvmhv_nestedv2_config_refresh_info,
+};
+
+static size_t gs_msg_ops_vcpu_get_size(struct kvmppc_gs_msg *gsm)
+{
+	struct kvmppc_gs_bitmap gsbm = { 0 };
+	size_t size = 0;
+	u16 iden;
+
+	kvmppc_gsbm_fill(&gsbm);
+	kvmppc_gsbm_for_each(&gsbm, iden)
+	{
+		switch (iden) {
+		case KVMPPC_GSID_HOST_STATE_SIZE:
+		case KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE:
+		case KVMPPC_GSID_PARTITION_TABLE:
+		case KVMPPC_GSID_PROCESS_TABLE:
+		case KVMPPC_GSID_RUN_INPUT:
+		case KVMPPC_GSID_RUN_OUTPUT:
+			break;
+		default:
+			size += kvmppc_gse_total_size(kvmppc_gsid_size(iden));
+		}
+	}
+	return size;
+}
+
+static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
+				     struct kvmppc_gs_msg *gsm)
+{
+	struct kvm_vcpu *vcpu;
+	vector128 v;
+	int rc, i;
+	u16 iden;
+
+	vcpu = gsm->data;
+
+	kvmppc_gsm_for_each(gsm, iden)
+	{
+		rc = 0;
+
+		if ((gsm->flags & KVMPPC_GS_FLAGS_WIDE) !=
+		    (kvmppc_gsid_flags(iden) & KVMPPC_GS_FLAGS_WIDE))
+			continue;
+
+		switch (iden) {
+		case KVMPPC_GSID_DSCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dscr);
+			break;
+		case KVMPPC_GSID_MMCRA:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.mmcra);
+			break;
+		case KVMPPC_GSID_HFSCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.hfscr);
+			break;
+		case KVMPPC_GSID_PURR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.purr);
+			break;
+		case KVMPPC_GSID_SPURR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.spurr);
+			break;
+		case KVMPPC_GSID_AMR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.amr);
+			break;
+		case KVMPPC_GSID_UAMOR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.uamor);
+			break;
+		case KVMPPC_GSID_SIAR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.siar);
+			break;
+		case KVMPPC_GSID_SDAR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.sdar);
+			break;
+		case KVMPPC_GSID_IAMR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.iamr);
+			break;
+		case KVMPPC_GSID_DAWR0:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dawr0);
+			break;
+		case KVMPPC_GSID_DAWR1:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.dawr1);
+			break;
+		case KVMPPC_GSID_DAWRX0:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.dawrx0);
+			break;
+		case KVMPPC_GSID_DAWRX1:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.dawrx1);
+			break;
+		case KVMPPC_GSID_CIABR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ciabr);
+			break;
+		case KVMPPC_GSID_WORT:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.wort);
+			break;
+		case KVMPPC_GSID_PPR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ppr);
+			break;
+		case KVMPPC_GSID_PSPB:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.pspb);
+			break;
+		case KVMPPC_GSID_TAR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.tar);
+			break;
+		case KVMPPC_GSID_FSCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.fscr);
+			break;
+		case KVMPPC_GSID_EBBHR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ebbhr);
+			break;
+		case KVMPPC_GSID_EBBRR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ebbrr);
+			break;
+		case KVMPPC_GSID_BESCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.bescr);
+			break;
+		case KVMPPC_GSID_IC:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ic);
+			break;
+		case KVMPPC_GSID_CTRL:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.ctrl);
+			break;
+		case KVMPPC_GSID_PIDR:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.pid);
+			break;
+		case KVMPPC_GSID_AMOR: {
+			u64 amor = ~0;
+
+			rc = kvmppc_gse_put_u64(gsb, iden, amor);
+			break;
+		}
+		case KVMPPC_GSID_VRSAVE:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.vrsave);
+			break;
+		case KVMPPC_GSID_MMCR(0)... KVMPPC_GSID_MMCR(3):
+			i = iden - KVMPPC_GSID_MMCR(0);
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.mmcr[i]);
+			break;
+		case KVMPPC_GSID_SIER(0)... KVMPPC_GSID_SIER(2):
+			i = iden - KVMPPC_GSID_SIER(0);
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.sier[i]);
+			break;
+		case KVMPPC_GSID_PMC(0)... KVMPPC_GSID_PMC(5):
+			i = iden - KVMPPC_GSID_PMC(0);
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.pmc[i]);
+			break;
+		case KVMPPC_GSID_GPR(0)... KVMPPC_GSID_GPR(31):
+			i = iden - KVMPPC_GSID_GPR(0);
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.regs.gpr[i]);
+			break;
+		case KVMPPC_GSID_CR:
+			rc = kvmppc_gse_put_u32(gsb, iden, vcpu->arch.regs.ccr);
+			break;
+		case KVMPPC_GSID_XER:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.regs.xer);
+			break;
+		case KVMPPC_GSID_CTR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.regs.ctr);
+			break;
+		case KVMPPC_GSID_LR:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.regs.link);
+			break;
+		case KVMPPC_GSID_NIA:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.regs.nip);
+			break;
+		case KVMPPC_GSID_SRR0:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.srr0);
+			break;
+		case KVMPPC_GSID_SRR1:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.srr1);
+			break;
+		case KVMPPC_GSID_SPRG0:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.sprg0);
+			break;
+		case KVMPPC_GSID_SPRG1:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.sprg1);
+			break;
+		case KVMPPC_GSID_SPRG2:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.sprg2);
+			break;
+		case KVMPPC_GSID_SPRG3:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.sprg3);
+			break;
+		case KVMPPC_GSID_DAR:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.dar);
+			break;
+		case KVMPPC_GSID_DSISR:
+			rc = kvmppc_gse_put_u32(gsb, iden,
+						vcpu->arch.shregs.dsisr);
+			break;
+		case KVMPPC_GSID_MSR:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.shregs.msr);
+			break;
+		case KVMPPC_GSID_VTB:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.vcore->vtb);
+			break;
+		case KVMPPC_GSID_LPCR:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.vcore->lpcr);
+			break;
+		case KVMPPC_GSID_TB_OFFSET:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.vcore->tb_offset);
+			break;
+		case KVMPPC_GSID_FPSCR:
+			rc = kvmppc_gse_put_u64(gsb, iden, vcpu->arch.fp.fpscr);
+			break;
+		case KVMPPC_GSID_VSRS(0)... KVMPPC_GSID_VSRS(31):
+			i = iden - KVMPPC_GSID_VSRS(0);
+			memcpy(&v, &vcpu->arch.fp.fpr[i],
+			       sizeof(vcpu->arch.fp.fpr[i]));
+			rc = kvmppc_gse_put_vector128(gsb, iden, &v);
+			break;
+#ifdef CONFIG_VSX
+		case KVMPPC_GSID_VSCR:
+			rc = kvmppc_gse_put_u32(gsb, iden,
+						vcpu->arch.vr.vscr.u[3]);
+			break;
+		case KVMPPC_GSID_VSRS(32)... KVMPPC_GSID_VSRS(63):
+			i = iden - KVMPPC_GSID_VSRS(32);
+			rc = kvmppc_gse_put_vector128(gsb, iden,
+						      &vcpu->arch.vr.vr[i]);
+			break;
+#endif
+		case KVMPPC_GSID_DEC_EXPIRY_TB: {
+			u64 dw;
+
+			dw = vcpu->arch.dec_expires -
+			     vcpu->arch.vcore->tb_offset;
+			rc = kvmppc_gse_put_u64(gsb, iden, dw);
+			break;
+		}
+		case KVMPPC_GSID_LOGICAL_PVR:
+			rc = kvmppc_gse_put_u32(gsb, iden,
+						vcpu->arch.vcore->arch_compat);
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
+static int gs_msg_ops_vcpu_refresh_info(struct kvmppc_gs_msg *gsm,
+					struct kvmppc_gs_buff *gsb)
+{
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_bitmap *valids;
+	struct kvm_vcpu *vcpu;
+	struct kvmppc_gs_elem *gse;
+	vector128 v;
+	int rc, i;
+	u16 iden;
+
+	vcpu = gsm->data;
+
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	io = &vcpu->arch.nestedv2_io;
+	valids = &io->valids;
+
+	kvmppc_gsp_for_each(&gsp, iden, gse)
+	{
+		switch (iden) {
+		case KVMPPC_GSID_DSCR:
+			vcpu->arch.dscr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_MMCRA:
+			vcpu->arch.mmcra = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_HFSCR:
+			vcpu->arch.hfscr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_PURR:
+			vcpu->arch.purr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SPURR:
+			vcpu->arch.spurr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_AMR:
+			vcpu->arch.amr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_UAMOR:
+			vcpu->arch.uamor = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SIAR:
+			vcpu->arch.siar = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SDAR:
+			vcpu->arch.sdar = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_IAMR:
+			vcpu->arch.iamr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DAWR0:
+			vcpu->arch.dawr0 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DAWR1:
+			vcpu->arch.dawr1 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DAWRX0:
+			vcpu->arch.dawrx0 = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_DAWRX1:
+			vcpu->arch.dawrx1 = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_CIABR:
+			vcpu->arch.ciabr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_WORT:
+			vcpu->arch.wort = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_PPR:
+			vcpu->arch.ppr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_PSPB:
+			vcpu->arch.pspb = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_TAR:
+			vcpu->arch.tar = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_FSCR:
+			vcpu->arch.fscr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_EBBHR:
+			vcpu->arch.ebbhr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_EBBRR:
+			vcpu->arch.ebbrr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_BESCR:
+			vcpu->arch.bescr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_IC:
+			vcpu->arch.ic = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_CTRL:
+			vcpu->arch.ctrl = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_PIDR:
+			vcpu->arch.pid = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_AMOR: {
+			u64 amor;
+
+			amor = kvmppc_gse_get_u64(gse);
+			break;
+		}
+		case KVMPPC_GSID_VRSAVE:
+			vcpu->arch.vrsave = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_MMCR(0)... KVMPPC_GSID_MMCR(3):
+			i = iden - KVMPPC_GSID_MMCR(0);
+			vcpu->arch.mmcr[i] = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SIER(0)... KVMPPC_GSID_SIER(2):
+			i = iden - KVMPPC_GSID_SIER(0);
+			vcpu->arch.sier[i] = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_PMC(0)... KVMPPC_GSID_PMC(5):
+			i = iden - KVMPPC_GSID_PMC(0);
+			vcpu->arch.pmc[i] = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_GPR(0)... KVMPPC_GSID_GPR(31):
+			i = iden - KVMPPC_GSID_GPR(0);
+			vcpu->arch.regs.gpr[i] = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_CR:
+			vcpu->arch.regs.ccr = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_XER:
+			vcpu->arch.regs.xer = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_CTR:
+			vcpu->arch.regs.ctr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_LR:
+			vcpu->arch.regs.link = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_NIA:
+			vcpu->arch.regs.nip = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SRR0:
+			vcpu->arch.shregs.srr0 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SRR1:
+			vcpu->arch.shregs.srr1 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SPRG0:
+			vcpu->arch.shregs.sprg0 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SPRG1:
+			vcpu->arch.shregs.sprg1 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SPRG2:
+			vcpu->arch.shregs.sprg2 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_SPRG3:
+			vcpu->arch.shregs.sprg3 = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DAR:
+			vcpu->arch.shregs.dar = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DSISR:
+			vcpu->arch.shregs.dsisr = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_MSR:
+			vcpu->arch.shregs.msr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_VTB:
+			vcpu->arch.vcore->vtb = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_LPCR:
+			vcpu->arch.vcore->lpcr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_TB_OFFSET:
+			vcpu->arch.vcore->tb_offset = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_FPSCR:
+			vcpu->arch.fp.fpscr = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_VSRS(0)... KVMPPC_GSID_VSRS(31):
+			kvmppc_gse_get_vector128(gse, &v);
+			i = iden - KVMPPC_GSID_VSRS(0);
+			memcpy(&vcpu->arch.fp.fpr[i], &v,
+			       sizeof(vcpu->arch.fp.fpr[i]));
+			break;
+#ifdef CONFIG_VSX
+		case KVMPPC_GSID_VSCR:
+			vcpu->arch.vr.vscr.u[3] = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_VSRS(32)... KVMPPC_GSID_VSRS(63):
+			i = iden - KVMPPC_GSID_VSRS(32);
+			kvmppc_gse_get_vector128(gse, &vcpu->arch.vr.vr[i]);
+			break;
+#endif
+		case KVMPPC_GSID_HDAR:
+			vcpu->arch.fault_dar = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_HDSISR:
+			vcpu->arch.fault_dsisr = kvmppc_gse_get_u32(gse);
+			break;
+		case KVMPPC_GSID_ASDR:
+			vcpu->arch.fault_gpa = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_HEIR:
+			vcpu->arch.emul_inst = kvmppc_gse_get_u64(gse);
+			break;
+		case KVMPPC_GSID_DEC_EXPIRY_TB: {
+			u64 dw;
+
+			dw = kvmppc_gse_get_u64(gse);
+			vcpu->arch.dec_expires =
+				dw + vcpu->arch.vcore->tb_offset;
+			break;
+		}
+		case KVMPPC_GSID_LOGICAL_PVR:
+			vcpu->arch.vcore->arch_compat = kvmppc_gse_get_u32(gse);
+			break;
+		default:
+			continue;
+		}
+		kvmppc_gsbm_set(valids, iden);
+	}
+
+	return 0;
+}
+
+static struct kvmppc_gs_msg_ops vcpu_message_ops = {
+	.get_size = gs_msg_ops_vcpu_get_size,
+	.fill_info = gs_msg_ops_vcpu_fill_info,
+	.refresh_info = gs_msg_ops_vcpu_refresh_info,
+};
+
+static int kvmhv_nestedv2_host_create(struct kvm_vcpu *vcpu,
+				      struct kvmhv_nestedv2_io *io)
+{
+	struct kvmhv_nestedv2_config *cfg;
+	struct kvmppc_gs_buff *gsb, *vcpu_run_output, *vcpu_run_input;
+	unsigned long guest_id, vcpu_id;
+	struct kvmppc_gs_msg *gsm, *vcpu_message, *vcore_message;
+	int rc;
+
+	cfg = &io->cfg;
+	guest_id = vcpu->kvm->arch.lpid;
+	vcpu_id = vcpu->vcpu_id;
+
+	gsm = kvmppc_gsm_new(&config_msg_ops, cfg, KVMPPC_GS_FLAGS_WIDE,
+			     GFP_KERNEL);
+	if (!gsm) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), guest_id, vcpu_id,
+			     GFP_KERNEL);
+	if (!gsb) {
+		rc = -ENOMEM;
+		goto free_gsm;
+	}
+
+	rc = kvmppc_gsb_receive_datum(gsb, gsm,
+				      KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't get vcpu run output buffer minimum size\n");
+		goto free_gsb;
+	}
+
+	vcpu_run_output = kvmppc_gsb_new(cfg->vcpu_run_output_size, guest_id,
+					 vcpu_id, GFP_KERNEL);
+	if (!vcpu_run_output) {
+		rc = -ENOMEM;
+		goto free_gsb;
+	}
+
+	cfg->vcpu_run_output_cfg.address = kvmppc_gsb_paddress(vcpu_run_output);
+	cfg->vcpu_run_output_cfg.size = kvmppc_gsb_capacity(vcpu_run_output);
+	io->vcpu_run_output = vcpu_run_output;
+
+	gsm->flags = 0;
+	rc = kvmppc_gsb_send_datum(gsb, gsm, KVMPPC_GSID_RUN_OUTPUT);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't set vcpu run output buffer\n");
+		goto free_gs_out;
+	}
+
+	vcpu_message = kvmppc_gsm_new(&vcpu_message_ops, vcpu, 0, GFP_KERNEL);
+	if (!vcpu_message) {
+		rc = -ENOMEM;
+		goto free_gs_out;
+	}
+	kvmppc_gsm_include_all(vcpu_message);
+
+	io->vcpu_message = vcpu_message;
+
+	vcpu_run_input = kvmppc_gsb_new(kvmppc_gsm_size(vcpu_message), guest_id,
+					vcpu_id, GFP_KERNEL);
+	if (!vcpu_run_input) {
+		rc = -ENOMEM;
+		goto free_vcpu_message;
+	}
+
+	io->vcpu_run_input = vcpu_run_input;
+	cfg->vcpu_run_input_cfg.address = kvmppc_gsb_paddress(vcpu_run_input);
+	cfg->vcpu_run_input_cfg.size = kvmppc_gsb_capacity(vcpu_run_input);
+	rc = kvmppc_gsb_send_datum(gsb, gsm, KVMPPC_GSID_RUN_INPUT);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't set vcpu run input buffer\n");
+		goto free_vcpu_run_input;
+	}
+
+	vcore_message = kvmppc_gsm_new(&vcpu_message_ops, vcpu,
+				       KVMPPC_GS_FLAGS_WIDE, GFP_KERNEL);
+	if (!vcore_message) {
+		rc = -ENOMEM;
+		goto free_vcpu_run_input;
+	}
+
+	kvmppc_gsm_include_all(vcore_message);
+	kvmppc_gsbm_clear(&vcore_message->bitmap, KVMPPC_GSID_LOGICAL_PVR);
+	io->vcore_message = vcore_message;
+
+	kvmppc_gsbm_fill(&io->valids);
+	kvmppc_gsm_free(gsm);
+	kvmppc_gsb_free(gsb);
+	return 0;
+
+free_vcpu_run_input:
+	kvmppc_gsb_free(vcpu_run_input);
+free_vcpu_message:
+	kvmppc_gsm_free(vcpu_message);
+free_gs_out:
+	kvmppc_gsb_free(vcpu_run_output);
+free_gsb:
+	kvmppc_gsb_free(gsb);
+free_gsm:
+	kvmppc_gsm_free(gsm);
+err:
+	return rc;
+}
+
+/**
+ * __kvmhv_nestedv2_mark_dirty() - mark a Guest State ID to be sent to the host
+ * @vcpu: vcpu
+ * @iden: guest state ID
+ *
+ * Mark a guest state ID as having been changed by the L1 host and thus
+ * the new value must be sent to the L0 hypervisor. See kvmhv_nestedv2_flush_vcpu()
+ */
+int __kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden)
+{
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_bitmap *valids;
+	struct kvmppc_gs_msg *gsm;
+
+	if (!iden)
+		return 0;
+
+	io = &vcpu->arch.nestedv2_io;
+	valids = &io->valids;
+	gsm = io->vcpu_message;
+	kvmppc_gsm_include(gsm, iden);
+	gsm = io->vcore_message;
+	kvmppc_gsm_include(gsm, iden);
+	kvmppc_gsbm_set(valids, iden);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_nestedv2_mark_dirty);
+
+/**
+ * __kvmhv_nestedv2_cached_reload() - reload a Guest State ID from the host
+ * @vcpu: vcpu
+ * @iden: guest state ID
+ *
+ * Reload the value for the guest state ID from the L0 host into the L1 host.
+ * This is cached so that going out to the L0 host only happens if necessary.
+ */
+int __kvmhv_nestedv2_cached_reload(struct kvm_vcpu *vcpu, u16 iden)
+{
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_bitmap *valids;
+	struct kvmppc_gs_buff *gsb;
+	struct kvmppc_gs_msg gsm;
+	int rc;
+
+	if (!iden)
+		return 0;
+
+	io = &vcpu->arch.nestedv2_io;
+	valids = &io->valids;
+	if (kvmppc_gsbm_test(valids, iden))
+		return 0;
+
+	gsb = io->vcpu_run_input;
+	kvmppc_gsm_init(&gsm, &vcpu_message_ops, vcpu, kvmppc_gsid_flags(iden));
+	rc = kvmppc_gsb_receive_datum(gsb, &gsm, iden);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't get GSID: 0x%x\n", iden);
+		return rc;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_nestedv2_cached_reload);
+
+/**
+ * kvmhv_nestedv2_flush_vcpu() - send modified Guest State IDs to the host
+ * @vcpu: vcpu
+ * @time_limit: hdec expiry tb
+ *
+ * Send the values marked by __kvmhv_nestedv2_mark_dirty() to the L0 host.
+ * Thread wide values are copied to the H_GUEST_RUN_VCPU input buffer. Guest
+ * wide values need to be sent with H_GUEST_SET first.
+ *
+ * The hdec tb offset is always sent to L0 host.
+ */
+int kvmhv_nestedv2_flush_vcpu(struct kvm_vcpu *vcpu, u64 time_limit)
+{
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_buff *gsb;
+	struct kvmppc_gs_msg *gsm;
+	int rc;
+
+	io = &vcpu->arch.nestedv2_io;
+	gsb = io->vcpu_run_input;
+	gsm = io->vcore_message;
+	rc = kvmppc_gsb_send_data(gsb, gsm);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't set guest wide elements\n");
+		return rc;
+	}
+
+	gsm = io->vcpu_message;
+	kvmppc_gsb_reset(gsb);
+	rc = kvmppc_gsm_fill_info(gsm, gsb);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't fill vcpu run input buffer\n");
+		return rc;
+	}
+
+	rc = kvmppc_gse_put_u64(gsb, KVMPPC_GSID_HDEC_EXPIRY_TB, time_limit);
+	if (rc < 0)
+		return rc;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_flush_vcpu);
+
+/**
+ * kvmhv_nestedv2_set_ptbl_entry() - send partition and process table state to
+ * L0 host
+ * @lpid: guest id
+ * @dw0: partition table double word
+ * @dw1: process table double word
+ */
+int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1)
+{
+	struct kvmppc_gs_part_table patbl;
+	struct kvmppc_gs_proc_table prtbl;
+	struct kvmppc_gs_buff *gsb;
+	size_t size;
+	int rc;
+
+	size = kvmppc_gse_total_size(
+		       kvmppc_gsid_size(KVMPPC_GSID_PARTITION_TABLE)) +
+	       kvmppc_gse_total_size(
+		       kvmppc_gsid_size(KVMPPC_GSID_PROCESS_TABLE)) +
+	       sizeof(struct kvmppc_gs_header);
+	gsb = kvmppc_gsb_new(size, lpid, 0, GFP_KERNEL);
+	if (!gsb)
+		return -ENOMEM;
+
+	patbl.address = dw0 & RPDB_MASK;
+	patbl.ea_bits = ((((dw0 & RTS1_MASK) >> (RTS1_SHIFT - 3)) |
+			  ((dw0 & RTS2_MASK) >> RTS2_SHIFT)) +
+			 31);
+	patbl.gpd_size = 1ul << ((dw0 & RPDS_MASK) + 3);
+	rc = kvmppc_gse_put_part_table(gsb, KVMPPC_GSID_PARTITION_TABLE, patbl);
+	if (rc < 0)
+		goto free_gsb;
+
+	prtbl.address = dw1 & PRTB_MASK;
+	prtbl.gpd_size = 1ul << ((dw1 & PRTS_MASK) + 12);
+	rc = kvmppc_gse_put_proc_table(gsb, KVMPPC_GSID_PROCESS_TABLE, prtbl);
+	if (rc < 0)
+		goto free_gsb;
+
+	rc = kvmppc_gsb_send(gsb, KVMPPC_GS_FLAGS_WIDE);
+	if (rc < 0) {
+		pr_err("KVM-NESTEDv2: couldn't set the PATE\n");
+		goto free_gsb;
+	}
+
+	kvmppc_gsb_free(gsb);
+	return 0;
+
+free_gsb:
+	kvmppc_gsb_free(gsb);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_set_ptbl_entry);
+
+/**
+ * kvmhv_nestedv2_parse_output() - receive values from H_GUEST_RUN_VCPU output
+ * @vcpu: vcpu
+ *
+ * Parse the output buffer from H_GUEST_RUN_VCPU to update vcpu.
+ */
+int kvmhv_nestedv2_parse_output(struct kvm_vcpu *vcpu)
+{
+	struct kvmhv_nestedv2_io *io;
+	struct kvmppc_gs_buff *gsb;
+	struct kvmppc_gs_msg gsm;
+
+	io = &vcpu->arch.nestedv2_io;
+	gsb = io->vcpu_run_output;
+
+	vcpu->arch.fault_dar = 0;
+	vcpu->arch.fault_dsisr = 0;
+	vcpu->arch.fault_gpa = 0;
+	vcpu->arch.emul_inst = KVM_INST_FETCH_FAILED;
+
+	kvmppc_gsm_init(&gsm, &vcpu_message_ops, vcpu, 0);
+	return kvmppc_gsm_refresh_info(&gsm, gsb);
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_parse_output);
+
+static void kvmhv_nestedv2_host_free(struct kvm_vcpu *vcpu,
+				     struct kvmhv_nestedv2_io *io)
+{
+	kvmppc_gsm_free(io->vcpu_message);
+	kvmppc_gsm_free(io->vcore_message);
+	kvmppc_gsb_free(io->vcpu_run_input);
+	kvmppc_gsb_free(io->vcpu_run_output);
+}
+
+int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs)
+{
+	int rc;
+
+	for (int i = 0; i < 32; i++) {
+		rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_GPR(i));
+		if (rc < 0)
+			return rc;
+	}
+
+	rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_CR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_XER);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_CTR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_LR);
+	if (rc < 0)
+		return rc;
+	rc = kvmhv_nestedv2_cached_reload(vcpu, KVMPPC_GSID_NIA);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_nestedv2_reload_ptregs);
+
+int __kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu,
+				       struct pt_regs *regs)
+{
+	for (int i = 0; i < 32; i++)
+		kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_GPR(i));
+
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_CR);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_XER);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_CTR);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_LR);
+	kvmhv_nestedv2_mark_dirty(vcpu, KVMPPC_GSID_NIA);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmhv_nestedv2_mark_dirty_ptregs);
+
+/**
+ * kvmhv_nestedv2_vcpu_create() - create nested vcpu for the NESTEDv2 API
+ * @vcpu: vcpu
+ * @io: NESTEDv2 nested io state
+ *
+ * Parse the output buffer from H_GUEST_RUN_VCPU to update vcpu.
+ */
+int kvmhv_nestedv2_vcpu_create(struct kvm_vcpu *vcpu,
+			       struct kvmhv_nestedv2_io *io)
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
+	rc = kvmhv_nestedv2_host_create(vcpu, io);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_vcpu_create);
+
+/**
+ * kvmhv_nestedv2_vcpu_free() - free the NESTEDv2 state
+ * @vcpu: vcpu
+ * @io: NESTEDv2 nested io state
+ */
+void kvmhv_nestedv2_vcpu_free(struct kvm_vcpu *vcpu,
+			      struct kvmhv_nestedv2_io *io)
+{
+	kvmhv_nestedv2_host_free(vcpu, io);
+}
+EXPORT_SYMBOL_GPL(kvmhv_nestedv2_vcpu_free);
diff --git a/arch/powerpc/kvm/emulate_loadstore.c b/arch/powerpc/kvm/emulate_loadstore.c
index e6e66c3792f8..077fd88a0b68 100644
--- a/arch/powerpc/kvm/emulate_loadstore.c
+++ b/arch/powerpc/kvm/emulate_loadstore.c
@@ -92,7 +92,8 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 	vcpu->arch.mmio_host_swabbed = 0;
 
 	emulated = EMULATE_FAIL;
-	vcpu->arch.regs.msr = vcpu->arch.shared->msr;
+	vcpu->arch.regs.msr = kvmppc_get_msr(vcpu);
+	kvmhv_nestedv2_reload_ptregs(vcpu, &vcpu->arch.regs);
 	if (analyse_instr(&op, &vcpu->arch.regs, inst) == 0) {
 		int type = op.type & INSTR_TYPE_MASK;
 		int size = GETSIZE(op.type);
@@ -357,6 +358,7 @@ int kvmppc_emulate_loadstore(struct kvm_vcpu *vcpu)
 	}
 
 	trace_kvm_ppc_instr(ppc_inst_val(inst), kvmppc_get_pc(vcpu), emulated);
+	kvmhv_nestedv2_mark_dirty_ptregs(vcpu, &vcpu->arch.regs);
 
 	/* Advance past emulated instruction. */
 	if (emulated != EMULATE_FAIL)
diff --git a/arch/powerpc/kvm/guest-state-buffer.c b/arch/powerpc/kvm/guest-state-buffer.c
index 0775652a1209..68018fcb44cf 100644
--- a/arch/powerpc/kvm/guest-state-buffer.c
+++ b/arch/powerpc/kvm/guest-state-buffer.c
@@ -569,3 +569,53 @@ int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
 	return gsm->ops->refresh_info(gsm, gsb);
 }
 EXPORT_SYMBOL_GPL(kvmppc_gsm_refresh_info);
+
+/**
+ * kvmppc_gsb_send - send all elements in the buffer to the hypervisor.
+ * @gsb: guest state buffer
+ * @flags: guest wide or thread wide
+ *
+ * Performs the H_GUEST_SET_STATE hcall for the guest state buffer.
+ */
+int kvmppc_gsb_send(struct kvmppc_gs_buff *gsb, unsigned long flags)
+{
+	unsigned long hflags = 0;
+	unsigned long i;
+	int rc;
+
+	if (kvmppc_gsb_nelems(gsb) == 0)
+		return 0;
+
+	if (flags & KVMPPC_GS_FLAGS_WIDE)
+		hflags |= H_GUEST_FLAGS_WIDE;
+
+	rc = plpar_guest_set_state(hflags, gsb->guest_id, gsb->vcpu_id,
+				   __pa(gsb->hdr), gsb->capacity, &i);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsb_send);
+
+/**
+ * kvmppc_gsb_recv - request all elements in the buffer have their value
+ * updated.
+ * @gsb: guest state buffer
+ * @flags: guest wide or thread wide
+ *
+ * Performs the H_GUEST_GET_STATE hcall for the guest state buffer.
+ * After returning from the hcall the guest state elements that were
+ * present in the buffer will have updated values from the hypervisor.
+ */
+int kvmppc_gsb_recv(struct kvmppc_gs_buff *gsb, unsigned long flags)
+{
+	unsigned long hflags = 0;
+	unsigned long i;
+	int rc;
+
+	if (flags & KVMPPC_GS_FLAGS_WIDE)
+		hflags |= H_GUEST_FLAGS_WIDE;
+
+	rc = plpar_guest_get_state(hflags, gsb->guest_id, gsb->vcpu_id,
+				   __pa(gsb->hdr), gsb->capacity, &i);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsb_recv);
-- 
2.39.3


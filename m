Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41835BB57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 09:52:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJgv21gmbz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 17:52:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pok+pm8w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pok+pm8w; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJgsd5J8Zz304Y
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 17:51:17 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id a12so8660903pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=24m5ArAoqHu7tAqjhg5xbekaG4lF0i88nlWBfZOaV64=;
 b=pok+pm8wls5Eelr40M7oQFAcMdgQh/X0K06Watf27Zh/pKEPZqWEMPi+BwvGHBZD/p
 mMUDaSM7luYu0kp09diklZg5tm5svaNBZjmVUTBbcfMR9J7TfUVJZeKEtXp4SqZNF2in
 7XCeZwE8xMoeSFBcO3t5kwzvJjCYcfD9aJ0eZN/k0pFppDoA2Pe0H2USN6corqZkuDGT
 EXjpQq419NJp/wNWpUMbKtQ689cP6flzyZkvxy8Sk7G6zQ4AilsaYbAj9xTwDLTOZ2YI
 rkIIefCwv7iYR1/wJXIsQj0/mDRZyIH0lOalVPpMlqwClfwnZF4cA4CCDtF+TkAQXtOA
 WyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24m5ArAoqHu7tAqjhg5xbekaG4lF0i88nlWBfZOaV64=;
 b=Nw2FZVDSy2MCduizrJfE1YeHeHh6MK6xhyaBPnuZfDprDIowftDHg9474m0paikUW4
 oG9tsIyVaPCRqwzA0L67RJ6KcLL7ospze+yqsg9IgbL4A//WLJuv/jNonaX5juSyve+F
 eTojr9T9hN8nb6aeimS2bgn/QpU60atiFyYJEp0VDJJ+08s/Rpzl5VlB9A+n6lyXkcIN
 d9V+AfGh9fdwIAP/xtCO85U5w/Ooj6DlCkUeiYOue+xr8iSfyk4zDUKrMR1g0DwduV54
 898er5kjpEN8l81mlOruc6HA5X5Yv4bUTfPutr13NCIPlkyucRlopUQB8jSNlQGMZdgE
 DsAw==
X-Gm-Message-State: AOAM533iOplMLycnz5kjAe2ILpvwDGyWiKY8/KcJyeO0ZLxk55RAMuob
 Lb1/UKt+YzUKEFbEgzI9EXNa2PIN9iU=
X-Google-Smtp-Source: ABdhPJyunSD0JEyh4ESY82ts1XXZh+t+xKrO7t0F6L9BhALZt4uqZCAi/elH0j7GDQ8PLz7pu/epXg==
X-Received: by 2002:a63:c48:: with SMTP id 8mr25259677pgm.74.1618213875338;
 Mon, 12 Apr 2021 00:51:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id i18sm606180pfq.168.2021.04.12.00.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 00:51:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 2/7] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
Date: Mon, 12 Apr 2021 17:50:58 +1000
Message-Id: <20210412075103.1533302-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412075103.1533302-1-npiggin@gmail.com>
References: <20210412075103.1533302-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the GUEST_MODE_SKIP logic into KVM code. This is quite a KVM
internal detail that has no real need to be in common handlers.

Add a comment explaining the what and why of KVM "skip" interrupts.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 arch/powerpc/kvm/book3s_64_entry.S   | 59 ++++++++++++++++++++++++++-
 2 files changed, 58 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bdec40bd92a8..5842cc3ebbbb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -133,7 +133,6 @@ name:
 #define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
 #define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\() /* Common runs in realmode */
 #define IMASK		.L_IMASK_\name\()	/* IRQ soft-mask bit */
-#define IKVM_SKIP	.L_IKVM_SKIP_\name\()	/* Generate KVM skip handler */
 #define IKVM_REAL	.L_IKVM_REAL_\name\()	/* Real entry tests KVM */
 #define __IKVM_REAL(name)	.L_IKVM_REAL_ ## name
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()	/* Virt entry tests KVM */
@@ -190,9 +189,6 @@ do_define_int n
 	.ifndef IMASK
 		IMASK=0
 	.endif
-	.ifndef IKVM_SKIP
-		IKVM_SKIP=0
-	.endif
 	.ifndef IKVM_REAL
 		IKVM_REAL=0
 	.endif
@@ -250,15 +246,10 @@ do_define_int n
 	.balign IFETCH_ALIGN_BYTES
 \name\()_kvm:
 
-	.if IKVM_SKIP
-	cmpwi	r10,KVM_GUEST_MODE_SKIP
-	beq	89f
-	.else
 BEGIN_FTR_SECTION
 	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
-	.endif
 
 	ld	r10,IAREA+EX_CTR(r13)
 	mtctr	r10
@@ -285,27 +276,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	ori	r12,r12,(IVEC)
 	.endif
 	b	kvmppc_interrupt
-
-	.if IKVM_SKIP
-89:	mtocrf	0x80,r9
-	ld	r10,IAREA+EX_CTR(r13)
-	mtctr	r10
-	ld	r9,IAREA+EX_R9(r13)
-	ld	r10,IAREA+EX_R10(r13)
-	ld	r11,IAREA+EX_R11(r13)
-	ld	r12,IAREA+EX_R12(r13)
-	.if IHSRR_IF_HVMODE
-	BEGIN_FTR_SECTION
-	b	kvmppc_skip_Hinterrupt
-	FTR_SECTION_ELSE
-	b	kvmppc_skip_interrupt
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif IHSRR
-	b	kvmppc_skip_Hinterrupt
-	.else
-	b	kvmppc_skip_interrupt
-	.endif
-	.endif
 .endm
 
 #else
@@ -1083,7 +1053,6 @@ INT_DEFINE_BEGIN(machine_check)
 	ISET_RI=0
 	IDAR=1
 	IDSISR=1
-	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(machine_check)
 
@@ -1356,7 +1325,6 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
-	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(data_access)
 
@@ -1410,7 +1378,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
 	IDAR=1
-	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(data_access_slb)
 
@@ -2080,7 +2047,6 @@ INT_DEFINE_BEGIN(h_data_storage)
 	IHSRR=1
 	IDAR=1
 	IDSISR=1
-	IKVM_SKIP=1
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(h_data_storage)
@@ -3030,32 +2996,6 @@ EXPORT_SYMBOL(do_uaccess_flush)
 MASKED_INTERRUPT
 MASKED_INTERRUPT hsrr=1
 
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-kvmppc_skip_interrupt:
-	/*
-	 * Here all GPRs are unchanged from when the interrupt happened
-	 * except for r13, which is saved in SPRG_SCRATCH0.
-	 */
-	mfspr	r13, SPRN_SRR0
-	addi	r13, r13, 4
-	mtspr	SPRN_SRR0, r13
-	GET_SCRATCH0(r13)
-	RFI_TO_KERNEL
-	b	.
-
-kvmppc_skip_Hinterrupt:
-	/*
-	 * Here all GPRs are unchanged from when the interrupt happened
-	 * except for r13, which is saved in SPRG_SCRATCH0.
-	 */
-	mfspr	r13, SPRN_HSRR0
-	addi	r13, r13, 4
-	mtspr	SPRN_HSRR0, r13
-	GET_SCRATCH0(r13)
-	HRFI_TO_KERNEL
-	b	.
-#endif
-
 	/*
 	 * Relocation-on interrupts: A subset of the interrupts can be delivered
 	 * with IR=1/DR=1, if AIL==2 and MSR.HV won't be changed by delivering
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 7a039ea78f15..bf927e7a06af 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
+#include <asm/exception-64s.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_book3s_asm.h>
 #include <asm/ppc_asm.h>
@@ -20,9 +21,12 @@ kvmppc_interrupt:
 	 * guest R12 saved in shadow VCPU SCRATCH0
 	 * guest R13 saved in SPRN_SCRATCH0
 	 */
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	std	r9,HSTATE_SCRATCH2(r13)
 	lbz	r9,HSTATE_IN_GUEST(r13)
+	cmpwi	r9,KVM_GUEST_MODE_SKIP
+	beq-	.Lmaybe_skip
+.Lno_skip:
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	cmpwi	r9,KVM_GUEST_MODE_HOST_HV
 	beq	kvmppc_bad_host_intr
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -32,5 +36,58 @@ kvmppc_interrupt:
 #endif
 	b	kvmppc_interrupt_hv
 #else
+	ld	r9,HSTATE_SCRATCH2(r13)
 	b	kvmppc_interrupt_pr
 #endif
+
+/*
+ * "Skip" interrupts are part of a trick KVM uses a with hash guests to load
+ * the faulting instruction in guest memory from the the hypervisor without
+ * walking page tables.
+ *
+ * When the guest takes a fault that requires the hypervisor to load the
+ * instruction (e.g., MMIO emulation), KVM is running in real-mode with HV=1
+ * and the guest MMU context loaded. It sets KVM_GUEST_MODE_SKIP, and sets
+ * MSR[DR]=1 while leaving MSR[IR]=0, so it continues to fetch HV instructions
+ * but loads and stores will access the guest context. This is used to load
+ * the faulting instruction using the faulting guest effective address.
+ *
+ * However the guest context may not be able to translate, or it may cause a
+ * machine check or other issue, which results in a fault in the host
+ * (even with KVM-HV).
+ *
+ * These faults come here because KVM_GUEST_MODE_SKIP was set, so if they
+ * are (or are likely) caused by that load, the instruction is skipped by
+ * just returning with the PC advanced +4, where it is noticed the load did
+ * not execute and it goes to the slow path which walks the page tables to
+ * read guest memory.
+ */
+.Lmaybe_skip:
+	cmpwi	r12,BOOK3S_INTERRUPT_MACHINE_CHECK
+	beq	1f
+	cmpwi	r12,BOOK3S_INTERRUPT_DATA_STORAGE
+	beq	1f
+	cmpwi	r12,BOOK3S_INTERRUPT_DATA_SEGMENT
+	beq	1f
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	/* HSRR interrupts get 2 added to interrupt number */
+	cmpwi	r12,BOOK3S_INTERRUPT_H_DATA_STORAGE | 0x2
+	beq	2f
+#endif
+	b	.Lno_skip
+1:	mfspr	r9,SPRN_SRR0
+	addi	r9,r9,4
+	mtspr	SPRN_SRR0,r9
+	ld	r12,HSTATE_SCRATCH0(r13)
+	ld	r9,HSTATE_SCRATCH2(r13)
+	GET_SCRATCH0(r13)
+	RFI_TO_KERNEL
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+2:	mfspr	r9,SPRN_HSRR0
+	addi	r9,r9,4
+	mtspr	SPRN_HSRR0,r9
+	ld	r12,HSTATE_SCRATCH0(r13)
+	ld	r9,HSTATE_SCRATCH2(r13)
+	GET_SCRATCH0(r13)
+	HRFI_TO_KERNEL
+#endif
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9533250E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:50:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ176zCRz3cp1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:50:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TNTdcoIa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TNTdcoIa; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYxt4sQKz3cjV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:47:30 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id z7so3211499plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnJgPi6pS049zycWvC+smiQcgR5eT/YM0fJSrNlfUGQ=;
 b=TNTdcoIaotV6bhnyDlk4HBo9c+hJ9K5LNMDyL99YvuYMqWv1IBFpm10/KSoyfqqqgK
 Gzhjvm14BIv3DZCXoV3nUkcFdBOkILnYtOmBlx/d1uVmMi/ypk+CkuDOOn8+xDfkbHrL
 F9aDqViKJ+h/T/AREAf/iT/2X5HY7KxUBDFNNIflamucp1vBPNKwnCV4RhRWz9z+plxx
 CNPYOFcLoge6JKfFw+XVRHQdl7CTDDtIskpni8HDxhzZtUAGg+bmBLgeux/8UUPrWKAm
 TUfMh/nHye1mc4GRPhobdkVMvEfNAc3yUhkV3nu4SMjxmWmJoz7LGzl8mVJU3TOek3Jg
 ymbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnJgPi6pS049zycWvC+smiQcgR5eT/YM0fJSrNlfUGQ=;
 b=HL38A4r26Fu441PjQqk/l/lw7ut1ncB17iF9tn0JzTa5i/Qo6TLZkSFSfjlQ+N5EIn
 PpEtt2XB+Az0f+W4lrN2UG9UcpVn2Ijw8YeDDsg+p3oUZbRe8vzS5AIUZJqFjkigJO+V
 DnwKQlL2vcRaq8fINuhTZKwdaSKGJw3tAWwGtYbjWtAcn15vnU3yhAEb6rFFIWUHQCwN
 EF8hNjTTK6pc3pQc3LcJIZ5ekFmZ6I0xST2lTvGdlprPQg7hesIqgfZNsLKIW4Avdme4
 ZAf7D1og63gtEwyKG2jj7M7EPew/i2PdZ7IM6EObRozZm/z1eoYS9Y7k7WkzwoAdUmHK
 oCzg==
X-Gm-Message-State: AOAM530EAIzDEDN2A4P8k/8NfhM7kAbcRcx0uL/C8t3IU/mEZOtEXlaD
 sT9sSvHOhHFoErNMcOgmLuI=
X-Google-Smtp-Source: ABdhPJwsRomrwb/S97K4G/nsNhT7HFem+VzokZcRLWEvpXd0w9g2bPiiM7p7yIdhQyIJrqXhgY0Shw==
X-Received: by 2002:a17:902:b68f:b029:e3:b18:7a48 with SMTP id
 c15-20020a170902b68fb02900e30b187a48mr3168862pls.65.1614260848494; 
 Thu, 25 Feb 2021 05:47:28 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:47:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 07/37] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into
 KVM
Date: Thu, 25 Feb 2021 23:46:22 +1000
Message-Id: <20210225134652.2127648-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the GUEST_MODE_SKIP logic into KVM code. This is quite a KVM
internal detail that has no real need to be in common handlers.

Also add a comment explaining why this thing exists.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 arch/powerpc/kvm/book3s_64_entry.S   | 51 ++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ba13d749d203..d956dd9ed61f 100644
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
@@ -3024,32 +2990,6 @@ EXPORT_SYMBOL(do_uaccess_flush)
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
index e9a6a8fbb164..c1276f616af4 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -1,5 +1,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
+#include <asm/exception-64s.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_book3s_asm.h>
 #include <asm/ppc_asm.h>
@@ -19,9 +20,12 @@ kvmppc_interrupt:
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
@@ -33,3 +37,48 @@ kvmppc_interrupt:
 #else
 	b	kvmppc_interrupt_pr
 #endif
+
+/*
+ * KVM uses a trick where it is running in MSR[HV]=1 mode in real-mode with the
+ * guest MMU context loaded, and it sets KVM_GUEST_MODE_SKIP and enables
+ * MSR[DR]=1 while leaving MSR[IR]=0, so it continues to fetch HV instructions
+ * but loads and stores will access the guest context. This is used to load
+ * the faulting instruction without walking page tables.
+ *
+ * However the guest context may not be able to translate, or it may cause a
+ * machine check or other issue, which will result in a fault in the host
+ * (even with KVM-HV).
+ *
+ * These faults are caught here and if the fault was (or was likely) due to
+ * that load, then we just return with the PC advanced +4 and skip the load,
+ * which then goes via the slow path.
+ */
+.Lmaybe_skip:
+	cmpwi	r12,BOOK3S_INTERRUPT_MACHINE_CHECK
+	beq	1f
+	cmpwi	r12,BOOK3S_INTERRUPT_DATA_STORAGE
+	beq	1f
+	cmpwi	r12,BOOK3S_INTERRUPT_DATA_SEGMENT
+	beq	1f
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	/* HSRR interrupts have 2 added to trap vector */
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


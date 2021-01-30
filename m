Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D03095F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:38:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScJ85FkdzDsWt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:38:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JYsUq3zN; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMv4ZYYzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:07 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id w14so8034140pfi.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPEu9AlenalFSmEBEMzPI6txfk7GO6d/jzm8Pajt3iM=;
 b=JYsUq3zNvhaJe8EyDchKo6zR0ypBBh7UW4D6eOCIxZMzSbUjngOhJbiaE501Q81L+4
 UlZLKE4d6YGsgFp7ciyE/eCR5PXBVA2TxVDD5cVeA0OeXVFMerqcb9u3bFoFckLvctAx
 aMPcQ7Kvj2VEH34/h4XKkGEwWCObf4jSTn7/my/U46owamDn0W7ezTfIWI0cUCDARrkv
 9vNWi8pWEPKiT+KQ2IMDrUZ9HdkXBfx1GXuBzXY3wjik2r4jAPr0tp2tHUwaiP96ynG/
 /5EokG+LmStFIGHuhtfY11d0OJWGJTOEkFEdnQjNYHqP0fve3ls+RpjexWtKaeFz5PGQ
 B1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPEu9AlenalFSmEBEMzPI6txfk7GO6d/jzm8Pajt3iM=;
 b=YAp4lSarHWXsqem4TP6+nxQ+kDeK3RZt4AnGkmxRBCXUcutv290FCPwUM+jIrL/29v
 qI1d/iR40JTbHEXUI6855ci9oOT3LVNe2TziAkD28O8WWF5YfvjnKNqzUiiZ+L9Hk7ne
 eqNJUy4s/8AhPL63clsUNSoEh4vZj8COmTvrUvg4ERYU5JDo+sNBfB+2KWGGsDRQh+dQ
 2TFNG6JnVLIA9Zbb+g+MT+Ood2aQmHCUv17j+l98BBRccGewRogL5db6IxtIa2DH85vG
 MbAmwofXAzO7Pnn261VzX8hl4DRcSVksD6AsDfPT6S2n53WlYkw9+tfssSWz5gQebNTS
 C8xA==
X-Gm-Message-State: AOAM531hSIn4NXwe57D+Ve5JQPXpd3gN6/TA//ZPGTcpBUO3wAbml7WJ
 umLWNgHDGClAL2GUWhgPfcbsi6o1Cnw=
X-Google-Smtp-Source: ABdhPJx2TyFqyowJnJVtXPnMKJljwukbzwGS7X8L0qzBYNSM9ufKbZpQUZL8bydtcSMWLJfi8SfqDQ==
X-Received: by 2002:a63:c10f:: with SMTP id w15mr8622554pgf.99.1612012260410; 
 Sat, 30 Jan 2021 05:11:00 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 36/42] powerpc/64s: reconcile interrupts in C
Date: Sat, 30 Jan 2021 23:08:46 +1000
Message-Id: <20210130130852.2952424-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need for this to be in asm, use the new intrrupt entry wrapper.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 15 +++++++++++----
 arch/powerpc/kernel/exceptions-64s.S | 26 --------------------------
 2 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 1c966e47b36f..e96d215f518a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -14,11 +14,14 @@ struct interrupt_state {
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC_BOOK3E_64
-	state->ctx_state = exception_enter();
-#endif
-
+	/*
+	 * Book3E reconciles irq soft mask in asm
+	 */
 #ifdef CONFIG_PPC_BOOK3S_64
+	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
+		trace_hardirqs_off();
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
@@ -31,6 +34,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
 	}
 #endif
+
+#ifdef CONFIG_PPC_BOOK3E_64
+	state->ctx_state = exception_enter();
+#endif
 }
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index fe33197ea8fb..39630b3f78b0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -139,7 +139,6 @@ name:
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()	/* Virt entry tests KVM */
 #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
 #define __ISTACK(name)	.L_ISTACK_ ## name
-#define IRECONCILE	.L_IRECONCILE_\name\()	/* Do RECONCILE_IRQ_STATE */
 #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
 
 #define INT_DEFINE_BEGIN(n)						\
@@ -203,9 +202,6 @@ do_define_int n
 	.ifndef ISTACK
 		ISTACK=1
 	.endif
-	.ifndef IRECONCILE
-		IRECONCILE=1
-	.endif
 	.ifndef IKUAP
 		IKUAP=1
 	.endif
@@ -653,10 +649,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	.if ISTACK
 	ACCOUNT_STOLEN_TIME
 	.endif
-
-	.if IRECONCILE
-	RECONCILE_IRQ_STATE(r10, r11)
-	.endif
 .endm
 
 /*
@@ -935,7 +927,6 @@ INT_DEFINE_BEGIN(system_reset)
 	 */
 	ISET_RI=0
 	ISTACK=0
-	IRECONCILE=0
 	IKVM_REAL=1
 INT_DEFINE_END(system_reset)
 
@@ -1123,7 +1114,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	ISTACK=0
 	IDAR=1
 	IDSISR=1
-	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
 INT_DEFINE_END(machine_check_early)
 
@@ -1483,7 +1473,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IDAR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
@@ -1510,7 +1499,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1568,7 +1556,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -1597,7 +1584,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1757,7 +1743,6 @@ EXC_COMMON_BEGIN(program_check_common)
  */
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -1772,7 +1757,6 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 0:	trap
@@ -1791,7 +1775,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
 	b	interrupt_return
@@ -1856,7 +1839,6 @@ INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=1
 	ISTACK=0
-	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -2230,7 +2212,6 @@ INT_DEFINE_BEGIN(hmi_exception_early)
 	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
-	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception_early)
@@ -2404,7 +2385,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
  */
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2434,7 +2414,6 @@ BEGIN_FTR_SECTION
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
 	b	interrupt_return
@@ -2442,7 +2421,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	interrupt_return
@@ -2458,7 +2436,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  */
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2487,7 +2464,6 @@ BEGIN_FTR_SECTION
 	b	load_up_vsx
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
 	b	interrupt_return
@@ -2495,7 +2471,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
 	b	interrupt_return
@@ -2830,7 +2805,6 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
-	IRECONCILE=0	/* Soft-NMI may fire under local_irq_disable */
 INT_DEFINE_END(soft_nmi)
 
 /*
-- 
2.23.0


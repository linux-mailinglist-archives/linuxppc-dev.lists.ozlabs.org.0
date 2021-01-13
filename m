Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFBA2F45AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:05:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0PP6pZ9zDr9T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:05:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XTaYZw2D; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgd63xwzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:33:01 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id q20so700669pfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ugijuxO7WVr7xKJqU8HIQtFHqA0X715w/zjB2Ad3duc=;
 b=XTaYZw2DHe9NAoaXmtqCHCp+lKmR0MgWG/kzt2Q/YHYUl48YA2X4iQxMDOuvCskX+b
 SN81/uPAZHAv4RzEIQ8ojsFGDUYQMjbv1KwWwjvBGSh4PNhv9eaJAJ+D02hoKwwCXdV2
 H2+jW8LgriCsrf9HaafsXTIqikuj3rToSsOaZtH03tNTkvOB4UHYhF5FQEeMqfUlhbST
 lwSBQ9sRH6vUD+vKL5Ee0ef/bzJh86tPZzVpV6n+r7qS3w4IC45akLPFNVIqq1qWazlP
 I1jwkFlGw71H8NpLOpLxSMnF/xwHUTx8kH2NvYBQ/xag2DzxZzvliZyda86ulKrdUwTg
 obYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ugijuxO7WVr7xKJqU8HIQtFHqA0X715w/zjB2Ad3duc=;
 b=lVK/SD50iY9Y3lehuvUQEk40fx0NlybixIH31TtlAYSwFHj+YJ96xKeowUejmVXxEs
 CwAcbZYxLv/7XxZt6XuzrH+uBJVUBwzQzdkiHmYwLBA5lPWwI/vKHZ251hokP4aIMsw5
 LwZywF3LkbGX6EhBtpRemq5b7m9mO39+EVTqOCCeqofaywu14o+wYjfG6qHMa246oNjn
 14JXrxlz6zHCtVKj6adAr/DdDtc6jmZ96XK3og/TDjPs5MVC1vXQROkuk8FDGcritpuo
 L99dwXiKJGFMa2E6xTOo0U9FXLTUMN2fUPHCyKwLLwAGDeuvpKYMWH6KG9N4PJHXGnwB
 7xcg==
X-Gm-Message-State: AOAM531WRUgkGBwkBxMfxOkVwfbDYQr6egT0ZPtkOTrvurE++J5h/vbJ
 MQZ8QLYcW+R2bMiSOa9leMoaiy9SCg4=
X-Google-Smtp-Source: ABdhPJwBGpmmDvcxiIh5lhK19NpQ0pm2IlOoWineOoOWnhMRy/7FEpZQZht0BA409X7czh2eCqHEpQ==
X-Received: by 2002:a63:cb0e:: with SMTP id p14mr890554pgg.408.1610523179457; 
 Tue, 12 Jan 2021 23:32:59 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 15/21] powerpc/64s: reconcile interrupts in C
Date: Wed, 13 Jan 2021 17:32:09 +1000
Message-Id: <20210113073215.516986-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
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
index 34d7cca2cb2e..6eba7c489753 100644
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
index 8b0db807974c..df4ee073386b 100644
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
 
@@ -1476,7 +1466,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IDAR=1
 	IKVM_SKIP=1
 	IKVM_REAL=1
@@ -1503,7 +1492,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1565,7 +1553,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -1594,7 +1581,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1754,7 +1740,6 @@ EXC_COMMON_BEGIN(program_check_common)
  */
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -1769,7 +1754,6 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 0:	trap
@@ -1788,7 +1772,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
 	b	interrupt_return
@@ -1853,7 +1836,6 @@ INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=1
 	ISTACK=0
-	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -2227,7 +2209,6 @@ INT_DEFINE_BEGIN(hmi_exception_early)
 	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
-	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception_early)
@@ -2401,7 +2382,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
  */
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2431,7 +2411,6 @@ BEGIN_FTR_SECTION
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
 	b	interrupt_return
@@ -2439,7 +2418,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	interrupt_return
@@ -2455,7 +2433,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  */
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2484,7 +2461,6 @@ BEGIN_FTR_SECTION
 	b	load_up_vsx
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
 	b	interrupt_return
@@ -2492,7 +2468,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
 	b	interrupt_return
@@ -2827,7 +2802,6 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
-	IRECONCILE=0	/* Soft-NMI may fire under local_irq_disable */
 INT_DEFINE_END(soft_nmi)
 
 /*
-- 
2.23.0


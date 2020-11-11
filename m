Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA62AEEC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:31:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLc42wqvzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:31:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WH8asn9T; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZn20fQzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:49 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id g7so1304219pfc.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRN4Ee5Eq4ZsOYgO+GONfx3dQne2v4rwHximwM/6geg=;
 b=WH8asn9TAT2bHT+g/NJ0CeVvF3e7O6rCNlfCr2hkoV0MlN1iXdUdHYvRfv3zNIDT3o
 P4EJzipa9xgf/7BPchIJbTQbVOGi3GfK5jNuR+IS2/ngHpSEEwMAO4+rXcUpD0vo80Uj
 VwNoXvOaaFsfO2W8sGpzuzY6bWas+XKFFMNicTcmDPXVQv5LGvOenS/0almzK4mFfzKM
 70lQVy4is9+vXXKlNwXQPbDcj/gI2wjhqfdEOKSzaLd2H8XUbcbedeSS0TspgyuCUivg
 Kq5h5qGRKX8/N1ROALvgrGuqF6zcSHn454qPmbAVtCwYM8xnGAPM13Yr+AuA128qXj8w
 DrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRN4Ee5Eq4ZsOYgO+GONfx3dQne2v4rwHximwM/6geg=;
 b=DNJuH0vkn+ZNcEI1mMWpHWRff4F78+yq9I9UmF+8cGj5dP5BukZb13VujOdzGEzVN/
 roh4VqQKxB9qi7iA5yBlB53cWkngFZTlIr854/M/P2hFaw7BluuSsrCiOwsdTrr5hVa7
 2EVIbKyjcWgi+HXGEs3R1ZCpIQ9g92V4FzfecQeV0jxkIK2f5KuVCL3RrxDOYJW8u/gi
 6V0ZQKF7BPza5SmTIoVgWVmbbdJzgSL+TunaW5Gq/k0d7ZrPIAlfD9z/t5wp1+3kPUay
 0unc9wHBDyRWHlCcVAHVuZxhrNwDFO+XehS8Mv22focUU18nvEF2DaYkwQoKFlV/KgW0
 fWpw==
X-Gm-Message-State: AOAM533dW+6JSY3OZUUfRuqy1KnhQwfJ3cX3ODVD8xCLmMMwz0eVzKAe
 k+IeKYNfne2ea0aFr9xv2QC7rrArqE4=
X-Google-Smtp-Source: ABdhPJzqsjMfVpVWEDvtvDd1kGrmr5GQSlSyMxAXRl3UhOB4s5AKeXcE5aPD0pMt/Lbsr/JRw4qYqQ==
X-Received: by 2002:a63:6246:: with SMTP id w67mr21987211pgb.239.1605087884327; 
 Wed, 11 Nov 2020 01:44:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/19] powerpc/64s: reconcile interrupts in C
Date: Wed, 11 Nov 2020 19:44:04 +1000
Message-Id: <20201111094410.3038123-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111094410.3038123-1-npiggin@gmail.com>
References: <20201111094410.3038123-1-npiggin@gmail.com>
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
index ad0389601d01..e54f25fc5cb5 100644
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
index f6989321136d..b36247ad1f64 100644
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
 
@@ -1125,7 +1116,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	ISTACK=0
 	IDAR=1
 	IDSISR=1
-	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
 INT_DEFINE_END(machine_check_early)
 
@@ -1473,7 +1463,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IDAR=1
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_SKIP=1
@@ -1502,7 +1491,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1564,7 +1552,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
 	IAREA=PACA_EXSLB
-	IRECONCILE=0
 	IISIDE=1
 	IDAR=1
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
@@ -1593,7 +1580,6 @@ MMU_FTR_SECTION_ELSE
 	li	r3,-EFAULT
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1753,7 +1739,6 @@ EXC_COMMON_BEGIN(program_check_common)
  */
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -1768,7 +1753,6 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 0:	trap
@@ -1787,7 +1771,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	fp_unavailable_tm
 	b	interrupt_return
@@ -1852,7 +1835,6 @@ INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=1
 	ISTACK=0
-	IRECONCILE=0
 	IKVM_REAL=1
 	IKVM_VIRT=1
 INT_DEFINE_END(hdecrementer)
@@ -2226,7 +2208,6 @@ INT_DEFINE_BEGIN(hmi_exception_early)
 	IHSRR=1
 	IREALMODE_COMMON=1
 	ISTACK=0
-	IRECONCILE=0
 	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
 	IKVM_REAL=1
 INT_DEFINE_END(hmi_exception_early)
@@ -2400,7 +2381,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
  */
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2430,7 +2410,6 @@ BEGIN_FTR_SECTION
 	b	fast_interrupt_return
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_tm
 	b	interrupt_return
@@ -2438,7 +2417,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	interrupt_return
@@ -2454,7 +2432,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
  */
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
-	IRECONCILE=0
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
@@ -2483,7 +2460,6 @@ BEGIN_FTR_SECTION
 	b	load_up_vsx
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_tm
 	b	interrupt_return
@@ -2491,7 +2467,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
-	RECONCILE_IRQ_STATE(r10, r11)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	vsx_unavailable_exception
 	b	interrupt_return
@@ -2826,7 +2801,6 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
-	IRECONCILE=0	/* Soft-NMI may fire under local_irq_disable */
 INT_DEFINE_END(soft_nmi)
 
 /*
-- 
2.23.0


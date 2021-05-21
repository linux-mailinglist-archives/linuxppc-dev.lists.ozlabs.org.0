Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B0538C5F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlFy3305z3c1T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c9PFLkbh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c9PFLkbh; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlC26rFYz3bnq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:46 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so7197377pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CoKGZymK7MZg77qXAP2QkfS/GU1PZvEp4+1VnMDqB34=;
 b=c9PFLkbhH1XZmVQxmqPCYZX7My3LED1DsC//mUJKgwj0TsjTJzDyHAADuCDrH46yRQ
 DOFU1BPYvewldlnr4Nvgi3eSKa72f3cWps9IQdWGm5BDiT19402Qf7V3QntEshkii5uC
 jdhd9jAUg0ST5W1TU9Ceb01fktYJ1S1DVxELbq/aBTQbH2MrCzQPYt/+xriVaJ4sZ/6E
 ihcD5ROqk/ax4AANB4uGMkGio7pm5S7kuaAD7KD/R3ATGCGbA/YXg6Aq60ey9rh7L9SF
 daaBu3RfrPhQjjsqQ7MmJBIQi1Jev9YTzf0iJKifljvJpnPljXQLunLhMN7nKTGxFxEK
 VDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CoKGZymK7MZg77qXAP2QkfS/GU1PZvEp4+1VnMDqB34=;
 b=iu5xX7q4JdQEEZrJ2DEHEb861FbhcZgSZhpBUj0CSN59Q1ELPYJrPTHPtuabgnT8Eq
 GllCTfuC0N0Hj8HCG3LkMXRLkumadyK9gu9nt03XYl4cgbnhxIg5ViApGqXVyFF+kuF9
 J1s1OgciQAWsMXz76doB5H1R2efb06ND0HL+V5PBCmeBjqzEjkZb+VG93x++rT06k7Oc
 wbg0PU73+Jwa93J2RWEonECZIfgYPhm/xiQkKd1MQWbDd0mwvgYIHUlkVUycG/cv5Tbw
 wAMJJziqVSiQc1kAEto4YWwktO6jmTipfR8hiac/ZKi60FVO1Ush+ZyO5c9PutU9rjFy
 HpoQ==
X-Gm-Message-State: AOAM532ZM6crEDZVQi/82rAqW5QAhWZ8CO3GWX0GkB5ebJIMYm4WRj9T
 g+3vm2fhMctlQdAhUajusXZMprXhIWo=
X-Google-Smtp-Source: ABdhPJyPO17EF0EdvOrYPRWq9EDaOrx7Nh0vdtyMGmKAHND+m2OE2nFNesmTxBpG54Sh0Wt5thxbFw==
X-Received: by 2002:a17:90a:d193:: with SMTP id
 fu19mr10421991pjb.103.1621597484047; 
 Fri, 21 May 2021 04:44:44 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/11] powerpc/64: move interrupt return asm to
 interrupt_64.S
Date: Fri, 21 May 2021 21:44:16 +1000
Message-Id: <20210521114422.3179350-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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

The next patch would like to move interrupt return assembly code to a low
location before general text, so move it into its own file and include via
head_64.S

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/head-64.h |   2 +-
 arch/powerpc/kernel/entry_64.S     | 623 ----------------------------
 arch/powerpc/kernel/head_64.S      |   5 +-
 arch/powerpc/kernel/interrupt_64.S | 636 +++++++++++++++++++++++++++++
 4 files changed, 641 insertions(+), 625 deletions(-)
 create mode 100644 arch/powerpc/kernel/interrupt_64.S

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 4cb9efa2eb21..242204e12993 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -16,7 +16,7 @@
 	.section ".head.data.\name\()","a",@progbits
 .endm
 .macro use_ftsec name
-	.section ".head.text.\name\()"
+	.section ".head.text.\name\()","ax",@progbits
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9a1d5e5599d3..15720f8661a1 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -32,7 +32,6 @@
 #include <asm/irqflags.h>
 #include <asm/hw_irq.h>
 #include <asm/context_tracking.h>
-#include <asm/tm.h>
 #include <asm/ppc-opcode.h>
 #include <asm/barrier.h>
 #include <asm/export.h>
@@ -48,410 +47,7 @@
 /*
  * System calls.
  */
-	.section	".toc","aw"
-SYS_CALL_TABLE:
-	.tc sys_call_table[TC],sys_call_table
-
-#ifdef CONFIG_COMPAT
-COMPAT_SYS_CALL_TABLE:
-	.tc compat_sys_call_table[TC],compat_sys_call_table
-#endif
-
-/* This value is used to mark exception frames on the stack. */
-exception_marker:
-	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
-
 	.section	".text"
-	.align 7
-
-.macro DEBUG_SRR_VALID srr
-#ifdef CONFIG_PPC_RFI_SRR_DEBUG
-	.ifc \srr,srr
-	mfspr	r11,SPRN_SRR0
-	ld	r12,_NIP(r1)
-100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
-	mfspr	r11,SPRN_SRR1
-	ld	r12,_MSR(r1)
-100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
-	.else
-	mfspr	r11,SPRN_HSRR0
-	ld	r12,_NIP(r1)
-100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
-	mfspr	r11,SPRN_HSRR1
-	ld	r12,_MSR(r1)
-100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
-	.endif
-#endif
-.endm
-
-#ifdef CONFIG_PPC_BOOK3S
-.macro system_call_vectored name trapnr
-	.globl system_call_vectored_\name
-system_call_vectored_\name:
-_ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
-	SCV_INTERRUPT_TO_KERNEL
-	mr	r10,r1
-	ld	r1,PACAKSAVE(r13)
-	std	r10,0(r1)
-	std	r11,_NIP(r1)
-	std	r12,_MSR(r1)
-	std	r0,GPR0(r1)
-	std	r10,GPR1(r1)
-	std	r2,GPR2(r1)
-	ld	r2,PACATOC(r13)
-	mfcr	r12
-	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
-	std	r3,GPR3(r1)
-	std	r4,GPR4(r1)
-	std	r5,GPR5(r1)
-	std	r6,GPR6(r1)
-	std	r7,GPR7(r1)
-	std	r8,GPR8(r1)
-	/* Zero r9-r12, this should only be required when restoring all GPRs */
-	std	r11,GPR9(r1)
-	std	r11,GPR10(r1)
-	std	r11,GPR11(r1)
-	std	r11,GPR12(r1)
-	std	r9,GPR13(r1)
-	SAVE_NVGPRS(r1)
-	std	r11,_XER(r1)
-	std	r11,_LINK(r1)
-	std	r11,_CTR(r1)
-
-	li	r11,\trapnr
-	std	r11,_TRAP(r1)
-	std	r12,_CCR(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
-
-BEGIN_FTR_SECTION
-	HMT_MEDIUM
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-	/*
-	 * scv enters with MSR[EE]=1 and is immediately considered soft-masked.
-	 * The entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED,
-	 * and interrupts may be masked and pending already.
-	 * system_call_exception() will call trace_hardirqs_off() which means
-	 * interrupts could already have been blocked before trace_hardirqs_off,
-	 * but this is the best we can do.
-	 */
-
-	/* Calling convention has r9 = orig r0, r10 = regs */
-	mr	r9,r0
-	bl	system_call_exception
-
-.Lsyscall_vectored_\name\()_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
-	li	r5,1 /* scv */
-	bl	syscall_exit_prepare
-
-	ld	r2,_CCR(r1)
-	ld	r4,_NIP(r1)
-	ld	r5,_MSR(r1)
-
-BEGIN_FTR_SECTION
-	stdcx.	r0,0,r1			/* to clear the reservation */
-END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
-
-BEGIN_FTR_SECTION
-	HMT_MEDIUM_LOW
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-	cmpdi	r3,0
-	bne	.Lsyscall_vectored_\name\()_restore_regs
-
-	/* rfscv returns with LR->NIA and CTR->MSR */
-	mtlr	r4
-	mtctr	r5
-
-	/* Could zero these as per ABI, but we may consider a stricter ABI
-	 * which preserves these if libc implementations can benefit, so
-	 * restore them for now until further measurement is done. */
-	ld	r0,GPR0(r1)
-	ld	r4,GPR4(r1)
-	ld	r5,GPR5(r1)
-	ld	r6,GPR6(r1)
-	ld	r7,GPR7(r1)
-	ld	r8,GPR8(r1)
-	/* Zero volatile regs that may contain sensitive kernel data */
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	li	r12,0
-	mtspr	SPRN_XER,r0
-
-	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * The value of AMR only matters while we're in the kernel.
-	 */
-	mtcr	r2
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
-	ld	r13,GPR13(r1)
-	ld	r1,GPR1(r1)
-	RFSCV_TO_USER
-	b	.	/* prevent speculative execution */
-
-.Lsyscall_vectored_\name\()_restore_regs:
-	li	r3,0
-	mtmsrd	r3,1
-	mtspr	SPRN_SRR0,r4
-	mtspr	SPRN_SRR1,r5
-
-	ld	r3,_CTR(r1)
-	ld	r4,_LINK(r1)
-	ld	r5,_XER(r1)
-
-	REST_NVGPRS(r1)
-	ld	r0,GPR0(r1)
-	mtcr	r2
-	mtctr	r3
-	mtlr	r4
-	mtspr	SPRN_XER,r5
-	REST_10GPRS(2, r1)
-	REST_2GPRS(12, r1)
-	ld	r1,GPR1(r1)
-	RFI_TO_USER
-.endm
-
-system_call_vectored common 0x3000
-/*
- * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
- * which is tested by system_call_exception when r0 is -1 (as set by vector
- * entry code).
- */
-system_call_vectored sigill 0x7ff0
-
-
-/*
- * Entered via kernel return set up by kernel/sstep.c, must match entry regs
- */
-	.globl system_call_vectored_emulate
-system_call_vectored_emulate:
-_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	b	system_call_vectored_common
-#endif
-
-	.balign IFETCH_ALIGN_BYTES
-	.globl system_call_common_real
-system_call_common_real:
-	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	mtmsrd	r10
-
-	.balign IFETCH_ALIGN_BYTES
-	.globl system_call_common
-system_call_common:
-_ASM_NOKPROBE_SYMBOL(system_call_common)
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
-	mr	r10,r1
-	ld	r1,PACAKSAVE(r13)
-	std	r10,0(r1)
-	std	r11,_NIP(r1)
-	std	r12,_MSR(r1)
-	std	r0,GPR0(r1)
-	std	r10,GPR1(r1)
-	std	r2,GPR2(r1)
-#ifdef CONFIG_PPC_FSL_BOOK3E
-START_BTB_FLUSH_SECTION
-	BTB_FLUSH(r10)
-END_BTB_FLUSH_SECTION
-#endif
-	ld	r2,PACATOC(r13)
-	mfcr	r12
-	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
-	std	r3,GPR3(r1)
-	std	r4,GPR4(r1)
-	std	r5,GPR5(r1)
-	std	r6,GPR6(r1)
-	std	r7,GPR7(r1)
-	std	r8,GPR8(r1)
-	/* Zero r9-r12, this should only be required when restoring all GPRs */
-	std	r11,GPR9(r1)
-	std	r11,GPR10(r1)
-	std	r11,GPR11(r1)
-	std	r11,GPR12(r1)
-	std	r9,GPR13(r1)
-	SAVE_NVGPRS(r1)
-	std	r11,_XER(r1)
-	std	r11,_CTR(r1)
-	mflr	r10
-
-	/*
-	 * This clears CR0.SO (bit 28), which is the error indication on
-	 * return from this system call.
-	 */
-	rldimi	r12,r11,28,(63-28)
-	li	r11,0xc00
-	std	r10,_LINK(r1)
-	std	r11,_TRAP(r1)
-	std	r12,_CCR(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
-
-#ifdef CONFIG_PPC_BOOK3S
-	li	r11,1
-	stb	r11,PACASRR_VALID(r13)
-#endif
-
-	/*
-	 * We always enter kernel from userspace with irq soft-mask enabled and
-	 * nothing pending. system_call_exception() will call
-	 * trace_hardirqs_off().
-	 */
-	li	r11,IRQS_ALL_DISABLED
-	li	r12,PACA_IRQ_HARD_DIS
-	stb	r11,PACAIRQSOFTMASK(r13)
-	stb	r12,PACAIRQHAPPENED(r13)
-
-	/* Calling convention has r9 = orig r0, r10 = regs */
-	mr	r9,r0
-	bl	system_call_exception
-
-.Lsyscall_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
-	li	r5,0 /* !scv */
-	bl	syscall_exit_prepare
-
-	ld	r2,_CCR(r1)
-	ld	r6,_LINK(r1)
-	mtlr	r6
-
-#ifdef CONFIG_PPC_BOOK3S
-	lbz	r4,PACASRR_VALID(r13)
-	cmpdi	r4,0
-	bne	1f
-	li	r4,0
-	stb	r4,PACASRR_VALID(r13)
-#endif
-	ld	r4,_NIP(r1)
-	ld	r5,_MSR(r1)
-	mtspr	SPRN_SRR0,r4
-	mtspr	SPRN_SRR1,r5
-1:
-	DEBUG_SRR_VALID srr
-
-BEGIN_FTR_SECTION
-	stdcx.	r0,0,r1			/* to clear the reservation */
-END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
-
-	cmpdi	r3,0
-	bne	.Lsyscall_restore_regs
-	/* Zero volatile regs that may contain sensitive kernel data */
-	li	r0,0
-	li	r4,0
-	li	r5,0
-	li	r6,0
-	li	r7,0
-	li	r8,0
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	li	r12,0
-	mtctr	r0
-	mtspr	SPRN_XER,r0
-.Lsyscall_restore_regs_cont:
-
-BEGIN_FTR_SECTION
-	HMT_MEDIUM_LOW
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * The value of AMR only matters while we're in the kernel.
-	 */
-	mtcr	r2
-	ld	r2,GPR2(r1)
-	ld	r3,GPR3(r1)
-	ld	r13,GPR13(r1)
-	ld	r1,GPR1(r1)
-	RFI_TO_USER
-	b	.	/* prevent speculative execution */
-
-.Lsyscall_restore_regs:
-	ld	r3,_CTR(r1)
-	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
-	mtctr	r3
-	mtspr	SPRN_XER,r4
-	ld	r0,GPR0(r1)
-	REST_8GPRS(4, r1)
-	ld	r12,GPR12(r1)
-	b	.Lsyscall_restore_regs_cont
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-.Ltabort_syscall:
-	/* Firstly we need to enable TM in the kernel */
-	mfmsr	r10
-	li	r9, 1
-	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
-	mtmsrd	r10, 0
-
-	/* tabort, this dooms the transaction, nothing else */
-	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
-	TABORT(R9)
-
-	/*
-	 * Return directly to userspace. We have corrupted user register state,
-	 * but userspace will never see that register state. Execution will
-	 * resume after the tbegin of the aborted transaction with the
-	 * checkpointed register state.
-	 */
-	li	r9, MSR_RI
-	andc	r10, r10, r9
-	mtmsrd	r10, 1
-	mtspr	SPRN_SRR0, r11
-	mtspr	SPRN_SRR1, r12
-	RFI_TO_USER
-	b	.	/* prevent speculative execution */
-#endif
-
-#ifdef CONFIG_PPC_BOOK3S
-_GLOBAL(ret_from_fork_scv)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	li	r3,0	/* fork() return value */
-	b	.Lsyscall_vectored_common_exit
-#endif
-
-_GLOBAL(ret_from_fork)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	li	r3,0	/* fork() return value */
-	b	.Lsyscall_exit
-
-_GLOBAL(ret_from_kernel_thread)
-	bl	schedule_tail
-	REST_NVGPRS(r1)
-	mtctr	r14
-	mr	r3,r15
-#ifdef PPC64_ELF_ABI_v2
-	mr	r12,r14
-#endif
-	bctrl
-	li	r3,0
-	b	.Lsyscall_exit
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
@@ -668,225 +264,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-	/*
-	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
-	 * touched, no exit work created, then this can be used.
-	 */
-	.balign IFETCH_ALIGN_BYTES
-	.globl fast_interrupt_return_srr
-fast_interrupt_return_srr:
-_ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
-	kuap_check_amr r3, r4
-	ld	r5,_MSR(r1)
-	andi.	r0,r5,MSR_PR
-#ifdef CONFIG_PPC_BOOK3S
-	bne	.Lfast_user_interrupt_return_amr_srr
-	kuap_kernel_restore r3, r4
-	andi.	r0,r5,MSR_RI
-	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	bne+	.Lfast_kernel_interrupt_return_srr
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
-	b	. /* should not get here */
-#else
-	bne	.Lfast_user_interrupt_return_srr
-	b	.Lfast_kernel_interrupt_return_srr
-#endif
-
-.macro interrupt_return_macro srr
-	.balign IFETCH_ALIGN_BYTES
-	.globl interrupt_return_\srr
-interrupt_return_\srr\():
-_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
-	ld	r4,_MSR(r1)
-	andi.	r0,r4,MSR_PR
-	beq	.Lkernel_interrupt_return_\srr
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	interrupt_exit_user_prepare
-	cmpdi	r3,0
-	bne-	.Lrestore_nvgprs_\srr
-
-#ifdef CONFIG_PPC_BOOK3S
-.Lfast_user_interrupt_return_amr_\srr\():
-	kuap_user_restore r3, r4
-#endif
-.Lfast_user_interrupt_return_\srr\():
-
-BEGIN_FTR_SECTION
-	ld	r10,_PPR(r1)
-	mtspr	SPRN_PPR,r10
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-#ifdef CONFIG_PPC_BOOK3S
-	.ifc \srr,srr
-	lbz	r4,PACASRR_VALID(r13)
-	.else
-	lbz	r4,PACAHSRR_VALID(r13)
-	.endif
-	cmpdi	r4,0
-	li	r4,0
-	bne	1f
-#endif
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
-	.ifc \srr,srr
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r12
-1:
-#ifdef CONFIG_PPC_BOOK3S
-	stb	r4,PACASRR_VALID(r13)
-#endif
-	.else
-	mtspr	SPRN_HSRR0,r11
-	mtspr	SPRN_HSRR1,r12
-1:
-#ifdef CONFIG_PPC_BOOK3S
-	stb	r4,PACAHSRR_VALID(r13)
-#endif
-	.endif
-	DEBUG_SRR_VALID \srr
-
-BEGIN_FTR_SECTION
-	stdcx.	r0,0,r1		/* to clear the reservation */
-FTR_SECTION_ELSE
-	ldarx	r0,0,r1
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
-
-	ld	r3,_CCR(r1)
-	ld	r4,_LINK(r1)
-	ld	r5,_CTR(r1)
-	ld	r6,_XER(r1)
-	li	r0,0
-
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
-	REST_GPR(13, r1)
-
-	mtcr	r3
-	mtlr	r4
-	mtctr	r5
-	mtspr	SPRN_XER,r6
-
-	REST_4GPRS(2, r1)
-	REST_GPR(6, r1)
-	REST_GPR(0, r1)
-	REST_GPR(1, r1)
-	.ifc \srr,srr
-	RFI_TO_USER
-	.else
-	HRFI_TO_USER
-	.endif
-	b	.	/* prevent speculative execution */
-
-.Lrestore_nvgprs_\srr\():
-	REST_NVGPRS(r1)
-	b	.Lfast_user_interrupt_return_\srr
-
-	.balign IFETCH_ALIGN_BYTES
-.Lkernel_interrupt_return_\srr\():
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	interrupt_exit_kernel_prepare
-
-.Lfast_kernel_interrupt_return_\srr\():
-	cmpdi	cr1,r3,0
-#ifdef CONFIG_PPC_BOOK3S
-	.ifc \srr,srr
-	lbz	r4,PACASRR_VALID(r13)
-	.else
-	lbz	r4,PACAHSRR_VALID(r13)
-	.endif
-	cmpdi	r4,0
-	li	r4,0
-	bne	1f
-#endif
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
-	.ifc \srr,srr
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r12
-1:
-#ifdef CONFIG_PPC_BOOK3S
-	stb	r4,PACASRR_VALID(r13)
-#endif
-	.else
-	mtspr	SPRN_HSRR0,r11
-	mtspr	SPRN_HSRR1,r12
-1:
-#ifdef CONFIG_PPC_BOOK3S
-	stb	r4,PACAHSRR_VALID(r13)
-#endif
-	.endif
-	DEBUG_SRR_VALID \srr
-
-BEGIN_FTR_SECTION
-	stdcx.	r0,0,r1		/* to clear the reservation */
-FTR_SECTION_ELSE
-	ldarx	r0,0,r1
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
-
-	ld	r3,_LINK(r1)
-	ld	r4,_CTR(r1)
-	ld	r5,_XER(r1)
-	ld	r6,_CCR(r1)
-	li	r0,0
-
-	REST_4GPRS(7, r1)
-	REST_2GPRS(11, r1)
-
-	mtlr	r3
-	mtctr	r4
-	mtspr	SPRN_XER,r5
-
-	/*
-	 * Leaving a stale exception_marker on the stack can confuse
-	 * the reliable stack unwinder later on. Clear it.
-	 */
-	std	r0,STACK_FRAME_OVERHEAD-16(r1)
-
-	REST_4GPRS(2, r1)
-
-	bne-	cr1,1f /* emulate stack store */
-	mtcr	r6
-	REST_GPR(6, r1)
-	REST_GPR(0, r1)
-	REST_GPR(1, r1)
-	.ifc \srr,srr
-	RFI_TO_KERNEL
-	.else
-	HRFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-
-1:	/*
-	 * Emulate stack store with update. New r1 value was already calculated
-	 * and updated in our interrupt regs by emulate_loadstore, but we can't
-	 * store the previous value of r1 to the stack before re-loading our
-	 * registers from it, otherwise they could be clobbered.  Use
-	 * PACA_EXGEN as temporary storage to hold the store data, as
-	 * interrupts are disabled here so it won't be clobbered.
-	 */
-	mtcr	r6
-	std	r9,PACA_EXGEN+0(r13)
-	addi	r9,r1,INT_FRAME_SIZE /* get original r1 */
-	REST_GPR(6, r1)
-	REST_GPR(0, r1)
-	REST_GPR(1, r1)
-	std	r9,0(r1) /* perform store component of stdu */
-	ld	r9,PACA_EXGEN+0(r13)
-
-	.ifc \srr,srr
-	RFI_TO_KERNEL
-	.else
-	HRFI_TO_KERNEL
-	.endif
-	b	.	/* prevent speculative execution */
-.endm
-
-interrupt_return_macro srr
-#ifdef CONFIG_PPC_BOOK3S
-interrupt_return_macro hsrr
-#endif
-
 #ifdef CONFIG_PPC_RTAS
 /*
  * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..d49c25daf1c0 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -194,8 +194,9 @@ CLOSE_FIXED_SECTION(first_256B)
 
 /* This value is used to mark exception frames on the stack. */
 	.section ".toc","aw"
+/* This value is used to mark exception frames on the stack. */
 exception_marker:
-	.tc	ID_72656773_68657265[TC],0x7265677368657265
+	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
 	.previous
 
 /*
@@ -211,6 +212,8 @@ OPEN_TEXT_SECTION(0x100)
 
 USE_TEXT_SECTION()
 
+#include "interrupt_64.S"
+
 #ifdef CONFIG_PPC_BOOK3E
 /*
  * The booting_thread_hwid holds the thread id we want to boot in cpu
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
new file mode 100644
index 000000000000..83826775d239
--- /dev/null
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -0,0 +1,636 @@
+#include <asm/ppc_asm.h>
+#include <asm/head-64.h>
+#include <asm/bug.h>
+#include <asm/hw_irq.h>
+#include <asm/tm.h>
+#include <asm/mmu.h>
+#include <asm/asm-offsets.h>
+#ifdef CONFIG_PPC_BOOK3S
+#include <asm/exception-64s.h>
+#else
+#include <asm/exception-64e.h>
+#endif
+#include <asm/ptrace.h>
+#include <asm/head-64.h>
+#include <asm/feature-fixups.h>
+#include <asm/kup.h>
+
+	.section	".toc","aw"
+SYS_CALL_TABLE:
+	.tc sys_call_table[TC],sys_call_table
+
+#ifdef CONFIG_COMPAT
+COMPAT_SYS_CALL_TABLE:
+	.tc compat_sys_call_table[TC],compat_sys_call_table
+#endif
+	.previous
+
+	.align 7
+
+.macro DEBUG_SRR_VALID srr
+#ifdef CONFIG_PPC_RFI_SRR_DEBUG
+	.ifc \srr,srr
+	mfspr	r11,SPRN_SRR0
+	ld	r12,_NIP(r1)
+100:	tdne	r11,r12
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	mfspr	r11,SPRN_SRR1
+	ld	r12,_MSR(r1)
+100:	tdne	r11,r12
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	.else
+	mfspr	r11,SPRN_HSRR0
+	ld	r12,_NIP(r1)
+100:	tdne	r11,r12
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	mfspr	r11,SPRN_HSRR1
+	ld	r12,_MSR(r1)
+100:	tdne	r11,r12
+	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	.endif
+#endif
+.endm
+
+#ifdef CONFIG_PPC_BOOK3S
+.macro system_call_vectored name trapnr
+	.globl system_call_vectored_\name
+system_call_vectored_\name:
+_ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+BEGIN_FTR_SECTION
+	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
+	bne	.Ltabort_syscall
+END_FTR_SECTION_IFSET(CPU_FTR_TM)
+#endif
+	SCV_INTERRUPT_TO_KERNEL
+	mr	r10,r1
+	ld	r1,PACAKSAVE(r13)
+	std	r10,0(r1)
+	std	r11,_NIP(r1)
+	std	r12,_MSR(r1)
+	std	r0,GPR0(r1)
+	std	r10,GPR1(r1)
+	std	r2,GPR2(r1)
+	ld	r2,PACATOC(r13)
+	mfcr	r12
+	li	r11,0
+	/* Can we avoid saving r3-r8 in common case? */
+	std	r3,GPR3(r1)
+	std	r4,GPR4(r1)
+	std	r5,GPR5(r1)
+	std	r6,GPR6(r1)
+	std	r7,GPR7(r1)
+	std	r8,GPR8(r1)
+	/* Zero r9-r12, this should only be required when restoring all GPRs */
+	std	r11,GPR9(r1)
+	std	r11,GPR10(r1)
+	std	r11,GPR11(r1)
+	std	r11,GPR12(r1)
+	std	r9,GPR13(r1)
+	SAVE_NVGPRS(r1)
+	std	r11,_XER(r1)
+	std	r11,_LINK(r1)
+	std	r11,_CTR(r1)
+
+	li	r11,\trapnr
+	std	r11,_TRAP(r1)
+	std	r12,_CCR(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+BEGIN_FTR_SECTION
+	HMT_MEDIUM
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	/*
+	 * scv enters with MSR[EE]=1 and is immediately considered soft-masked.
+	 * The entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED,
+	 * and interrupts may be masked and pending already.
+	 * system_call_exception() will call trace_hardirqs_off() which means
+	 * interrupts could already have been blocked before trace_hardirqs_off,
+	 * but this is the best we can do.
+	 */
+
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_exception
+
+.Lsyscall_vectored_\name\()_exit:
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	li	r5,1 /* scv */
+	bl	syscall_exit_prepare
+
+	ld	r2,_CCR(r1)
+	ld	r4,_NIP(r1)
+	ld	r5,_MSR(r1)
+
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1			/* to clear the reservation */
+END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
+
+BEGIN_FTR_SECTION
+	HMT_MEDIUM_LOW
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	cmpdi	r3,0
+	bne	.Lsyscall_vectored_\name\()_restore_regs
+
+	/* rfscv returns with LR->NIA and CTR->MSR */
+	mtlr	r4
+	mtctr	r5
+
+	/* Could zero these as per ABI, but we may consider a stricter ABI
+	 * which preserves these if libc implementations can benefit, so
+	 * restore them for now until further measurement is done. */
+	ld	r0,GPR0(r1)
+	ld	r4,GPR4(r1)
+	ld	r5,GPR5(r1)
+	ld	r6,GPR6(r1)
+	ld	r7,GPR7(r1)
+	ld	r8,GPR8(r1)
+	/* Zero volatile regs that may contain sensitive kernel data */
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	li	r12,0
+	mtspr	SPRN_XER,r0
+
+	/*
+	 * We don't need to restore AMR on the way back to userspace for KUAP.
+	 * The value of AMR only matters while we're in the kernel.
+	 */
+	mtcr	r2
+	ld	r2,GPR2(r1)
+	ld	r3,GPR3(r1)
+	ld	r13,GPR13(r1)
+	ld	r1,GPR1(r1)
+	RFSCV_TO_USER
+	b	.	/* prevent speculative execution */
+
+.Lsyscall_vectored_\name\()_restore_regs:
+	li	r3,0
+	mtmsrd	r3,1
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+
+	ld	r3,_CTR(r1)
+	ld	r4,_LINK(r1)
+	ld	r5,_XER(r1)
+
+	REST_NVGPRS(r1)
+	ld	r0,GPR0(r1)
+	mtcr	r2
+	mtctr	r3
+	mtlr	r4
+	mtspr	SPRN_XER,r5
+	REST_10GPRS(2, r1)
+	REST_2GPRS(12, r1)
+	ld	r1,GPR1(r1)
+	RFI_TO_USER
+.endm
+
+system_call_vectored common 0x3000
+/*
+ * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
+ * which is tested by system_call_exception when r0 is -1 (as set by vector
+ * entry code).
+ */
+system_call_vectored sigill 0x7ff0
+
+
+/*
+ * Entered via kernel return set up by kernel/sstep.c, must match entry regs
+ */
+	.globl system_call_vectored_emulate
+system_call_vectored_emulate:
+_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
+	li	r10,IRQS_ALL_DISABLED
+	stb	r10,PACAIRQSOFTMASK(r13)
+	b	system_call_vectored_common
+#endif
+
+	.balign IFETCH_ALIGN_BYTES
+	.globl system_call_common_real
+system_call_common_real:
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	mtmsrd	r10
+
+	.balign IFETCH_ALIGN_BYTES
+	.globl system_call_common
+system_call_common:
+_ASM_NOKPROBE_SYMBOL(system_call_common)
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+BEGIN_FTR_SECTION
+	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
+	bne	.Ltabort_syscall
+END_FTR_SECTION_IFSET(CPU_FTR_TM)
+#endif
+	mr	r10,r1
+	ld	r1,PACAKSAVE(r13)
+	std	r10,0(r1)
+	std	r11,_NIP(r1)
+	std	r12,_MSR(r1)
+	std	r0,GPR0(r1)
+	std	r10,GPR1(r1)
+	std	r2,GPR2(r1)
+#ifdef CONFIG_PPC_FSL_BOOK3E
+START_BTB_FLUSH_SECTION
+	BTB_FLUSH(r10)
+END_BTB_FLUSH_SECTION
+#endif
+	ld	r2,PACATOC(r13)
+	mfcr	r12
+	li	r11,0
+	/* Can we avoid saving r3-r8 in common case? */
+	std	r3,GPR3(r1)
+	std	r4,GPR4(r1)
+	std	r5,GPR5(r1)
+	std	r6,GPR6(r1)
+	std	r7,GPR7(r1)
+	std	r8,GPR8(r1)
+	/* Zero r9-r12, this should only be required when restoring all GPRs */
+	std	r11,GPR9(r1)
+	std	r11,GPR10(r1)
+	std	r11,GPR11(r1)
+	std	r11,GPR12(r1)
+	std	r9,GPR13(r1)
+	SAVE_NVGPRS(r1)
+	std	r11,_XER(r1)
+	std	r11,_CTR(r1)
+	mflr	r10
+
+	/*
+	 * This clears CR0.SO (bit 28), which is the error indication on
+	 * return from this system call.
+	 */
+	rldimi	r12,r11,28,(63-28)
+	li	r11,0xc00
+	std	r10,_LINK(r1)
+	std	r11,_TRAP(r1)
+	std	r12,_CCR(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+#ifdef CONFIG_PPC_BOOK3S
+	li	r11,1
+	stb	r11,PACASRR_VALID(r13)
+#endif
+
+	/*
+	 * We always enter kernel from userspace with irq soft-mask enabled and
+	 * nothing pending. system_call_exception() will call
+	 * trace_hardirqs_off().
+	 */
+	li	r11,IRQS_ALL_DISABLED
+	li	r12,PACA_IRQ_HARD_DIS
+	stb	r11,PACAIRQSOFTMASK(r13)
+	stb	r12,PACAIRQHAPPENED(r13)
+
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_exception
+
+.Lsyscall_exit:
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	li	r5,0 /* !scv */
+	bl	syscall_exit_prepare
+
+	ld	r2,_CCR(r1)
+	ld	r6,_LINK(r1)
+	mtlr	r6
+
+#ifdef CONFIG_PPC_BOOK3S
+	lbz	r4,PACASRR_VALID(r13)
+	cmpdi	r4,0
+	bne	1f
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+#endif
+	ld	r4,_NIP(r1)
+	ld	r5,_MSR(r1)
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+1:
+	DEBUG_SRR_VALID srr
+
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1			/* to clear the reservation */
+END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
+
+	cmpdi	r3,0
+	bne	.Lsyscall_restore_regs
+	/* Zero volatile regs that may contain sensitive kernel data */
+	li	r0,0
+	li	r4,0
+	li	r5,0
+	li	r6,0
+	li	r7,0
+	li	r8,0
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	li	r12,0
+	mtctr	r0
+	mtspr	SPRN_XER,r0
+.Lsyscall_restore_regs_cont:
+
+BEGIN_FTR_SECTION
+	HMT_MEDIUM_LOW
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	/*
+	 * We don't need to restore AMR on the way back to userspace for KUAP.
+	 * The value of AMR only matters while we're in the kernel.
+	 */
+	mtcr	r2
+	ld	r2,GPR2(r1)
+	ld	r3,GPR3(r1)
+	ld	r13,GPR13(r1)
+	ld	r1,GPR1(r1)
+	RFI_TO_USER
+	b	.	/* prevent speculative execution */
+
+.Lsyscall_restore_regs:
+	ld	r3,_CTR(r1)
+	ld	r4,_XER(r1)
+	REST_NVGPRS(r1)
+	mtctr	r3
+	mtspr	SPRN_XER,r4
+	ld	r0,GPR0(r1)
+	REST_8GPRS(4, r1)
+	ld	r12,GPR12(r1)
+	b	.Lsyscall_restore_regs_cont
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+.Ltabort_syscall:
+	/* Firstly we need to enable TM in the kernel */
+	mfmsr	r10
+	li	r9, 1
+	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
+	mtmsrd	r10, 0
+
+	/* tabort, this dooms the transaction, nothing else */
+	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
+	TABORT(R9)
+
+	/*
+	 * Return directly to userspace. We have corrupted user register state,
+	 * but userspace will never see that register state. Execution will
+	 * resume after the tbegin of the aborted transaction with the
+	 * checkpointed register state.
+	 */
+	li	r9, MSR_RI
+	andc	r10, r10, r9
+	mtmsrd	r10, 1
+	mtspr	SPRN_SRR0, r11
+	mtspr	SPRN_SRR1, r12
+	RFI_TO_USER
+	b	.	/* prevent speculative execution */
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S
+_GLOBAL(ret_from_fork_scv)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	li	r3,0	/* fork() return value */
+	b	.Lsyscall_vectored_common_exit
+#endif
+
+_GLOBAL(ret_from_fork)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	li	r3,0	/* fork() return value */
+	b	.Lsyscall_exit
+
+_GLOBAL(ret_from_kernel_thread)
+	bl	schedule_tail
+	REST_NVGPRS(r1)
+	mtctr	r14
+	mr	r3,r15
+#ifdef PPC64_ELF_ABI_v2
+	mr	r12,r14
+#endif
+	bctrl
+	li	r3,0
+	b	.Lsyscall_exit
+
+	/*
+	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
+	 * touched, no exit work created, then this can be used.
+	 */
+	.balign IFETCH_ALIGN_BYTES
+	.globl fast_interrupt_return_srr
+fast_interrupt_return_srr:
+_ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
+	kuap_check_amr r3, r4
+	ld	r5,_MSR(r1)
+	andi.	r0,r5,MSR_PR
+#ifdef CONFIG_PPC_BOOK3S
+	bne	.Lfast_user_interrupt_return_amr_srr
+	kuap_kernel_restore r3, r4
+	andi.	r0,r5,MSR_RI
+	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
+	bne+	.Lfast_kernel_interrupt_return_srr
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unrecoverable_exception
+	b	. /* should not get here */
+#else
+	bne	.Lfast_user_interrupt_return_srr
+	b	.Lfast_kernel_interrupt_return_srr
+#endif
+
+.macro interrupt_return_macro srr
+	.balign IFETCH_ALIGN_BYTES
+	.globl interrupt_return_\srr
+interrupt_return_\srr\():
+_ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
+	ld	r4,_MSR(r1)
+	andi.	r0,r4,MSR_PR
+	beq	.Lkernel_interrupt_return_\srr
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	interrupt_exit_user_prepare
+	cmpdi	r3,0
+	bne-	.Lrestore_nvgprs_\srr
+
+#ifdef CONFIG_PPC_BOOK3S
+.Lfast_user_interrupt_return_amr_\srr\():
+	kuap_user_restore r3, r4
+#endif
+.Lfast_user_interrupt_return_\srr\():
+
+BEGIN_FTR_SECTION
+	ld	r10,_PPR(r1)
+	mtspr	SPRN_PPR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+#ifdef CONFIG_PPC_BOOK3S
+	.ifc \srr,srr
+	lbz	r4,PACASRR_VALID(r13)
+	.else
+	lbz	r4,PACAHSRR_VALID(r13)
+	.endif
+	cmpdi	r4,0
+	li	r4,0
+	bne	1f
+#endif
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+	.ifc \srr,srr
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACASRR_VALID(r13)
+#endif
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACAHSRR_VALID(r13)
+#endif
+	.endif
+	DEBUG_SRR_VALID \srr
+
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1		/* to clear the reservation */
+FTR_SECTION_ELSE
+	ldarx	r0,0,r1
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
+
+	ld	r3,_CCR(r1)
+	ld	r4,_LINK(r1)
+	ld	r5,_CTR(r1)
+	ld	r6,_XER(r1)
+	li	r0,0
+
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
+	REST_GPR(13, r1)
+
+	mtcr	r3
+	mtlr	r4
+	mtctr	r5
+	mtspr	SPRN_XER,r6
+
+	REST_4GPRS(2, r1)
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	.ifc \srr,srr
+	RFI_TO_USER
+	.else
+	HRFI_TO_USER
+	.endif
+	b	.	/* prevent speculative execution */
+
+.Lrestore_nvgprs_\srr\():
+	REST_NVGPRS(r1)
+	b	.Lfast_user_interrupt_return_\srr
+
+	.balign IFETCH_ALIGN_BYTES
+.Lkernel_interrupt_return_\srr\():
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	interrupt_exit_kernel_prepare
+
+.Lfast_kernel_interrupt_return_\srr\():
+	cmpdi	cr1,r3,0
+#ifdef CONFIG_PPC_BOOK3S
+	.ifc \srr,srr
+	lbz	r4,PACASRR_VALID(r13)
+	.else
+	lbz	r4,PACAHSRR_VALID(r13)
+	.endif
+	cmpdi	r4,0
+	li	r4,0
+	bne	1f
+#endif
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+	.ifc \srr,srr
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACASRR_VALID(r13)
+#endif
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACAHSRR_VALID(r13)
+#endif
+	.endif
+	DEBUG_SRR_VALID \srr
+
+BEGIN_FTR_SECTION
+	stdcx.	r0,0,r1		/* to clear the reservation */
+FTR_SECTION_ELSE
+	ldarx	r0,0,r1
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
+
+	ld	r3,_LINK(r1)
+	ld	r4,_CTR(r1)
+	ld	r5,_XER(r1)
+	ld	r6,_CCR(r1)
+	li	r0,0
+
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
+
+	mtlr	r3
+	mtctr	r4
+	mtspr	SPRN_XER,r5
+
+	/*
+	 * Leaving a stale exception_marker on the stack can confuse
+	 * the reliable stack unwinder later on. Clear it.
+	 */
+	std	r0,STACK_FRAME_OVERHEAD-16(r1)
+
+	REST_4GPRS(2, r1)
+
+	bne-	cr1,1f /* emulate stack store */
+	mtcr	r6
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	.ifc \srr,srr
+	RFI_TO_KERNEL
+	.else
+	HRFI_TO_KERNEL
+	.endif
+	b	.	/* prevent speculative execution */
+
+1:	/*
+	 * Emulate stack store with update. New r1 value was already calculated
+	 * and updated in our interrupt regs by emulate_loadstore, but we can't
+	 * store the previous value of r1 to the stack before re-loading our
+	 * registers from it, otherwise they could be clobbered.  Use
+	 * PACA_EXGEN as temporary storage to hold the store data, as
+	 * interrupts are disabled here so it won't be clobbered.
+	 */
+	mtcr	r6
+	std	r9,PACA_EXGEN+0(r13)
+	addi	r9,r1,INT_FRAME_SIZE /* get original r1 */
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	std	r9,0(r1) /* perform store component of stdu */
+	ld	r9,PACA_EXGEN+0(r13)
+
+	.ifc \srr,srr
+	RFI_TO_KERNEL
+	.else
+	HRFI_TO_KERNEL
+	.endif
+	b	.	/* prevent speculative execution */
+.endm
+
+interrupt_return_macro srr
+#ifdef CONFIG_PPC_BOOK3S
+interrupt_return_macro hsrr
+#endif
-- 
2.23.0


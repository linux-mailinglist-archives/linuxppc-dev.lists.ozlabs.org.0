Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C8B2A992B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:11:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQPR5wJ1zDqGb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vWxXVVmL; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7t2zhXzDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:52 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id e7so1694931pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7DIG8RccY4M7zL+H9+rnQYSyn0igP1MR+TjVKnE4gaE=;
 b=vWxXVVmL33+WJVzNyvZRiWnc8O8UIfByIIBHDd1hOHWkOZK7R2xIlMhohVuIZ23NQi
 k7rTbOR9e1Yq3XMd+8F3zp8gmJCCyn+SmDqIYec9F/4HbeTDJ+3NA9huXqEgbc63WuwA
 H5+EUscPuzTgxNJqQSSK7yWPS81jF1s0UUco1N7ZT7dBhr5m0jalOPPf6UIb0PxzcSvU
 XwM0svbBmECXMvpYM4PZ+2JwPQnHuZzM4psllhxjVUW/3Lp6Yv9rNxbm9iRpRTl6ANfv
 q2yPdx+OfdH4v32ANMq612TGkBoeYN158Z/Duqzo7CDWd0EQmq9xhdyXwopFBuGiDf0j
 21hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7DIG8RccY4M7zL+H9+rnQYSyn0igP1MR+TjVKnE4gaE=;
 b=JuXflxnYkP2Nqt2w7frMbfDdmE/QTVij1D8JcwRe7KdhLWmKqgnC7j7BoygC0v+wPH
 60K0qh1vXXW6n7YwvXFzZoRjxkTPpf0kxLd2jhKj++FAUxJiqNlGuCOwEzGPe6LPF5Nf
 LSGkPipRPFx+0N7DNSPPdQx4qmXHuTwA1XwbxRdN1rG/0rp3Zh4XWgv+1EqBw6hQgv5g
 QlEJS1e/2hy72NvSbc+Zamhy7/gaMml0s3M8h84L+v3PblMmfJsGCc0eaHEn3w/vpPE/
 eQKUoPU2meMSBe/3XMjC1Qwl+HyxHuWuD/QoUyfhhC07hCBRnZySW2XG0tzyisAjlB8g
 CEEQ==
X-Gm-Message-State: AOAM530CR0dczCpRS07k0rAF5t6y/Zpy3VWnohRNNs4aE0zA2W7cGDmc
 kBIvh6a483fS066EJYbnXownTyZ9iZE=
X-Google-Smtp-Source: ABdhPJxIs5lT/WDQDauPXDolokGPhWdLSwdmuaff5tgmFigFbwMyQZ3KSXFiw8SrAB0J7A2JviS/0A==
X-Received: by 2002:a63:7f47:: with SMTP id p7mr2182924pgn.394.1604678389229; 
 Fri, 06 Nov 2020 07:59:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/9] powerpc/64: move interrupt return asm to
 interrupt_64.S
Date: Sat,  7 Nov 2020 01:59:25 +1000
Message-Id: <20201106155929.2246055-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/entry_64.S     | 601 ----------------------------
 arch/powerpc/kernel/head_64.S      |   5 +-
 arch/powerpc/kernel/interrupt_64.S | 608 +++++++++++++++++++++++++++++
 4 files changed, 613 insertions(+), 603 deletions(-)
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
index 6236a88a592f..65ddd159974b 100644
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
@@ -48,411 +47,7 @@
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
-#ifdef CONFIG_PPC_BOOK3S
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
-	INTERRUPT_TO_KERNEL
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
-	std	r3,ORIG_GPR3(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
-
-BEGIN_FTR_SECTION
-	HMT_MEDIUM
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-	/*
-	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
-	 * would clobber syscall parameters. Also we always enter with IRQs
-	 * enabled and nothing pending. system_call_exception() will call
-	 * trace_hardirqs_off().
-	 *
-	 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS. The
-	 * entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED.
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
-	std	r3,ORIG_GPR3(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
-	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
-
-	li	r11,1
-	stb	r11,PACASRR_VALID(r13)
-
-	/*
-	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
-	 * would clobber syscall parameters. Also we always enter with IRQs
-	 * enabled and nothing pending. system_call_exception() will call
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
-	lbz	r4,PACASRR_VALID(r13)
-	cmpdi	r4,0
-	bne	1f
-	li	r4,0
-	stb	r4,PACASRR_VALID(r13)
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
-
 #ifdef CONFIG_PPC_BOOK3E
 /* Save non-volatile GPRs, if not already saved. */
 _GLOBAL(save_nvgprs)
@@ -681,202 +276,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-#ifdef CONFIG_PPC_BOOK3S
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
-	bne	.Lfast_user_interrupt_return_srr
-	kuap_restore_amr r3, r4
-	andi.	r0,r5,MSR_RI
-	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
-	bne+	.Lfast_kernel_interrupt_return_srr
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
-	b	. /* should not get here */
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
-.Lfast_user_interrupt_return_\srr:
-BEGIN_FTR_SECTION
-	ld	r10,_PPR(r1)
-	mtspr	SPRN_PPR,r10
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	.ifc \srr,srr
-	lbz	r4,PACASRR_VALID(r13)
-	.else
-	lbz	r4,PACAHSRR_VALID(r13)
-	.endif
-	cmpdi	r4,0
-	li	r4,0
-	bne	1f
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
-	.ifc \srr,srr
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r12
-1:
-	stb	r4,PACASRR_VALID(r13)
-	.else
-	mtspr	SPRN_HSRR0,r11
-	mtspr	SPRN_HSRR1,r12
-1:
-	stb	r4,PACAHSRR_VALID(r13)
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
-	.ifc \srr,srr
-	lbz	r4,PACASRR_VALID(r13)
-	.else
-	lbz	r4,PACAHSRR_VALID(r13)
-	.endif
-	cmpdi	r4,0
-	li	r4,0
-	bne	1f
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
-	.ifc \srr,srr
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r12
-1:
-	stb	r4,PACASRR_VALID(r13)
-	.else
-	mtspr	SPRN_HSRR0,r11
-	mtspr	SPRN_HSRR1,r12
-1:
-	stb	r4,PACAHSRR_VALID(r13)
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
-interrupt_return_macro hsrr
-#endif /* CONFIG_PPC_BOOK3S */
-
 #ifdef CONFIG_PPC_RTAS
 /*
  * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 4e2591cb4bd1..b13a2d79dfb4 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -189,8 +189,9 @@ CLOSE_FIXED_SECTION(first_256B)
 
 /* This value is used to mark exception frames on the stack. */
 	.section ".toc","aw"
+/* This value is used to mark exception frames on the stack. */
 exception_marker:
-	.tc	ID_72656773_68657265[TC],0x7265677368657265
+	.tc	ID_EXC_MARKER[TC],STACK_FRAME_REGS_MARKER
 	.previous
 
 /*
@@ -206,6 +207,8 @@ OPEN_TEXT_SECTION(0x100)
 
 USE_TEXT_SECTION()
 
+#include "interrupt_64.S"
+
 #ifdef CONFIG_PPC_BOOK3E
 /*
  * The booting_thread_hwid holds the thread id we want to boot in cpu
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
new file mode 100644
index 000000000000..e121829ef717
--- /dev/null
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -0,0 +1,608 @@
+#include <asm/ppc_asm.h>
+#include <asm/head-64.h>
+#include <asm/bug.h>
+#include <asm/hw_irq.h>
+#include <asm/tm.h>
+#include <asm/mmu.h>
+#include <asm/asm-offsets.h>
+#include <asm/exception-64s.h>
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
+#ifdef CONFIG_PPC_BOOK3S
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
+	INTERRUPT_TO_KERNEL
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
+	std	r3,ORIG_GPR3(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+BEGIN_FTR_SECTION
+	HMT_MEDIUM
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
+	/*
+	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
+	 * would clobber syscall parameters. Also we always enter with IRQs
+	 * enabled and nothing pending. system_call_exception() will call
+	 * trace_hardirqs_off().
+	 *
+	 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS. The
+	 * entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED.
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
+#endif /* CONFIG_PPC_BOOK3S */
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
+	std	r3,ORIG_GPR3(r1)
+	addi	r10,r1,STACK_FRAME_OVERHEAD
+	ld	r11,exception_marker@toc(r2)
+	std	r11,-16(r10)		/* "regshere" marker */
+
+	li	r11,1
+	stb	r11,PACASRR_VALID(r13)
+
+	/*
+	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
+	 * would clobber syscall parameters. Also we always enter with IRQs
+	 * enabled and nothing pending. system_call_exception() will call
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
+	lbz	r4,PACASRR_VALID(r13)
+	cmpdi	r4,0
+	bne	1f
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
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
+#ifdef CONFIG_PPC_BOOK3S
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
+	bne	.Lfast_user_interrupt_return_srr
+	kuap_restore_amr r3, r4
+	andi.	r0,r5,MSR_RI
+	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
+	bne+	.Lfast_kernel_interrupt_return_srr
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unrecoverable_exception
+	b	. /* should not get here */
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
+.Lfast_user_interrupt_return_\srr:
+BEGIN_FTR_SECTION
+	ld	r10,_PPR(r1)
+	mtspr	SPRN_PPR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	.ifc \srr,srr
+	lbz	r4,PACASRR_VALID(r13)
+	.else
+	lbz	r4,PACAHSRR_VALID(r13)
+	.endif
+	cmpdi	r4,0
+	li	r4,0
+	bne	1f
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+	.ifc \srr,srr
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
+1:
+	stb	r4,PACASRR_VALID(r13)
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+1:
+	stb	r4,PACAHSRR_VALID(r13)
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
+	.ifc \srr,srr
+	lbz	r4,PACASRR_VALID(r13)
+	.else
+	lbz	r4,PACAHSRR_VALID(r13)
+	.endif
+	cmpdi	r4,0
+	li	r4,0
+	bne	1f
+	ld	r11,_NIP(r1)
+	ld	r12,_MSR(r1)
+	.ifc \srr,srr
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
+1:
+	stb	r4,PACASRR_VALID(r13)
+	.else
+	mtspr	SPRN_HSRR0,r11
+	mtspr	SPRN_HSRR1,r12
+1:
+	stb	r4,PACAHSRR_VALID(r13)
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
+interrupt_return_macro hsrr
+
+#endif /* CONFIG_PPC_BOOK3S */
-- 
2.23.0


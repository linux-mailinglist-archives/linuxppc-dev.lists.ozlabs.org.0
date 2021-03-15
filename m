Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E033C907
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:06:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzr8z73R2z3bxX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:06:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=STFyaxHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=STFyaxHU; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr6x6gjRz304L
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:25 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id b23so7460054pfo.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTg4/lo7YHaJ9VbZ7gIQill2xkPZLyuy1S9VoEenBUI=;
 b=STFyaxHU0/g3yWQZ7e4Xi7uNKF+QqsKU6cLLNmxM4lhWkaBTH5mB+p8qMBGZ4PMoue
 VGZ/YkJ+eJvLSdsSbeDd9P5QbMouBjbNpSw5pw0qbnlpyAEOw/2idjqYOYTHKgW68JJw
 ujs+HWz9y/z2Zy4qSQ8odiuh2rCpSg/zAkgFggmog2YHkYuLBV7eo7ZiaJ3KNdiJvn3p
 YejIlWZ0zcte5ujEN14YoVFhhHj3sLa6RnCwuWw3juDcWatBxuvsagHUNrjd23NaA1pn
 Z8lYKrb0xA2t+nrWaI6t6w594F1ZrhI7Wswg/z+y0K/2g+I5A9jVQGidl3q4v195QcB4
 Dzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTg4/lo7YHaJ9VbZ7gIQill2xkPZLyuy1S9VoEenBUI=;
 b=jhdDzF7nci7wvU+NtAFAIL0YOS5scYo3ooGJ5792ngCNDSDDgEPauu7p2Q5W6fJI60
 2FJbL6H22B5MfCgyVb4fXXFT6fP+9bBDAfGixb7jWHD+olIb3wUC5li7xr5U5YRmhSWI
 LYXHflxQ/t8rM97P3taSDCFrh67delpJr+ntqbYVk8LSV6yYZgeHLa3UszjBANR3qlEp
 IhcZDBUkTOySwNB2BQLH6r1WU/Z6CvdoroYGEH0TDGErwiZjJ3PDDyEj/xmLLItjLAnH
 DG4Q2NGSsnZukdWeNDiZ7OHlLoEIAmRooE+zIeLsh3MYp+q7esSBU+wa1NqmwcnjmzDk
 WLlA==
X-Gm-Message-State: AOAM530nhkZsfyIzhVyE9lYnQFFi34SNNvduy1z8+2EyWdZFb2peRJra
 oDtDNhm1qSE/P0+MLqP0G3IXj+o4n10=
X-Google-Smtp-Source: ABdhPJwSOq0hrSzCknxJuj8VjgXlWdZT6ZI8kCAwRAXhI7X92Drf+pEpvXb4eb8aUCN6koqQgg6mUw==
X-Received: by 2002:a63:4808:: with SMTP id v8mr973991pga.381.1615845862568;
 Mon, 15 Mar 2021 15:04:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/14] powerpc/64s: avoid reloading (H)SRR registers if they
 are still valid
Date: Tue, 16 Mar 2021 08:03:52 +1000
Message-Id: <20210315220402.260594-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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

When an interrupt is taken, the SRR registers are set to return to
where it left off. Unless they are modified in the meantime, or the
return address or MSR are modified, there is no need to reload these
registers when returning from interrupt.

Introduce per-CPU flags that track the validity of SRR and HSRR
registers, clear them when returning from interrupt, using the registers
for something else (e.g., OPAL calls), or adjusting return address or MSR.

This improves the performance of interrupt returns.

XXX: may not need to invalidate both hsrr and srr all the time

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig.debug                 |  5 ++
 arch/powerpc/include/asm/paca.h            |  2 +
 arch/powerpc/include/asm/ptrace.h          | 57 +++++++++-----
 arch/powerpc/kernel/asm-offsets.c          |  2 +
 arch/powerpc/kernel/entry_64.S             | 91 ++++++++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S       | 27 +++++++
 arch/powerpc/kernel/fpu.S                  |  2 +
 arch/powerpc/kernel/kgdb.c                 |  2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |  2 +-
 arch/powerpc/kernel/kprobes.c              | 10 +--
 arch/powerpc/kernel/process.c              | 20 ++++-
 arch/powerpc/kernel/rtas.c                 | 13 +++-
 arch/powerpc/kernel/signal.c               |  2 +-
 arch/powerpc/kernel/signal_64.c            | 14 ++++
 arch/powerpc/kernel/syscalls.c             |  2 +
 arch/powerpc/kernel/traps.c                | 18 ++---
 arch/powerpc/kernel/vector.S               |  4 +
 arch/powerpc/lib/sstep.c                   |  5 +-
 arch/powerpc/math-emu/math.c               |  2 +-
 arch/powerpc/platforms/powernv/opal-call.c |  3 +
 arch/powerpc/sysdev/fsl_pci.c              |  2 +-
 21 files changed, 233 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index ae084357994e..359ed36c5487 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -84,6 +84,11 @@ config MSI_BITMAP_SELFTEST
 
 config PPC_IRQ_SOFT_MASK_DEBUG
 	bool "Include extra checks for powerpc irq soft masking"
+	depends on PPC64
+
+config PPC_RFI_SRR_DEBUG
+	bool "Include extra checks for RFI SRR register validity"
+	depends on PPC_BOOK3S_64
 
 config XMON
 	bool "Include xmon kernel debugger"
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 819db8afd425..4cbfaa09950a 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -170,6 +170,8 @@ struct paca_struct {
 #ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
+	u8 hsrr_valid;			/* HSRRs set for HRFID */
+	u8 srr_valid;			/* SRRs set for RFID */
 	u8 irq_soft_mask;		/* mask for irq soft masking */
 	u8 irq_happened;		/* irq happened while soft-disabled */
 	u8 irq_work_pending;		/* IRQ_WORK interrupt while soft-disable */
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 6a04abfe5eb6..77c86ce01f20 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -121,27 +121,7 @@ struct pt_regs
 #endif /* __powerpc64__ */
 
 #ifndef __ASSEMBLY__
-
-static inline unsigned long instruction_pointer(struct pt_regs *regs)
-{
-	return regs->nip;
-}
-
-static inline void instruction_pointer_set(struct pt_regs *regs,
-		unsigned long val)
-{
-	regs->nip = val;
-}
-
-static inline unsigned long user_stack_pointer(struct pt_regs *regs)
-{
-	return regs->gpr[1];
-}
-
-static inline unsigned long frame_pointer(struct pt_regs *regs)
-{
-	return 0;
-}
+#include <asm/paca.h>
 
 #ifdef CONFIG_SMP
 extern unsigned long profile_pc(struct pt_regs *regs);
@@ -171,6 +151,41 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 	regs->gpr[3] = rc;
 }
 
+static inline void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+{
+	regs->nip = ip;
+#ifdef CONFIG_PPC_BOOK3S_64
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+#endif
+}
+
+static inline void regs_add_return_ip(struct pt_regs *regs, long offset)
+{
+	regs_set_return_ip(regs, regs->nip + offset);
+}
+
+static inline unsigned long instruction_pointer(struct pt_regs *regs)
+{
+	return regs->nip;
+}
+
+static inline void instruction_pointer_set(struct pt_regs *regs,
+		unsigned long val)
+{
+	regs_set_return_ip(regs, val);
+}
+
+static inline unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	return regs->gpr[1];
+}
+
+static inline unsigned long frame_pointer(struct pt_regs *regs)
+{
+	return 0;
+}
+
 #ifdef __powerpc64__
 #define user_mode(regs) ((((regs)->msr) >> MSR_PR_LG) & 0x1)
 #else
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e33f04280f77..35ce6e36f593 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -209,6 +209,8 @@ int main(void)
 	OFFSET(PACATOC, paca_struct, kernel_toc);
 	OFFSET(PACAKBASE, paca_struct, kernelbase);
 	OFFSET(PACAKMSR, paca_struct, kernel_msr);
+	OFFSET(PACAHSRR_VALID, paca_struct, hsrr_valid);
+	OFFSET(PACASRR_VALID, paca_struct, srr_valid);
 	OFFSET(PACAIRQSOFTMASK, paca_struct, irq_soft_mask);
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index ccf913cedd29..b466b3e1bb3f 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -64,6 +64,30 @@ exception_marker:
 	.section	".text"
 	.align 7
 
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
 #ifdef CONFIG_PPC_BOOK3S
 .macro system_call_vectored name trapnr
 	.globl system_call_vectored_\name
@@ -290,6 +314,11 @@ END_BTB_FLUSH_SECTION
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
 
+#ifdef CONFIG_PPC_BOOK3S
+	li	r11,1
+	stb	r11,PACASRR_VALID(r13)
+#endif
+
 	/*
 	 * We always enter kernel from userspace with irq soft-mask enabled and
 	 * nothing pending. system_call_exception() will call
@@ -314,18 +343,27 @@ END_BTB_FLUSH_SECTION
 	EXIT_KERNEL_SECURITY_FALLBACK
 
 	ld	r2,_CCR(r1)
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
 	ld	r4,_NIP(r1)
 	ld	r5,_MSR(r1)
-	ld	r6,_LINK(r1)
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+1:
+	DEBUG_SRR_VALID srr
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-	mtspr	SPRN_SRR0,r4
-	mtspr	SPRN_SRR1,r5
-	mtlr	r6
-
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -683,19 +721,39 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 .Lfast_user_interrupt_return_\srr\():
 	EXIT_KERNEL_SECURITY_FALLBACK
 
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
 	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACASRR_VALID(r13)
+#endif
 	.else
 	mtspr	SPRN_HSRR0,r11
 	mtspr	SPRN_HSRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACAHSRR_VALID(r13)
+#endif
 	.endif
+	DEBUG_SRR_VALID \srr
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
@@ -740,15 +798,34 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
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
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
 	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACASRR_VALID(r13)
+#endif
 	.else
 	mtspr	SPRN_HSRR0,r11
 	mtspr	SPRN_HSRR1,r12
+1:
+#ifdef CONFIG_PPC_BOOK3S
+	stb	r4,PACAHSRR_VALID(r13)
+#endif
 	.endif
+	DEBUG_SRR_VALID \srr
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 136323d38c80..0c7af27d6dc1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -567,6 +567,20 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
+	/* Mark our [H]SRRs valid for return */
+	li	r10,1
+	.if IHSRR_IF_HVMODE
+	BEGIN_FTR_SECTION
+	stb	r10,PACAHSRR_VALID(r13)
+	FTR_SECTION_ELSE
+	stb	r10,PACASRR_VALID(r13)
+	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.elseif IHSRR
+	stb	r10,PACAHSRR_VALID(r13)
+	.else
+	stb	r10,PACASRR_VALID(r13)
+	.endif
+
 	.if ISET_RI
 	li	r10,MSR_RI
 	mtmsrd	r10,1			/* Set MSR_RI */
@@ -668,10 +682,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 .macro EXCEPTION_RESTORE_REGS hsrr=0
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
+	li	r10,0
 	.if \hsrr
 	mtspr	SPRN_HSRR1,r9
+	stb	r10,PACAHSRR_VALID(r13)
 	.else
 	mtspr	SPRN_SRR1,r9
+	stb	r10,PACASRR_VALID(r13)
 	.endif
 	ld	r9,_NIP(r1)
 	.if \hsrr
@@ -1829,6 +1846,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	 *
 	 * Be careful to avoid touching the kernel stack.
 	 */
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r10
 	mtcrf	0x80,r9
@@ -2663,6 +2682,8 @@ BEGIN_FTR_SECTION
 	ld	r10,PACA_EXGEN+EX_CFAR(r13)
 	mtspr	SPRN_CFAR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
@@ -2835,6 +2856,12 @@ masked_interrupt:
 	ori	r11,r11,PACA_IRQ_HARD_DIS
 	stb	r11,PACAIRQHAPPENED(r13)
 2:	/* done */
+	li	r10,0
+	.if \hsrr
+	stb	r10,PACAHSRR_VALID(r13)
+	.else
+	stb	r10,PACASRR_VALID(r13)
+	.endif
 	ld	r10,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r10
 	mtcrf	0x80,r9
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 2c57ece6671c..44526c157bff 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -103,6 +103,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	ori	r12,r12,MSR_FP
 	or	r12,r12,r4
 	std	r12,_MSR(r1)
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
 #endif
 	li	r4,1
 	stb	r4,THREAD_LOAD_FP(r5)
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 409080208a6c..dcac6c74a93c 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -147,7 +147,7 @@ static int kgdb_handle_breakpoint(struct pt_regs *regs)
 		return 0;
 
 	if (*(u32 *)regs->nip == BREAK_INSTR)
-		regs->nip += BREAK_INSTR_SIZE;
+		regs_add_return_ip(regs, BREAK_INSTR_SIZE);
 
 	return 1;
 }
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 660138f6c4b2..a4965a32628a 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -48,7 +48,7 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 			 * Emulate singlestep (and also recover regs->nip)
 			 * as if there is a nop
 			 */
-			regs->nip += MCOUNT_INSN_SIZE;
+			regs_add_return_ip(regs, MCOUNT_INSN_SIZE);
 			if (unlikely(p->post_handler)) {
 				kcb->kprobe_status = KPROBE_HIT_SSDONE;
 				p->post_handler(p, regs, 0);
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e..8165ed71ab51 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -178,7 +178,7 @@ static nokprobe_inline void prepare_singlestep(struct kprobe *p, struct pt_regs
 	 * variant as values in regs could play a part in
 	 * if the trap is taken or not
 	 */
-	regs->nip = (unsigned long)p->ainsn.insn;
+	regs_set_return_ip(regs, (unsigned long)p->ainsn.insn);
 }
 
 static nokprobe_inline void save_previous_kprobe(struct kprobe_ctlblk *kcb)
@@ -415,7 +415,7 @@ static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
 	 * we end up emulating it in kprobe_handler(), which increments the nip
 	 * again.
 	 */
-	regs->nip = orig_ret_address - 4;
+	regs_set_return_ip(regs, orig_ret_address - 4);
 	regs->link = orig_ret_address;
 
 	return 0;
@@ -450,7 +450,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 
 	/* Adjust nip to after the single-stepped instruction */
-	regs->nip = (unsigned long)cur->addr + len;
+	regs_set_return_ip(regs, (unsigned long)cur->addr + len);
 	regs->msr |= kcb->kprobe_saved_msr;
 
 	/*Restore back the original saved kprobes variables and continue. */
@@ -490,7 +490,7 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 		 * and allow the page fault handler to continue as a
 		 * normal page fault.
 		 */
-		regs->nip = (unsigned long)cur->addr;
+		regs_set_return_ip(regs, (unsigned long)cur->addr);
 		regs->msr &= ~MSR_SINGLESTEP; /* Turn off 'trace' bits */
 		regs->msr |= kcb->kprobe_saved_msr;
 		if (kcb->kprobe_status == KPROBE_REENTER)
@@ -523,7 +523,7 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 		 * zero, try to fix up.
 		 */
 		if ((entry = search_exception_tables(regs->nip)) != NULL) {
-			regs->nip = extable_fixup(entry);
+			regs_set_return_ip(regs, extable_fixup(entry));
 			return 1;
 		}
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1e62a70a29aa..ee8e274bbfd1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -98,6 +98,8 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	    !test_thread_flag(TIF_RESTORE_TM)) {
 		tsk->thread.ckpt_regs.msr = tsk->thread.regs->msr;
 		set_thread_flag(TIF_RESTORE_TM);
+		local_paca->hsrr_valid = 0;
+		local_paca->srr_valid = 0;
 	}
 }
 
@@ -162,6 +164,8 @@ static void __giveup_fpu(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 
 void giveup_fpu(struct task_struct *tsk)
@@ -245,6 +249,8 @@ static void __giveup_altivec(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 
 void giveup_altivec(struct task_struct *tsk)
@@ -560,6 +566,8 @@ void notrace restore_math(struct pt_regs *regs)
 		msr_check_and_clear(new_msr);
 
 		regs->msr |= new_msr | fpexc_mode;
+		local_paca->hsrr_valid = 0;
+		local_paca->srr_valid = 0;
 	}
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -1284,6 +1292,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
 			atomic_read(&current->mm->context.vas_windows)))
 			asm volatile(PPC_CP_ABORT);
 	}
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 	return last;
@@ -1873,6 +1883,8 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 EXPORT_SYMBOL(start_thread);
 
@@ -1920,9 +1932,12 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 	if (val > PR_FP_EXC_PRECISE)
 		return -EINVAL;
 	tsk->thread.fpexc_mode = __pack_fe01(val);
-	if (regs != NULL && (regs->msr & MSR_FP) != 0)
+	if (regs != NULL && (regs->msr & MSR_FP) != 0) {
 		regs->msr = (regs->msr & ~(MSR_FE0|MSR_FE1))
 			| tsk->thread.fpexc_mode;
+		local_paca->hsrr_valid = 0;
+		local_paca->srr_valid = 0;
+	}
 	return 0;
 }
 
@@ -1974,6 +1989,9 @@ int set_endian(struct task_struct *tsk, unsigned int val)
 	else
 		return -EINVAL;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d126d71ea5bd..adb92f7d00a1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -46,6 +46,13 @@
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
+static inline void do_enter_rtas(unsigned long args)
+{
+	enter_rtas(args);
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+}
+
 struct rtas_t rtas = {
 	.lock = __ARCH_SPIN_LOCK_UNLOCKED
 };
@@ -384,7 +391,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	save_args = rtas.args;
 	rtas.args = err_args;
 
-	enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas.args));
 
 	err_args = rtas.args;
 	rtas.args = save_args;
@@ -430,7 +437,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	for (i = 0; i < nret; ++i)
 		args->rets[i] = 0;
 
-	enter_rtas(__pa(args));
+	do_enter_rtas(__pa(args));
 }
 
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
@@ -1127,7 +1134,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	flags = lock_rtas();
 
 	rtas.args = args;
-	enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas.args));
 	args = rtas.args;
 
 	/* A -1 return code indicates that the last command couldn't
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 9ded046edb0e..285f036ef3c0 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -214,7 +214,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 			regs->gpr[0] = __NR_restart_syscall;
 		else
 			regs->gpr[3] = regs->orig_gpr3;
-		regs->nip -= 4;
+		regs_add_return_ip(regs, - 4);
 		regs->result = 0;
 	} else {
 		if (trap_is_scv(regs)) {
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 0e3637722e97..6f1309e3c338 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -686,6 +686,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
+
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 }
 
@@ -791,6 +795,10 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		goto badframe;
 
 	set_thread_flag(TIF_RESTOREALL);
+
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 
 badframe:
@@ -866,6 +874,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
 
 	/* Set up "regs" so we "return" to the signal handler. */
+	/* XXX: use set return IP */
 	if (is_elf2_task()) {
 		regs->ctr = (unsigned long) ksig->ka.sa.sa_handler;
 		regs->gpr[12] = regs->ctr;
@@ -898,10 +907,15 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (err)
 		goto badframe;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 
 	return 1;
 }
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..13bf62ccfa18 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -123,6 +123,8 @@ SYSCALL_DEFINE0(switch_endian)
 	struct thread_info *ti;
 
 	current->thread.regs->msr ^= MSR_LE;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 
 	/*
 	 * Set TIF_RESTOREALL so that r3 isn't clobbered on return to
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 6c62e4e87979..c9a5bfeb8a7c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1032,7 +1032,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 #endif /* !__LITTLE_ENDIAN__ */
 
 	/* Go to next instruction */
-	regs->nip += 4;
+	regs_add_return_ip(regs, 4);
 }
 #endif /* CONFIG_VSX */
 
@@ -1478,7 +1478,7 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
@@ -1540,7 +1540,7 @@ static void do_program_check(struct pt_regs *regs)
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
 		switch (emulate_instruction(regs)) {
 		case 0:
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 			return;
 		case -EFAULT:
@@ -1595,7 +1595,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 
 	if (fixed == 1) {
 		/* skip over emulated instruction */
-		regs->nip += inst_length(reason);
+		regs_add_return_ip(regs, inst_length(reason));
 		emulate_single_step(regs);
 		return;
 	}
@@ -1753,7 +1753,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 				pr_err("DSCR based mfspr emulation failed\n");
 				return;
 			}
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 		}
 		return;
@@ -2046,7 +2046,7 @@ DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 	PPC_WARN_EMULATED(altivec, regs);
 	err = emulate_altivec(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2111,7 +2111,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointException)
 
 	err = do_spe_mathemu(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2142,10 +2142,10 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
 		giveup_spe(current);
 	preempt_enable();
 
-	regs->nip -= 4;
+	regs_add_return_ip(regs, - 4);
 	err = speround_handler(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 54dbefcb4cde..02f8925c7919 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -73,6 +73,8 @@ _GLOBAL(load_up_altivec)
 	addi	r5,r4,THREAD		/* Get THREAD */
 	oris	r12,r12,MSR_VEC@h
 	std	r12,_MSR(r1)
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
 #endif
 	li	r4,1
 	stb	r4,THREAD_LOAD_VEC(r5)
@@ -131,6 +133,8 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
 	b	fast_interrupt_return_srr
 
 #endif /* CONFIG_VSX */
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 45bda2520755..96505d4bba1c 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3203,7 +3203,7 @@ void emulate_update_regs(struct pt_regs *regs, struct instruction_op *op)
 	default:
 		WARN_ON_ONCE(1);
 	}
-	regs->nip = next_pc;
+	regs_set_return_ip(regs, next_pc);
 }
 NOKPROBE_SYMBOL(emulate_update_regs);
 
@@ -3480,6 +3480,9 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 	unsigned long val;
 	unsigned long ea;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	r = analyse_instr(&op, regs, instr);
 	if (r < 0)
 		return r;
diff --git a/arch/powerpc/math-emu/math.c b/arch/powerpc/math-emu/math.c
index 30b4b69c6941..d92416d78aee 100644
--- a/arch/powerpc/math-emu/math.c
+++ b/arch/powerpc/math-emu/math.c
@@ -453,7 +453,7 @@ do_mathemu(struct pt_regs *regs)
 		break;
 	}
 
-	regs->nip += 4;
+	regs_add_return_ip(regs, 4);
 	return 0;
 
 illegal:
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..1a7bc261d156 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -100,6 +100,9 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 	bool mmu = (msr & (MSR_IR|MSR_DR));
 	int64_t ret;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	msr &= ~MSR_EE;
 
 	if (unlikely(!mmu))
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 040b9d01c079..af78e7c3108f 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1072,7 +1072,7 @@ int fsl_pci_mcheck_exception(struct pt_regs *regs)
 			ret = get_kernel_nofault(inst, (void *)regs->nip);
 
 		if (!ret && mcheck_handle_load(regs, inst)) {
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			return 1;
 		}
 	}
-- 
2.23.0


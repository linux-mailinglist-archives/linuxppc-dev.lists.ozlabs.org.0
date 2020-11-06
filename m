Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94A2A9917
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:09:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQLf6Jv7zDrKL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eLQvY1xk; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7n5mjCzDrGs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:49 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id e7so1694812pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfSZh6ZLWXbdWIf13js/TTl1qeDP9U8nMKwHLQ2CvkI=;
 b=eLQvY1xkPgJUBysHpMBL01M+4Cu3Ynx9TYR4GU+Hgfcxv3PYgaUVBNA2/EL5VSv3LG
 pyKIIidbwmya+kvnXXc3lAh9AVX+9wtQ1bHnMXXXCuE31ksYWUeBET3RN5oEplbYNDPL
 R4CMwExlapHWJg/wGMdp9rJzRBc4scvZwyO+jIyZ1mBd5qhQi+BEZS3H8lW+0740ICW8
 OHJHEQZLFAIwJZDpntUF4W+AaHNcbjbz+fzbt0Jf/CfhaTklj1mtEEZPpvPHKdalq1s1
 ueeuS+bqeAU8O8IHtulZqn47iVcOwF3VgsQ/vr/YKDhTYpgfs97+MxY9f25YF+B4W5ey
 B7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfSZh6ZLWXbdWIf13js/TTl1qeDP9U8nMKwHLQ2CvkI=;
 b=TBil8oHYQnw7+ZE2LCqDQbtCBT9dC+A6VrC1NBs0vRjY6rHAb0v9iMQd09MrBHjfGF
 W093jvu/ZIBL+oWHyQnJOoH+swmkA0oghz+B6FHqySL4FzJsh7QWyVxtmG4S+hOGvOiT
 YJclyrDoxBxf6lawhLB8jdMVFvF6pRSi4pOgaBBz2sc3jQCER1BF3KDPZyvp/93oG/DZ
 Uf9pdtTGo6Ug0uqYkX4HQJ00r2cgWb0O9yE61n1dF4o6jvZatcLd5NtwFIVwzamE+QcS
 G1DGlAnldnhSxDH5S7sDhnUr06zOt/dimlsZcs0E6gG4YL52aZ98R0E+ZveSsCXFjUet
 Ze/A==
X-Gm-Message-State: AOAM533KLvnevEJ9bROafuGNz3CELhB5J3xiJSsrfwQLhguCQG7LL5r0
 5zavcyNgkotLvQ13DfO+KiWF90XVESc=
X-Google-Smtp-Source: ABdhPJypu2fB/BtHV9BXZsYanTVvrMGPFGi+kMRndBEr3SRR1nrYv1/IOgAnWQruNVfbaDBLU53NkQ==
X-Received: by 2002:a17:90a:9f82:: with SMTP id o2mr266328pjp.52.1604678386292; 
 Fri, 06 Nov 2020 07:59:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/9] powerpc/64s: avoid reloading (H)SRR registers if they
 are still valid
Date: Sat,  7 Nov 2020 01:59:24 +1000
Message-Id: <20201106155929.2246055-5-npiggin@gmail.com>
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

When an interrupt is taken, the SRR registers are set to return to
where it left off. Unless they are modified in the meantime, or the
return address or MSR are modified, there is no need to reload these
registers when returning from interrupt.

Introduce per-CPU flags that track the validity of SRR and HSRR
registers, clear them when returning from interrupt, using the registers
for something else (e.g., OPAL calls), or adjusting return address or MSR.

This improves the performance of interrupt returns.

XXX: 64e build breaks

XXX: may not need to invalidate both hsrr and srr all the time

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig.debug                 |  5 ++
 arch/powerpc/include/asm/paca.h            |  2 +
 arch/powerpc/include/asm/ptrace.h          | 15 +++++
 arch/powerpc/kernel/asm-offsets.c          |  2 +
 arch/powerpc/kernel/entry_64.S             | 75 +++++++++++++++++++---
 arch/powerpc/kernel/exceptions-64s.S       | 27 ++++++++
 arch/powerpc/kernel/fpu.S                  |  2 +
 arch/powerpc/kernel/kgdb.c                 |  2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |  2 +-
 arch/powerpc/kernel/kprobes.c              | 10 +--
 arch/powerpc/kernel/process.c              | 21 +++++-
 arch/powerpc/kernel/rtas.c                 | 13 +++-
 arch/powerpc/kernel/signal.c               |  2 +-
 arch/powerpc/kernel/signal_64.c            | 14 ++++
 arch/powerpc/kernel/syscalls.c             |  2 +
 arch/powerpc/kernel/traps.c                | 18 +++---
 arch/powerpc/kernel/vector.S               |  4 ++
 arch/powerpc/lib/sstep.c                   |  5 +-
 arch/powerpc/math-emu/math.c               |  2 +-
 arch/powerpc/mm/fault.c                    |  2 +-
 arch/powerpc/platforms/powernv/opal-call.c |  3 +
 arch/powerpc/sysdev/fsl_pci.c              |  2 +-
 22 files changed, 197 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index b88900f4832f..ad1f5bf6ab3d 100644
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
index 9454d29ff4b4..58e9995c3184 100644
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
index e2c778c176a3..2c3e773ce292 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -110,6 +110,7 @@ struct pt_regs
 #endif /* __powerpc64__ */
 
 #ifndef __ASSEMBLY__
+#include <asm/paca.h>
 
 static inline unsigned long instruction_pointer(struct pt_regs *regs)
 {
@@ -160,6 +161,20 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 	regs->gpr[3] = rc;
 }
 
+static inline void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+{
+	regs->nip = ip;
+#ifdef CONFIG_PPC_BOOK3S
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
 #ifdef __powerpc64__
 #define user_mode(regs) ((((regs)->msr) >> MSR_PR_LG) & 0x1)
 #else
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index c2722ff36e98..ea13e35dd511 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -210,6 +210,8 @@ int main(void)
 	OFFSET(PACATOC, paca_struct, kernel_toc);
 	OFFSET(PACAKBASE, paca_struct, kernelbase);
 	OFFSET(PACAKMSR, paca_struct, kernel_msr);
+	OFFSET(PACAHSRR_VALID, paca_struct, hsrr_valid);
+	OFFSET(PACASRR_VALID, paca_struct, srr_valid);
 	OFFSET(PACAIRQSOFTMASK, paca_struct, irq_soft_mask);
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 53027fc9cd31..6236a88a592f 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -65,6 +65,30 @@ exception_marker:
 	.align 7
 
 #ifdef CONFIG_PPC_BOOK3S
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
 .macro system_call_vectored name trapnr
 	.globl system_call_vectored_\name
 system_call_vectored_\name:
@@ -289,6 +313,9 @@ END_BTB_FLUSH_SECTION
 	ld	r11,exception_marker@toc(r2)
 	std	r11,-16(r10)		/* "regshere" marker */
 
+	li	r11,1
+	stb	r11,PACASRR_VALID(r13)
+
 	/*
 	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
 	 * would clobber syscall parameters. Also we always enter with IRQs
@@ -310,18 +337,25 @@ END_BTB_FLUSH_SECTION
 	bl	syscall_exit_prepare
 
 	ld	r2,_CCR(r1)
+	ld	r6,_LINK(r1)
+	mtlr	r6
+
+	lbz	r4,PACASRR_VALID(r13)
+	cmpdi	r4,0
+	bne	1f
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
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
@@ -648,7 +682,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	blr
 
 #ifdef CONFIG_PPC_BOOK3S
-
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
 	 * touched, no exit work created, then this can be used.
@@ -683,19 +716,32 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	bne-	.Lrestore_nvgprs_\srr
 
 .Lfast_user_interrupt_return_\srr:
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
 BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
 	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+1:
+	stb	r4,PACASRR_VALID(r13)
 	.else
 	mtspr	SPRN_HSRR0,r11
 	mtspr	SPRN_HSRR1,r12
+1:
+	stb	r4,PACAHSRR_VALID(r13)
 	.endif
+	DEBUG_SRR_VALID \srr
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
@@ -740,15 +786,28 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
+	.ifc \srr,srr
+	lbz	r4,PACASRR_VALID(r13)
+	.else
+	lbz	r4,PACAHSRR_VALID(r13)
+	.endif
+	cmpdi	r4,0
+	li	r4,0
+	bne	1f
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
 	.ifc \srr,srr
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r12
+1:
+	stb	r4,PACASRR_VALID(r13)
 	.else
 	mtspr	SPRN_HSRR0,r11
 	mtspr	SPRN_HSRR1,r12
+1:
+	stb	r4,PACAHSRR_VALID(r13)
 	.endif
+	DEBUG_SRR_VALID \srr
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1f725a3ac2f3..b370a5f334fc 100644
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
@@ -666,10 +680,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -1781,6 +1798,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	 *
 	 * Be careful to avoid touching the kernel stack.
 	 */
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r10
 	mtcrf	0x80,r9
@@ -2611,6 +2630,8 @@ BEGIN_FTR_SECTION
 	ld	r10,PACA_EXGEN+EX_CFAR(r13)
 	mtspr	SPRN_CFAR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
@@ -2783,6 +2804,12 @@ masked_interrupt:
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
index 3ff9a8fafa46..ae80b4a3da48 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -105,6 +105,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
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
index 972cb28174b2..dc35d4f5564f 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -40,7 +40,7 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
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
index 0bdd3ed653df..ea36a29c8b01 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -97,6 +97,8 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	    !test_thread_flag(TIF_RESTORE_TM)) {
 		tsk->thread.ckpt_regs.msr = tsk->thread.regs->msr;
 		set_thread_flag(TIF_RESTORE_TM);
+		local_paca->hsrr_valid = 0;
+		local_paca->srr_valid = 0;
 	}
 }
 
@@ -161,6 +163,8 @@ static void __giveup_fpu(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 
 void giveup_fpu(struct task_struct *tsk)
@@ -244,6 +248,8 @@ static void __giveup_altivec(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 
 void giveup_altivec(struct task_struct *tsk)
@@ -559,6 +565,8 @@ void notrace restore_math(struct pt_regs *regs)
 		msr_check_and_clear(new_msr);
 
 		regs->msr |= new_msr | fpexc_mode;
+		local_paca->hsrr_valid = 0;
+		local_paca->srr_valid = 0;
 	}
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -1295,6 +1303,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
 			atomic_read(&current->mm->context.vas_windows)))
 			asm volatile(PPC_CP_ABORT);
 	}
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 	return last;
@@ -1878,6 +1888,9 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 	thread_pkey_regs_init(&current->thread);
+
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
 }
 EXPORT_SYMBOL(start_thread);
 
@@ -1925,9 +1938,12 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
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
 
@@ -1979,6 +1995,9 @@ int set_endian(struct task_struct *tsk, unsigned int val)
 	else
 		return -EINVAL;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 954f41676f69..85b5541a24f7 100644
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
@@ -1198,7 +1205,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	flags = lock_rtas();
 
 	rtas.args = args;
-	enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas.args));
 	args = rtas.args;
 
 	/* A -1 return code indicates that the last command couldn't
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 44ec7b34b27e..ca1a504d442d 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -242,7 +242,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 			regs->gpr[0] = __NR_restart_syscall;
 		else
 			regs->gpr[3] = regs->orig_gpr3;
-		regs->nip -= 4;
+		regs_add_return_ip(regs, - 4);
 		regs->result = 0;
 	} else {
 		if (trap_is_scv(regs)) {
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index bfc939360bad..8e60c89dcc87 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -693,6 +693,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
+
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 }
 
@@ -798,6 +802,10 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		goto badframe;
 
 	set_thread_flag(TIF_RESTOREALL);
+
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 
 badframe:
@@ -878,6 +886,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
 
 	/* Set up "regs" so we "return" to the signal handler. */
+	/* XXX: use set return IP */
 	if (is_elf2_task()) {
 		regs->ctr = (unsigned long) ksig->ka.sa.sa_handler;
 		regs->gpr[12] = regs->ctr;
@@ -910,6 +919,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (err)
 		goto badframe;
 
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+
 	return 0;
 
 badframe:
@@ -917,6 +929,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		printk_ratelimited(regs->msr & MSR_64BIT ? fmt64 : fmt32,
 				   tsk->comm, tsk->pid, "setup_rt_frame",
 				   (long)frame, regs->nip, regs->link);
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
index 95f84c542523..0796391edd16 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1049,7 +1049,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 #endif /* !__LITTLE_ENDIAN__ */
 
 	/* Go to next instruction */
-	regs->nip += 4;
+	regs_add_return_ip(regs, 4);
 }
 #endif /* CONFIG_VSX */
 
@@ -1487,7 +1487,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
@@ -1549,7 +1549,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
 		switch (emulate_instruction(regs)) {
 		case 0:
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 			return;
 		case -EFAULT:
@@ -1600,7 +1600,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 
 	if (fixed == 1) {
 		/* skip over emulated instruction */
-		regs->nip += inst_length(reason);
+		regs_add_return_ip(regs, inst_length(reason));
 		emulate_single_step(regs);
 		return;
 	}
@@ -1767,7 +1767,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 				pr_err("DSCR based mfspr emulation failed\n");
 				return;
 			}
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 		}
 		return;
@@ -2030,7 +2030,7 @@ DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 	PPC_WARN_EMULATED(altivec, regs);
 	err = emulate_altivec(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2094,7 +2094,7 @@ void SPEFloatingPointException(struct pt_regs *regs)
 
 	err = do_spe_mathemu(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2125,10 +2125,10 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
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
index 2c948e7b0d00..609e3526a66f 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -75,6 +75,8 @@ _GLOBAL(load_up_altivec)
 	addi	r5,r4,THREAD		/* Get THREAD */
 	oris	r12,r12,MSR_VEC@h
 	std	r12,_MSR(r1)
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
 #endif
 	li	r4,1
 	stb	r4,THREAD_LOAD_VEC(r5)
@@ -133,6 +135,8 @@ _GLOBAL(load_up_vsx)
 	/* enable use of VSX after return */
 	oris	r12,r12,MSR_VSX@h
 	std	r12,_MSR(r1)
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
 	b	fast_interrupt_return_srr
 
 #endif /* CONFIG_VSX */
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 855457ed09b5..6c2d6a3c9c8a 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3033,7 +3033,7 @@ void emulate_update_regs(struct pt_regs *regs, struct instruction_op *op)
 	default:
 		WARN_ON_ONCE(1);
 	}
-	regs->nip = next_pc;
+	regs_set_return_ip(regs, next_pc);
 }
 NOKPROBE_SYMBOL(emulate_update_regs);
 
@@ -3310,6 +3310,9 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
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
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 1999982200ab..1d82dc53386f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -615,7 +615,7 @@ void bad_page_fault(struct pt_regs *regs, int sig)
 
 	/* Are we prepared to handle this fault?  */
 	if ((entry = search_exception_tables(regs->nip)) != NULL) {
-		regs->nip = extable_fixup(entry);
+		regs_set_return_ip(regs, extable_fixup(entry));
 		return;
 	}
 
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E83A2C90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G149n0CB4z3cDJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VXknvHix;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VXknvHix; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G147r5N6nz3079
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:44 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso5444829pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ugeWiMGlokfieKasAUot2XMPU2HFwVx6/XWHfV/hxRg=;
 b=VXknvHixlbsxSLr9rwhxazqNLC6GWT7RRTPrJJugNEyFAYj9NKDHQ1ItsBaZEOw7ZO
 NnLOZSvCi1jEikaIr8IZKxPP0uq2M4Y7avIUac//nTqSBwoiO+pwN8eZvg/hnXTBHPZ9
 gI8dhhodlFnrDksz1Yp8mDn1w2L8Djy1kNuyInXprn0zKvUf0O+2LCfZQNlrmERxAHmD
 qWHM+kssAm6YX9Xt97Wrp7qiYbF4/8LL9HAMj6D2ZIE/DobHJBBE2Kj1TAOLdSZl37l9
 CZ7kaJErM0JYTDUpL7N5MVcWLrWpA4b5bEveIgo8l01oXbnOGDIxq+aeajAqNzZuf6lE
 UeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ugeWiMGlokfieKasAUot2XMPU2HFwVx6/XWHfV/hxRg=;
 b=SJ2W0vBQoAmrVkspEKPpTqYMZ+UJdQJzU/HTEWLsPuMVJYwfk/5Olw4rfXe9QWbxIO
 j50hXieJ6t3rXfUhQ6o+Pm/lMoVhSxIr5SnRSly2DJd1B42MxXU3z+KGacbMPT7fVN1U
 nJe5yTkvj1zBNmdv2wU3f0aI2wb8T38LBhO8x6BvMVMSuWZHqTE+rgl4Oom1+2G0ARJA
 Vzgu4+6QAmh+mDbWE61u6H2CFTuy4VVfVr2SxZoVIO/o+GVMacjcmROshRVvEhj7yqgj
 MQgX+vx5l8a5cm8JzDo95+6yxIwncwUCirB5s96f7dQOOZYltxODZ17bxONQ/XOfQN/5
 quMg==
X-Gm-Message-State: AOAM531uyyhR7AiSs90l/VFOYLLiEOX2Cgcw3CIv1xFytla42DbetzT0
 ew1rDnIymCTQd65X7rtGQv8sLGokJ0s=
X-Google-Smtp-Source: ABdhPJzFtGTtypLBj+VDvdYxw9e+kjlMJ5Ib3h25N9wRBF6BGYjO/BmnNZfrB/o4dkOeSiDhZOsQ7g==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id
 s1-20020a170902b181b02900fcc069865cmr4967550plr.28.1623330581059; 
 Thu, 10 Jun 2021 06:09:41 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/11] powerpc/64s: avoid reloading (H)SRR registers if
 they are still valid
Date: Thu, 10 Jun 2021 23:09:13 +1000
Message-Id: <20210610130921.706938-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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

When an interrupt is taken, the SRR registers are set to return to where
it left off. Unless they are modified in the meantime, or the return
address or MSR are modified, there is no need to reload these registers
when returning from interrupt.

Introduce per-CPU flags that track the validity of SRR and HSRR
registers. These are cleared when returning from interrupt, when
using the registers for something else (e.g., OPAL calls), when
adjusting the return address or MSR of a context, and when context
switching (which changes the return address and MSR).

This improves the performance of interrupt returns.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig.debug                 |  5 ++
 arch/powerpc/include/asm/hw_irq.h          | 10 ++-
 arch/powerpc/include/asm/interrupt.h       | 12 +++
 arch/powerpc/include/asm/paca.h            |  4 +
 arch/powerpc/include/asm/ptrace.h          | 74 ++++++++++++-----
 arch/powerpc/kernel/asm-offsets.c          |  4 +
 arch/powerpc/kernel/entry_64.S             | 92 ++++++++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S       | 27 +++++++
 arch/powerpc/kernel/fpu.S                  |  2 +
 arch/powerpc/kernel/kgdb.c                 |  2 +-
 arch/powerpc/kernel/kprobes-ftrace.c       |  2 +-
 arch/powerpc/kernel/kprobes.c              | 10 +--
 arch/powerpc/kernel/process.c              | 26 +++---
 arch/powerpc/kernel/prom_init.c            |  3 +
 arch/powerpc/kernel/rtas.c                 | 14 +++-
 arch/powerpc/kernel/signal.c               |  2 +-
 arch/powerpc/kernel/signal_64.c            |  9 +++
 arch/powerpc/kernel/syscalls.c             |  3 +-
 arch/powerpc/kernel/traps.c                | 18 ++---
 arch/powerpc/kernel/vector.S               |  4 +
 arch/powerpc/kvm/book3s_hv.c               |  3 +
 arch/powerpc/kvm/book3s_pr.c               |  2 +
 arch/powerpc/lib/sstep.c                   |  4 +-
 arch/powerpc/math-emu/math.c               |  2 +-
 arch/powerpc/platforms/powernv/opal-call.c |  4 +
 arch/powerpc/platforms/pseries/hvCall.S    | 29 +++++++
 arch/powerpc/sysdev/fsl_pci.c              |  2 +-
 27 files changed, 306 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 6342f9da4545..205cd77f321f 100644
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
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 56a98936a6a9..19bcef666cf6 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -389,7 +389,15 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 	return !(regs->msr & MSR_EE);
 }
 
-static inline void may_hard_irq_enable(void) { }
+static inline bool may_hard_irq_enable(void)
+{
+	return false;
+}
+
+static inline void do_hard_irq_enable(void)
+{
+	BUILD_BUG();
+}
 
 static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, unsigned long val)
 {
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 59f704408d65..6e9d18838d56 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -73,6 +73,18 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+#ifdef CONFIG_PPC_BOOK3S_64
+static inline void srr_regs_clobbered(void)
+{
+	local_paca->srr_valid = 0;
+	local_paca->hsrr_valid = 0;
+}
+#else
+static inline void srr_regs_clobbered(void)
+{
+}
+#endif
+
 static inline void nap_adjust_return(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_970_NAP
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index ec18ac818e3a..dfc984b0e640 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -169,6 +169,10 @@ struct paca_struct {
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
 #ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	u8 hsrr_valid;			/* HSRRs set for HRFID */
+	u8 srr_valid;			/* SRRs set for RFID */
 #endif
 	u8 irq_soft_mask;		/* mask for irq soft masking */
 	u8 irq_happened;		/* irq happened while soft-disabled */
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 9c9ab2746168..516117bba4e6 100644
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
@@ -171,6 +151,58 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
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
+static inline void regs_set_return_msr(struct pt_regs *regs, unsigned long msr)
+{
+	regs->msr = msr;
+#ifdef CONFIG_PPC_BOOK3S_64
+	local_paca->hsrr_valid = 0;
+	local_paca->srr_valid = 0;
+#endif
+}
+
+static inline void return_ip_or_msr_changed(void)
+{
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
index 28af4efb4587..1c2b869d9d52 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -209,6 +209,10 @@ int main(void)
 	OFFSET(PACATOC, paca_struct, kernel_toc);
 	OFFSET(PACAKBASE, paca_struct, kernelbase);
 	OFFSET(PACAKMSR, paca_struct, kernel_msr);
+#ifdef CONFIG_PPC_BOOK3S
+	OFFSET(PACAHSRR_VALID, paca_struct, hsrr_valid);
+	OFFSET(PACASRR_VALID, paca_struct, srr_valid);
+#endif
 	OFFSET(PACAIRQSOFTMASK, paca_struct, irq_soft_mask);
 	OFFSET(PACAIRQHAPPENED, paca_struct, irq_happened);
 	OFFSET(PACA_FTRACE_ENABLED, paca_struct, ftrace_enabled);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 03a45a88b4b8..9a1d5e5599d3 100644
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
@@ -286,6 +310,11 @@ END_BTB_FLUSH_SECTION
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
@@ -306,18 +335,27 @@ END_BTB_FLUSH_SECTION
 	bl	syscall_exit_prepare
 
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
@@ -673,19 +711,40 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	kuap_user_restore r3, r4
 #endif
 .Lfast_user_interrupt_return_\srr\():
-	ld	r11,_NIP(r1)
-	ld	r12,_MSR(r1)
+
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
@@ -730,15 +789,34 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
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
index 3a63feedae0b..5c18a2a3058d 100644
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
@@ -1825,6 +1842,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	 *
 	 * Be careful to avoid touching the kernel stack.
 	 */
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r10
 	mtcrf	0x80,r9
@@ -2660,6 +2679,8 @@ BEGIN_FTR_SECTION
 	ld	r10,PACA_EXGEN+EX_CFAR(r13)
 	mtspr	SPRN_CFAR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	li	r10,0
+	stb	r10,PACAHSRR_VALID(r13)
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
@@ -2828,6 +2849,12 @@ masked_interrupt:
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
index 7dd2ad3603ad..26163497d69e 100644
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
index 89e34aa273e2..fea5c68daeef 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -96,7 +96,8 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	if (tsk == current && tsk->thread.regs &&
 	    MSR_TM_ACTIVE(tsk->thread.regs->msr) &&
 	    !test_thread_flag(TIF_RESTORE_TM)) {
-		tsk->thread.ckpt_regs.msr = tsk->thread.regs->msr;
+		regs_set_return_msr(&tsk->thread.ckpt_regs,
+						tsk->thread.regs->msr);
 		set_thread_flag(TIF_RESTORE_TM);
 	}
 }
@@ -161,7 +162,7 @@ static void __giveup_fpu(struct task_struct *tsk)
 	msr &= ~(MSR_FP|MSR_FE0|MSR_FE1);
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
-	tsk->thread.regs->msr = msr;
+	regs_set_return_msr(tsk->thread.regs, msr);
 }
 
 void giveup_fpu(struct task_struct *tsk)
@@ -244,7 +245,7 @@ static void __giveup_altivec(struct task_struct *tsk)
 	msr &= ~MSR_VEC;
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
-	tsk->thread.regs->msr = msr;
+	regs_set_return_msr(tsk->thread.regs, msr);
 }
 
 void giveup_altivec(struct task_struct *tsk)
@@ -559,7 +560,7 @@ void notrace restore_math(struct pt_regs *regs)
 
 		msr_check_and_clear(new_msr);
 
-		regs->msr |= new_msr | fpexc_mode;
+		regs_set_return_msr(regs, regs->msr | new_msr | fpexc_mode);
 	}
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -1287,6 +1288,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
+	return_ip_or_msr_changed();
+
 	return last;
 }
 
@@ -1845,6 +1848,9 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 		regs->gpr[2] = 0;
 		regs->msr = MSR_USER32;
 	}
+
+	return_ip_or_msr_changed();
+
 #endif
 #ifdef CONFIG_VSX
 	current->thread.used_vsr = 0;
@@ -1875,7 +1881,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.tm_tfiar = 0;
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-
 }
 EXPORT_SYMBOL(start_thread);
 
@@ -1923,9 +1928,10 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 	if (val > PR_FP_EXC_PRECISE)
 		return -EINVAL;
 	tsk->thread.fpexc_mode = __pack_fe01(val);
-	if (regs != NULL && (regs->msr & MSR_FP) != 0)
-		regs->msr = (regs->msr & ~(MSR_FE0|MSR_FE1))
-			| tsk->thread.fpexc_mode;
+	if (regs != NULL && (regs->msr & MSR_FP) != 0) {
+		regs_set_return_msr(regs, (regs->msr & ~(MSR_FE0|MSR_FE1))
+						| tsk->thread.fpexc_mode);
+	}
 	return 0;
 }
 
@@ -1971,9 +1977,9 @@ int set_endian(struct task_struct *tsk, unsigned int val)
 		return -EINVAL;
 
 	if (val == PR_ENDIAN_BIG)
-		regs->msr &= ~MSR_LE;
+		regs_set_return_msr(regs, regs->msr & ~MSR_LE);
 	else if (val == PR_ENDIAN_LITTLE || val == PR_ENDIAN_PPC_LITTLE)
-		regs->msr |= MSR_LE;
+		regs_set_return_msr(regs, regs->msr | MSR_LE);
 	else
 		return -EINVAL;
 
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 41ed7e33d897..f4774614e7eb 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -31,6 +31,7 @@
 #include <asm/rtas.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <asm/interrupt.h>
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/smp.h>
@@ -1762,6 +1763,8 @@ static int prom_rtas_hcall(uint64_t args)
 	asm volatile("sc 1\n" : "=r" (arg1) :
 			"r" (arg1),
 			"r" (arg2) :);
+	srr_regs_clobbered();
+
 	return arg1;
 }
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 6bada744402b..99f2cce635fb 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -25,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/syscalls.h>
 
+#include <asm/interrupt.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/hvcall.h>
@@ -46,6 +47,13 @@
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
+static inline void do_enter_rtas(unsigned long args)
+{
+	enter_rtas(args);
+
+	srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
+}
+
 struct rtas_t rtas = {
 	.lock = __ARCH_SPIN_LOCK_UNLOCKED
 };
@@ -384,7 +392,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 	save_args = rtas.args;
 	rtas.args = err_args;
 
-	enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas.args));
 
 	err_args = rtas.args;
 	rtas.args = save_args;
@@ -430,7 +438,7 @@ va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	for (i = 0; i < nret; ++i)
 		args->rets[i] = 0;
 
-	enter_rtas(__pa(args));
+	do_enter_rtas(__pa(args));
 }
 
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret, ...)
@@ -1138,7 +1146,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	flags = lock_rtas();
 
 	rtas.args = args;
-	enter_rtas(__pa(&rtas.args));
+	do_enter_rtas(__pa(&rtas.args));
 	args = rtas.args;
 
 	/* A -1 return code indicates that the last command couldn't
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 9ded046edb0e..3f851fa8f5f1 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -214,7 +214,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 			regs->gpr[0] = __NR_restart_syscall;
 		else
 			regs->gpr[3] = regs->orig_gpr3;
-		regs->nip -= 4;
+		regs_add_return_ip(regs, -4);
 		regs->result = 0;
 	} else {
 		if (trap_is_scv(regs)) {
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index dca66481d0c2..4a62faefba0f 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -720,6 +720,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
+
+	return_ip_or_msr_changed();
+
 	return 0;
 
 efault_out:
@@ -832,6 +835,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		goto badframe;
 
 	set_thread_flag(TIF_RESTOREALL);
+
+	return_ip_or_msr_changed();
+
 	return 0;
 
 badframe_block:
@@ -957,12 +963,15 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (err)
 		goto badframe;
 
+	return_ip_or_msr_changed();
+
 	return 0;
 
 badframe_block:
 	user_write_access_end();
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
+	return_ip_or_msr_changed();
 
 	return 1;
 }
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index a552c9e68d7e..bf4ae0f0e36c 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -114,7 +114,8 @@ SYSCALL_DEFINE0(switch_endian)
 {
 	struct thread_info *ti;
 
-	current->thread.regs->msr ^= MSR_LE;
+	regs_set_return_msr(current->thread.regs,
+				current->thread.regs->msr ^ MSR_LE);
 
 	/*
 	 * Set TIF_RESTOREALL so that r3 isn't clobbered on return to
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index b4ab95c9e94a..e413f9908664 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1031,7 +1031,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 #endif /* !__LITTLE_ENDIAN__ */
 
 	/* Go to next instruction */
-	regs->nip += 4;
+	regs_add_return_ip(regs, 4);
 }
 #endif /* CONFIG_VSX */
 
@@ -1476,7 +1476,7 @@ static void do_program_check(struct pt_regs *regs)
 
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
@@ -1538,7 +1538,7 @@ static void do_program_check(struct pt_regs *regs)
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
 		switch (emulate_instruction(regs)) {
 		case 0:
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 			return;
 		case -EFAULT:
@@ -1593,7 +1593,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 
 	if (fixed == 1) {
 		/* skip over emulated instruction */
-		regs->nip += inst_length(reason);
+		regs_add_return_ip(regs, inst_length(reason));
 		emulate_single_step(regs);
 		return;
 	}
@@ -1751,7 +1751,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 				pr_err("DSCR based mfspr emulation failed\n");
 				return;
 			}
-			regs->nip += 4;
+			regs_add_return_ip(regs, 4);
 			emulate_single_step(regs);
 		}
 		return;
@@ -2044,7 +2044,7 @@ DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 	PPC_WARN_EMULATED(altivec, regs);
 	err = emulate_altivec(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2109,7 +2109,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointException)
 
 	err = do_spe_mathemu(regs);
 	if (err == 0) {
-		regs->nip += 4;		/* skip emulated instruction */
+		regs_add_return_ip(regs, 4); /* skip emulated instruction */
 		emulate_single_step(regs);
 		return;
 	}
@@ -2140,10 +2140,10 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
 		giveup_spe(current);
 	preempt_enable();
 
-	regs->nip -= 4;
+	regs_add_return_ip(regs, -4);
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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 28a80d240b76..efd95b867210 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4461,6 +4461,9 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	vcpu->arch.state = KVMPPC_VCPU_NOTREADY;
 	atomic_dec(&kvm->arch.vcpus_running);
+
+	srr_regs_clobbered();
+
 	return r;
 }
 
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index d7733b07f489..1ed5ceee73eb 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -25,6 +25,7 @@
 #include <asm/cputable.h>
 #include <asm/cacheflush.h>
 #include <linux/uaccess.h>
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
@@ -1848,6 +1849,7 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 	/* Make sure we save the guest TAR/EBB/DSCR state */
 	kvmppc_giveup_fac(vcpu, FSCR_TAR_LG);
 
+	srr_regs_clobbered();
 out:
 	vcpu->mode = OUTSIDE_GUEST_MODE;
 	return ret;
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 45bda2520755..90fa3878299a 100644
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
 
@@ -3480,6 +3480,8 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 	unsigned long val;
 	unsigned long ea;
 
+	return_ip_or_msr_changed();
+
 	r = analyse_instr(&op, regs, instr);
 	if (r < 0)
 		return r;
diff --git a/arch/powerpc/math-emu/math.c b/arch/powerpc/math-emu/math.c
index 327165f26ca6..36761bd00f38 100644
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
index 01401e3da7ca..f812c74c61e5 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/percpu.h>
 #include <linux/jump_label.h>
+#include <asm/interrupt.h>
 #include <asm/opal-api.h>
 #include <asm/trace.h>
 #include <asm/asm-prototypes.h>
@@ -100,6 +101,9 @@ static int64_t opal_call(int64_t a0, int64_t a1, int64_t a2, int64_t a3,
 	bool mmu = (msr & (MSR_IR|MSR_DR));
 	int64_t ret;
 
+	/* OPAL call / firmware may use SRR and/or HSRR */
+	srr_regs_clobbered();
+
 	msr &= ~MSR_EE;
 
 	if (unlikely(!mmu))
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 8a2b8d64265b..ab9fc6506861 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -108,6 +108,10 @@ _GLOBAL_TOC(plpar_hcall_norets_notrace)
 	mfcr	r0
 	stw	r0,8(r1)
 	HVSC				/* invoke the hypervisor */
+
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 	blr				/* return r3 = status */
@@ -120,6 +124,9 @@ _GLOBAL_TOC(plpar_hcall_norets)
 	HCALL_BRANCH(plpar_hcall_norets_trace)
 	HVSC				/* invoke the hypervisor */
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 	blr				/* return r3 = status */
@@ -129,6 +136,10 @@ plpar_hcall_norets_trace:
 	HCALL_INST_PRECALL(R4)
 	HVSC
 	HCALL_INST_POSTCALL_NORETS
+
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 	blr
@@ -159,6 +170,9 @@ _GLOBAL_TOC(plpar_hcall)
 	std	r6, 16(r12)
 	std	r7, 24(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
@@ -188,6 +202,9 @@ plpar_hcall_trace:
 
 	HCALL_INST_POSTCALL(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
@@ -223,6 +240,9 @@ _GLOBAL(plpar_hcall_raw)
 	std	r6, 16(r12)
 	std	r7, 24(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
@@ -262,6 +282,9 @@ _GLOBAL_TOC(plpar_hcall9)
 	std	r11,56(r12)
 	std	r0, 64(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
@@ -300,6 +323,9 @@ plpar_hcall9_trace:
 
 	HCALL_INST_POSTCALL(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
@@ -339,6 +365,9 @@ _GLOBAL(plpar_hcall9_raw)
 	std	r11,56(r12)
 	std	r0, 64(r12)
 
+	li	r4,0
+	stb	r4,PACASRR_VALID(r13)
+
 	lwz	r0,8(r1)
 	mtcrf	0xff,r0
 
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 69af73765783..b8f76f3fd994 100644
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


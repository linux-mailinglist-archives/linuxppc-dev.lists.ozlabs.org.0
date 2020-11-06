Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C12A993A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:15:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQTY4lySzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M/j9p9QM; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7w0djZzDrL4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:56 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id u4so1245862pgr.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZewrVgItGZRSNs4AmTlFfWT4gSE5RgtP9c4NRQUrRE=;
 b=M/j9p9QMi0Ukvn0LdMPOIjGUN3rzCZCTSdf7zXhCF6cHTewXO4nWURFaqMXw1z0LdH
 pQAGISHl2w3gs8CIg7EtBXl/26CQs1ZfLs8B/dWUHl00pgpFwa26j0I9erJTXaUf50Ds
 hGyyB4W6H3JRZIpXlfvBJJOgXgV6x2fP4cc6bIMjzMODKwZ3RzqWW26NwbBvySBmI7YQ
 0sJw1i323mhfSAu6t25IsK/D38SsHjsvsiqCda8Io9qT/F7Xl/HMM7Be1UR9mVed/a26
 izvXAKiFk8SybZwhBrOzyeMa5CUCJzcWyOKTrHs1HKgcD+FP7MeXHFAJL8VW13lzB3Zy
 QEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZewrVgItGZRSNs4AmTlFfWT4gSE5RgtP9c4NRQUrRE=;
 b=qV2PZcVUcBMbAPZTXUDhlFqELM8UowGPtYYPgahXVHk7VfJM6dCRNxnhrWoW/dfQI9
 GeONtsr3dKpkuqlCCz0eK5CjFZ3PDHhkPPrzRcPFqd7WaiMncnZcaXh2GMpaIBmaH0uW
 xHAbwbIVan2Uxwl0mXK0I4vito5ndpOQWtSAdDTf7n0yaCFBtjt77zvP6vd7sO9zvR5v
 LLdYZxE7QtDCPAIlyqwcfLRdQygwDgmgvsMHcoSGll7vcsLIYYyrBUHtnXdaIhOmltCh
 CBjofrciHirqzMoRTPXuAjxzeHxqqpWh1E50f6WtJFZ78Weku/VpuGsXtSeehwGSM683
 Xo6A==
X-Gm-Message-State: AOAM532wC4qyOKARXaJcTH0Iy10cQd6vIJRJQ+iG5CUd9iROIM6+ymg2
 MHku6D+nBiOQ5ppvbbZeugF9iUoRvQc=
X-Google-Smtp-Source: ABdhPJx7GHKK6beqcVNV3X9neg4vT9aFpMb0TGo3/xboCByOukVZxEzNPue5LeY0sjP8DETD3uXz0Q==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr2203910pgh.441.1604678393986; 
 Fri, 06 Nov 2020 07:59:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 7/9] powerpc/64s: allow alternate return locations for
 soft-masked interrupts
Date: Sat,  7 Nov 2020 01:59:27 +1000
Message-Id: <20201106155929.2246055-8-npiggin@gmail.com>
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

This is a variation of the exception table code which adjusts a failed
page fault return location if it was taken at an address specified in
an exception table, to a corresponding fixup handler address.

This patch adds a similar masked interrupt restart table that is checked
when when an asynchronous interrupt is taken while soft-masked.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 18 ++++++++++++++
 arch/powerpc/include/asm/ppc_asm.h   |  8 +++++++
 arch/powerpc/kernel/exceptions-64s.S | 36 +++++++++++++++++++++++++++-
 arch/powerpc/kernel/interrupt_64.S   |  3 +++
 arch/powerpc/kernel/vmlinux.lds.S    | 10 ++++++++
 arch/powerpc/lib/Makefile            |  2 +-
 arch/powerpc/lib/restart_table.c     | 26 ++++++++++++++++++++
 arch/powerpc/perf/core-book3s.c      | 19 ++++++++++++---
 8 files changed, 117 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/lib/restart_table.c

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 1aeb9a841cc6..5d68c510e5e0 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -18,6 +18,11 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
+#ifdef CONFIG_PPC_BOOK3S_64
+extern char __end_soft_masked[];
+unsigned long search_kernel_restart_table(unsigned long addr);
+#endif
+
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
@@ -47,6 +52,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		 */
 		if (TRAP(regs) != 0x700)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+		BUG_ON(regs->nip < (unsigned long)__end_soft_masked));
+		if (arch_irq_disabled_regs(regs))
+			BUG_ON(search_kernel_restart_table(regs->nip));
 	}
 #endif
 
@@ -126,6 +134,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 {
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3S_64
+	if (!(regs->msr & MSR_PR) && regs->nip < (unsigned long)__end_soft_masked)
+		regs->softe = IRQS_ALL_DISABLED;
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
 
@@ -163,6 +173,14 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 	nap_adjust_return(regs);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (arch_irq_disabled_regs(regs)) {
+		unsigned long rst = search_kernel_restart_table(regs->nip);
+		if (rst)
+			regs_set_return_ip(regs, rst);
+	}
+#endif
+
 #ifdef CONFIG_PPC64
 	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index c1199f6c75a3..da084d695cfe 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -791,6 +791,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 	stringify_in_c(.long (_target) - . ;)	\
 	stringify_in_c(.previous)
 
+#define RESTART_TABLE(_start, _end, _target)	\
+	stringify_in_c(.section __restart_table,"a";)\
+	stringify_in_c(.balign 8;)		\
+	stringify_in_c(.llong (_start);)	\
+	stringify_in_c(.llong (_end);)		\
+	stringify_in_c(.llong (_target);)	\
+	stringify_in_c(.previous)
+
 #ifdef CONFIG_PPC_FSL_BOOK3E
 #define BTB_FLUSH(reg)			\
 	lis reg,BUCSR_INIT@h;		\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a01f69e774b5..0615c2e724ea 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -514,8 +514,9 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 		/* Kernel code running below __end_interrupts is implicitly
 		 * soft-masked */
-		LOAD_HANDLER(r10, __end_interrupts)
+		LOAD_HANDLER(r10, __end_soft_masked)
 		cmpld	r11,r10
+
 		li	r10,IMASK
 		blt-	1f
 
@@ -673,6 +674,28 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	__GEN_COMMON_BODY \name
 .endm
 
+.macro SEARCH_RESTART_TABLE
+	LOAD_REG_IMMEDIATE_SYM(r9, r12, __start___restart_table)
+	LOAD_REG_IMMEDIATE_SYM(r10, r12, __stop___restart_table)
+300:
+	cmpd	r9,r10
+	beq	302f
+	ld	r12,0(r9)
+	cmpld	r11,r12
+	blt	301f
+	ld	r12,8(r9)
+	cmpld	r11,r12
+	bge	301f
+	ld	r12,16(r9)
+	b	303f
+301:
+	addi	r9,r9,24
+	b	300b
+302:
+	li	r12,0
+303:
+.endm
+
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -2758,6 +2781,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mtmsrd	r9,1
 
 	kuap_restore_amr r9, r10
+
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
@@ -2815,6 +2839,16 @@ masked_interrupt:
 	stb	r9,PACASRR_VALID(r13)
 	.endif
 
+	SEARCH_RESTART_TABLE
+	cmpdi	r12,0
+	beq	3f
+	.if \hsrr
+	mtspr	SPRN_HSRR0,r12
+	.else
+	mtspr	SPRN_SRR0,r12
+	.endif
+3:
+
 	ld	r9,PACA_EXGEN+EX_CTR(r13)
 	mtctr	r9
 	lwz	r9,PACA_EXGEN+EX_CCR(r13)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index e121829ef717..9b44f6d3463b 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -605,4 +605,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 interrupt_return_macro srr
 interrupt_return_macro hsrr
 
+	.globl __end_soft_masked
+__end_soft_masked:
+DEFINE_FIXED_SYMBOL(__end_soft_masked)
 #endif /* CONFIG_PPC_BOOK3S */
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index e0548b4950de..211c82e96420 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -9,6 +9,14 @@
 #define EMITS_PT_NOTE
 #define RO_EXCEPTION_TABLE_ALIGN	0
 
+#define RESTART_TABLE(align)						\
+	. = ALIGN(align);						\
+	__restart_table : AT(ADDR(__restart_table) - LOAD_OFFSET) {	\
+		__start___restart_table = .;				\
+		KEEP(*(__restart_table))				\
+		__stop___restart_table = .;				\
+	}
+
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/cache.h>
@@ -124,6 +132,8 @@ SECTIONS
 	RO_DATA(PAGE_SIZE)
 
 #ifdef CONFIG_PPC64
+	RESTART_TABLE(8)
+
 	. = ALIGN(8);
 	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
 		__start___stf_entry_barrier_fixup = .;
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 69a91b571845..5d90bebcf9cf 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -36,7 +36,7 @@ extra-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-			       memcpy_power7.o
+			       memcpy_power7.o restart_table.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o copy_mc_64.o
diff --git a/arch/powerpc/lib/restart_table.c b/arch/powerpc/lib/restart_table.c
new file mode 100644
index 000000000000..f2df84c46f24
--- /dev/null
+++ b/arch/powerpc/lib/restart_table.c
@@ -0,0 +1,26 @@
+struct restart_table_entry {
+	unsigned long start;
+	unsigned long end;
+	unsigned long fixup;
+};
+
+extern struct restart_table_entry __start___restart_table[];
+extern struct restart_table_entry __stop___restart_table[];
+
+/* Given an address, look for it in the kernel exception table */
+unsigned long search_kernel_restart_table(unsigned long addr)
+{
+	struct restart_table_entry *rte = __start___restart_table;
+
+	while (rte < __stop___restart_table) {
+		unsigned long start = rte->start;
+		unsigned long end = rte->end;
+		unsigned long fixup = rte->fixup;
+
+		if (addr >= start && addr < end)
+			return fixup;
+
+		rte++;
+	}
+	return 0;
+}
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cba1494..4afd292a7a5e 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -332,9 +332,15 @@ static inline void perf_read_regs(struct pt_regs *regs)
  * If interrupts were soft-disabled when a PMU interrupt occurs, treat
  * it as an NMI.
  */
+extern char __end_soft_masked[];
 static inline int perf_intr_is_nmi(struct pt_regs *regs)
 {
-	return (regs->softe & IRQS_DISABLED);
+	if (regs->softe & IRQS_DISABLED)
+		return true;
+
+	if (!(regs->msr & MSR_PR) && regs->nip < (unsigned long)__end_soft_masked)
+		return true;
+	return false;
 }
 
 /*
@@ -2214,6 +2220,8 @@ static bool pmc_overflow(unsigned long val)
 	return false;
 }
 
+unsigned long search_kernel_restart_table(unsigned long addr);
+
 /*
  * Performance monitor interrupt stuff
  */
@@ -2301,10 +2309,15 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	 */
 	write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
 
-	if (nmi)
+	if (nmi) {
+		unsigned long rst = search_kernel_restart_table(regs->nip);
+		if (rst)
+			regs_set_return_ip(regs, rst);
+
 		nmi_exit();
-	else
+	} else {
 		irq_exit();
+	}
 }
 
 static void perf_event_interrupt(struct pt_regs *regs)
-- 
2.23.0


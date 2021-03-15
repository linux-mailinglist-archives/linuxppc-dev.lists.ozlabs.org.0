Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E433C90D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:08:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrC94fvnz3bpD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:08:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TYrHkBWy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TYrHkBWy; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7546M1z302v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:33 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so332608pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7P89k8i40fnB3JT0nHFkNqteenqWjWrlTo5SYfnS5S4=;
 b=TYrHkBWyPuT2EJiZKVnqhYehuB7s38GRKlb0r/4Hk93Y2SPSdLTsepN7yOcEiJaCvI
 2B0K9MfDHkw6NwDrun3i9A2M38evTAF+ivpw2qdy/higPI2Gu8AxwZb2b2Em2QNTodxN
 LHFkAETkH3jC2aU+upOhjari/wduBh6eFeQJEX0dyu+TSVxCFRWN58wBkX9WXilJJhHU
 Ew57Q+3DAcCG2nIUUD9Y5OppKzzlBFlhU+tOA9LfWSjPhUSnZXwMPoERopXaeNKOybzZ
 YhYmjn2bmKWGzHi3x4D6CpN+3oyWAXdF3K/RGZ1UxVK9hrNRyrCjogjb/qtvKvXjRgqq
 uhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7P89k8i40fnB3JT0nHFkNqteenqWjWrlTo5SYfnS5S4=;
 b=Wz7c0M5qwHw3HCCJANDGc18y5+JQOS9IHrQHDt1pcanC4/Lglf2C8MbS+j53auSbCU
 TTQ83dRFwYYKmjrt4n9qI9QxMtmXey84ogNxWU/Nv2GXB/dIubK7CS56qAZfGLH9Hdh8
 DaICPsKqyeL/LGGCR4QikUt6Cc6t3/Zlku7tZKu2R5qKcwrzvRLEGC4fmPrK3IURa7V7
 3LQoMjXATnJAZiZ1onwgHxz2rYzop6gLfraMfWEixTTSg+K7A1fVxcDRiF0BwowVx8nF
 z6OjnONRq78YGRfb5WceuA5w9bh/FVuPhbCqYa7cLdmLK06WFQLVNcK2V7mTl2/TGtoV
 QgBg==
X-Gm-Message-State: AOAM530QgQFkln4ZgK84sDaoU0atHKTtUWrnS8p2lKoL8B4gxMWbFNvV
 CgVBc3zde/C73GSjDBDPM+CE8sdAX1I=
X-Google-Smtp-Source: ABdhPJwa3wg4nQ4VkJo3mcogAvRKZaJQ1MUW6GeK4AM76+PDh3z+QfBR4134nmsXO+tD/dclagf2kA==
X-Received: by 2002:a17:902:7246:b029:e6:78c4:48d8 with SMTP id
 c6-20020a1709027246b02900e678c448d8mr14323568pll.18.1615845870730; 
 Mon, 15 Mar 2021 15:04:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/14] powerpc/64: allow alternate return locations for
 soft-masked interrupts
Date: Tue, 16 Mar 2021 08:03:55 +1000
Message-Id: <20210315220402.260594-8-npiggin@gmail.com>
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

The exception table fixup adjusts a failed page fault's interrupt return
location if it was taken at an address specified in the exception table,
to a corresponding fixup handler address.

Introduce a variation of that idea which adds a fixup table for NMIs and
soft-masked asynchronous interrupts. This will be used to protect
certain critical sections that are sensitive to being clobbered by
interrupts coming in (due to using the same SPRs and/or irq soft-mask
state).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 13 ++++++++++
 arch/powerpc/include/asm/ppc_asm.h   |  8 ++++++
 arch/powerpc/kernel/exceptions-64e.S | 37 ++++++++++++++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S | 33 +++++++++++++++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S    | 10 ++++++++
 arch/powerpc/lib/Makefile            |  2 +-
 arch/powerpc/lib/restart_table.c     | 29 ++++++++++++++++++++++
 7 files changed, 129 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/lib/restart_table.c

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index dfa50bb3734d..5cdbd3630254 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -9,6 +9,11 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+#ifdef CONFIG_PPC64
+extern char __end_soft_masked[];
+unsigned long search_kernel_restart_table(unsigned long addr);
+#endif
+
 static inline void nap_adjust_return(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_970_NAP
@@ -183,6 +188,14 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	 * new work to do (must use irq_work for that).
 	 */
 
+#ifdef CONFIG_PPC64
+	if (arch_irq_disabled_regs(regs)) {
+		unsigned long rst = search_kernel_restart_table(regs->nip);
+		if (rst)
+			regs_set_return_ip(regs, rst);
+	}
+#endif
+
 #ifdef CONFIG_PPC64
 	if (nmi_disables_ftrace(regs))
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 8998122fc7e2..03447f79f684 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -782,6 +782,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
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
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 86612f68f5bd..69d0d63cee85 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -883,6 +883,28 @@ kernel_dbg_exc:
 	bl	unknown_exception
 	b	interrupt_return
 
+.macro SEARCH_RESTART_TABLE
+	LOAD_REG_IMMEDIATE_SYM(r14, r11, __start___restart_table)
+	LOAD_REG_IMMEDIATE_SYM(r15, r11, __stop___restart_table)
+300:
+	cmpd	r14,r15
+	beq	302f
+	ld	r11,0(r14)
+	cmpld	r10,r11
+	blt	301f
+	ld	r11,8(r14)
+	cmpld	r10,r11
+	bge	301f
+	ld	r11,16(r14)
+	b	303f
+301:
+	addi	r14,r14,24
+	b	300b
+302:
+	li	r11,0
+303:
+.endm
+
 /*
  * An interrupt came in while soft-disabled; We mark paca->irq_happened
  * accordingly and if the interrupt is level sensitive, we hard disable
@@ -891,6 +913,9 @@ kernel_dbg_exc:
  */
 
 .macro masked_interrupt_book3e paca_irq full_mask
+	std	r14,PACA_EXGEN+EX_R14(r13)
+	std	r15,PACA_EXGEN+EX_R15(r13)
+
 	lbz	r10,PACAIRQHAPPENED(r13)
 	.if \full_mask == 1
 	ori	r10,r10,\paca_irq | PACA_IRQ_HARD_DIS
@@ -900,15 +925,23 @@ kernel_dbg_exc:
 	stb	r10,PACAIRQHAPPENED(r13)
 
 	.if \full_mask == 1
-	rldicl	r10,r11,48,1		/* clear MSR_EE */
-	rotldi	r11,r10,16
+	xori	r11,r11,MSR_EE		/* clear MSR_EE */
 	mtspr	SPRN_SRR1,r11
 	.endif
 
+	mfspr	r10,SPRN_SRR0
+	SEARCH_RESTART_TABLE
+	cmpdi	r11,0
+	beq	1f
+	mtspr	SPRN_SRR0,r11		/* return to restart address */
+1:
+
 	lwz	r11,PACA_EXGEN+EX_CR(r13)
 	mtcr	r11
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	mfspr	r13,SPRN_SPRG_GEN_SCRATCH
 	rfi
 	b	.
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index a5a0b17f77bf..32b11431ac4a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -675,6 +675,28 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -2810,6 +2832,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mtmsrd	r9,1
 
 	kuap_kernel_restore r9, r10
+
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
@@ -2867,6 +2890,16 @@ masked_interrupt:
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
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 582009dacef4..badcca54e968 100644
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
index d4efc182662a..a9bbd80e2748 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -39,7 +39,7 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 			       memcpy_power7.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
-	   memcpy_64.o copy_mc_64.o
+	   memcpy_64.o copy_mc_64.o restart_table.o
 
 ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 obj64-$(CONFIG_SMP)	+= locks.o
diff --git a/arch/powerpc/lib/restart_table.c b/arch/powerpc/lib/restart_table.c
new file mode 100644
index 000000000000..3ccb31914036
--- /dev/null
+++ b/arch/powerpc/lib/restart_table.c
@@ -0,0 +1,29 @@
+#include <asm/kprobes.h>
+
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
+NOKPROBE_SYMBOL(search_kernel_restart_table);
-- 
2.23.0


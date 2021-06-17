Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A98123AB7F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:55:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RTq2RdRz3dp4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:55:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gSauFakW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gSauFakW; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPb0Xv7z3c0p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:46 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id k5so4029402pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aj0B8uE+Lcnm17IV8n33ayK9IQj3ckvGHemI1xs0Jd0=;
 b=gSauFakWHJdYS+zAPjnG3vzAfM8bppnfo8cQtOBS/W+dB2rUzldT3HYSyBnKOfbTZt
 MIdRHgCFunlDFuBmVlbJ7FtXqgZIgfVGcK3dz5/VNlHmgQ0jAMZRofpLaTf/eB0QGXhQ
 6W9FLP06JsHGWf9Yp3CjkTYG+ndmUWlsFqJRI7zhBgQTkfhh+X4/54C9qfaN7tCqtqnR
 tUsxavSTwWiEkqROhK1Ot4TJqZ7d6C7o3Dtmgajt07wxlV0YBmm+ULCUHq2E24bowuyi
 dVHUc/nNXylG99vaJ34no54RV5yftU9GKJj/QeMdC3Tt2PqlLOvUUJ3nGFVetN6c+hxp
 Bzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aj0B8uE+Lcnm17IV8n33ayK9IQj3ckvGHemI1xs0Jd0=;
 b=jQ7bye9wYjAePvsm8+BaH5VpFf9WjUsOnRaGk7AjzVa87mW0k4QEziC1/NKEdZeapN
 XNOxlrVlYVrdx4IQMhJ9U1wy8xaObk5NDNdVnl/x6TyB3M2iLc+KcofTSukbDM5wXaeR
 BsDqd7C1VyIBj0xLehmTzBFsQdEnIG3KEIhDYX8ufAUtSSV1ecgdD/t9ilv59hG6RO+f
 ckM74QQtsYqhqjPNuphdJ3fdNiyWzxKzIFHOxiK/Of7A8aspVBKphuFrzH0j01F3jgIh
 aHtjePCSeKf53IsrmGD/jIafA2qTcQxs4TlQrqMgsM2nwtU6kwLl26QlziD1qNJF21/4
 gnvw==
X-Gm-Message-State: AOAM533sVFiSIrYNjr1RNs5g7OHVoMHI9q9bw4u0VzGHiFO3hkK8uqW9
 i7be3aAx7y2vqM1hNPzxrfcrd4DMWCk=
X-Google-Smtp-Source: ABdhPJyZvSedrmVPQdB5nv3ooxZp/zY6eOQvpbz78wboU2q6FWJsYPO+MkhvccNrv0tQScUQFUW1VQ==
X-Received: by 2002:a17:902:b707:b029:11a:b005:acf7 with SMTP id
 d7-20020a170902b707b029011ab005acf7mr602765pls.26.1623945104073; 
 Thu, 17 Jun 2021 08:51:44 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/17] powerpc/64: allow alternate return locations for
 soft-masked interrupts
Date: Fri, 18 Jun 2021 01:51:08 +1000
Message-Id: <20210617155116.2167984-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h | 13 +++++++++
 arch/powerpc/include/asm/ppc_asm.h   |  8 ++++++
 arch/powerpc/kernel/exceptions-64e.S | 37 +++++++++++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S | 41 ++++++++++++++++++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S    | 10 +++++++
 arch/powerpc/lib/Makefile            |  2 +-
 arch/powerpc/lib/restart_table.c     | 30 ++++++++++++++++++++
 7 files changed, 138 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/lib/restart_table.c

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b9c510187b58..49d9a6fd1bb9 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -73,6 +73,11 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+#ifdef CONFIG_PPC64
+extern char __end_soft_masked[];
+unsigned long search_kernel_restart_table(unsigned long addr);
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 static inline void srr_regs_clobbered(void)
 {
@@ -287,6 +292,14 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
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
index d6739d700f0a..c9c2c36c1f8f 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -762,6 +762,14 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
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
index b35c97c7082f..1b79f8a75298 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -901,6 +901,28 @@ kernel_dbg_exc:
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
@@ -909,6 +931,9 @@ kernel_dbg_exc:
  */
 
 .macro masked_interrupt_book3e paca_irq full_mask
+	std	r14,PACA_EXGEN+EX_R14(r13)
+	std	r15,PACA_EXGEN+EX_R15(r13)
+
 	lbz	r10,PACAIRQHAPPENED(r13)
 	.if \full_mask == 1
 	ori	r10,r10,\paca_irq | PACA_IRQ_HARD_DIS
@@ -918,15 +943,23 @@ kernel_dbg_exc:
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
index 0ba8c2387aac..17a213f25c92 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -664,6 +664,36 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	__GEN_COMMON_BODY \name
 .endm
 
+.macro SEARCH_RESTART_TABLE
+#ifdef CONFIG_RELOCATABLE
+	mr	r12,r2
+	ld	r2,PACATOC(r13)
+	LOAD_REG_ADDR(r9, __start___restart_table)
+	LOAD_REG_ADDR(r10, __stop___restart_table)
+	mr	r2,r12
+#else
+	LOAD_REG_IMMEDIATE_SYM(r9, r12, __start___restart_table)
+	LOAD_REG_IMMEDIATE_SYM(r10, r12, __stop___restart_table)
+#endif
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
@@ -2771,6 +2801,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mtmsrd	r9,1
 
 	kuap_kernel_restore r9, r10
+
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
@@ -2828,6 +2859,16 @@ masked_interrupt:
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
index 72fa3c00229a..16c5e13e00c4 100644
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
index cc1a8a0f311e..4c92c80454f3 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -42,7 +42,7 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 			       memcpy_power7.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
-	   memcpy_64.o copy_mc_64.o
+	   memcpy_64.o copy_mc_64.o restart_table.o
 
 ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 obj64-$(CONFIG_SMP)	+= locks.o
diff --git a/arch/powerpc/lib/restart_table.c b/arch/powerpc/lib/restart_table.c
new file mode 100644
index 000000000000..7cd20757cc33
--- /dev/null
+++ b/arch/powerpc/lib/restart_table.c
@@ -0,0 +1,30 @@
+#include <asm/interrupt.h>
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


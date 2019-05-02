Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E858E1128F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:23:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vkFR1xkfzDq8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 15:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YzUaWJG6"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vkCt6VdDzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 15:22:18 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j11so538823pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUypN2ug/1fHg81x2rJmk0JyCvhNfiwq4bQW5C94vyc=;
 b=YzUaWJG6+S+2CH2YXdQ/EMcqnZ2EQM9hvEOmV2Mqqky7qKpIaxWAukJHpzPE6i2ebp
 fyqi7zZahnSxmthd4fHAATu1cN825K7WdObQA57OJ4qcVPtNfiig+WHgIW6A5OtzfgIn
 E8gpfjkKPTwyl/LwT+QnZXhmogeGWVcNNWKS+XUVR+xw2fRxXWpO72nqbTuww1SiYZcy
 j5ksrTw4aU0rq//5Xsx/9DihiP+1FASKPeL7UgA1w/O4M685pFTQZpR7J+0sx7EfQoyZ
 wA1k4R5Vlz1dbZtzc74rlFFmE9evyK8cTjsh7HA38wiZaZcWGPUmEzrYGwjh1hr7yV4o
 yg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUypN2ug/1fHg81x2rJmk0JyCvhNfiwq4bQW5C94vyc=;
 b=Qs+pJGdvpK20FYr6p4AmFfHjthYrL0qKO5XGR5O4+0peynCVSrlHJke8c9ARPQ/rdQ
 LO9SmWASjAdv0+1zhjx/5+l2gBhXdime056ojdextLFDJRVWhwOrvDyWuhM2A4e00LeW
 kkrT9uMnVmYJhueENP9Lzsf9Yz25Ma+IxHXBxF7y9wirGmCUlsxtzJ1JU0o2IendEyQc
 jLrv7tBy5waHrsTwIq3etCd2Td08nh5Nv+7c4EWdrkzWyvWp/Eb8k1gdFAmDEUNA28dI
 yQWQmcXliO7Y2m9+dnt/USbXQBa+jdUoRHSs0vthQEnjY53xICiL29TXPQZ4z3tNCrix
 k2tQ==
X-Gm-Message-State: APjAAAUgBYHb6vuCOtNDP7AL7BYCx5k0Iqb7fjm2uDViPfJDGO5rEOm/
 Ahbb4tcl2BBrNT+tNg+YjeIuM8fR
X-Google-Smtp-Source: APXvYqxNRYaGRLW7p4saiczkIbAx9O2Ev4zFxWBMVDojKOPnFEhfzPOLYKJQAzRpIQaOaLOPIqzmbw==
X-Received: by 2002:a62:d5c9:: with SMTP id d192mr1913276pfg.109.1556774536239; 
 Wed, 01 May 2019 22:22:16 -0700 (PDT)
Received: from bobo.local0.net ([61.68.7.233])
 by smtp.gmail.com with ESMTPSA id f2sm80430773pgc.30.2019.05.01.22.22.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 22:22:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: remplement power4_idle code in C
Date: Thu,  2 May 2019 15:22:07 +1000
Message-Id: <20190502052207.24894-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

This implements the tricky tracing and soft irq handling bits in C,
leaving the low level bit to asm.

A functional difference is that this redirects the interrupt exit to
a return stub to execute blr, rather than the lr address itself. This
is probably irrelevant or barely measurable on real hardware, but it
follows the modern practice of balancing the link stack.

Tested with QEMU.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/processor.h |  3 +
 arch/powerpc/kernel/Makefile         |  3 +-
 arch/powerpc/kernel/exceptions-64s.S |  9 ---
 arch/powerpc/kernel/idle.c           | 25 ++++++++
 arch/powerpc/kernel/idle_book3s.S    | 35 +++++++++++
 arch/powerpc/kernel/idle_power4.S    | 87 ----------------------------
 arch/powerpc/platforms/Kconfig       |  4 ++
 7 files changed, 68 insertions(+), 98 deletions(-)
 delete mode 100644 arch/powerpc/kernel/idle_power4.S

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 706ac5df546f..c0d870c57061 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -418,6 +418,9 @@ static inline unsigned long get_clean_sp(unsigned long sp, int is_32)
 extern unsigned long isa300_idle_stop_noloss(unsigned long psscr_val);
 extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
 extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
+#ifdef CONFIG_PPC_970_NAP
+extern void power4_idle_nap(void);
+#endif
 
 extern unsigned long cpuidle_disable;
 enum idle_boot_override {IDLE_NO_OVERRIDE = 0, IDLE_POWERSAVE_OFF};
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index cddadccf551d..2af8ee47b2ee 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -51,8 +51,7 @@ obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_book3e.o
 obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
 obj-$(CONFIG_PPC64)		+= vdso64/
 obj-$(CONFIG_ALTIVEC)		+= vecemu.o
-obj-$(CONFIG_PPC_970_NAP)	+= idle_power4.o
-obj-$(CONFIG_PPC_P7_NAP)	+= idle_book3s.o
+obj-$(CONFIG_PPC_BOOK3S_IDLE)	+= idle_book3s.o
 procfs-y			:= proc_powerpc.o
 obj-$(CONFIG_PROC_FS)		+= $(procfs-y)
 rtaspci-$(CONFIG_PPC64)-$(CONFIG_PCI)	:= rtas_pci.o
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6b86055e5251..e173690dad52 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1683,15 +1683,6 @@ USE_FIXED_SECTION(virt_trampolines)
 __end_interrupts:
 DEFINE_FIXED_SYMBOL(__end_interrupts)
 
-#ifdef CONFIG_PPC_970_NAP
-EXC_COMMON_BEGIN(power4_fixup_nap)
-	andc	r9,r9,r10
-	std	r9,TI_LOCAL_FLAGS(r11)
-	ld	r10,_LINK(r1)		/* make idle task do the */
-	std	r10,_NIP(r1)		/* equivalent of a blr */
-	blr
-#endif
-
 CLOSE_FIXED_SECTION(real_vectors);
 CLOSE_FIXED_SECTION(real_trampolines);
 CLOSE_FIXED_SECTION(virt_vectors);
diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index d7216c9abda1..605defde43b9 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -81,6 +81,31 @@ void arch_cpu_idle(void)
 
 int powersave_nap;
 
+#ifdef CONFIG_PPC_970_NAP
+void power4_idle(void)
+{
+	if (!cpu_has_feature(CPU_FTR_CAN_NAP))
+		return;
+
+	if (!powersave_nap)
+		return;
+
+	if (!prep_irq_for_idle())
+		return;
+
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		asm volatile("DSSALL ; sync" ::: "memory");
+
+	power4_idle_nap();
+
+	/*
+	 * power4_idle_nap returns with interrupts enabled (soft and hard).
+	 * to our caller with interrupts enabled (soft and hard). Our caller
+	 * can cope with either interrupts disabled or enabled upon return.
+	 */
+}
+#endif
+
 #ifdef CONFIG_SYSCTL
 /*
  * Register the sysctl to set/clear powersave_nap.
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 2dfbd5d5b932..5afac9177fec 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -19,7 +19,9 @@
 #include <asm/asm-offsets.h>
 #include <asm/ppc-opcode.h>
 #include <asm/cpuidle.h>
+#include <asm/thread_info.h> /* TLF_NAPPING */
 
+#ifdef CONFIG_PPC_P7_NAP
 /*
  * Desired PSSCR in r3
  *
@@ -185,4 +187,37 @@ _GLOBAL(isa206_idle_insn_mayloss)
 	bne	2f
 	IDLE_STATE_ENTER_SEQ_NORET(PPC_SLEEP)
 2:	IDLE_STATE_ENTER_SEQ_NORET(PPC_WINKLE)
+#endif
 
+#ifdef CONFIG_PPC_970_NAP
+_GLOBAL(power4_idle_nap)
+	LOAD_REG_IMMEDIATE(r7, MSR_KERNEL|MSR_EE|MSR_POW)
+	ld	r9,PACA_THREAD_INFO(r13)
+	ld	r8,TI_LOCAL_FLAGS(r9)
+	ori	r8,r8,_TLF_NAPPING
+	std	r8,TI_LOCAL_FLAGS(r9)
+	/*
+	 * NAPPING bit is set, from this point onward power4_fixup_nap
+	 * will cause exceptions to return to power4_idle_nap_return.
+	 */
+1:	sync
+	isync
+	mtmsrd	r7
+	isync
+	b	1b
+power4_idle_nap_return:
+	blr
+
+	/*
+	 * Called by exception entry code if _TLF_NAPPING was set, this clear
+	 * the NAPPING flag, and redirects the exception exit to
+	 * power4_fixup_nap_return.
+	 */
+	.globl power4_fixup_nap
+power4_fixup_nap:
+	andc	r9,r9,r10
+	std	r9,TI_LOCAL_FLAGS(r11)
+	LOAD_REG_ADDR(r10, power4_idle_nap_return)
+	std	r10,_NIP(r1)
+	blr
+#endif
diff --git a/arch/powerpc/kernel/idle_power4.S b/arch/powerpc/kernel/idle_power4.S
deleted file mode 100644
index a2fdb0a34b75..000000000000
--- a/arch/powerpc/kernel/idle_power4.S
+++ /dev/null
@@ -1,87 +0,0 @@
-/*
- *  This file contains the power_save function for 970-family CPUs.
- *
- *  This program is free software; you can redistribute it and/or
- *  modify it under the terms of the GNU General Public License
- *  as published by the Free Software Foundation; either version
- *  2 of the License, or (at your option) any later version.
- */
-
-#include <linux/threads.h>
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/cputable.h>
-#include <asm/thread_info.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/irqflags.h>
-#include <asm/hw_irq.h>
-#include <asm/feature-fixups.h>
-
-#undef DEBUG
-
-	.text
-
-_GLOBAL(power4_idle)
-BEGIN_FTR_SECTION
-	blr
-END_FTR_SECTION_IFCLR(CPU_FTR_CAN_NAP)
-	/* Now check if user or arch enabled NAP mode */
-	LOAD_REG_ADDRBASE(r3,powersave_nap)
-	lwz	r4,ADDROFF(powersave_nap)(r3)
-	cmpwi	0,r4,0
-	beqlr
-
-	/* This sequence is similar to prep_irq_for_idle() */
-
-	/* Hard disable interrupts */
-	mfmsr	r7
-	rldicl	r0,r7,48,1
-	rotldi	r0,r0,16
-	mtmsrd	r0,1
-
-	/* Check if something happened while soft-disabled */
-	lbz	r0,PACAIRQHAPPENED(r13)
-	cmpwi	cr0,r0,0
-	bne-	2f
-
-	/*
-	 * Soft-enable interrupts. This will make power4_fixup_nap return
-	 * to our caller with interrupts enabled (soft and hard). The caller
-	 * can cope with either interrupts disabled or enabled upon return.
-	 */
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* Tell the tracer interrupts are on, because idle responds to them. */
-	mflr	r0
-	std	r0,16(r1)
-	stdu    r1,-128(r1)
-	bl	trace_hardirqs_on
-	addi    r1,r1,128
-	ld	r0,16(r1)
-	mtlr	r0
-	mfmsr	r7
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
-	li	r0,IRQS_ENABLED
-	stb	r0,PACAIRQSOFTMASK(r13)	/* we'll hard-enable shortly */
-BEGIN_FTR_SECTION
-	DSSALL
-	sync
-END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
-	ld	r9, PACA_THREAD_INFO(r13)
-	ld	r8,TI_LOCAL_FLAGS(r9)	/* set napping bit */
-	ori	r8,r8,_TLF_NAPPING	/* so when we take an exception */
-	std	r8,TI_LOCAL_FLAGS(r9)	/* it will return to our caller */
-	ori	r7,r7,MSR_EE
-	oris	r7,r7,MSR_POW@h
-1:	sync
-	isync
-	mtmsrd	r7
-	isync
-	b	1b
-
-2:	/* Return if an interrupt had happened while soft disabled */
-	/* Set the HARD_DIS flag because interrupts are now hard disabled */
-	ori	r0,r0,PACA_IRQ_HARD_DIS
-	stb	r0,PACAIRQHAPPENED(r13)
-	blr
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index f3fb79fccc72..736325451bc4 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -177,6 +177,10 @@ config PPC_970_NAP
 config PPC_P7_NAP
 	bool
 
+config PPC_BOOK3S_IDLE
+	def_bool y
+	depends on (PPC_970_NAP || PPC_P7_NAP)
+
 config PPC_INDIRECT_PIO
 	bool
 	select GENERIC_IOMAP
-- 
2.20.1


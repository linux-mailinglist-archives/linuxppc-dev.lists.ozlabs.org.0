Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3A2C6FC1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:16:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjw7V4b4czF0PV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nxOneY8H; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvN032QczDsNP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:42:08 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id y7so6952205pfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzTIfP54Wrw9lEvJyOk7/S2QStgX/y+VUQ7mJoNy90g=;
 b=nxOneY8Hd8IHAjvkGFtiCblxOWqh9d3HH1Nn5453JeFrbJ/2/ex/0ACB1g42efQsmf
 skQbg/3pR+rTLThWjrnctd0fXnTodbwAcDO0nyffH3Jyfa98rlOMhRveCpvMNUzUFEP3
 cFu4l2/uZkG17/IP6RNBDW0yaNioztQ3TofHAZttyIGIKx7TWJVkK82CkhBKkF6ccKV+
 86a/8fdzkqEoxYasUGbSeKnSQXjGEHEUhotOmD7DYU2Cfz3QcqHWaO7q9MRKcqZAuevu
 kXo0/qUjgLEQQfM/Va59isOOzPrXoua3r3rJcHaCNuMELUBvmeWJzZBlVUOreQPptH9v
 mxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzTIfP54Wrw9lEvJyOk7/S2QStgX/y+VUQ7mJoNy90g=;
 b=HFxo/s7/0+yfFQmbqeifrnBuFAOPCBqFID2tqyklf929EoVkm2BsGnIwTIIxmAPZbt
 R5CP8z7bx6PhPzPDR0kil+AcWCTcl4c6Gsschg2VJJgSr1t6nBJPK/nFx3yVz4xNjMrD
 LH7qSvneQZJ13f4lQim6YE6d96j8jcLSIs6OtKLym6Sryzfv6WarhC8/SfJ0dojm2aAB
 AyBKBsbxoHpiPGtRdqpOkr3TTL+bT5HnZHaIGxJwYy0uahYz7yyAOhOUAgzWFbv1tVYQ
 zVSn0wc4iYpfH/2keYYRLYGeZ1zS+7HkvbynqrbAbXgW3vZpewZVHzF3Vrj2x1uFQb53
 28sg==
X-Gm-Message-State: AOAM533bTs/oGBdr6gjGJnVXaHcFfGWNoFyBUnbc7SGePf2R1FTjZzlL
 Zxnp6k3ZiPFwx21K5JX7TVm1hYF/gMA=
X-Google-Smtp-Source: ABdhPJxz+naZpzoeRjY81VzDaP7i3l0+omHVbQr9CNEdsWEm0UIQXg1pDZv/XxOKMZACDUfkTy6V7Q==
X-Received: by 2002:a63:3145:: with SMTP id x66mr10550760pgx.179.1606574524173; 
 Sat, 28 Nov 2020 06:42:04 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:42:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 19/19] powerpc/64s: power4 nap fixup in C
Date: Sun, 29 Nov 2020 00:41:14 +1000
Message-Id: <20201128144114.944000-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h   | 15 +++++++++
 arch/powerpc/include/asm/processor.h   |  1 +
 arch/powerpc/include/asm/thread_info.h |  6 ++++
 arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
 arch/powerpc/kernel/idle_book3s.S      |  4 +++
 5 files changed, 26 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 655fb668e2da..29afc7443d0f 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -8,6 +8,16 @@
 #include <asm/ftrace.h>
 #include <asm/runlatch.h>
 
+static inline void nap_adjust_return(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_970_NAP
+	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		clear_thread_local_flags(_TLF_NAPPING);
+		regs->nip = (unsigned long)power4_idle_nap_return;
+	}
+#endif
+}
+
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
@@ -99,6 +109,9 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 {
 	irq_exit();
 	interrupt_exit_prepare(regs, state);
+
+	/* Adjust at exit so the main handler sees the true NIA */
+	nap_adjust_return(regs);
 }
 
 struct interrupt_nmi_state {
@@ -150,6 +163,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 			radix_enabled() || (mfmsr() & MSR_DR))
 		nmi_exit();
 
+	nap_adjust_return(regs);
+
 #ifdef CONFIG_PPC64
 	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index c61c859b51a8..d845850f75e2 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -418,6 +418,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
 extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
 #ifdef CONFIG_PPC_970_NAP
 extern void power4_idle_nap(void);
+void power4_idle_nap_return(void);
 #endif
 
 extern unsigned long cpuidle_disable;
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index c9443c16e5fb..e7ee220b88ea 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -151,6 +151,12 @@ void arch_setup_new_exec(void);
 
 #ifndef __ASSEMBLY__
 
+static inline void clear_thread_local_flags(unsigned int flags)
+{
+	struct thread_info *ti = current_thread_info();
+	ti->local_flags &= ~flags;
+}
+
 static inline bool test_thread_local_flags(unsigned int flags)
 {
 	struct thread_info *ti = current_thread_info();
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e75849a60578..869ad412517b 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -692,25 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r1,GPR1(r1)
 .endm
 
-/*
- * When the idle code in power4_idle puts the CPU into NAP mode,
- * it has to do so in a loop, and relies on the external interrupt
- * and decrementer interrupt entry code to get it out of the loop.
- * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
- * to signal that it is in the loop and needs help to get out.
- */
-#ifdef CONFIG_PPC_970_NAP
-#define FINISH_NAP				\
-BEGIN_FTR_SECTION				\
-	ld	r11, PACA_THREAD_INFO(r13);	\
-	ld	r9,TI_LOCAL_FLAGS(r11);		\
-	andi.	r10,r9,_TLF_NAPPING;		\
-	bnel	power4_fixup_nap;		\
-END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
-#else
-#define FINISH_NAP
-#endif
-
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical location.
@@ -1248,7 +1229,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 */
 	GEN_COMMON machine_check
 
-	FINISH_NAP
 	/* Enable MSR_RI when finished with PACA_EXMC */
 	li	r10,MSR_RI
 	mtmsrd 	r10,1
@@ -1573,7 +1553,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1758,7 +1737,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1843,7 +1821,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2197,7 +2174,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2226,7 +2202,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2259,7 +2234,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2305,7 +2279,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3037,24 +3010,6 @@ USE_FIXED_SECTION(virt_trampolines)
 __end_interrupts:
 DEFINE_FIXED_SYMBOL(__end_interrupts)
 
-#ifdef CONFIG_PPC_970_NAP
-	/*
-	 * Called by exception entry code if _TLF_NAPPING was set, this clears
-	 * the NAPPING flag, and redirects the exception exit to
-	 * power4_fixup_nap_return.
-	 */
-	.globl power4_fixup_nap
-EXC_COMMON_BEGIN(power4_fixup_nap)
-	andc	r9,r9,r10
-	std	r9,TI_LOCAL_FLAGS(r11)
-	LOAD_REG_ADDR(r10, power4_idle_nap_return)
-	std	r10,_NIP(r1)
-	blr
-
-power4_idle_nap_return:
-	blr
-#endif
-
 CLOSE_FIXED_SECTION(real_vectors);
 CLOSE_FIXED_SECTION(real_trampolines);
 CLOSE_FIXED_SECTION(virt_vectors);
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 22f249b6f58d..27d2e6a72ec9 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -201,4 +201,8 @@ _GLOBAL(power4_idle_nap)
 	mtmsrd	r7
 	isync
 	b	1b
+
+	.globl power4_idle_nap_return
+power4_idle_nap_return:
+	blr
 #endif
-- 
2.23.0


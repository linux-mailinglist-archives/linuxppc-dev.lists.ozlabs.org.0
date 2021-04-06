Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08605354B0F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 04:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDsbN71nvz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 12:55:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sUzE3C5k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sUzE3C5k; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDsZx18Zwz2yjP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 12:55:18 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso6880054pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Apr 2021 19:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJNtPc7Wc85bW1Zb2VqcYeldiTGvhjkwFCExT6ragYs=;
 b=sUzE3C5kyxcXkI+Gw9pvKKdiu0v3mLrnF7/P42RbykkwZnz/+voWiIDqTX9wtH9j9M
 p3YVHNe5uMwz2xOnTiC7FwM3z90HZddfqTuYt1ynpqD9UgPGclCuixbb+pE7CA8APmk3
 RMFvfmK/OW3qQl4H3Ghp5Tc0JbGBMsBnK0FK6M/R5wR30JdzDR6Q74ilJco5kqurXt++
 Ms3anm7itVJVccOp3GTSTM77e+loj+dwBqywJlUolljHhwxMotxmzUgCO70FgNdMMBnz
 3taQLtc315Ne9Eu8ZYyFUMtAxgaMGI2seDildFv2+SYA3N6S+jXd9FVFfMtm2T58JbLt
 xX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJNtPc7Wc85bW1Zb2VqcYeldiTGvhjkwFCExT6ragYs=;
 b=Rm9bX7T8oxHQT1wQVj+u/W3nCI35RO/Qn03LHJvqCNuZn4VG1etOgjxq9GJcTe7V+p
 R1Df+sDZBUqt4gkh3b8eI6DSoUSqg9hIyNeA6EIe8O5qfOv2DRzPq+GL6b0rpLi5YqOE
 3QeShGCNxLjMvyF7ID4rTw8Rds2dnymdlnIlV2Fxjn91ZVVrYy2NEGwNDvnsoMxD2+Qu
 zxmT3kqMOOn8bS/LzMXwq6wWsDmN11fYkxLJTevCXcbj1jM3D3DJpo7UcBwKI1TG95BG
 UXzMo3OtrxfkOm1wg5P7CiwXJK7UNbKt9Vx5ll2ZRpEk9VrifRik3sqSINGCDZxGBgno
 XsXw==
X-Gm-Message-State: AOAM5311x7KKLFGDiyHUruqEyfW5+/UwfkdSrORF28hSZEK2klBAiPL/
 PGPUyVtnXnJKGICT/Vg7ljV3UFjTpCzmng==
X-Google-Smtp-Source: ABdhPJySeRRK/nz1XJkLjKGZ5kmetcv8pwFJu78FwEE4lkQxOTw+nQEF1AW1PdOr3Is7bFFH5sLAIg==
X-Received: by 2002:a17:90a:9a8e:: with SMTP id
 e14mr2150925pjp.113.1617677715068; 
 Mon, 05 Apr 2021 19:55:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([144.130.156.129])
 by smtp.gmail.com with ESMTPSA id y68sm17957225pgy.5.2021.04.05.19.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 19:55:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: power4 nap fixup in C
Date: Tue,  6 Apr 2021 12:55:08 +1000
Message-Id: <20210406025508.821718-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Andreas Schwab <schwab@linux-m68k.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need for this to be in asm, use the new intrrupt entry wrapper.

Tested-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Fixed the G5 hang bug (reproduced and QEMU and real hardware), added
  a comment about the tricky behaviour of irq_exit enabling interrupts.

---
 arch/powerpc/include/asm/interrupt.h   | 24 ++++++++++++++
 arch/powerpc/include/asm/processor.h   |  1 +
 arch/powerpc/include/asm/thread_info.h |  6 ++++
 arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
 arch/powerpc/kernel/idle_book3s.S      |  4 +++
 5 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index e8d09a841373..2643028cf67a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -9,6 +9,17 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+static inline void nap_adjust_return(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_970_NAP
+	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		/* Can avoid a test-and-clear because NMIs do not call this */
+		clear_thread_local_flags(_TLF_NAPPING);
+		regs->nip = (unsigned long)power4_idle_nap_return;
+	}
+#endif
+}
+
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
@@ -109,6 +120,14 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct in
 
 static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	/*
+	 * Adjust at exit so the main handler sees the true NIA. This must
+	 * come before irq_exit() because irq_exit can enable interrupts, and
+	 * if another interrupt is taken before nap_adjust_return has run
+	 * here, then that interrupt would return directly to idle nap return.
+	 */
+	nap_adjust_return(regs);
+
 	irq_exit();
 	interrupt_exit_prepare(regs, state);
 }
@@ -164,6 +183,11 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 			radix_enabled() || (mfmsr() & MSR_DR))
 		nmi_exit();
 
+	/*
+	 * nmi does not call nap_adjust_return because nmi should not create
+	 * new work to do (must use irq_work for that).
+	 */
+
 #ifdef CONFIG_PPC64
 	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8acc3590c971..eedc3c775141 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -393,6 +393,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
 extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
 #ifdef CONFIG_PPC_970_NAP
 extern void power4_idle_nap(void);
+void power4_idle_nap_return(void);
 #endif
 
 extern unsigned long cpuidle_disable;
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 386d576673a1..bf137151100b 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -152,6 +152,12 @@ void arch_setup_new_exec(void);
 
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
index 8082b690e874..0cdb59e8b577 100644
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
@@ -1571,7 +1551,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1801,7 +1780,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1886,7 +1864,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2237,7 +2214,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2266,7 +2242,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2299,7 +2274,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2345,7 +2319,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3096,24 +3069,6 @@ USE_FIXED_SECTION(virt_trampolines)
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
index f9e6d83e6720..abb719b21cae 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -209,4 +209,8 @@ _GLOBAL(power4_idle_nap)
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


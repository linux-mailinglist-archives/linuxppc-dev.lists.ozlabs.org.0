Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B55309603
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:50:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScZv2YCGzDqDL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MXVb9Sw/; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZNN5V9pzDrTN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:32 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id h15so7086120pli.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKcF/J6BLrZ+u1rNYX2yAYFfvaFDhjoAoypRqnnAXCY=;
 b=MXVb9Sw/m0PzTt+SNKm6dBioHfEnX2Q/kF5w7SG8aMa4i2kwmGYHmU+4CPrZlQVsFO
 QpyDUDQ7HJcBJNkaa/y+hoRLq+U1ibgmK6HhG0d+zkevird+jGoEwC/XlUqX0UjHb7+c
 j9jrvtFMoKCnW4vTIcZrwDULJnY2k0Lo0Lxr+S/wx7No4B45l6UcWlsopXZ9dcsNmbaV
 kq8MEqa56PGraq6WhQXMMVr3iLtYf0gtsJ5EGnGkCCjzXQojNe4+6VCRb9DMniQAgPL+
 LMev7p6bh7u7BroZUimHTt5TPaIjU+yheppKb3pNe2Dt7Gb59+buVD+vo8MYPeiji1wo
 3S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKcF/J6BLrZ+u1rNYX2yAYFfvaFDhjoAoypRqnnAXCY=;
 b=qEg2ig17APRoMt/h64xKSNoKCLpttk7nPpPIOEMASkUC5idllMlXM3M0v+vywUbuW3
 lSX9xVPai7X69zUA/OBlgTEByokjo+6tmZozAclpIX4uM0SU9hUccYDpKz5UimSbyJ/o
 BlxI96M7BrpPXpYreNLmq5QW+SsT3VIS2m6ji2fH9acCVfHlUcTqanaK7e+Bm4h+Dgz6
 TBqADfu/VTp4f8nD2d+8l3YHYt2F8gYljAIEfhxIPtzypiGGXIO39QS1DnH/l6O7XLUf
 lgW4RS1qi2aNULDS0vJUKFC9INoPWGJlE+SxR3/UMymHC49vc2n8m0S+3GpQK0x4uKgf
 JFTw==
X-Gm-Message-State: AOAM532U7doXS4aZd9m/UC87l1quNuhYkFa1oR0IPCbikHwTvCuOdi+5
 doOQVY19mrcAGQ7bzMMCOl7eUY90xX0=
X-Google-Smtp-Source: ABdhPJw441B34hKGoBj2pTXDucJW/ES+BKye8oKNxC8di9Vy6h0z90EOQeG90obnunO15z6Y4aVAQw==
X-Received: by 2002:a17:902:8542:b029:df:ef68:38c with SMTP id
 d2-20020a1709028542b02900dfef68038cmr9641313plo.27.1612012289906; 
 Sat, 30 Jan 2021 05:11:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 42/42] powerpc/64s: power4 nap fixup in C
Date: Sat, 30 Jan 2021 23:08:52 +1000
Message-Id: <20210130130852.2952424-43-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index 4badb3e51c19..25f2420b1965 100644
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
@@ -98,6 +108,9 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 {
 	irq_exit();
 	interrupt_exit_prepare(regs, state);
+
+	/* Adjust at exit so the main handler sees the true NIA */
+	nap_adjust_return(regs);
 }
 
 struct interrupt_nmi_state {
@@ -151,6 +164,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 			radix_enabled() || (mfmsr() & MSR_DR))
 		nmi_exit();
 
+	nap_adjust_return(regs);
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
index 27351276c54b..5478ffa85603 100644
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
@@ -1576,7 +1556,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1761,7 +1740,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1846,7 +1824,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2200,7 +2177,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2229,7 +2205,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2262,7 +2237,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2308,7 +2282,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3059,24 +3032,6 @@ USE_FIXED_SECTION(virt_trampolines)
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


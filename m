Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABD52B3B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L34g84tkbz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 17:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L34fG5N2yz3c9N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 17:40:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L34f15x09z9snF;
 Wed, 18 May 2022 09:40:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmBnR0xNHsBy; Wed, 18 May 2022 09:40:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L34f05HTnz9snK;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A220E8B77B;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9e0W1gEClFHj; Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 77F7E8B763;
 Wed, 18 May 2022 09:40:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24I7eHni2950424
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:40:17 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24I7eGKp2950422;
 Wed, 18 May 2022 09:40:16 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/irq: Split irq.c
Date: Wed, 18 May 2022 09:40:15 +0200
Message-Id: <9f1a47de80f78d3dd270a7a72f69f55f581c4054.1652859593.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652859614; l=24385; s=20211009;
 h=from:subject:message-id; bh=jedmnXy0cSOBGgWDbIfwXyrQLs2K2IKXQjeV+7UYKzk=;
 b=n50gSnPRLp3Y8bbrvSeLuwx1HfV/wN/FdXxgjKa4UOZdNJW4MY9+BiFqCvWTK1afztDMavEsFJgV
 IQiajiGtDDDH/sbsZnb3ZsJn3L+jM1dbZ+KvavARW9d3yRjJdbyV
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

More than half of irq.c is dedicated to PPC64.

Move PPC64 code out of irq.c into irq_64.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/Makefile            |   2 +-
 arch/powerpc/kernel/irq.c               | 421 ------------------------
 arch/powerpc/kernel/{irq.c => irq_64.c} | 331 -------------------
 3 files changed, 1 insertion(+), 753 deletions(-)
 copy arch/powerpc/kernel/{irq.c => irq_64.c} (60%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4ddd161aef32..611e9787a74c 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -50,7 +50,7 @@ obj-y				:= cputable.o syscalls.o \
 				   hw_breakpoint_constraints.o interrupt.o \
 				   kdebugfs.o stacktrace.o
 obj-y				+= ptrace/
-obj-$(CONFIG_PPC64)		+= setup_64.o \
+obj-$(CONFIG_PPC64)		+= setup_64.o irq_64.o\
 				   paca.o nvram_64.o note.o
 obj-$(CONFIG_COMPAT)		+= sys_ppc32.o signal_32.o
 obj-$(CONFIG_VDSO32)		+= vdso32_wrapper.o
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index dd09919c3c66..873e6dffb868 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -66,12 +66,6 @@
 #include <asm/hw_irq.h>
 #include <asm/softirq_stack.h>
 
-#ifdef CONFIG_PPC64
-#include <asm/paca.h>
-#include <asm/firmware.h>
-#include <asm/lv1call.h>
-#include <asm/dbell.h>
-#endif
 #define CREATE_TRACE_POINTS
 #include <asm/trace.h>
 #include <asm/cpu_has_feature.h>
@@ -88,411 +82,6 @@ u32 tau_interrupts(unsigned long cpu);
 #endif
 #endif /* CONFIG_PPC32 */
 
-#ifdef CONFIG_PPC64
-
-int distribute_irqs = 1;
-
-static inline notrace unsigned long get_irq_happened(void)
-{
-	unsigned long happened;
-
-	__asm__ __volatile__("lbz %0,%1(13)"
-	: "=r" (happened) : "i" (offsetof(struct paca_struct, irq_happened)));
-
-	return happened;
-}
-
-void replay_soft_interrupts(void)
-{
-	struct pt_regs regs;
-
-	/*
-	 * Be careful here, calling these interrupt handlers can cause
-	 * softirqs to be raised, which they may run when calling irq_exit,
-	 * which will cause local_irq_enable() to be run, which can then
-	 * recurse into this function. Don't keep any state across
-	 * interrupt handler calls which may change underneath us.
-	 *
-	 * We use local_paca rather than get_paca() to avoid all the
-	 * debug_smp_processor_id() business in this low level function.
-	 */
-
-	ppc_save_regs(&regs);
-	regs.softe = IRQS_ENABLED;
-	regs.msr |= MSR_EE;
-
-again:
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(mfmsr() & MSR_EE);
-
-	/*
-	 * Force the delivery of pending soft-disabled interrupts on PS3.
-	 * Any HV call will have this side effect.
-	 */
-	if (firmware_has_feature(FW_FEATURE_PS3_LV1)) {
-		u64 tmp, tmp2;
-		lv1_get_version_info(&tmp, &tmp2);
-	}
-
-	/*
-	 * Check if an hypervisor Maintenance interrupt happened.
-	 * This is a higher priority interrupt than the others, so
-	 * replay it first.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_HMI)) {
-		local_paca->irq_happened &= ~PACA_IRQ_HMI;
-		regs.trap = INTERRUPT_HMI;
-		handle_hmi_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
-	if (local_paca->irq_happened & PACA_IRQ_DEC) {
-		local_paca->irq_happened &= ~PACA_IRQ_DEC;
-		regs.trap = INTERRUPT_DECREMENTER;
-		timer_interrupt(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
-	if (local_paca->irq_happened & PACA_IRQ_EE) {
-		local_paca->irq_happened &= ~PACA_IRQ_EE;
-		regs.trap = INTERRUPT_EXTERNAL;
-		do_IRQ(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
-	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (local_paca->irq_happened & PACA_IRQ_DBELL)) {
-		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
-		regs.trap = INTERRUPT_DOORBELL;
-		doorbell_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
-	/* Book3E does not support soft-masking PMI interrupts */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_PMI)) {
-		local_paca->irq_happened &= ~PACA_IRQ_PMI;
-		regs.trap = INTERRUPT_PERFMON;
-		performance_monitor_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
-	}
-
-	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS) {
-		/*
-		 * We are responding to the next interrupt, so interrupt-off
-		 * latencies should be reset here.
-		 */
-		trace_hardirqs_on();
-		trace_hardirqs_off();
-		goto again;
-	}
-}
-
-#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_KUAP)
-static inline void replay_soft_interrupts_irqrestore(void)
-{
-	unsigned long kuap_state = get_kuap();
-
-	/*
-	 * Check if anything calls local_irq_enable/restore() when KUAP is
-	 * disabled (user access enabled). We handle that case here by saving
-	 * and re-locking AMR but we shouldn't get here in the first place,
-	 * hence the warning.
-	 */
-	kuap_assert_locked();
-
-	if (kuap_state != AMR_KUAP_BLOCKED)
-		set_kuap(AMR_KUAP_BLOCKED);
-
-	replay_soft_interrupts();
-
-	if (kuap_state != AMR_KUAP_BLOCKED)
-		set_kuap(kuap_state);
-}
-#else
-#define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
-#endif
-
-notrace void arch_local_irq_restore(unsigned long mask)
-{
-	unsigned char irq_happened;
-
-	/* Write the new soft-enabled value if it is a disable */
-	if (mask) {
-		irq_soft_mask_set(mask);
-		return;
-	}
-
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(in_nmi() || in_hardirq());
-
-	/*
-	 * After the stb, interrupts are unmasked and there are no interrupts
-	 * pending replay. The restart sequence makes this atomic with
-	 * respect to soft-masked interrupts. If this was just a simple code
-	 * sequence, a soft-masked interrupt could become pending right after
-	 * the comparison and before the stb.
-	 *
-	 * This allows interrupts to be unmasked without hard disabling, and
-	 * also without new hard interrupts coming in ahead of pending ones.
-	 */
-	asm_volatile_goto(
-"1:					\n"
-"		lbz	9,%0(13)	\n"
-"		cmpwi	9,0		\n"
-"		bne	%l[happened]	\n"
-"		stb	9,%1(13)	\n"
-"2:					\n"
-		RESTART_TABLE(1b, 2b, 1b)
-	: : "i" (offsetof(struct paca_struct, irq_happened)),
-	    "i" (offsetof(struct paca_struct, irq_soft_mask))
-	: "cr0", "r9"
-	: happened);
-
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
-
-	return;
-
-happened:
-	irq_happened = get_irq_happened();
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(!irq_happened);
-
-	if (irq_happened == PACA_IRQ_HARD_DIS) {
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-			WARN_ON_ONCE(mfmsr() & MSR_EE);
-		irq_soft_mask_set(IRQS_ENABLED);
-		local_paca->irq_happened = 0;
-		__hard_irq_enable();
-		return;
-	}
-
-	/* Have interrupts to replay, need to hard disable first */
-	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
-			if (!(mfmsr() & MSR_EE)) {
-				/*
-				 * An interrupt could have come in and cleared
-				 * MSR[EE] and set IRQ_HARD_DIS, so check
-				 * IRQ_HARD_DIS again and warn if it is still
-				 * clear.
-				 */
-				irq_happened = get_irq_happened();
-				WARN_ON_ONCE(!(irq_happened & PACA_IRQ_HARD_DIS));
-			}
-		}
-		__hard_irq_disable();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-	} else {
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
-			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
-				__hard_irq_disable();
-		}
-	}
-
-	/*
-	 * Disable preempt here, so that the below preempt_enable will
-	 * perform resched if required (a replayed interrupt may set
-	 * need_resched).
-	 */
-	preempt_disable();
-	irq_soft_mask_set(IRQS_ALL_DISABLED);
-	trace_hardirqs_off();
-
-	replay_soft_interrupts_irqrestore();
-	local_paca->irq_happened = 0;
-
-	trace_hardirqs_on();
-	irq_soft_mask_set(IRQS_ENABLED);
-	__hard_irq_enable();
-	preempt_enable();
-}
-EXPORT_SYMBOL(arch_local_irq_restore);
-
-/*
- * This is a helper to use when about to go into idle low-power
- * when the latter has the side effect of re-enabling interrupts
- * (such as calling H_CEDE under pHyp).
- *
- * You call this function with interrupts soft-disabled (this is
- * already the case when ppc_md.power_save is called). The function
- * will return whether to enter power save or just return.
- *
- * In the former case, it will have notified lockdep of interrupts
- * being re-enabled and generally sanitized the lazy irq state,
- * and in the latter case it will leave with interrupts hard
- * disabled and marked as such, so the local_irq_enable() call
- * in arch_cpu_idle() will properly re-enable everything.
- */
-bool prep_irq_for_idle(void)
-{
-	/*
-	 * First we need to hard disable to ensure no interrupt
-	 * occurs before we effectively enter the low power state
-	 */
-	__hard_irq_disable();
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
-	/*
-	 * If anything happened while we were soft-disabled,
-	 * we return now and do not enter the low power state.
-	 */
-	if (lazy_irq_pending())
-		return false;
-
-	/* Tell lockdep we are about to re-enable */
-	trace_hardirqs_on();
-
-	/*
-	 * Mark interrupts as soft-enabled and clear the
-	 * PACA_IRQ_HARD_DIS from the pending mask since we
-	 * are about to hard enable as well as a side effect
-	 * of entering the low power state.
-	 */
-	local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
-	irq_soft_mask_set(IRQS_ENABLED);
-
-	/* Tell the caller to enter the low power state */
-	return true;
-}
-
-#ifdef CONFIG_PPC_BOOK3S
-/*
- * This is for idle sequences that return with IRQs off, but the
- * idle state itself wakes on interrupt. Tell the irq tracer that
- * IRQs are enabled for the duration of idle so it does not get long
- * off times. Must be paired with fini_irq_for_idle_irqsoff.
- */
-bool prep_irq_for_idle_irqsoff(void)
-{
-	WARN_ON(!irqs_disabled());
-
-	/*
-	 * First we need to hard disable to ensure no interrupt
-	 * occurs before we effectively enter the low power state
-	 */
-	__hard_irq_disable();
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
-	/*
-	 * If anything happened while we were soft-disabled,
-	 * we return now and do not enter the low power state.
-	 */
-	if (lazy_irq_pending())
-		return false;
-
-	/* Tell lockdep we are about to re-enable */
-	trace_hardirqs_on();
-
-	return true;
-}
-
-/*
- * Take the SRR1 wakeup reason, index into this table to find the
- * appropriate irq_happened bit.
- *
- * Sytem reset exceptions taken in idle state also come through here,
- * but they are NMI interrupts so do not need to wait for IRQs to be
- * restored, and should be taken as early as practical. These are marked
- * with 0xff in the table. The Power ISA specifies 0100b as the system
- * reset interrupt reason.
- */
-#define IRQ_SYSTEM_RESET	0xff
-
-static const u8 srr1_to_lazyirq[0x10] = {
-	0, 0, 0,
-	PACA_IRQ_DBELL,
-	IRQ_SYSTEM_RESET,
-	PACA_IRQ_DBELL,
-	PACA_IRQ_DEC,
-	0,
-	PACA_IRQ_EE,
-	PACA_IRQ_EE,
-	PACA_IRQ_HMI,
-	0, 0, 0, 0, 0 };
-
-void replay_system_reset(void)
-{
-	struct pt_regs regs;
-
-	ppc_save_regs(&regs);
-	regs.trap = 0x100;
-	get_paca()->in_nmi = 1;
-	system_reset_exception(&regs);
-	get_paca()->in_nmi = 0;
-}
-EXPORT_SYMBOL_GPL(replay_system_reset);
-
-void irq_set_pending_from_srr1(unsigned long srr1)
-{
-	unsigned int idx = (srr1 & SRR1_WAKEMASK_P8) >> 18;
-	u8 reason = srr1_to_lazyirq[idx];
-
-	/*
-	 * Take the system reset now, which is immediately after registers
-	 * are restored from idle. It's an NMI, so interrupts need not be
-	 * re-enabled before it is taken.
-	 */
-	if (unlikely(reason == IRQ_SYSTEM_RESET)) {
-		replay_system_reset();
-		return;
-	}
-
-	if (reason == PACA_IRQ_DBELL) {
-		/*
-		 * When doorbell triggers a system reset wakeup, the message
-		 * is not cleared, so if the doorbell interrupt is replayed
-		 * and the IPI handled, the doorbell interrupt would still
-		 * fire when EE is enabled.
-		 *
-		 * To avoid taking the superfluous doorbell interrupt,
-		 * execute a msgclr here before the interrupt is replayed.
-		 */
-		ppc_msgclr(PPC_DBELL_MSGTYPE);
-	}
-
-	/*
-	 * The 0 index (SRR1[42:45]=b0000) must always evaluate to 0,
-	 * so this can be called unconditionally with the SRR1 wake
-	 * reason as returned by the idle code, which uses 0 to mean no
-	 * interrupt.
-	 *
-	 * If a future CPU was to designate this as an interrupt reason,
-	 * then a new index for no interrupt must be assigned.
-	 */
-	local_paca->irq_happened |= reason;
-}
-#endif /* CONFIG_PPC_BOOK3S */
-
-/*
- * Force a replay of the external interrupt handler on this CPU.
- */
-void force_external_irq_replay(void)
-{
-	/*
-	 * This must only be called with interrupts soft-disabled,
-	 * the replay will happen when re-enabling.
-	 */
-	WARN_ON(!arch_irqs_disabled());
-
-	/*
-	 * Interrupts must always be hard disabled before irq_happened is
-	 * modified (to prevent lost update in case of interrupt between
-	 * load and store).
-	 */
-	__hard_irq_disable();
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
-	/* Indicate in the PACA that we have an interrupt to replay */
-	local_paca->irq_happened |= PACA_IRQ_EE;
-}
-
-#endif /* CONFIG_PPC64 */
-
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	int j;
@@ -794,13 +383,3 @@ int irq_choose_cpu(const struct cpumask *mask)
 	return hard_smp_processor_id();
 }
 #endif
-
-#ifdef CONFIG_PPC64
-static int __init setup_noirqdistrib(char *str)
-{
-	distribute_irqs = 0;
-	return 1;
-}
-
-__setup("noirqdistrib", setup_noirqdistrib);
-#endif /* CONFIG_PPC64 */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq_64.c
similarity index 60%
copy from arch/powerpc/kernel/irq.c
copy to arch/powerpc/kernel/irq_64.c
index dd09919c3c66..488f6eb4553d 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -14,14 +14,6 @@
  * instead of just grabbing them. Thus setups with different IRQ numbers
  * shouldn't result in any weird surprises, and installing new handlers
  * should be easier.
- *
- * The MPC8xx has an interrupt mask in the SIU.  If a bit is set, the
- * interrupt is _enabled_.  As expected, IRQ0 is bit 0 in the 32-bit
- * mask register (of which only 16 are defined), hence the weird shifting
- * and complement of the cached_irq_mask.  I want to be able to stuff
- * this right into the SIU SMASK register.
- * Many of the prep/chrp functions are conditional compiled on CONFIG_PPC_8xx
- * to reduce code space and undefined function references.
  */
 
 #undef DEBUG
@@ -66,30 +58,13 @@
 #include <asm/hw_irq.h>
 #include <asm/softirq_stack.h>
 
-#ifdef CONFIG_PPC64
 #include <asm/paca.h>
 #include <asm/firmware.h>
 #include <asm/lv1call.h>
 #include <asm/dbell.h>
-#endif
-#define CREATE_TRACE_POINTS
 #include <asm/trace.h>
 #include <asm/cpu_has_feature.h>
 
-DEFINE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
-EXPORT_PER_CPU_SYMBOL(irq_stat);
-
-#ifdef CONFIG_PPC32
-atomic_t ppc_n_lost_interrupts;
-
-#ifdef CONFIG_TAU_INT
-extern int tau_initialized;
-u32 tau_interrupts(unsigned long cpu);
-#endif
-#endif /* CONFIG_PPC32 */
-
-#ifdef CONFIG_PPC64
-
 int distribute_irqs = 1;
 
 static inline notrace unsigned long get_irq_happened(void)
@@ -491,311 +466,6 @@ void force_external_irq_replay(void)
 	local_paca->irq_happened |= PACA_IRQ_EE;
 }
 
-#endif /* CONFIG_PPC64 */
-
-int arch_show_interrupts(struct seq_file *p, int prec)
-{
-	int j;
-
-#if defined(CONFIG_PPC32) && defined(CONFIG_TAU_INT)
-	if (tau_initialized) {
-		seq_printf(p, "%*s: ", prec, "TAU");
-		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", tau_interrupts(j));
-		seq_puts(p, "  PowerPC             Thermal Assist (cpu temp)\n");
-	}
-#endif /* CONFIG_PPC32 && CONFIG_TAU_INT */
-
-	seq_printf(p, "%*s: ", prec, "LOC");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).timer_irqs_event);
-        seq_printf(p, "  Local timer interrupts for timer event device\n");
-
-	seq_printf(p, "%*s: ", prec, "BCT");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).broadcast_irqs_event);
-	seq_printf(p, "  Broadcast timer interrupts for timer event device\n");
-
-	seq_printf(p, "%*s: ", prec, "LOC");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).timer_irqs_others);
-        seq_printf(p, "  Local timer interrupts for others\n");
-
-	seq_printf(p, "%*s: ", prec, "SPU");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).spurious_irqs);
-	seq_printf(p, "  Spurious interrupts\n");
-
-	seq_printf(p, "%*s: ", prec, "PMI");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).pmu_irqs);
-	seq_printf(p, "  Performance monitoring interrupts\n");
-
-	seq_printf(p, "%*s: ", prec, "MCE");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).mce_exceptions);
-	seq_printf(p, "  Machine check exceptions\n");
-
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		seq_printf(p, "%*s: ", prec, "HMI");
-		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", paca_ptrs[j]->hmi_irqs);
-		seq_printf(p, "  Hypervisor Maintenance Interrupts\n");
-	}
-#endif
-
-	seq_printf(p, "%*s: ", prec, "NMI");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).sreset_irqs);
-	seq_printf(p, "  System Reset interrupts\n");
-
-#ifdef CONFIG_PPC_WATCHDOG
-	seq_printf(p, "%*s: ", prec, "WDG");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", per_cpu(irq_stat, j).soft_nmi_irqs);
-	seq_printf(p, "  Watchdog soft-NMI interrupts\n");
-#endif
-
-#ifdef CONFIG_PPC_DOORBELL
-	if (cpu_has_feature(CPU_FTR_DBELL)) {
-		seq_printf(p, "%*s: ", prec, "DBL");
-		for_each_online_cpu(j)
-			seq_printf(p, "%10u ", per_cpu(irq_stat, j).doorbell_irqs);
-		seq_printf(p, "  Doorbell interrupts\n");
-	}
-#endif
-
-	return 0;
-}
-
-/*
- * /proc/stat helpers
- */
-u64 arch_irq_stat_cpu(unsigned int cpu)
-{
-	u64 sum = per_cpu(irq_stat, cpu).timer_irqs_event;
-
-	sum += per_cpu(irq_stat, cpu).broadcast_irqs_event;
-	sum += per_cpu(irq_stat, cpu).pmu_irqs;
-	sum += per_cpu(irq_stat, cpu).mce_exceptions;
-	sum += per_cpu(irq_stat, cpu).spurious_irqs;
-	sum += per_cpu(irq_stat, cpu).timer_irqs_others;
-#ifdef CONFIG_PPC_BOOK3S_64
-	sum += paca_ptrs[cpu]->hmi_irqs;
-#endif
-	sum += per_cpu(irq_stat, cpu).sreset_irqs;
-#ifdef CONFIG_PPC_WATCHDOG
-	sum += per_cpu(irq_stat, cpu).soft_nmi_irqs;
-#endif
-#ifdef CONFIG_PPC_DOORBELL
-	sum += per_cpu(irq_stat, cpu).doorbell_irqs;
-#endif
-
-	return sum;
-}
-
-static inline void check_stack_overflow(void)
-{
-	long sp;
-
-	if (!IS_ENABLED(CONFIG_DEBUG_STACKOVERFLOW))
-		return;
-
-	sp = current_stack_pointer & (THREAD_SIZE - 1);
-
-	/* check for stack overflow: is there less than 2KB free? */
-	if (unlikely(sp < 2048)) {
-		pr_err("do_IRQ: stack overflow: %ld\n", sp);
-		dump_stack();
-	}
-}
-
-static __always_inline void call_do_softirq(const void *sp)
-{
-	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
-	asm volatile (
-		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
-		"mr		%%r1, %[sp]		;"
-		"bl		%[callee]		;"
-		 PPC_LL "	%%r1, 0(%%r1)		;"
-		 : // Outputs
-		 : // Inputs
-		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
-		   [callee] "i" (__do_softirq)
-		 : // Clobbers
-		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
-		   "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
-		   "r11", "r12"
-	);
-}
-
-static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
-{
-	register unsigned long r3 asm("r3") = (unsigned long)regs;
-
-	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
-	asm volatile (
-		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
-		"mr		%%r1, %[sp]		;"
-		"bl		%[callee]		;"
-		 PPC_LL "	%%r1, 0(%%r1)		;"
-		 : // Outputs
-		   "+r" (r3)
-		 : // Inputs
-		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
-		   [callee] "i" (__do_irq)
-		 : // Clobbers
-		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
-		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
-		   "r11", "r12"
-	);
-}
-
-DEFINE_STATIC_CALL_RET0(ppc_get_irq, *ppc_md.get_irq);
-
-void __do_irq(struct pt_regs *regs)
-{
-	unsigned int irq;
-
-	trace_irq_entry(regs);
-
-	/*
-	 * Query the platform PIC for the interrupt & ack it.
-	 *
-	 * This will typically lower the interrupt line to the CPU
-	 */
-	irq = static_call(ppc_get_irq)();
-
-	/* We can hard enable interrupts now to allow perf interrupts */
-	if (should_hard_irq_enable())
-		do_hard_irq_enable();
-
-	/* And finally process it */
-	if (unlikely(!irq))
-		__this_cpu_inc(irq_stat.spurious_irqs);
-	else
-		generic_handle_irq(irq);
-
-	trace_irq_exit(regs);
-}
-
-void __do_IRQ(struct pt_regs *regs)
-{
-	struct pt_regs *old_regs = set_irq_regs(regs);
-	void *cursp, *irqsp, *sirqsp;
-
-	/* Switch to the irq stack to handle this */
-	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
-	irqsp = hardirq_ctx[raw_smp_processor_id()];
-	sirqsp = softirq_ctx[raw_smp_processor_id()];
-
-	check_stack_overflow();
-
-	/* Already there ? */
-	if (unlikely(cursp == irqsp || cursp == sirqsp)) {
-		__do_irq(regs);
-		set_irq_regs(old_regs);
-		return;
-	}
-	/* Switch stack and call */
-	call_do_irq(regs, irqsp);
-
-	set_irq_regs(old_regs);
-}
-
-DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
-{
-	__do_IRQ(regs);
-}
-
-static void *__init alloc_vm_stack(void)
-{
-	return __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, THREADINFO_GFP,
-			      NUMA_NO_NODE, (void *)_RET_IP_);
-}
-
-static void __init vmap_irqstack_init(void)
-{
-	int i;
-
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_vm_stack();
-		hardirq_ctx[i] = alloc_vm_stack();
-	}
-}
-
-
-void __init init_IRQ(void)
-{
-	if (IS_ENABLED(CONFIG_VMAP_STACK))
-		vmap_irqstack_init();
-
-	if (ppc_md.init_IRQ)
-		ppc_md.init_IRQ();
-
-	if (!WARN_ON(!ppc_md.get_irq))
-		static_call_update(ppc_get_irq, ppc_md.get_irq);
-}
-
-#ifdef CONFIG_BOOKE_OR_40x
-void   *critirq_ctx[NR_CPUS] __read_mostly;
-void    *dbgirq_ctx[NR_CPUS] __read_mostly;
-void *mcheckirq_ctx[NR_CPUS] __read_mostly;
-#endif
-
-void *softirq_ctx[NR_CPUS] __read_mostly;
-void *hardirq_ctx[NR_CPUS] __read_mostly;
-
-void do_softirq_own_stack(void)
-{
-	call_do_softirq(softirq_ctx[smp_processor_id()]);
-}
-
-irq_hw_number_t virq_to_hw(unsigned int virq)
-{
-	struct irq_data *irq_data = irq_get_irq_data(virq);
-	return WARN_ON(!irq_data) ? 0 : irq_data->hwirq;
-}
-EXPORT_SYMBOL_GPL(virq_to_hw);
-
-#ifdef CONFIG_SMP
-int irq_choose_cpu(const struct cpumask *mask)
-{
-	int cpuid;
-
-	if (cpumask_equal(mask, cpu_online_mask)) {
-		static int irq_rover;
-		static DEFINE_RAW_SPINLOCK(irq_rover_lock);
-		unsigned long flags;
-
-		/* Round-robin distribution... */
-do_round_robin:
-		raw_spin_lock_irqsave(&irq_rover_lock, flags);
-
-		irq_rover = cpumask_next(irq_rover, cpu_online_mask);
-		if (irq_rover >= nr_cpu_ids)
-			irq_rover = cpumask_first(cpu_online_mask);
-
-		cpuid = irq_rover;
-
-		raw_spin_unlock_irqrestore(&irq_rover_lock, flags);
-	} else {
-		cpuid = cpumask_first_and(mask, cpu_online_mask);
-		if (cpuid >= nr_cpu_ids)
-			goto do_round_robin;
-	}
-
-	return get_hard_smp_processor_id(cpuid);
-}
-#else
-int irq_choose_cpu(const struct cpumask *mask)
-{
-	return hard_smp_processor_id();
-}
-#endif
-
-#ifdef CONFIG_PPC64
 static int __init setup_noirqdistrib(char *str)
 {
 	distribute_irqs = 0;
@@ -803,4 +473,3 @@ static int __init setup_noirqdistrib(char *str)
 }
 
 __setup("noirqdistrib", setup_noirqdistrib);
-#endif /* CONFIG_PPC64 */
-- 
2.35.3


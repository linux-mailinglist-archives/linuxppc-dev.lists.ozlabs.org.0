Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526E19FCF5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:19:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wzMl21QDzDqwB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:19:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ZQjx3Xv+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzJX1smdzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:16:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzJQ0tr0z9tycw;
 Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZQjx3Xv+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q6LIRPK1AIQ2; Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzJP6Sdjz9tycr;
 Mon,  6 Apr 2020 20:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586196997; bh=WqU4KLn6Sl0HwiZdz0ISg/mRs3Ozs9UR7ddjW2hPIbo=;
 h=From:Subject:To:Cc:Date:From;
 b=ZQjx3Xv+ljJXBuPcvwr2dEZjFIw9fCAfttbYw9P2Y3fb2EUGiwAbjpKGRarpf7wtq
 HGiCzukxBKUXb+KlBFjfgxm2xBbuAv0dGMbe3AUWCEGW61urSOrQjkwLrbahgzYYkC
 AhsamkoEV61uXTrRLV0h7tFkwkdOhOQNIn9MySho=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9CF28B784;
 Mon,  6 Apr 2020 20:16:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t62a4Hiu9txY; Mon,  6 Apr 2020 20:16:37 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B1988B775;
 Mon,  6 Apr 2020 20:16:37 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0F096656E9; Mon,  6 Apr 2020 18:16:36 +0000 (UTC)
Message-Id: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 01/15] powerpc/syscall: Refactorise from Nick
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  6 Apr 2020 18:16:36 +0000 (UTC)
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

From: Nicholas Piggin <npiggin@gmail.com>

Christophe Leroy's on April 6, 2020 3:44 am:
> ifdef out specific PPC64 stuff to allow building
> syscall_64.c on PPC32.
>
> Modify Makefile to always build syscall.o
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/Makefile  |  5 ++---
>  arch/powerpc/kernel/syscall.c | 10 ++++++++++
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 8cc3c831dccd..e4be425b7718 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -45,11 +45,10 @@ obj-y				:= cputable.o syscalls.o \
>  				   signal.o sysfs.o cacheinfo.o time.o \
>  				   prom.o traps.o setup-common.o \
>  				   udbg.o misc.o io.o misc_$(BITS).o \
> -				   of_platform.o prom_parse.o
> +				   of_platform.o prom_parse.o syscall.o
>  obj-y				+= ptrace/
>  obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o signal_64.o \
> -				   paca.o nvram_64.o firmware.o note.o \
> -				   syscall.o
> +				   paca.o nvram_64.o firmware.o note.o
>  obj-$(CONFIG_VDSO32)		+= vdso32/
>  obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index 72f3d2f0a823..28bd43db8755 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -25,8 +25,10 @@ notrace long system_call_exception(long r3, long r4, long r5,
>  	unsigned long ti_flags;
>  	syscall_fn f;
>
> +#ifdef CONFIG_PPC64
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> +#endif
>
>  	trace_hardirqs_off(); /* finish reconciling */
>
> @@ -34,7 +36,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
>  		BUG_ON(!(regs->msr & MSR_RI));
>  	BUG_ON(!(regs->msr & MSR_PR));
>  	BUG_ON(!FULL_REGS(regs));
> +#ifdef CONFIG_PPC64
>  	BUG_ON(regs->softe != IRQS_ENABLED);
> +#endif
>
>  	account_cpu_user_entry();
>
> @@ -56,7 +60,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
>  	 * frame, or if the unwinder was taught the first stack frame always
>  	 * returns to user with IRQS_ENABLED, this store could be avoided!
>  	 */
> +#ifdef CONFIG_PPC64
>  	regs->softe = IRQS_ENABLED;
> +#endif
>
>  	local_irq_enable();
>
> @@ -148,7 +154,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>  		ret |= _TIF_RESTOREALL;
>  	}
>
> +#ifdef CONFIG_PPC64
>  again:
> +#endif
>  	local_irq_disable();
>  	ti_flags = READ_ONCE(*ti_flagsp);
>  	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
> @@ -191,6 +199,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>
>  	/* This pattern matches prep_irq_for_idle */
>  	__hard_EE_RI_disable();
> +#ifdef CONFIG_PPC64
>  	if (unlikely(lazy_irq_pending())) {
>  		__hard_RI_enable();
>  		trace_hardirqs_off();
> @@ -201,6 +210,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>  	}
>  	local_paca->irq_happened = 0;
>  	irq_soft_mask_set(IRQS_ENABLED);
> +#endif
>
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	local_paca->tm_scratch = regs->msr;
> --
> 2.25.0
>
>

The #ifdefs disappoint me!

Here is (unested) something that should help 32-bit avoid several ifdefs
in the main part of the function. I should have done this as part of the
merged series, but that's okay I'll submit as a cleanup.

The rest looks okay for now. Maybe we grow some helpers to manage the
soft-mask state, though I'm not really sure it would make sense for
32-bit code to ever call them. Maybe just confined to this file would be
okay but for now the ifdefs are okay.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/syscall_64.c | 58 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index cf06eb443a80..f021db893ec2 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -103,6 +103,31 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	return f(r3, r4, r5, r6, r7, r8);
 }
 
+/*
+ * local irqs must be disabled. Returns false if the caller must re-enable
+ * them, check for new work, and try again.
+ */
+static notrace inline bool prep_irq_for_enabled_exit(void)
+{
+	/* This must be done with RI=1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+	/* This pattern matches prep_irq_for_idle */
+	__hard_EE_RI_disable();
+	if (unlikely(lazy_irq_pending())) {
+		/* Took an interrupt, may have more exit work to do. */
+		__hard_RI_enable();
+		trace_hardirqs_off();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+		return false;
+	}
+	local_paca->irq_happened = 0;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+	return true;
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -186,21 +211,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-	/* This pattern matches prep_irq_for_idle */
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -264,19 +278,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	trace_hardirqs_on();
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
 		local_irq_disable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
 
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
@@ -334,13 +340,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			}
 		}
 
-		trace_hardirqs_on();
-		__hard_EE_RI_disable();
-		if (unlikely(lazy_irq_pending())) {
-			__hard_RI_enable();
-			irq_soft_mask_set(IRQS_ALL_DISABLED);
-			trace_hardirqs_off();
-			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		if (unlikely(!prep_irq_for_enabled_exit())) {
 			/*
 			 * Can't local_irq_restore to replay if we were in
 			 * interrupt context. Must replay directly.
@@ -354,8 +354,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			/* Took an interrupt, may have more exit work to do. */
 			goto again;
 		}
-		local_paca->irq_happened = 0;
-		irq_soft_mask_set(IRQS_ENABLED);
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
-- 
2.25.0


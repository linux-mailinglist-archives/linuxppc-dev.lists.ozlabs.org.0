Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3533C913
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrDj0nZrz30Hp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J1u1ZiAK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J1u1ZiAK; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7F5tm1z30Gl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:41 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id c17so3876742pfv.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DtimiWVxrdDP5j31uZN9lm7xIoKGNiYTVWFqIiP9898=;
 b=J1u1ZiAKlJSgzFjTYNjXIjycCoU8eCmtdEqYZY28hfWkbaFtZi7N1DqEIzSZZea1bm
 V/Bvkz+9d1/Qput4rd8l9Kn9lmGsUVldR9tkeu6bmvNhaDA9mSeNUiPFFwGv1ElWUEA7
 KiCJThpyFTBep4Qg6SezIpuiIoZWAur9dDD42hNCSAPuesopfrgTB22HpSWDFufRd6p+
 UoV40mJiSZj3StWWLjXByg2xK30OpJtOse0xyWtw99mTLit1i2OiuHkhgjkBNh56Nons
 8dSnlauMaNabKzs/ruEi6MDYglp8QKAGV3aX4hDdJEJh4j0+i2saDVSDW7h/Ys0LUxpn
 oxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DtimiWVxrdDP5j31uZN9lm7xIoKGNiYTVWFqIiP9898=;
 b=P5rov6DnUQZiHgQkdH9CEFfP3ryi6VVgOkzRUEh1HcOJa1ZotnXmWVT7deK/WOZP3f
 ewPJ/jiMC6cG4sPXNNl7l/LGJXhKpVUbTPLEtUXzjUiL+4Fc20eGyBkbRlOeyneuKiJ5
 5+GGaz578Q/v2Quot8AHTSUIZUy7foL72L1aOKzR7c6nrD3vryNGdLnoPbNRVD7e+P+g
 HUU1j+dmYnbGkpxkFaJTLb+WqoU/ZHvASvJdC53lMNq/iABJBcaXDncOPfD+OJA/y71P
 +Rk1qdPHupkDXV+ubpMxqC4sGQylauywzV33KnUQZTkM9LV7mKBCw3kvvq4JZLu1HDoc
 zB2Q==
X-Gm-Message-State: AOAM5336DyND4bfdHOB8fwOAke1WW/wgJIJ4RDJt1Ivvfw4ogdAblpy7
 ReV1cVNyLgc0inx+lHRPxk9GO0mkve4=
X-Google-Smtp-Source: ABdhPJzBnZ4qYNNa5yKTFeSzvEs/Cq5XUq5F1/OgYq9epZQ2v9HKFqb9q7IItuvYrT4YrOb1O7Zt5Q==
X-Received: by 2002:a62:f248:0:b029:20a:f9d5:dac3 with SMTP id
 y8-20020a62f2480000b029020af9d5dac3mr802578pfl.13.1615845878690; 
 Mon, 15 Mar 2021 15:04:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/14] powerpc/64: use interrupt restart table to speed up
 return from interrupt
Date: Tue, 16 Mar 2021 08:03:58 +1000
Message-Id: <20210315220402.260594-11-npiggin@gmail.com>
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

The restart table facility is used to return from interrupt without
disabling MSR EE or RI.

Interrupt return code is put into the low soft-masked region.

Critical code that has no exit work, SRRs set, soft-masked state set to
return state, saves r1 in the PACA and then begins to run instructions
that have an alternate return handler.

In this region, pending interrupts are checked, and if any exist then
it branches directly to the restart handler.

If it does not branch, then no masked interrupts are pending, and if any
interrupts do hit, we will go out the restart handler.

The restart handler re-loads the saved r1, and from there we can find
regs, and reload critical state before setting things up to replay
interrupts and go around the exit prepare sequence again.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paca.h    |   1 +
 arch/powerpc/include/asm/ptrace.h  |   4 +-
 arch/powerpc/kernel/asm-offsets.c  |   1 +
 arch/powerpc/kernel/interrupt.c    | 282 ++++++++++++++++-------------
 arch/powerpc/kernel/interrupt_64.S | 118 +++++++++++-
 5 files changed, 270 insertions(+), 136 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 4cbfaa09950a..039ccedcfcdb 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -167,6 +167,7 @@ struct paca_struct {
 	u64 kstack;			/* Saved Kernel stack addr */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
+	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
 #ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 77c86ce01f20..d37787a74342 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -52,6 +52,7 @@ struct pt_regs
 		struct {
 #ifdef CONFIG_PPC64
 			unsigned long ppr;
+			unsigned long exit_result;
 #endif
 			union {
 #ifdef CONFIG_PPC_KUAP
@@ -65,7 +66,8 @@ struct pt_regs
 			unsigned long iamr;
 #endif
 		};
-		unsigned long __pad[4];	/* Maintain 16 byte interrupt stack alignment */
+		/* Maintain 16 byte interrupt stack alignment */
+		unsigned long __pad[4];
 	};
 };
 #endif
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 35ce6e36f593..44d557dacc77 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -288,6 +288,7 @@ int main(void)
 	OFFSET(ACCOUNT_STARTTIME_USER, paca_struct, accounting.starttime_user);
 	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
 	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
+	OFFSET(PACA_EXIT_SAVE_R1, paca_struct, exit_save_r1);
 #ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
 #endif
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index efeeefe6ee8f..09cf699d0e2e 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -147,71 +147,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	return f(r3, r4, r5, r6, r7, r8);
 }
 
-/*
- * local irqs must be disabled. Returns false if the caller must re-enable
- * them, check for new work, and try again.
- *
- * This should be called with local irqs disabled, but if they were previously
- * enabled when the interrupt handler returns (indicating a process-context /
- * synchronous interrupt) then irqs_enabled should be true.
- */
-static notrace __always_inline bool __prep_irq_for_enabled_exit(bool clear_ri)
-{
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-	/* This pattern matches prep_irq_for_idle */
-	if (clear_ri)
-		__hard_EE_RI_disable();
-	else
-		__hard_irq_disable();
-#ifdef CONFIG_PPC64
-	if (unlikely(lazy_irq_pending_nocheck())) {
-		/* Took an interrupt, may have more exit work to do. */
-		if (clear_ri)
-			__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-
-		return false;
-	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
-#endif
-	return true;
-}
-
-static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_enabled)
-{
-	if (__prep_irq_for_enabled_exit(clear_ri))
-		return true;
-
-	/*
-	 * Must replay pending soft-masked interrupts now. Don't just
-	 * local_irq_enabe(); local_irq_disable(); because if we are
-	 * returning from an asynchronous interrupt here, another one
-	 * might hit after irqs are enabled, and it would exit via this
-	 * same path allowing another to fire, and so on unbounded.
-	 *
-	 * If interrupts were enabled when this interrupt exited,
-	 * indicating a process context (synchronous) interrupt,
-	 * local_irq_enable/disable can be used, which will enable
-	 * interrupts rather than keeping them masked (unclear how
-	 * much benefit this is over just replaying for all cases,
-	 * because we immediately disable again, so all we're really
-	 * doing is allowing hard interrupts to execute directly for
-	 * a very small time, rather than being masked and replayed).
-	 */
-	if (irqs_enabled) {
-		local_irq_enable();
-		local_irq_disable();
-	} else {
-		replay_soft_interrupts();
-	}
-
-	return false;
-}
-
 static notrace void booke_load_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
@@ -234,57 +169,11 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-/*
- * This should be called after a syscall returns, with r3 the return value
- * from the syscall. If this function returns non-zero, the system call
- * exit assembly should additionally load all GPR registers and CTR and XER
- * from the interrupt frame.
- *
- * The function graph tracer can not trace the return side of this function,
- * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
- */
-notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs,
-					   long scv)
+notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
+						struct pt_regs *regs)
 {
 	unsigned long ti_flags;
 	unsigned long ret = 0;
-	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
-
-	CT_WARN_ON(ct_state() == CONTEXT_USER);
-
-	kuap_assert_locked();
-
-	regs->result = r3;
-
-	/* Check whether the syscall is issued inside a restartable sequence */
-	rseq_syscall(regs);
-
-	ti_flags = current_thread_info()->flags;
-
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
-		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
-			r3 = -r3;
-			regs->ccr |= 0x10000000; /* Set SO bit in CR */
-		}
-	}
-
-	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
-		if (ti_flags & _TIF_RESTOREALL)
-			ret = _TIF_RESTOREALL;
-		else
-			regs->gpr[3] = r3;
-		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
-	} else {
-		regs->gpr[3] = r3;
-	}
-
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-		do_syscall_trace_leave(regs);
-		ret |= _TIF_RESTOREALL;
-	}
-
-	local_irq_disable();
 
 again:
 	ti_flags = READ_ONCE(current_thread_info()->flags);
@@ -330,16 +219,16 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	user_enter_irqoff();
-
 	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!__prep_irq_for_enabled_exit(is_not_scv))) {
-		user_exit_irqoff();
+	if (unlikely(lazy_irq_pending_nocheck())) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
 	}
 
+	user_enter_irqoff();
+	trace_hardirqs_on();
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
 #endif
@@ -359,6 +248,84 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
+/*
+ * This should be called after a syscall returns, with r3 the return value
+ * from the syscall. If this function returns non-zero, the system call
+ * exit assembly should additionally load all GPR registers and CTR and XER
+ * from the interrupt frame.
+ *
+ * The function graph tracer can not trace the return side of this function,
+ * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
+ */
+notrace unsigned long syscall_exit_prepare(unsigned long r3,
+					   struct pt_regs *regs,
+					   long scv)
+{
+	unsigned long ti_flags;
+	unsigned long ret = 0;
+	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
+
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
+	kuap_assert_locked();
+
+	regs->result = r3;
+
+	/* Check whether the syscall is issued inside a restartable sequence */
+	rseq_syscall(regs);
+
+	ti_flags = current_thread_info()->flags;
+
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			r3 = -r3;
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
+	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
+		if (ti_flags & _TIF_RESTOREALL)
+			ret = _TIF_RESTOREALL;
+		else
+			regs->gpr[3] = r3;
+		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
+	} else {
+		regs->gpr[3] = r3;
+	}
+
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		do_syscall_trace_leave(regs);
+		ret |= _TIF_RESTOREALL;
+	}
+
+	local_irq_disable();
+	ret |= syscall_exit_prepare_main(r3, regs);
+
+	regs->exit_result = ret;
+
+	return ret;
+}
+
+notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs)
+{
+	/* This is called in when detecting a soft-pending interrupt as well,
+	 * so can't just have restart table returns clear SRR1[MSR] and set
+	 * PACA_IRQ_HARD_DIS here (unless the soft-pending case were to clear
+	 * MSR[EE] too).
+	 */
+	hard_irq_disable();
+
+	trace_hardirqs_off();
+	user_exit_irqoff();
+	account_cpu_user_entry();
+
+	BUG_ON(!user_mode(regs));
+
+	regs->exit_result |= syscall_exit_prepare_main(r3, regs);
+
+	return regs->exit_result;
+}
+
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ti_flags;
@@ -414,15 +381,15 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 		}
 	}
 
-	user_enter_irqoff();
-
-	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
-		user_exit_irqoff();
+	if (unlikely(lazy_irq_pending_nocheck())) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
 	}
 
+	user_enter_irqoff();
+	trace_hardirqs_on();
+
 	booke_load_dbcr0();
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -437,6 +404,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 #ifndef CONFIG_PPC_BOOK3E_64
 	kuap_user_restore(regs);
 #endif
+	regs->exit_result = ret;
 
 	return ret;
 }
@@ -466,11 +434,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	kuap = kuap_get_and_assert_locked();
 #endif
 
-	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
-		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
-		ret = 1;
-	}
-
 	local_irq_save(flags);
 
 	if (!arch_irq_disabled_regs(regs)) {
@@ -485,17 +448,42 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 			}
 		}
 
-		if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
+		/*
+		 * May replay pending soft-masked interrupts now. Don't just
+		 * local_irq_enabe(); local_irq_disable(); because if we are
+		 * returning from an asynchronous interrupt here, another one
+		 * might hit after irqs are enabled, and it would exit via this
+		 * same path allowing another to fire, and so on unbounded.
+		 */
+		if (unlikely(lazy_irq_pending_nocheck())) {
+			hard_irq_disable();
+			replay_soft_interrupts();
+			/* Took an interrupt, may have more exit work to do. */
 			goto again;
+		}
+		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+
+		trace_hardirqs_on();
 	} else {
-		/* Returning to a kernel context with local irqs disabled. */
-		__hard_EE_RI_disable();
 #ifdef CONFIG_PPC64
+		/* Returning to a kernel context with local irqs disabled. */
 		if (regs->msr & MSR_EE)
 			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
 #endif
 	}
 
+	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
+		/* Stack store can't be restarted (stack might have been clobbered) */
+		__hard_EE_RI_disable();
+		if (unlikely(lazy_irq_pending_nocheck()) && !arch_irq_disabled_regs(regs)) {
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			__hard_RI_enable();
+			goto again;
+		}
+
+		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
+		ret = 1;
+	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -512,3 +500,39 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 	return ret;
 }
+
+#ifdef CONFIG_PPC64
+notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
+{
+	hard_irq_disable();
+
+	trace_hardirqs_off();
+	user_exit_irqoff();
+	account_cpu_user_entry();
+
+	BUG_ON(!user_mode(regs));
+
+	regs->exit_result |= interrupt_exit_user_prepare(regs);
+
+	return regs->exit_result;
+}
+
+/* No real need to return a value here because the stack store can't be
+ * restarted
+ */
+notrace unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs)
+{
+	hard_irq_disable();
+
+#ifndef CONFIG_PPC_BOOK3E_64
+	set_kuap(AMR_KUAP_BLOCKED);
+#endif
+
+	if (regs->softe == IRQS_ENABLED)
+		trace_hardirqs_off();
+
+	BUG_ON(user_mode(regs));
+
+	return interrupt_exit_kernel_prepare(regs);
+}
+#endif
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index c6a0349dde59..2b68b1dea8bf 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -119,9 +119,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,1 /* scv */
 	bl	syscall_exit_prepare
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Lsyscall_vectored_\name\()_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Lsyscall_vectored_\name\()_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	EXIT_KERNEL_SECURITY_FALLBACK
 
@@ -173,8 +182,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.	/* prevent speculative execution */
 
 .Lsyscall_vectored_\name\()_restore_regs:
-	li	r3,0
-	mtmsrd	r3,1
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r5
 
@@ -192,9 +199,26 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_2GPRS(12, r1)
 	ld	r1,GPR1(r1)
 	RFI_TO_USER
+.Lsyscall_vectored_\name\()_rst_end:
+
+.Lsyscall_vectored_\name\()_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	ld	r3,RESULT(r1)
+	addi	r4,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	syscall_exit_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Lsyscall_vectored_\name\()_rst_start
+
+RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, .Lsyscall_vectored_\name\()_restart)
+
 .endm
 
 system_call_vectored common 0x3000
+
 /*
  * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
  * which is tested by system_call_exception when r0 is -1 (as set by vector
@@ -299,9 +323,18 @@ END_BTB_FLUSH_SECTION
 	bl	system_call_exception
 
 .Lsyscall_exit:
-	addi    r4,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,0 /* !scv */
 	bl	syscall_exit_prepare
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Lsyscall_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Lsyscall_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	EXIT_KERNEL_SECURITY_FALLBACK
 
@@ -370,6 +403,21 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_8GPRS(4, r1)
 	ld	r12,GPR12(r1)
 	b	.Lsyscall_restore_regs_cont
+.Lsyscall_rst_end:
+
+.Lsyscall_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	ld	r3,RESULT(r1)
+	addi	r4,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	syscall_exit_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Lsyscall_rst_start
+
+RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, .Lsyscall_restart)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 .Ltabort_syscall:
@@ -462,13 +510,28 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	ld	r4,_MSR(r1)
 	andi.	r0,r4,MSR_PR
 	beq	.Lkernel_interrupt_return_\srr
+.Linterrupt_return_\srr\()_user:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
-.Lfast_user_interrupt_return_\srr\():
+.Lrestore_nvgprs_\srr\()_cont:
 	EXIT_KERNEL_SECURITY_FALLBACK
 
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_user_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Linterrupt_return_\srr\()_user_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
+
+.Lfast_user_interrupt_return_\srr\():
+	lbz	r4,PACAIRQSOFTMASK(r13)
+	tdnei	r4,IRQS_ENABLED
+
 BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
@@ -534,16 +597,44 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_USER
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_user_rst_end:
 
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
-	b	.Lfast_user_interrupt_return_\srr
+	b	.Lrestore_nvgprs_\srr\()_cont
+
+.Linterrupt_return_\srr\()_user_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	interrupt_exit_user_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Linterrupt_return_\srr\()_user_rst_start
+
+RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, .Linterrupt_return_\srr\()_user_restart)
 
 	.balign IFETCH_ALIGN_BYTES
 .Lkernel_interrupt_return_\srr\():
+.Linterrupt_return_\srr\()_kernel:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_kernel_rst_start:
+	lbz	r11,SOFTE(r1)
+	cmpwi	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bne	1f
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	.Linterrupt_return_\srr\()_kernel_restart
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
+1:
+
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
@@ -637,6 +728,21 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_KERNEL
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_kernel_rst_end:
+
+.Linterrupt_return_\srr\()_kernel_restart:
+	GET_PACA(r13)
+	ld	r1,PACA_EXIT_SAVE_R1(r13)
+	ld	r2,PACATOC(r13)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	li	r11,IRQS_ALL_DISABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bl	interrupt_exit_kernel_restart
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+	b	.Linterrupt_return_\srr\()_kernel_rst_start
+
+RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, .Linterrupt_return_\srr\()_kernel_restart)
+
 .endm
 
 interrupt_return_macro srr
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F73AB804
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RWD28v7z3f4L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:56:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RHwWMtV4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RHwWMtV4; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPk5D6xz3c4S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:54 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id e33so5320810pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/Oae6ju9rzYKBPBh+kFnM8hdavm/t1q/Fw1WWwQf74=;
 b=RHwWMtV445fdQD+eIjdBzry9DZKxS6rN5tjrwy2RnxLTI5ToSDGHkc9cYECVCe/Aka
 KscRmdg6glQsq7rqJMGvfoT8286xmPNW9I7penp+A2xFkPXVGIkGdDeZ/UPyveRFx+03
 DZRl4akR3w9aObV4eChGfq8F8QqHI5DFcTHEi1y8NwVvDBI449l1W2GUX0qiaPA5Rizu
 pm3gMHK2QfpojbCz5ZRXAjVGzFVUE1gRtAMHa5VIDgVYS21mqBlGA83CuhWmjqxEIFXM
 B5kJ9gyo3qv25vpuaoNNKlkB/ZabGj8SE2sIAHHdMr/XgsYfIqlgpoyB8juVi8KQvH5D
 MmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/Oae6ju9rzYKBPBh+kFnM8hdavm/t1q/Fw1WWwQf74=;
 b=X4/VD9SoPq6/iZM7SgjsCqKJtP7XiNi6v1eXjObhx0ijP0znc4yNXyVwciZGXx2TdZ
 6MDCzelnFMLyvN3Kc/WyHkH8f2Ae2SD6ZexQ2RqKDElBZzk/dVKGYC59whcHKiE3FQTV
 U9BINe94HR5Ircr4Em2vooCiZKkv5VCRSW6Az0i7ChIY0FarWJ50gwjXKpPr5NGI6aYO
 vs0WJvI6O4zMYJrSSSPnD2JMqtdBIo4NKivS61jK7o/lsG/83oQmfCxwG27sD3D7ecl/
 +elrvfP/5w8v/7+2PbOS9X6nUfDclyTQDH0eKTpvbnPqgRpglyQws6G4BIG6mxmV3t25
 KU/Q==
X-Gm-Message-State: AOAM530sEst5+FkWtBf2XyQgrfFL8NgAJcLlJvh981OLZaO2+B4EJain
 8ZKpHwyxLwovYs/0Hqn6pQT33bLJpOw=
X-Google-Smtp-Source: ABdhPJy8sQ9H86uzCL+byaO7U1eZAnALiSl/H1GGNJnGe3h8v2mhqkue8PD3R51ULQgL9jXlHDd+jQ==
X-Received: by 2002:a63:d908:: with SMTP id r8mr5569457pgg.414.1623945110715; 
 Thu, 17 Jun 2021 08:51:50 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/17] powerpc/64: use interrupt restart table to speed up
 return from interrupt
Date: Fri, 18 Jun 2021 01:51:11 +1000
Message-Id: <20210617155116.2167984-13-npiggin@gmail.com>
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

Use the restart table facility to return from interrupt or system calls
without disabling MSR[EE] or MSR[RI].

Interrupt return asm is put into the low soft-masked region, to prevent
interrupts being processed here, although they are still taken as masked
interrupts which causes SRRs to be clobbered, and a pending soft-masked
interrupt to require replaying.

The return code uses restart table regions to redirct to a fixup handler
rather than continue with the exit, if such an interrupt happens. In
this case the interrupt return is redirected to a fixup handler which
reloads r1 for the interrupt stack and reloads registers and sets state
up to replay the soft-masked interrupt and try the exit again.

Some types of security exit fallback flushes and barriers are currently
unable to cope with reentrant interrupts, e.g., because they store some
state in the scratch SPR which would be clobbered even by masked
interrupts. For now the interrupts-enabled exits are disabled when these
flushes are used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   5 +
 arch/powerpc/include/asm/hw_irq.h         |  13 +-
 arch/powerpc/include/asm/interrupt.h      |   2 +
 arch/powerpc/include/asm/paca.h           |   3 +
 arch/powerpc/include/asm/ptrace.h         |   1 +
 arch/powerpc/kernel/asm-offsets.c         |   3 +
 arch/powerpc/kernel/interrupt.c           | 393 ++++++++++++++--------
 arch/powerpc/kernel/interrupt_64.S        | 143 ++++++--
 arch/powerpc/lib/feature-fixups.c         |  52 ++-
 9 files changed, 457 insertions(+), 158 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 95492655462e..89765b2b3be0 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -73,6 +73,11 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
+#ifdef CONFIG_PPC64
+unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs);
+unsigned long interrupt_exit_user_restart(struct pt_regs *regs);
+unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs);
+#endif
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 19bcef666cf6..21cc571ea9c2 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -18,8 +18,17 @@
  * PACA flags in paca->irq_happened.
  *
  * This bits are set when interrupts occur while soft-disabled
- * and allow a proper replay. Additionally, PACA_IRQ_HARD_DIS
- * is set whenever we manually hard disable.
+ * and allow a proper replay.
+ *
+ * The PACA_IRQ_HARD_DIS is set whenever we hard disable. It is almost
+ * always in synch with the MSR[EE] state, except:
+ * - A window in interrupt entry, where hardware disables MSR[EE] and that
+ *   must be "reconciled" with the soft mask state.
+ * - NMI interrupts that hit in awkward places, until they fix the state.
+ * - When local irqs are being enabled and state is being fixed up.
+ * - When returning from an interrupt there are some windows where this
+ *   can become out of synch, but gets fixed before the RFI or before
+ *   executing the next user instruction (see arch/powerpc/kernel/interrupt.c).
  */
 #define PACA_IRQ_HARD_DIS	0x01
 #define PACA_IRQ_DBELL		0x02
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 88043e46442a..c7b4adbe2dfe 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -79,6 +79,8 @@ unsigned long search_kernel_restart_table(unsigned long addr);
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
+DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
+
 static inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dfc984b0e640..ca0b52e107a8 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -167,6 +167,9 @@ struct paca_struct {
 	u64 kstack;			/* Saved Kernel stack addr */
 	u64 saved_r1;			/* r1 save for RTAS calls or PM or EE=0 */
 	u64 saved_msr;			/* MSR saved here by enter_rtas */
+#ifdef CONFIG_PPC64
+	u64 exit_save_r1;		/* Syscall/interrupt R1 save */
+#endif
 #ifdef CONFIG_PPC_BOOK3E
 	u16 trap_save;			/* Used when bad stack is encountered */
 #endif
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 516117bba4e6..cb2b093dee13 100644
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
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index ebe9afef619f..f90a8876e622 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -286,6 +286,9 @@ int main(void)
 	OFFSET(PACAHWCPUID, paca_struct, hw_cpu_id);
 	OFFSET(PACAKEXECSTATE, paca_struct, kexec_state);
 	OFFSET(PACA_DSCR_DEFAULT, paca_struct, dscr_default);
+#ifdef CONFIG_PPC64
+	OFFSET(PACA_EXIT_SAVE_R1, paca_struct, exit_save_r1);
+#endif
 #ifdef CONFIG_PPC_BOOK3E
 	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
 #endif
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 05fa3ae56e25..6dc9b7536511 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -26,6 +26,83 @@ unsigned long global_dbcr0[NR_CPUS];
 
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
+static inline bool exit_must_hard_disable(void)
+{
+	return static_branch_unlikely(&interrupt_exit_not_reentrant);
+}
+#else
+static inline bool exit_must_hard_disable(void)
+{
+	return false;
+}
+#endif
+
+/*
+ * local irqs must be disabled. Returns false if the caller must re-enable
+ * them, check for new work, and try again.
+ *
+ * This should be called with local irqs disabled, but if they were previously
+ * enabled when the interrupt handler returns (indicating a process-context /
+ * synchronous interrupt) then irqs_enabled should be true.
+ */
+static notrace __always_inline bool prep_irq_for_user_exit(void)
+{
+	user_enter_irqoff();
+	/* This must be done with RI=1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+#ifdef CONFIG_PPC32
+	__hard_EE_RI_disable();
+#else
+	if (exit_must_hard_disable())
+		__hard_EE_RI_disable();
+
+	/* This pattern matches prep_irq_for_idle */
+	if (unlikely(lazy_irq_pending_nocheck())) {
+		if (exit_must_hard_disable()) {
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			__hard_RI_enable();
+		}
+		trace_hardirqs_off();
+		user_exit_irqoff();
+
+		return false;
+	}
+#endif
+	return true;
+}
+
+/*
+ * restartable is true then EE/RI can be left on because interrupts are handled
+ * with a restart sequence.
+ */
+static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
+{
+	/* This must be done with RI=1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+#ifdef CONFIG_PPC32
+	__hard_EE_RI_disable();
+#else
+	if (exit_must_hard_disable() || !restartable)
+		__hard_EE_RI_disable();
+
+	/* This pattern matches prep_irq_for_idle */
+	if (unlikely(lazy_irq_pending_nocheck())) {
+		if (exit_must_hard_disable() || !restartable) {
+			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+			__hard_RI_enable();
+		}
+		trace_hardirqs_off();
+
+		return false;
+	}
+#endif
+	return true;
+}
+
 /* Has to run notrace because it is entered not completely "reconciled" */
 notrace long system_call_exception(long r3, long r4, long r5,
 				   long r6, long r7, long r8,
@@ -144,71 +221,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
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
@@ -231,57 +243,11 @@ static notrace void booke_load_dbcr0(void)
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
+static notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
+						       struct pt_regs *regs)
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
@@ -327,11 +293,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	user_enter_irqoff();
-
-	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!__prep_irq_for_enabled_exit(is_not_scv))) {
-		user_exit_irqoff();
+	if (!prep_irq_for_user_exit()) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -352,6 +314,95 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
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
+#ifdef CONFIG_PPC64
+	regs->exit_result = ret;
+#endif
+
+	return ret;
+}
+
+#ifdef CONFIG_PPC64
+notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *regs)
+{
+	/*
+	 * This is called when detecting a soft-pending interrupt as well as
+	 * an alternate-return interrupt. So we can't just have the alternate
+	 * return path clear SRR1[MSR] and set PACA_IRQ_HARD_DIS (unless
+	 * the soft-pending case were to fix things up as well). RI might be
+	 * disabled, in which case it gets re-enabled by __hard_irq_disable().
+	 */
+	__hard_irq_disable();
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	set_kuap(AMR_KUAP_BLOCKED);
+#endif
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
+#endif
+
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ti_flags;
@@ -405,10 +456,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 		}
 	}
 
-	user_enter_irqoff();
-
-	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
-		user_exit_irqoff();
+	if (!prep_irq_for_user_exit()) {
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -422,6 +470,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 
 	account_cpu_user_exit();
 
+#ifdef CONFIG_PPC64
+	regs->exit_result = ret;
+#endif
+
 	/* Restore user access locks last */
 	kuap_user_restore(regs);
 	kuep_unlock();
@@ -436,6 +488,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	unsigned long flags;
 	unsigned long ret = 0;
 	unsigned long kuap;
+	bool stack_store = current_thread_info()->flags &
+						_TIF_EMULATE_STACK_STORE;
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
 	    unlikely(!(regs->msr & MSR_RI)))
@@ -450,11 +504,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 	kuap = kuap_get_and_assert_locked();
 
-	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
-		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
-		ret = 1;
-	}
-
 	local_irq_save(flags);
 
 	if (!arch_irq_disabled_regs(regs)) {
@@ -469,17 +518,54 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 			}
 		}
 
-		if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
+		/*
+		 * Stack store exit can't be restarted because the interrupt
+		 * stack frame might have been clobbered.
+		 */
+		if (!prep_irq_for_kernel_enabled_exit(unlikely(stack_store))) {
+			/*
+			 * Replay pending soft-masked interrupts now. Don't
+			 * just local_irq_enabe(); local_irq_disable(); because
+			 * if we are returning from an asynchronous interrupt
+			 * here, another one might hit after irqs are enabled,
+			 * and it would exit via this same path allowing
+			 * another to fire, and so on unbounded.
+			 */
+			hard_irq_disable();
+			replay_soft_interrupts();
+			/* Took an interrupt, may have more exit work to do. */
 			goto again;
-	} else {
-		/* Returning to a kernel context with local irqs disabled. */
-		__hard_EE_RI_disable();
+		}
 #ifdef CONFIG_PPC64
+		/*
+		 * An interrupt may clear MSR[EE] and set this concurrently,
+		 * but it will be marked pending and the exit will be retried.
+		 * This leaves a racy window where MSR[EE]=0 and HARD_DIS is
+		 * clear, until interrupt_exit_kernel_restart() calls
+		 * hard_irq_disable(), which will set HARD_DIS again.
+		 */
+		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+
+	} else {
+		if (unlikely(stack_store))
+			__hard_EE_RI_disable();
+		/*
+		 * Returning to a kernel context with local irqs disabled.
+		 * Here, if EE was enabled in the interrupted context, enable
+		 * it on return as well. A problem exists here where a soft
+		 * masked interrupt may have cleared MSR[EE] and set HARD_DIS
+		 * here, and it will still exist on return to the caller. This
+		 * will be resolved by the masked interrupt firing again.
+		 */
 		if (regs->msr & MSR_EE)
 			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
-#endif
+#endif /* CONFIG_PPC64 */
 	}
 
+	if (unlikely(stack_store)) {
+		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
+		ret = 1;
+	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -494,3 +580,46 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 	return ret;
 }
+
+#ifdef CONFIG_PPC64
+notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
+{
+	__hard_irq_disable();
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	set_kuap(AMR_KUAP_BLOCKED);
+#endif
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
+/*
+ * No real need to return a value here because the stack store case does not
+ * get restarted.
+ */
+notrace unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs)
+{
+	__hard_irq_disable();
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+#ifdef CONFIG_PPC_BOOK3S_64
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
index 33ee83791487..e7a50613a570 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -58,7 +58,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 BEGIN_FTR_SECTION
 	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
+	bne	tabort_syscall
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 	SCV_INTERRUPT_TO_KERNEL
@@ -116,9 +116,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
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
+	bne-	syscall_vectored_\name\()_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	ld	r2,_CCR(r1)
 	ld	r4,_NIP(r1)
@@ -168,8 +177,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	b	.	/* prevent speculative execution */
 
 .Lsyscall_vectored_\name\()_restore_regs:
-	li	r3,0
-	mtmsrd	r3,1
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r5
 
@@ -187,9 +194,26 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_2GPRS(12, r1)
 	ld	r1,GPR1(r1)
 	RFI_TO_USER
+.Lsyscall_vectored_\name\()_rst_end:
+
+syscall_vectored_\name\()_restart:
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
+RESTART_TABLE(.Lsyscall_vectored_\name\()_rst_start, .Lsyscall_vectored_\name\()_rst_end, syscall_vectored_\name\()_restart)
+
 .endm
 
 system_call_vectored common 0x3000
+
 /*
  * We instantiate another entry copy for the SIGILL variant, with TRAP=0x7ff0
  * which is tested by system_call_exception when r0 is -1 (as set by vector
@@ -222,7 +246,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_common)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 BEGIN_FTR_SECTION
 	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
+	bne	tabort_syscall
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
 	mr	r10,r1
@@ -292,9 +316,18 @@ END_BTB_FLUSH_SECTION
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
+	bne-	syscall_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
 	ld	r2,_CCR(r1)
 	ld	r6,_LINK(r1)
@@ -361,9 +394,24 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_8GPRS(4, r1)
 	ld	r12,GPR12(r1)
 	b	.Lsyscall_restore_regs_cont
+.Lsyscall_rst_end:
+
+syscall_restart:
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
+RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-.Ltabort_syscall:
+tabort_syscall:
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
@@ -427,8 +475,10 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
 #ifdef CONFIG_PPC_BOOK3S
-	bne	.Lfast_user_interrupt_return_amr_srr
-	kuap_kernel_restore r3, r4
+	beq	1f
+	kuap_user_restore r3, r4
+	b	.Lfast_user_interrupt_return_srr
+1:	kuap_kernel_restore r3, r4
 	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return_srr
@@ -452,18 +502,18 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	bl	interrupt_exit_user_prepare
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
+.Lrestore_nvgprs_\srr\()_cont:
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_user_rst_start:
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	interrupt_return_\srr\()_user_restart
+	li	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 
-#ifdef CONFIG_PPC_BOOK3S
-.Lfast_user_interrupt_return_amr_\srr\():
-	kuap_user_restore r3, r4
-#endif
 .Lfast_user_interrupt_return_\srr\():
-
-BEGIN_FTR_SECTION
-	ld	r10,_PPR(r1)
-	mtspr	SPRN_PPR,r10
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
 #ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
@@ -493,6 +543,16 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	.endif
 	DEBUG_SRR_VALID \srr
 
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	lbz	r4,PACAIRQSOFTMASK(r13)
+	tdnei	r4,IRQS_ENABLED
+#endif
+
+BEGIN_FTR_SECTION
+	ld	r10,_PPR(r1)
+	mtspr	SPRN_PPR,r10
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
 FTR_SECTION_ELSE
@@ -524,16 +584,44 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_USER
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_user_rst_end:
 
 .Lrestore_nvgprs_\srr\():
 	REST_NVGPRS(r1)
-	b	.Lfast_user_interrupt_return_\srr
+	b	.Lrestore_nvgprs_\srr\()_cont
+
+interrupt_return_\srr\()_user_restart:
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
+RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, interrupt_return_\srr\()_user_restart)
 
 	.balign IFETCH_ALIGN_BYTES
 .Lkernel_interrupt_return_\srr\():
+.Linterrupt_return_\srr\()_kernel:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	interrupt_exit_kernel_prepare
 
+	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
+.Linterrupt_return_\srr\()_kernel_rst_start:
+	ld	r11,SOFTE(r1)
+	cmpwi	r11,IRQS_ENABLED
+	stb	r11,PACAIRQSOFTMASK(r13)
+	bne	1f
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	bne-	interrupt_return_\srr\()_kernel_restart
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
+1:
+
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
 #ifdef CONFIG_PPC_BOOK3S
@@ -627,6 +715,21 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	HRFI_TO_KERNEL
 	.endif
 	b	.	/* prevent speculative execution */
+.Linterrupt_return_\srr\()_kernel_rst_end:
+
+interrupt_return_\srr\()_kernel_restart:
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
+RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, interrupt_return_\srr\()_kernel_restart)
+
 .endm
 
 interrupt_return_macro srr
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index fe26f2fa0f3f..6643486d1cec 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -17,6 +17,7 @@
 #include <linux/stop_machine.h>
 #include <asm/cputable.h>
 #include <asm/code-patching.h>
+#include <asm/interrupt.h>
 #include <asm/page.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
@@ -228,6 +229,9 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 		                                           : "unknown");
 }
 
+static bool stf_exit_reentrant = false;
+static bool rfi_exit_reentrant = false;
+
 static int __do_stf_barrier_fixups(void *data)
 {
 	enum stf_barrier_type *types = data;
@@ -242,11 +246,27 @@ void do_stf_barrier_fixups(enum stf_barrier_type types)
 {
 	/*
 	 * The call to the fallback entry flush, and the fallback/sync-ori exit
-	 * flush can not be safely patched in/out while other CPUs are executing
-	 * them. So call __do_stf_barrier_fixups() on one CPU while all other CPUs
-	 * spin in the stop machine core with interrupts hard disabled.
+	 * flush can not be safely patched in/out while other CPUs are
+	 * executing them. So call __do_stf_barrier_fixups() on one CPU while
+	 * all other CPUs spin in the stop machine core with interrupts hard
+	 * disabled.
+	 *
+	 * The branch to mark interrupt exits non-reentrant is enabled first,
+	 * then stop_machine runs which will ensure all CPUs are out of the
+	 * low level interrupt exit code before patching. After the patching,
+	 * if allowed, then flip the branch to allow fast exits.
 	 */
+	static_branch_enable(&interrupt_exit_not_reentrant);
+
 	stop_machine(__do_stf_barrier_fixups, &types, NULL);
+
+	if ((types & STF_BARRIER_FALLBACK) || (types & STF_BARRIER_SYNC_ORI))
+		stf_exit_reentrant = false;
+	else
+		stf_exit_reentrant = true;
+
+	if (stf_exit_reentrant && rfi_exit_reentrant)
+		static_branch_disable(&interrupt_exit_not_reentrant);
 }
 
 void do_uaccess_flush_fixups(enum l1d_flush_type types)
@@ -412,8 +432,9 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	stop_machine(__do_entry_flush_fixups, &types, NULL);
 }
 
-void do_rfi_flush_fixups(enum l1d_flush_type types)
+static int __do_rfi_flush_fixups(void *data)
 {
+	enum l1d_flush_type types = *(enum l1d_flush_type *)data;
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
@@ -456,6 +477,29 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 							: "ori type" :
 		(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
 						: "unknown");
+
+	return 0;
+}
+
+void do_rfi_flush_fixups(enum l1d_flush_type types)
+{
+	/*
+	 * stop_machine gets all CPUs out of the interrupt exit handler same
+	 * as do_stf_barrier_fixups. do_rfi_flush_fixups patching can run
+	 * without stop_machine, so this could be achieved with a broadcast
+	 * IPI instead, but this matches the stf sequence.
+	 */
+	static_branch_enable(&interrupt_exit_not_reentrant);
+
+	stop_machine(__do_rfi_flush_fixups, &types, NULL);
+
+	if (types & L1D_FLUSH_FALLBACK)
+		rfi_exit_reentrant = false;
+	else
+		rfi_exit_reentrant = true;
+
+	if (stf_exit_reentrant && rfi_exit_reentrant)
+		static_branch_disable(&interrupt_exit_not_reentrant);
 }
 
 void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_end)
-- 
2.23.0


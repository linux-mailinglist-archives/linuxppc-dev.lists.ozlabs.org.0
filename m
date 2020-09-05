Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBC25E9A0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:12:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkN1Z5CkXzDqfF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 04:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UWgsia+D; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNq614czDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:44:11 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d9so90357pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6mPt9kB/93T2A8oqbS8W/m1m8Gm/nOJ07YcwfRl/4o=;
 b=UWgsia+DX9ZGR1AHbOLpObaxJi4XeqRGQtskyAhhahWHBGKYkkwz7gi8cLUoBUFYTB
 AfJSEssOQPqYS8lvj1Vv55cXXdK/vLFUYOZP+YqOBLCE69ZkzEpON2LieCmUJmC7v0j4
 g19xqomVRJmv2rCbuaC+uHn+CcyM3aWwWcoFIbmiLAuSVOHJmgar64RY6uvMl4moQEGJ
 ITvBhSn0sjRxxgJqjw95THLJT/2zKgulL2d+qTR4T3kartlK+G/br7X4DYUQhKwbDhNE
 U5CmFvk0Q7pxbEuTMf8a1Re54RuixeFXaZMsKfoPCAgCtS1yH/CYoTsYNVMv5KwryJM4
 6tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6mPt9kB/93T2A8oqbS8W/m1m8Gm/nOJ07YcwfRl/4o=;
 b=OoK2opl6poCUW/Hw+NpfWhJDpx/ngv+VJLw8tSbJlYriulGAoPhtYcWBjCWxQCtjck
 9efkdEIeCne6MzBbJ+Z872dBM7wFuXU6gSpPCxiL7bYr/lxMmJvA6stgpURg8Ou+Qq2A
 6G4h5jMg9hVMi6/5EmU7WFQ/ZonXgco6E49Y4FcBjkiFeeFRjXMsRJOv/rBIw9OrtvHJ
 40SPoCBeGahaw/NTGvwBZsuDfyHVNbOelM9YGxkQUFY19x1/fA6Rbo0faLhNjJwPsI5N
 hIFhf22xDoZP4NjGZUA276HRXF3yZfZDeMZQoxTf/1YIQPGLpelQHADZBe1Wg+gPU8Mh
 xwCA==
X-Gm-Message-State: AOAM532D5WtwSw1KwyyjJZGdSb/D4gOJp3MUdieKp+G0hNZTO4hnXAny
 V/5id0dzmCuxyUMwlGEU+A0=
X-Google-Smtp-Source: ABdhPJyKLYfOFMTQ2qZEXqKNp2XpvTm15UMa/+4iTAkGKspih3BMYKWyb4fgz1+kP/NQu+OjqsUTDQ==
X-Received: by 2002:a63:141d:: with SMTP id u29mr11855356pgl.315.1599327848074; 
 Sat, 05 Sep 2020 10:44:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:44:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 09/12] powerpc: move NMI entry/exit code into wrapper
Date: Sun,  6 Sep 2020 03:43:32 +1000
Message-Id: <20200905174335.3161229-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200905174335.3161229-1-npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the common NMI entry and exit code into the interrupt handler
wrappers.

This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
also MCE interrupts on 64e, by adding missing parts of the NMI entry to
them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 26 +++++++++++++++++++
 arch/powerpc/kernel/mce.c            | 12 ---------
 arch/powerpc/kernel/traps.c          | 38 +++++-----------------------
 arch/powerpc/kernel/watchdog.c       | 10 +++-----
 4 files changed, 37 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 83fe1d64cf23..69eb8a432984 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -31,6 +31,27 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
+struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 ftrace_enabled;
+#endif
+};
+
+static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+{
+	this_cpu_set_ftrace_enabled(0);
+
+	nmi_enter();
+}
+
+static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+{
+	nmi_exit();
+
+	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+}
+
+
 /**
  * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
  * @func:	Function name of the entry point
@@ -177,10 +198,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr long func(struct pt_regs *regs)			\
 {									\
+	struct interrupt_nmi_state state;				\
 	long ret;							\
 									\
+	interrupt_nmi_enter_prepare(regs, &state);			\
+									\
 	ret = ___##func (regs);						\
 									\
+	interrupt_nmi_exit_prepare(regs, &state);			\
+									\
 	return ret;							\
 }									\
 									\
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index d0bbcc4fe13c..9f39deed4fca 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -592,13 +592,6 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 {
 	long handled = 0;
-	bool nested = in_nmi();
-	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
-
-	this_cpu_set_ftrace_enabled(0);
-
-	if (!nested)
-		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
 
@@ -608,11 +601,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (!nested)
-		nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	return handled;
 }
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3784578db630..01ddbe5ed5a4 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -443,11 +443,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 {
 	unsigned long hsrr0, hsrr1;
 	bool saved_hsrrs = false;
-	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
-
-	this_cpu_set_ftrace_enabled(0);
-
-	nmi_enter();
 
 	/*
 	 * System reset can interrupt code where HSRRs are live and MSR[RI]=1.
@@ -519,10 +514,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 		mtspr(SPRN_HSRR1, hsrr1);
 	}
 
-	nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	/* What should we do here? We could issue a shutdown or hard reset. */
 
 	return 0;
@@ -828,6 +819,12 @@ int machine_check_generic(struct pt_regs *regs)
 #endif /* everything else */
 
 
+/*
+ * BOOK3S_64 does not call this handler as a non-maskable interrupt
+ * (it uses its own early real-mode handler to handle the MCE proper
+ * and then raises irq_work to call this handler when interrupts are
+ * enabled).
+ */
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
 #else
@@ -836,20 +833,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 {
 	int recover = 0;
 
-	/*
-	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
-	 * (it uses its own early real-mode handler to handle the MCE proper
-	 * and then raises irq_work to call this handler when interrupts are
-	 * enabled).
-	 *
-	 * This is silly. The BOOK3S_64 should just call a different function
-	 * rather than expecting semantics to magically change. Something
-	 * like 'non_nmi_machine_check_exception()', perhaps?
-	 */
-	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
-
-	if (nmi) nmi_enter();
-
 	__this_cpu_inc(irq_stat.mce_exceptions);
 
 	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);
@@ -874,24 +857,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (nmi) nmi_exit();
-
 	die("Machine check", regs, SIGBUS);
 
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
 		die("Unrecoverable Machine check", regs, SIGBUS);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 bail:
+#ifdef CONFIG_PPC_BOOK3S_64
 	return;
 #else
 	return 0;
-
-bail:
-	if (nmi) nmi_exit();
-
-	return 0;
 #endif
 }
 
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 824b9376ac35..dc39534836a3 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -254,11 +254,12 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 	int cpu = raw_smp_processor_id();
 	u64 tb;
 
+	/* should only arrive from kernel, with irqs disabled */
+	WARN_ON_ONCE(!arch_irq_disabled_regs(regs));
+
 	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
 		return 0;
 
-	nmi_enter();
-
 	__this_cpu_inc(irq_stat.soft_nmi_irqs);
 
 	tb = get_tb();
@@ -266,7 +267,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 		wd_smp_lock(&flags);
 		if (cpumask_test_cpu(cpu, &wd_smp_cpus_stuck)) {
 			wd_smp_unlock(&flags);
-			goto out;
+			return 0;
 		}
 		set_cpu_stuck(cpu, tb);
 
@@ -290,9 +291,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 	if (wd_panic_timeout_tb < 0x7fffffff)
 		mtspr(SPRN_DEC, wd_panic_timeout_tb);
 
-out:
-	nmi_exit();
-
 	return 0;
 }
 
-- 
2.23.0


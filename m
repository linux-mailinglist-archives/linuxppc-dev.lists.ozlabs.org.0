Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A307B3095FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:45:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScSW50nMzDrgt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AnyOZ5JO; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZNB6nZ9zDrTf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:22 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id q2so7100468plk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLT+uC4PrLEjE0oZcb77KcKBhBsIko11GfLX99zEBGE=;
 b=AnyOZ5JOdN/sVrh/KRbqwS0oRpQ5rFJXkMQ+uBzRO5deIRl2JN3e48/3nGQKSCgqdS
 8yq+m1RhFhu1hhtyYN3xBJBQZido7JF/XITFI2jkZyTB0JxOnpo/mkIlKwl6LxezpGPH
 tMBfNDUj6kSAb4WmOqW/ZChB7N7pL9SKbJc+1rbokD5cMXt2/yvQVrFXiJ1sklKlqYUk
 LKp9mPFC6lJRa4x5lPJrY5xvdEmIvHyjB+4cC3lkFNWCO1HiWUokLI7U+thnTZ0ObBBq
 OaWoec61vGpZshFULix/qdXaKZQt/2ZLw5WVKuD46W0xk1inViQWEEvsP2fcXjc2nT4H
 m+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLT+uC4PrLEjE0oZcb77KcKBhBsIko11GfLX99zEBGE=;
 b=gh2DSiLqeTFkxjY4Ecg8s+BPNzCj7xBrOCQlKXUkOc23fAFXc3RAysM8Q7/Rd4xkOy
 4sar98Ib+dcToIgPuiSIPTMSZgh3gp46qR3l5s9gnwmpcc7Fx044dsC4cXD/9sE3EETl
 u6WpIRTY6E8EVKAMBrqD2476i2/woBawMUjGuNq25/djJUnVS8NIY44cEOEjAN7r4wKG
 tNwziK1xnkyqComTLgqTLhiofTLqmZHG7MIj+gLBiXRuEhgm2guemT4fVW44tB571qeR
 XtpTcUrjJwoSwr6naLXiO0jgvMhxpC1IP9k5vsBjsHvitzMjviLtZRQ5Zk/LnhFRuCOW
 yv9w==
X-Gm-Message-State: AOAM5316NV/gPRBLPDkaf2T3kr7D+R/c1cSmWx7Tfut3kcLlWvFRyvzy
 /XgG8F4u/btkdJ6wrqbAw9z5jurV1vU=
X-Google-Smtp-Source: ABdhPJz3LoeC9LI8b0fm3EbMznhuMxvVStISoJaJk3gYbPOl8i7rq53LF8FVrDf/B0CcNCfQeknUDg==
X-Received: by 2002:a17:902:7c10:b029:e0:7a2:38c7 with SMTP id
 x16-20020a1709027c10b02900e007a238c7mr9612998pll.79.1612012277989; 
 Sat, 30 Jan 2021 05:11:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
Date: Sat, 30 Jan 2021 23:08:49 +1000
Message-Id: <20210130130852.2952424-40-npiggin@gmail.com>
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

This moves the common NMI entry and exit code into the interrupt handler
wrappers.

This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
also MCE interrupts on 64e, by adding missing parts of the NMI entry to
them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
 arch/powerpc/kernel/mce.c            | 11 ---------
 arch/powerpc/kernel/traps.c          | 35 +++++-----------------------
 arch/powerpc/kernel/watchdog.c       | 10 ++++----
 4 files changed, 38 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index ca8e08b18a16..cd819d42573c 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -94,14 +94,42 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 }
 
 struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 ftrace_enabled;
+#endif
 };
 
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+#ifdef CONFIG_PPC64
+	/* Allow DEC and PMI to be traced when they are soft-NMI */
+	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
+		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+		this_cpu_set_ftrace_enabled(0);
+	}
+#endif
+
+	/*
+	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
+	 * NMI because not everything it touches is within the RMA limit.
+	 */
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
+			!firmware_has_feature(FW_FEATURE_LPAR) ||
+			radix_enabled() || (mfmsr() & MSR_DR))
+		nmi_enter();
 }
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
+			!firmware_has_feature(FW_FEATURE_LPAR) ||
+			radix_enabled() || (mfmsr() & MSR_DR))
+		nmi_exit();
+
+#ifdef CONFIG_PPC64
+	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
+		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+#endif
 }
 
 /**
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 54269947113d..51456217ec40 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -592,12 +592,6 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 {
 	long handled = 0;
-	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
-
-	this_cpu_set_ftrace_enabled(0);
-	/* Do not use nmi_enter/exit for pseries hpte guest */
-	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
-		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
 
@@ -607,11 +601,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
-		nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	return handled;
 }
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1623400a0a7b..e61391f6948f 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -435,11 +435,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
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
@@ -514,10 +509,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 		mtspr(SPRN_HSRR1, hsrr1);
 	}
 
-	nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	/* What should we do here? We could issue a shutdown or hard reset. */
 
 	return 0;
@@ -809,6 +800,12 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 }
 NOKPROBE_SYMBOL(die_mce);
 
+/*
+ * BOOK3S_64 does not call this handler as a non-maskable interrupt
+ * (it uses its own early real-mode handler to handle the MCE proper
+ * and then raises irq_work to call this handler when interrupts are
+ * enabled).
+ */
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
 #else
@@ -817,20 +814,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
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
@@ -862,8 +845,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	if (!(regs->msr & MSR_RI))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
-	if (nmi) nmi_exit();
-
 #ifdef CONFIG_PPC_BOOK3S_64
 	return;
 #else
@@ -1886,14 +1867,10 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
 DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 {
-	nmi_enter();
-
 	__this_cpu_inc(irq_stat.pmu_irqs);
 
 	perf_irq(regs);
 
-	nmi_exit();
-
 	return 0;
 }
 #endif
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABC2AEECC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:34:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLgm5ZPBzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:34:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qCmaJz4c; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZs5FGWzDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:53 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id e21so1092313pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wE0gtoOHRfW5z1tb8LV9LKSyj0MLMCeK7D04nEHf4Fo=;
 b=qCmaJz4cqh5NT5pEkr9tkk206t/8HGORDr461fnitwMR2uWJ2C25/He+dKexVFQlaJ
 SNxXmud4k4EOV9HfDwQB+c0ys7q6GIcJ3Ddt7WtewvZj7SphSYbMS1dp4xeJmnptWc/U
 6qyX3nqEStLFX4U2VjoMUjiaH6X3jxEwGBzJa/bOv/37SGedvrrUJosGo4C09tG6X1bU
 cu03zOx+sH9YARaWTY+K4g3ijj+dvAgis0hUZVrhK+cqeViydVwOe6UfWVZgI8qKazWT
 GOQyosGMDxg6AM8swH4iuORkF7o/H+2dlQaA+n3b9um2+Bn99IW6PHIgbQJiPvaZxNhJ
 volw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wE0gtoOHRfW5z1tb8LV9LKSyj0MLMCeK7D04nEHf4Fo=;
 b=Swe68/rak2SAMdG8U8LFuZ71wswjE8z6gprCzAEL8FoVZk83+XlURHk0wWMQTMjszO
 o580B1wSToCGp1cIv484bEbXZ4ojxC3l/01zmBPJUPEVtENs8CasIbDOBvm7c3GSm8m6
 cb98wnCaXJR708h9cb9VDc4tX2UUNOhdPPA6yBm1rW7hRMjIGXlX3cxsu4QxURqKmWOC
 syRXNh2avw9aGO1RUtVI3LcG8ECEW7OsLYN1qInCEfV+MyyitI9JkZdoNqxVUsBgjBtH
 JOxbci5vB6kIUgV6xif5rXrMTvhkWzczoJ0YJFipJmdgVKl5dp0Bv2rqe4XGfwhIg0wQ
 yrCA==
X-Gm-Message-State: AOAM531crHwrM5DRT2/Eoci4fU0bFBkUTw9cYb48A/8gNpW31AB9FID/
 LOYxHhvQSwEV8MYWkbDV9/s8giP191U=
X-Google-Smtp-Source: ABdhPJykYXtMkUPV+p9AZywDhXjxGjiELwxEDLVB9WDbP+VHWyGpB3s44CX6xuvpsgnqt90HS4L1fQ==
X-Received: by 2002:a63:e553:: with SMTP id z19mr20594585pgj.102.1605087890579; 
 Wed, 11 Nov 2020 01:44:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/19] powerpc: move NMI entry/exit code into wrapper
Date: Wed, 11 Nov 2020 19:44:07 +1000
Message-Id: <20201111094410.3038123-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111094410.3038123-1-npiggin@gmail.com>
References: <20201111094410.3038123-1-npiggin@gmail.com>
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

This moves the common NMI entry and exit code into the interrupt handler
wrappers.

This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
also MCE interrupts on 64e, by adding missing parts of the NMI entry to
them. It fixes a bug with sreset on pseries HPT guests which shouldn't
call nmi_enter().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 24 ++++++++++++++++
 arch/powerpc/kernel/mce.c            | 11 --------
 arch/powerpc/kernel/traps.c          | 42 +++++-----------------------
 arch/powerpc/kernel/watchdog.c       | 10 +++----
 4 files changed, 35 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 5089ad8db0c0..38f0553e6fc5 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -95,14 +95,38 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 }
 
 struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 ftrace_enabled;
+#endif
 };
 
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+#ifdef CONFIG_PPC64
+	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+	this_cpu_set_ftrace_enabled(0);
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
+	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+#endif
 }
 
 /**
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b84459f45b1a..9f39deed4fca 100644
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
index 7baa5ba5cfb3..4ee5d3adc5f1 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -441,11 +441,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
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
@@ -517,10 +512,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 		mtspr(SPRN_HSRR1, hsrr1);
 	}
 
-	nmi_exit();
-
-	this_cpu_set_ftrace_enabled(ftrace_enabled);
-
 	/* What should we do here? We could issue a shutdown or hard reset. */
 
 	return 0;
@@ -823,6 +814,12 @@ int machine_check_generic(struct pt_regs *regs)
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
@@ -831,20 +828,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
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
@@ -869,24 +852,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
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
 NOKPROBE_SYMBOL(machine_check_exception);
@@ -1901,14 +1877,10 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 
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


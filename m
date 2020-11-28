Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C696C2C6FBD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:11:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjw1G2KbdzDsLx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IsyJcth9; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMs4Dr0zDsM4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:42:00 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id s21so6950577pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dndwMTXUHkaEtFYV+rQ1khAGitI3MWaUDWkJLeJKS48=;
 b=IsyJcth9PMoG4rrkN12zXPujNNTe1/4TiyPYJUVAjIYzfKARQoKVn5cC7aC+bHWDCT
 m4ruRhf8GDAIGDU5SF1BDs0QhNcOxRopjvUhWaU6gXVuE5yi4AeLz5NS9EjVweR+RJwQ
 KMJ7CM5sRVmwfafJzPPyCHvTWNjU+jODUR3r2WUqWgpGv1L/pDZcr8I6nxLb6+GaDtY6
 NH9oU+R2TSOwFdFiaSBTFU63hLAqo/MXOOszZEaJ35gN9hnXSMfdQeUoV6fQDghl1U2Q
 AK5NbstdDVF+a2CpE0HJZlXE5OlgayeGzPrDNNajcGpp+VfquXRlq532Xw1Ov38/jHfu
 ITNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dndwMTXUHkaEtFYV+rQ1khAGitI3MWaUDWkJLeJKS48=;
 b=QQLtbikRZbMpbB7CV3GVhzIyhK/xhYQoaUJhSFDJ+RHvBI7aGv4vqPKH1ddsfowny2
 gCLp6RkzFeqQH00ynBjCghSrnA6JG0e0hbHanLQz0gT5Kr6JFoF2/QpFdCbo7pYEPYVg
 Bar6W6raWifOomHVsqX2A8fRGQXAnwLdeTDvf9j2BdVBsEDT4Sjwz6Ha0sa1aeGEC/oJ
 rHoWC0e58XEBltUuLEhBkDrxus64MAWDurZ4JNFTPpLUzeF1b+sb5ECiiYn1nGoYAJ+3
 lc368Meu/y8+Nka3gpJnKeEyq0Vbrm2Pxc6udTc1L97UuQVzFzUSrevJUMoANl/FhujH
 JMYQ==
X-Gm-Message-State: AOAM530OgSi3FiQMAYka9aelhaMmc0ty1jU7WqsSWGUIkXJFMpbiRt/m
 4ZWbwM1ejSpN/vKWqYKHkzSKXGFx9dE=
X-Google-Smtp-Source: ABdhPJxpETKTgkOQI6J1cA4WyFzDKk4O4w1bEnw07cPGytx8bcWgM7xWf7tN5Cg7CrRhwodSvky5AA==
X-Received: by 2002:a17:90b:4595:: with SMTP id
 hd21mr16416079pjb.127.1606574517457; 
 Sat, 28 Nov 2020 06:41:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 16/19] powerpc: move NMI entry/exit code into wrapper
Date: Sun, 29 Nov 2020 00:41:11 +1000
Message-Id: <20201128144114.944000-17-npiggin@gmail.com>
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
index 26aa897d251b..8508b99d3455 100644
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
index 06b638a7f0b0..1b881ef5f07b 100644
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
@@ -1902,14 +1878,10 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 #ifdef CONFIG_PPC64
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


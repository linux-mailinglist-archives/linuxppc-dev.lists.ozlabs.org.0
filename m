Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4572F8441
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:24:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHV2W0YbzzDsP3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f4BmfZ+0; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHS081BGjzDsjG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:24 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id t29so725038pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZR900eb8YAh524BH+HmJdd1t6NZLAOrzCTi7CMC55E=;
 b=f4BmfZ+0flyXs/XWI7ZBiUSYXrOB6n9M6DHezzpEMvIkCm+u30jZ5jFLAS/TsTawf5
 T9/YTUZNG9cacCgYq7kN7QAuDMlwFtFYieqQ8V+uaB3Be5tWkEbz3+Dusmzy3op05RwT
 oRMAAVDKkxmzx+Wyd1b1HIOZZ2Y6S7OLF5XTjgkEqahaMBv66DFqEah7jtPbF25kVd4Y
 Dt+0J2FD9MSaHindbiZ60Zzn/5UKcXsgmza/vm5v9awPmMV7qGFKCZ8Bu36cIwI3dNIk
 cGH+FVNW6LM5szJmE+IT48Ul/ccEI+i5pgJOa2NVVnBfcNuME9TsoE7zNDDOTCwXYX2F
 q3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZR900eb8YAh524BH+HmJdd1t6NZLAOrzCTi7CMC55E=;
 b=fnwD3K4XnU5R7m4TTMLhmKq1xZOZ7BjbMhj98zbQp+RcoKSJWSZL5ALTNvIyFrPIx0
 /vnAeO/D3c0MMi50qurWKZedBxnaKYJuGZWB5qV03WfwKh9+us2CEFmzpgVB7V8tQa7s
 xyg6cxNU0WeZWarRDejrVhatrD5krg9z977oNNSJJYnV87FEB7ELN/4+tHb5mILU7k/M
 FQu1R0/iMQFULwBmkjpE38i1UBLGFdCh0/apMw4ioL+Ikig5GOusaxj6sGFVBYSVD8SR
 9/qC3rZPlGFCdP8gPuZZeGAsD8+SKEaMnU0qsCam8F1CnJAvWoTN2iElS8SMRGt+YqSq
 /Ydw==
X-Gm-Message-State: AOAM530BlVXDRlLcb8ruq3eQEuyiTwhmcafoORU+YHNL5RLugcgnNoIL
 6kiHxuz8584aEueq5SqlnEgpxKf8u54=
X-Google-Smtp-Source: ABdhPJwyDYP72oJ15WRwfsQR8spqMmSQd1+c4EuccEkKkuDevFyJN09hzhMCS+l8nXZeco4gK8bHkQ==
X-Received: by 2002:a65:4105:: with SMTP id w5mr13597902pgp.52.1610729541943; 
 Fri, 15 Jan 2021 08:52:21 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 36/39] powerpc: move NMI entry/exit code into wrapper
Date: Sat, 16 Jan 2021 02:50:09 +1000
Message-Id: <20210115165012.1260253-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 24 +++++++++++++++++++
 arch/powerpc/kernel/mce.c            | 11 ---------
 arch/powerpc/kernel/traps.c          | 35 +++++-----------------------
 arch/powerpc/kernel/watchdog.c       | 10 ++++----
 4 files changed, 34 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index ca8e08b18a16..879a0b2705d6 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -94,14 +94,38 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
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
index f37583d57442..9e5574756689 100644
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
@@ -1885,14 +1866,10 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
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


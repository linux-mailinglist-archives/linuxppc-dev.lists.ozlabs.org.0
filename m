Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7272C6FAF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:49:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvXw0Qm5zF11r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:49:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JoEEFRom; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMJ3hhPzDsGv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:32 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 131so6960956pfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Epu9ANqD8QC3efzS4M5Om3MIjaPYiGpwNIUscp4pCWU=;
 b=JoEEFRomrrQvkFL36iqjgl54QtTrcCfpUI5Vm2UluesXpf2RVuooUotJ5GEZDM6RSw
 MggItqjjgFnyHkZ5OE8BB9YUVWbQoXgd+jEtJlotOY6siKiR8kd8D2IShRQZoOvKxesP
 oNSQOF7y2Rk6FJhoCpzOlaYL/kOMwFjwa2YgSHFbx8/LhzcDzgB1ItagG35bGvQFAs15
 AGgYacgdMBak0eGW9t876FV3/8flLIMCyNC74h7/clBrAcDbD3IUf+xKeTAdT9O4CQU9
 xhe42mQQhAIQ6pvVE9hS5Aa5KkGUP3bqcfvce+6l9ru6I8dGF3gzRTaoIi4aclrFctFc
 2FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Epu9ANqD8QC3efzS4M5Om3MIjaPYiGpwNIUscp4pCWU=;
 b=JLpFVP2Ax5DKMVxG4Nl9j9E7C0p3Zm4WPz3CBceuYOpxxgEmieq8HeMLlNtLXAWYeh
 GuhikhsPcKQJVmZoPvuJILB2a0tB9+64oQr5IBkfW+MREzjAI1AhTZHFpJYxrIK81LTQ
 0XuFJl0IV/oKZrDqbHEizoJCoJraceUzbHXelWk71YZ26YlGHRVoejravDQPMOlT1EWJ
 K82rmx2Sv6t5DNJteMwfUH41ea2HCbFYQohbzApKN6h8W52a3LVSBDnT4aqqeuuwnYmO
 cUPRhquRepHxvJOUn0qSw8s6Y/mN7KhxXciDTSL9s6xuVjlAw+wF1ZaaVfwxlB5NUbau
 e4+w==
X-Gm-Message-State: AOAM530SOreUkd46ThJrR+4IHeDjxEO+ntp9rKRCTk2S4dcMS9WMzZRF
 M+HesgWGCVkAT5ieANd1Pd24tOiB+3M=
X-Google-Smtp-Source: ABdhPJwNf04ojqZNYwtOVdBUkn7+xksd31RAMj9Oo7dkbZ5oA7M85F1z6GzUTbleqWfKPVkrYRGXPw==
X-Received: by 2002:a17:90b:249:: with SMTP id
 fz9mr15922988pjb.233.1606574490524; 
 Sat, 28 Nov 2020 06:41:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/19] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Date: Sun, 29 Nov 2020 00:40:59 +1000
Message-Id: <20201128144114.944000-5-npiggin@gmail.com>
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

This is required in order to allow more significant differences between
NMI type interrupt handlers and regular asynchronous handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c      | 31 +++++++++++++++++++++++++++-
 arch/powerpc/perf/core-book3s.c  | 35 ++------------------------------
 arch/powerpc/perf/core-fsl-emb.c | 25 -----------------------
 3 files changed, 32 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 902fcbd1a778..7dda72eb97cc 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1919,11 +1919,40 @@ void vsx_unavailable_tm(struct pt_regs *regs)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-void performance_monitor_exception(struct pt_regs *regs)
+static void performance_monitor_exception_nmi(struct pt_regs *regs)
+{
+	nmi_enter();
+
+	__this_cpu_inc(irq_stat.pmu_irqs);
+
+	perf_irq(regs);
+
+	nmi_exit();
+}
+
+static void performance_monitor_exception_async(struct pt_regs *regs)
 {
+	irq_enter();
+
 	__this_cpu_inc(irq_stat.pmu_irqs);
 
 	perf_irq(regs);
+
+	irq_exit();
+}
+
+void performance_monitor_exception(struct pt_regs *regs)
+{
+	/*
+	 * On 64-bit, if perf interrupts hit in a local_irq_disable
+	 * (soft-masked) region, we consider them as NMIs. This is required to
+	 * prevent hash faults on user addresses when reading callchains (and
+	 * looks better from an irq tracing perspective).
+	 */
+	if (IS_ENABLED(CONFIG_PPC64) && unlikely(arch_irq_disabled_regs(regs)))
+		performance_monitor_exception_nmi(regs);
+	else
+		performance_monitor_exception_async(regs);
 }
 
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cba1494..9fd8cae09218 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -109,10 +109,6 @@ static inline void perf_read_regs(struct pt_regs *regs)
 {
 	regs->result = 0;
 }
-static inline int perf_intr_is_nmi(struct pt_regs *regs)
-{
-	return 0;
-}
 
 static inline int siar_valid(struct pt_regs *regs)
 {
@@ -328,15 +324,6 @@ static inline void perf_read_regs(struct pt_regs *regs)
 	regs->result = use_siar;
 }
 
-/*
- * If interrupts were soft-disabled when a PMU interrupt occurs, treat
- * it as an NMI.
- */
-static inline int perf_intr_is_nmi(struct pt_regs *regs)
-{
-	return (regs->softe & IRQS_DISABLED);
-}
-
 /*
  * On processors like P7+ that have the SIAR-Valid bit, marked instructions
  * must be sampled only if the SIAR-valid bit is set.
@@ -2224,7 +2211,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	struct perf_event *event;
 	unsigned long val[8];
 	int found, active;
-	int nmi;
 
 	if (cpuhw->n_limited)
 		freeze_limited_counters(cpuhw, mfspr(SPRN_PMC5),
@@ -2232,18 +2218,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 
 	perf_read_regs(regs);
 
-	/*
-	 * If perf interrupts hit in a local_irq_disable (soft-masked) region,
-	 * we consider them as NMIs. This is required to prevent hash faults on
-	 * user addresses when reading callchains. See the NMI test in
-	 * do_hash_page.
-	 */
-	nmi = perf_intr_is_nmi(regs);
-	if (nmi)
-		nmi_enter();
-	else
-		irq_enter();
-
 	/* Read all the PMCs since we'll need them a bunch of times */
 	for (i = 0; i < ppmu->n_counter; ++i)
 		val[i] = read_pmc(i + 1);
@@ -2289,8 +2263,8 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 			}
 		}
 	}
-	if (!found && !nmi && printk_ratelimit())
-		printk(KERN_WARNING "Can't find PMC that caused IRQ\n");
+	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
+		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
 
 	/*
 	 * Reset MMCR0 to its normal value.  This will set PMXE and
@@ -2300,11 +2274,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	 * we get back out of this interrupt.
 	 */
 	write_mmcr0(cpuhw, cpuhw->mmcr.mmcr0);
-
-	if (nmi)
-		nmi_exit();
-	else
-		irq_exit();
 }
 
 static void perf_event_interrupt(struct pt_regs *regs)
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index e0e7e276bfd2..ee721f420a7b 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -31,19 +31,6 @@ static atomic_t num_events;
 /* Used to avoid races in calling reserve/release_pmc_hardware */
 static DEFINE_MUTEX(pmc_reserve_mutex);
 
-/*
- * If interrupts were soft-disabled when a PMU interrupt occurs, treat
- * it as an NMI.
- */
-static inline int perf_intr_is_nmi(struct pt_regs *regs)
-{
-#ifdef __powerpc64__
-	return (regs->softe & IRQS_DISABLED);
-#else
-	return 0;
-#endif
-}
-
 static void perf_event_interrupt(struct pt_regs *regs);
 
 /*
@@ -659,13 +646,6 @@ static void perf_event_interrupt(struct pt_regs *regs)
 	struct perf_event *event;
 	unsigned long val;
 	int found = 0;
-	int nmi;
-
-	nmi = perf_intr_is_nmi(regs);
-	if (nmi)
-		nmi_enter();
-	else
-		irq_enter();
 
 	for (i = 0; i < ppmu->n_counter; ++i) {
 		event = cpuhw->event[i];
@@ -690,11 +670,6 @@ static void perf_event_interrupt(struct pt_regs *regs)
 	mtmsr(mfmsr() | MSR_PMM);
 	mtpmr(PMRN_PMGC0, PMGC0_PMIE | PMGC0_FCECE);
 	isync();
-
-	if (nmi)
-		nmi_exit();
-	else
-		irq_exit();
 }
 
 void hw_perf_event_setup(int cpu)
-- 
2.23.0


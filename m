Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E652E874D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:40:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7M1V5J51zDqq7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TLUat4WL; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7LhG1GbmzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:34 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id b5so7646290pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jpc6qUTwTx7sZRbtg7HEtKf0oUuowBznwJTgSr51KE=;
 b=TLUat4WLE5764LIv9Mqczl1hVRC3sbK4a9s1bPkGvaWOjyNgGiPxx7dbGpbJcd4Zec
 AB8hZonBIYV/RcnBZo5T2vNpAq9FBhfSHtWprsp/FwpDWX96/S9ImGFVcxKLewnq6+Dm
 bNEYbWc6Q8NRbeRiDx3mlSwQzqJ+n6MFERAkr0rV7GQ3ijhSt8o/6ORAOa2LhpnsUtpR
 yLE1iM8p8ZVyLIIqjNW2IkT21mUkmAUg0BQ5DhZrw8wwijZR46ntNoS6UK5lRpAQUknC
 C/j4iM13NgmluaXW09n7oPJSxuR5G8+HVU3w+etFp503eILIRR4CjopiYqt0YFEoQS4q
 wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jpc6qUTwTx7sZRbtg7HEtKf0oUuowBznwJTgSr51KE=;
 b=L3o8TSM0roMaS4Lt1ZRKG2JwVVawfBwvVo5oqRvXrEONwcCApKCS0abckgrx6Hl/Ak
 iNn3vNq7BW+NegZLgaWxtX18xD0xqCcVNbKDyCM2Q/XPl88vV8odgMtdKN+xxQJAFw7a
 L6V56hUY+p9ZV6X3J3dzs3dmbtn2q/vhicGnZ/fZPgDFJQGdZaofxtWePbVrvLu8GvQy
 KUvb5+FpAfwRm9zJjmbOOqct+8zIePkabW9C1MYe8P7ttubsnYYB80Xw+4Ktiu31NOqp
 Z+5fm0XBZaJOO6hHglAaxy1FHs0XUBc4+INBpR0a83HQx0hsrSeZqxIgfvqSbyOMY7l9
 38Sg==
X-Gm-Message-State: AOAM531UjJRtneVaTbxo8GKD6kMIq6JljNKZiOUVkaZMy/fzc3k+/z1Z
 hI1tftPH3Hq4Kpka1YrDxIzG5dVvZB4=
X-Google-Smtp-Source: ABdhPJw+AxAu8/2VI0DABw7KuoGNtHoUhuE+5ia70eDe2NUrJD6RtLnfFiuY/VBJnJMqLhmpkCwxhw==
X-Received: by 2002:a17:90a:764f:: with SMTP id
 s15mr21055791pjl.98.1609590331279; 
 Sat, 02 Jan 2021 04:25:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/21] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Date: Sat,  2 Jan 2021 22:24:52 +1000
Message-Id: <20210102122508.1950592-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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
index f3f6af3141ee..9b5298c016c7 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1890,11 +1890,40 @@ void vsx_unavailable_tm(struct pt_regs *regs)
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
index 28206b1fe172..9fd06010e8b6 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -110,10 +110,6 @@ static inline void perf_read_regs(struct pt_regs *regs)
 {
 	regs->result = 0;
 }
-static inline int perf_intr_is_nmi(struct pt_regs *regs)
-{
-	return 0;
-}
 
 static inline int siar_valid(struct pt_regs *regs)
 {
@@ -353,15 +349,6 @@ static inline void perf_read_regs(struct pt_regs *regs)
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
@@ -2279,7 +2266,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 	struct perf_event *event;
 	unsigned long val[8];
 	int found, active;
-	int nmi;
 
 	if (cpuhw->n_limited)
 		freeze_limited_counters(cpuhw, mfspr(SPRN_PMC5),
@@ -2287,18 +2273,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 
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
@@ -2344,8 +2318,8 @@ static void __perf_event_interrupt(struct pt_regs *regs)
 			}
 		}
 	}
-	if (!found && !nmi && printk_ratelimit())
-		printk(KERN_WARNING "Can't find PMC that caused IRQ\n");
+	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
+		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
 
 	/*
 	 * Reset MMCR0 to its normal value.  This will set PMXE and
@@ -2355,11 +2329,6 @@ static void __perf_event_interrupt(struct pt_regs *regs)
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


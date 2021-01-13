Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC132F457E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:47:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFzzx6NpKzDr5g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:47:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AlkS2BT1; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzg95zG8zDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:37 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id 11so711178pfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jpc6qUTwTx7sZRbtg7HEtKf0oUuowBznwJTgSr51KE=;
 b=AlkS2BT1ptCBHaOuFjacjQs2UHiJAdRNSw2gv8n9YeXMG5hx4Cp9QfkW2UhQiixhw2
 iq7SxBivUaqGGKlRIUxOuZ+k67hGwSikgOaxQ4xn2IuejKg0uMNKc9hjKpbGFfVRNgg+
 /dpMmjqJBi+rQQB5k+OV/hLxWQn5mIel5fK9d0YKysGYtJByYqVFdG7JIdfdEuS/hQnv
 oGNN5zECBDkHHvFmaIk+KMqvB3uoqD2TLaGxamc922y+UDjJ3kIsJUXdbBUk/qRK8KRR
 QC+5GvKYt3sZXtbuGype4CfdMhdZ8qAMifzBsBqwMyzQ7kD69cZtjq0Kv6HnGJv6H7Fr
 mlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jpc6qUTwTx7sZRbtg7HEtKf0oUuowBznwJTgSr51KE=;
 b=gmvsO1iZAuSYxLL4tIcKNsMUCpgNtFf4X7yqsQBfmXyLDof0T+7+euaAa1KaRW8l8i
 GyYDolGHN78be1wXLQbnBGq/hUfb4zLi73EYibBvvqQnv08MFn92/Pyo7Q7pVDNA/xKe
 aB6zdWzMdCTgmLyR8eDzkwXO3wE/rfr3Lzcy0hSunfh4EX1HecDKA8vTEYm6kyPzSkO2
 Sji7rF+0AFDEboMV+cRdfyF3uDqmVoDJSDwRXA9AoeCBkFMY0HgMrn3je2GC+BgEzm6W
 mCV74hAcIyiKzLxOyMAfx0qvXp+2OVU8UoV1ELOdQhKEjSUj0mCSmnTd92MmSx5giQTN
 0itQ==
X-Gm-Message-State: AOAM5314br74G1UpHo4xLLpslU4pkCDwQlw1ACEzO0kbguG3R0iMr/Ob
 uJC0qb5ENXOCJNOHqGncGmDW61hHp3c=
X-Google-Smtp-Source: ABdhPJyEWPQl+Hqwtxwg41dmII+3nyiZz6/OiLeI+rnc5NNiB3F2jw/dHeYmkCBLzhE7hMCN23fmYw==
X-Received: by 2002:aa7:9af1:0:b029:19e:568e:c452 with SMTP id
 y17-20020aa79af10000b029019e568ec452mr944066pfp.28.1610523155156; 
 Tue, 12 Jan 2021 23:32:35 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 05/21] powerpc/perf: move perf irq/nmi handling details
 into traps.c
Date: Wed, 13 Jan 2021 17:31:59 +1000
Message-Id: <20210113073215.516986-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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


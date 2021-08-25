Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 753693F7535
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvltQ1sM9z2yMq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:39:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uPDAgZy4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uPDAgZy4; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvlqX2WPxz2yMG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 22:37:28 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id y11so21153553pfl.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/ySyDykokmlH6z9bwxhPDX2ouRoSz0sZlJzqXWZ2/w=;
 b=uPDAgZy4qNjcYbEOtz9ttFrxfKN58LsV2rKzGZNbfMLccciZrrDwg2W7DJkFOZwmIX
 BsCyCbNDmrN9UvcycOJZj8kX25i5eFgXpE+9t4WdkXfgXqSkDYPKulPVMUX3FKotDIpL
 e/idnU7TrIiU1Bup3wqv3dxj8nnuabLYuuVAKvCQnVzio7yNzcfOwGmj5bB2avAqPkll
 C0ZP2pVJZHRPSDbDrVSeoIf4vGWfJnW3vqat1X53EaTw7jMVvcwXWjCJ1+Hmt1Mlh0lY
 L014+m/lE4v2bw7gcAVIqkcPF5mOB9ApEYq7P7D+sb99R8FjaSHp/BIpSsFIanpJa6Pc
 PraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/ySyDykokmlH6z9bwxhPDX2ouRoSz0sZlJzqXWZ2/w=;
 b=eiKLCA5jwBeDzCJIUj0+cY9MA1qlKTXk1S+9XSl8KWKIRa8zOSXhjT6gdReSAaYRSf
 uKaO1Qe1QoREh1nVKDoiKzF8cFtOLWQ+u7APrY5roqNb8X1mckdPYESvSO2B1Ury+/Qf
 LdMjxxn+GqJSrgJW8u5YfiqN8d0M9yBJC7Y2bbRCIjzNes01CcceQCkBCcLeSs9xchdY
 k/AEAlnGc9/PLvG98v1UPoqIewDq7bAvkkScegDC+tdTwMl0bwktADw9IhVALz+OhZI6
 9SiOAlq+U/Y29QtsjHr9P0OsfBGgHepo3F9NdInEHSkm6JtXt+aKYcvzU23d/NvClMY/
 m2FA==
X-Gm-Message-State: AOAM532hMw2ctbuyoXkfXjNDeMasayRAFTI3wo4pPzQhOsvPOVVo7gi6
 arPZMt8InjbNxtIzMiSvTa3rp//5rXo=
X-Google-Smtp-Source: ABdhPJyswviniEJC9zqolMJcWNGpOSsXOO2KGJuKIKPNswSPz+CFnuWgs/QSmNcf9hoQPw5Wlga9PA==
X-Received: by 2002:a63:ea58:: with SMTP id l24mr2035883pgk.334.1629895045898; 
 Wed, 25 Aug 2021 05:37:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-119-33.tpgi.com.au.
 [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id j6sm22043162pfi.220.2021.08.25.05.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:37:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/64s/interrupt: Don't enable MSR[EE] in irq
 handlers unless perf is in use
Date: Wed, 25 Aug 2021 22:37:13 +1000
Message-Id: <20210825123714.706201-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210825123714.706201-1-npiggin@gmail.com>
References: <20210825123714.706201-1-npiggin@gmail.com>
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

Enabling MSR[EE] in interrupt handlers while interrupts are still soft
masked allows PMIs to profile interrupt handlers to some degree, beyond
what SIAR latching allows.

When perf is not being used, this is almost useless work. It requires an
extra mtmsrd in the irq handler, and it also opens the door to masked
interrupts hitting and requiring replay, which is more expensive than
just taking them directly. This effect can be noticable in high IRQ
workloads.

Avoid enabling MSR[EE] unless perf is currently in use. This saves about
60 cycles (or 8%) on a simple decrementer interrupt microbenchmark.
Replayed interrupts drop from 1.4% of interrupts to 0.003%.

This does prevent the soft-nmi interrupt being taken in these handlers,
but that's not too reliable anyway. The SMP watchdog will continue to be
the reliable way to catch lockups.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 55 ++++++++++++++++++++++++++-----
 arch/powerpc/kernel/dbell.c       |  3 +-
 arch/powerpc/kernel/irq.c         |  3 +-
 arch/powerpc/kernel/time.c        | 31 ++++++++---------
 4 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index b987822e552e..8c78c40c006e 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -309,17 +309,54 @@ static inline bool lazy_irq_pending_nocheck(void)
 bool power_pmu_wants_prompt_pmi(void);
 
 /*
- * This is called by asynchronous interrupts to conditionally
- * re-enable hard interrupts after having cleared the source
- * of the interrupt. They are kept disabled if there is a different
- * soft-masked interrupt pending that requires hard masking.
+ * This is called by asynchronous interrupts to check whether to
+ * conditionally re-enable hard interrupts after having cleared
+ * the source of the interrupt. They are kept disabled if there
+ * is a different soft-masked interrupt pending that requires hard
+ * masking.
  */
-static inline void may_hard_irq_enable(void)
+static inline bool should_hard_irq_enable(void)
 {
-	if (!(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)) {
-		get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
-		__hard_irq_enable();
-	}
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+	WARN_ON(mfmsr() & MSR_EE);
+#endif
+#ifdef CONFIG_PERF_EVENTS
+	/*
+	 * If the PMU is not running, there is not much reason to enable
+	 * MSR[EE] in irq handlers because any interrupts would just be
+	 * soft-masked.
+	 *
+	 * TODO: Add test for 64e
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !power_pmu_wants_prompt_pmi())
+		return false;
+
+	if (get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)
+		return false;
+
+	return true;
+#else
+	return false;
+#endif
+}
+
+/*
+ * Do the hard enabling, only call this if should_hard_irq_enable is true.
+ */
+static inline void do_hard_irq_enable(void)
+{
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+	WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
+	WARN_ON(mfmsr() & MSR_EE);
+#endif
+	/*
+	 * This allows PMI interrupts (and watchdog soft-NMIs) through.
+	 * There is no other reason to enable this way.
+	 */
+	get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	__hard_irq_enable();
 }
 
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 5545c9cd17c1..f55c6fb34a3a 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -27,7 +27,8 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 
 	ppc_msgsync();
 
-	may_hard_irq_enable();
+	if (should_hard_irq_enable())
+		do_hard_irq_enable();
 
 	kvmppc_clear_host_ipi(smp_processor_id());
 	__this_cpu_inc(irq_stat.doorbell_irqs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..f658aa22a21e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -739,7 +739,8 @@ void __do_irq(struct pt_regs *regs)
 	irq = ppc_md.get_irq();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
-	may_hard_irq_enable();
+	if (should_hard_irq_enable())
+		do_hard_irq_enable();
 
 	/* And finally process it */
 	if (unlikely(!irq))
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index c487ba5a6e11..e7aab5540d09 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -567,22 +567,23 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		return;
 	}
 
-	/* Ensure a positive value is written to the decrementer, or else
-	 * some CPUs will continue to take decrementer exceptions. When the
-	 * PPC_WATCHDOG (decrementer based) is configured, keep this at most
-	 * 31 bits, which is about 4 seconds on most systems, which gives
-	 * the watchdog a chance of catching timer interrupt hard lockups.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
-		set_dec(0x7fffffff);
-	else
-		set_dec(decrementer_max);
-
-	/* Conditionally hard-enable interrupts now that the DEC has been
-	 * bumped to its maximum value
-	 */
-	may_hard_irq_enable();
+	/* Conditionally hard-enable interrupts. */
+	if (should_hard_irq_enable()) {
+		/*
+		 * Ensure a positive value is written to the decrementer, or
+		 * else some CPUs will continue to take decrementer exceptions.
+		 * When the PPC_WATCHDOG (decrementer based) is configured,
+		 * keep this at most 31 bits, which is about 4 seconds on most
+		 * systems, which gives the watchdog a chance of catching timer
+		 * interrupt hard lockups.
+		 */
+		if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
+			set_dec(0x7fffffff);
+		else
+			set_dec(decrementer_max);
 
+		do_hard_irq_enable();
+	}
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 	if (atomic_read(&ppc_n_lost_interrupts) != 0)
-- 
2.23.0


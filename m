Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02ED2F8352
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:09:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTjC4SxkzDvVq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:09:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lahKG/2j; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzv0c8qzDshy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:10 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id r4so4976829pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KufZEqGHuK1JCtG2RPfbig5+FmV6/eI/216MrpKGNhc=;
 b=lahKG/2jRyTiAUF5B9+IBefd1UGliKwtbLQBBmhEBM57gT+ud/BAgDJAyX7+PH8EoV
 tXEJSqsw0sNx1aZWblXT8MNbpI+i94SDGGfhtkLrJgnLVydndGM/RB0JaMx9YU/zIEsX
 6Np9MU+x8Gc/8wfY9GEEcGwVDI/c5afcLhKJspPO+WLFH8iByOk5nnQ0b6Lu2IUPw/2v
 o9T/quSa52nhHPigYPcd4PuZKLWc3Xge0Pp4ZRUv2fb4hyZB265dYKews59OfWXqzwwW
 4QfTLr1mV23mBsklEPkbU+Wf1o1fE1iylJP7cEEZV3txW7Kgkc9dKExpRuNDYHiUR8tT
 j/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KufZEqGHuK1JCtG2RPfbig5+FmV6/eI/216MrpKGNhc=;
 b=MtlVe0A4DhWVltTmzIcaE1cmT/HRrRXlsvzLomsmPg1ogYa1aVZ4sdud0w5Xe/5xBR
 /Ch6o+loMYaERHOo4fg+ZjWymH1jVi06+4493+a1kdKuEd1u/soarlwPw6KOW93pSi2E
 nMjITKSGYjJR1o44aD9ioLcSbobnjvBrhT8QqVkMc5uCxo3Lx1GtKH+GjB7L/MeY5khh
 5o9DShkuJJrvzIM9g2nOCZPggJaUtsUt0xILxVpztuaXh9hXlW5oeLvXrtS6uzHNTBvc
 e0l64zDTtWFUT8dqpyQ8vdMziCkHg72iJ8DiHYf0ySvvksEVT8x/JZBNU4FzUPw7baG7
 5cqA==
X-Gm-Message-State: AOAM530fVWSFQY5rcfEfG4k4MDeYFFfIAeAL1kofe1OAZZoyJGzvyP7G
 QPlPO7MXbVfMt2IHdaURKFDpxAWmyyk=
X-Google-Smtp-Source: ABdhPJyMp10T2yCgNLic2oKgNGXujMs/dlqzfOMBeIA6fDeqaWVTY9oQDwNMnyOetGhYGZhko0N/gQ==
X-Received: by 2002:a17:90b:a47:: with SMTP id
 gw7mr11534939pjb.1.1610729527664; 
 Fri, 15 Jan 2021 08:52:07 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 31/39] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Sat, 16 Jan 2021 02:50:04 +1000
Message-Id: <20210115165012.1260253-32-npiggin@gmail.com>
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

Move irq_enter/irq_exit into asynchronous interrupt handler wrappers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  2 ++
 arch/powerpc/kernel/dbell.c          |  3 +--
 arch/powerpc/kernel/irq.c            |  4 ----
 arch/powerpc/kernel/tau_6xx.c        |  3 ---
 arch/powerpc/kernel/time.c           |  4 ++--
 arch/powerpc/kernel/traps.c          | 10 +++-------
 6 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f7f64c3c514d..5a1395499508 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -43,10 +43,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
 	interrupt_enter_prepare(regs, state);
+	irq_enter();
 }
 
 static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+	irq_exit();
 	interrupt_exit_prepare(regs, state);
 }
 
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 6a7ecfca5c3b..5545c9cd17c1 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -23,7 +23,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
-	irq_enter();
 	trace_doorbell_entry(regs);
 
 	ppc_msgsync();
@@ -36,7 +35,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 	smp_ipi_demux_relaxed(); /* already performed the barrier */
 
 	trace_doorbell_exit(regs);
-	irq_exit();
+
 	set_irq_regs(old_regs);
 }
 #else /* CONFIG_SMP */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 2055d204d08e..681abb7c0507 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -641,8 +641,6 @@ void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
 
-	irq_enter();
-
 	trace_irq_entry(regs);
 
 	/*
@@ -662,8 +660,6 @@ void __do_irq(struct pt_regs *regs)
 		generic_handle_irq(irq);
 
 	trace_irq_exit(regs);
-
-	irq_exit();
 }
 
 DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 46b2e5de4ef5..d864f07bab74 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -104,12 +104,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(TAUException)
 {
 	int cpu = smp_processor_id();
 
-	irq_enter();
 	tau[cpu].interrupts++;
 
 	TAUupdate(cpu);
-
-	irq_exit();
 }
 #endif /* CONFIG_TAU_INT */
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 435a251247ed..2177defb7884 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -610,7 +610,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 #endif
 
 	old_regs = set_irq_regs(regs);
-	irq_enter();
+
 	trace_timer_interrupt_entry(regs);
 
 	if (test_irq_work_pending()) {
@@ -635,7 +635,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 	}
 
 	trace_timer_interrupt_exit(regs);
-	irq_exit();
+
 	set_irq_regs(old_regs);
 }
 EXPORT_SYMBOL(timer_interrupt);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d3892f402b0e..f37583d57442 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -801,7 +801,9 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 	 * do_exit() checks for in_interrupt() and panics in that case, so
 	 * exit the irq/nmi before calling die.
 	 */
-	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		irq_exit();
+	else
 		nmi_exit();
 	die(str, regs, err);
 }
@@ -1061,7 +1063,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	struct pt_regs *old_regs;
 
 	old_regs = set_irq_regs(regs);
-	irq_enter();
 
 #ifdef CONFIG_VSX
 	/* Real mode flagged P9 special emu is needed */
@@ -1081,7 +1082,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	if (ppc_md.handle_hmi_exception)
 		ppc_md.handle_hmi_exception(regs);
 
-	irq_exit();
 	set_irq_regs(old_regs);
 }
 
@@ -1899,13 +1899,9 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 
 DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async)
 {
-	irq_enter();
-
 	__this_cpu_inc(irq_stat.pmu_irqs);
 
 	perf_irq(regs);
-
-	irq_exit();
 }
 
 DEFINE_INTERRUPT_HANDLER_RAW(performance_monitor_exception)
-- 
2.23.0


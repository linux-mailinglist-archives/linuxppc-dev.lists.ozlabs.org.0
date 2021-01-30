Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 544C63095F2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:36:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScGK2L9PzDsV9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lOAjt1cB; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMh701BzDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:56 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id q20so8022039pfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8xsNoPoS1c4ZSiDcITNh9dhGjslVxoI6M2axq7Ywhg=;
 b=lOAjt1cBhIWbz1sNc0VdkMP/etZ/vYSDG/a5aORjewl9oTAS6U7xp9KZx9WJliiCOX
 SqdD2XurwGKi53oR1ejeNa4ghf+btIzp3lywwWzwxmYu8nGc+BnIjEtdRyc0wea7vHsP
 K1p3wq94i7ZJDeH3g7oiU47DhQ/vRKXpLcjXl9QoJg7zWL2/6hraSBIeK3X56MBWYP/D
 y2GF2ylPgZmf/GSQRAt49kW0vLcldKWZlSX5LjHi1uIsNgXJRqipTYEzxon+vMjHGogU
 IHCapteLF3b1pYb6cgw5W9sE+sn3r9aEGyviMNv27WzCYAmEv6EGIQeRj47cBwCbyVoT
 KQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8xsNoPoS1c4ZSiDcITNh9dhGjslVxoI6M2axq7Ywhg=;
 b=akwsIFGH6QCGRcT79agow8ocnPaYvhu/qY/LL1ikPVVXXcF+0rwGl3C7UcAVyzsh3d
 2RhUXGc1rLSnLRy5+ttwSiPqKXcCghIgG1GmmdnwVAxhZl64nkaKDkZAhtadNQqquHyD
 2LyaqX3Ji3cg0uudNi3mT0P0428i4vUX3N3Cmtiss92ut+5mu/c0Id4+Hw1RIuffF9q7
 M7kJGbTnmdFOVLCK7EER3BiIDTxRG1QuR3KupMHMVJrPu3B8jYvPTc/1FM9QNsw9CV4W
 PFPyYWKeWEQXfKQ/y+BQ9gozCFVXCiIqo9sRvmz4Thh/l5SNhp88IDXYyO/Y5T08PToW
 Avaw==
X-Gm-Message-State: AOAM531Z7N7pqh6feAXM8DolSNggIM9TMS0vTpkG6tOwpB1yup1fUHst
 f+cxRevgIyqr0rIpoFurLOaFR2ewrEw=
X-Google-Smtp-Source: ABdhPJzJ0Ag6wUEpWhac7vFXqs4pDl2sKUJb8iZf3SPM2168h4ENIXfSS3ADhQaPgndcFgtMXT1PgQ==
X-Received: by 2002:a62:f243:0:b029:1c2:8424:2495 with SMTP id
 y3-20020a62f2430000b02901c284242495mr8576877pfl.32.1612012253390; 
 Sat, 30 Jan 2021 05:10:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 34/42] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Sat, 30 Jan 2021 23:08:44 +1000
Message-Id: <20210130130852.2952424-35-npiggin@gmail.com>
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
index 90435574b66b..0c2cb41d1286 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -645,8 +645,6 @@ void __do_irq(struct pt_regs *regs)
 {
 	unsigned int irq;
 
-	irq_enter();
-
 	trace_irq_entry(regs);
 
 	/*
@@ -666,8 +664,6 @@ void __do_irq(struct pt_regs *regs)
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
index 21fd14828827..1623400a0a7b 100644
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
 
@@ -1901,13 +1901,9 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
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


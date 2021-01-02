Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054C2E8765
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:04:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MY42ZpYzDqx6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iNOI++Zx; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lhk2BnNzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:58 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id g15so15768381pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjSybgJgK2gwur0v2lrnNhZdRxnBRjOYQ8pXO9F18Xs=;
 b=iNOI++Zx+5DZemqNov2Sbqg6HPe+UmQQcKy8BY1HGvp0kn0cYxkq0poxi20B+gqawO
 FdKGKDAjUc8KZdSMM+wPSp7tPc0WsSGsqRpgtV6mR/LVbGQm3bDpPn5j2F/fIMJDp7ze
 DUeD1NZQPRWpdzDndiUoiS10I8BL8zD7sACFDvxR25ok3/BGgfdtQBZPYfi/XnytDpLv
 2eT6rcv4dUt8T/it3UC8MrDEjjy0nwpT/bn2LJizYiIZdPRwL87Mt2upGK66ySQp3jbw
 GisXooHy4v68XGktVlfZhml9OiLl2A3HHv2cBgClr5DJ6EWai+qoMUKdd3QG/KpcPP4d
 UcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjSybgJgK2gwur0v2lrnNhZdRxnBRjOYQ8pXO9F18Xs=;
 b=BVrqesbWrApFZleIEeRoVwh9u3acjyNXB81UqNgRzYICZ4v8s9rExp0ZIANB7W+Ptl
 aWcqtJvsn8gai0naqFwoYbTbJbXiTKAy4GD8RhfTIs0jlwgqwQVt7evAy1pltZ//vyA4
 4hhzXbRpFl4v/Y1HWJpAwtXsSEVKWEMlxNZouKgTO40BpkcgsUIWZWhzkifAsmXpA/gI
 D8uQkjipy+fgFUHfq/uJtvKgjzWdzUulW5OzXCVJtzl8ZZoxTDVdonv+Hcic41WpwcAs
 txmX69DMFAOtv+Zte+sXsGfj/Jcso2r7Nvdde+/tp6dGhRRuD/5F9NMNfDj1Zr3JiJ7L
 u4Qw==
X-Gm-Message-State: AOAM533oKXYEyN4v0Wc+cXTP7I9/v7rOmGSaM80IWaqeNo/WVaMMoECZ
 JRr4Z/zj3gQc9idMrTSRh4m2W3d+9j8=
X-Google-Smtp-Source: ABdhPJyH6St0ZQMn/6gHloZS9HBPD4bm+RbRcgcT4KYoGNCc8bRwCwbrkQQleNnHhv5HaBu2Fq32Bw==
X-Received: by 2002:a62:1ec1:0:b029:1a8:2c01:13c0 with SMTP id
 e184-20020a621ec10000b02901a82c0113c0mr37258599pfe.8.1609590354065; 
 Sat, 02 Jan 2021 04:25:54 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 13/21] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Sat,  2 Jan 2021 22:25:00 +1000
Message-Id: <20210102122508.1950592-14-npiggin@gmail.com>
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

Move irq_enter/irq_exit into asynchronous interrupt handler wrappers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 ++
 arch/powerpc/kernel/dbell.c          | 3 +--
 arch/powerpc/kernel/irq.c            | 4 ----
 arch/powerpc/kernel/tau_6xx.c        | 3 ---
 arch/powerpc/kernel/time.c           | 4 ++--
 arch/powerpc/kernel/traps.c          | 6 ------
 6 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7c40ce78c4bb..bee393c72fe5 100644
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
index c0f99f8ffa7d..84ee9c511459 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -22,7 +22,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 #ifdef CONFIG_SMP
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
-	irq_enter();
 	trace_doorbell_entry(regs);
 
 	ppc_msgsync();
@@ -35,7 +34,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 	smp_ipi_demux_relaxed(); /* already performed the barrier */
 
 	trace_doorbell_exit(regs);
-	irq_exit();
+
 	set_irq_regs(old_regs);
 #else /* CONFIG_SMP */
 	printk(KERN_WARNING "Received doorbell on non-smp system\n");
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
index b2c53883580b..b4f23e871a68 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1051,7 +1051,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	struct pt_regs *old_regs;
 
 	old_regs = set_irq_regs(regs);
-	irq_enter();
 
 #ifdef CONFIG_VSX
 	/* Real mode flagged P9 special emu is needed */
@@ -1071,7 +1070,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	if (ppc_md.handle_hmi_exception)
 		ppc_md.handle_hmi_exception(regs);
 
-	irq_exit();
 	set_irq_regs(old_regs);
 }
 
@@ -1889,13 +1887,9 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 
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


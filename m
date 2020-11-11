Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 028052AEEB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:25:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLTx3KCJzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MS8+lZ//; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZg4yXYzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:43 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q5so1279397pfk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hyxPceJY1MuPCuslCRWp4RxJefUZRmkfbIMya8kpWp0=;
 b=MS8+lZ//E8K4F2Pz9NAbG9rgAlgZ0vfAf9CZUR64kgGnk4WjWZdnUsPRLJVVeOJgOr
 ZFGdRlweiFOe2Ea5Gp6Bg0J/oSaKvcZ9hvmnhyq/qIxRt+jDTgzTWoFYzJUkKLFONY+N
 ON/Rkbt6vvsQ1Q7EnS8fQecVz9SBEOWQ7p8T/vdDDXV9OUzawhT/Tkgu+xoNVV8LouLY
 xpOLemZMi/rLTpmQ7h5v6ihWSGs4DgruDd13LuEv+X4AQ/oiftpD21lKjXAaIqSk9qjI
 r4C4b2k+//4Ews5qC0VV1awTwEnQIvpjSUxEHvT4iSnV/U4SWp7koOoH8+XRiHhpw+Fk
 ZvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hyxPceJY1MuPCuslCRWp4RxJefUZRmkfbIMya8kpWp0=;
 b=nyG/cdexS8esp4cEVMb2oxvaAmOVXHRK1ml9cNSKVhguGEi0MIaDt+vUn6d4aV/ACT
 EMAYQfzH1c+bVDUWJ1zCmbJWzcRiFKHBQ3LAjXW1N58GYlOYJ5JOcyIcb02vOSLoEhqE
 YdoUSUiKHXuHHB5Hkv7Lm1DS6FpQYnX+lDTyInJz3PkI6iO6gGwcMYgYL439Ae5fgds3
 C/pXw3uCW15pQudeUKssvKUDpy9jbZ+c5RhMad9grhWb7+EFcJFm3BG1g9ymcYCdND+J
 cqRvBv4NExwO19UqpBBqmBsXbfyco7ENI4O1ghk45sOAwXca7AP/ck6APE3BfcbBNBeU
 nw3w==
X-Gm-Message-State: AOAM531zF4fUWDm9+dcUHPX6/ZliyJmtCuhkDCZuyIs4EfP83MYu6PCd
 H/WuG2BASYhRhH2tct2BTKfmLlTs3g0=
X-Google-Smtp-Source: ABdhPJzEiN61QEzCz4/ryziGGOzb6Z/H1cPeE10XNayKqTWZT9Ne/0rBS1IqcgfGXWDpU1Z/7XRcdw==
X-Received: by 2002:a63:343:: with SMTP id 64mr4012206pgd.14.1605087880098;
 Wed, 11 Nov 2020 01:44:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/19] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Wed, 11 Nov 2020 19:44:02 +1000
Message-Id: <20201111094410.3038123-12-npiggin@gmail.com>
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
index ef1f6b595ffd..a354da1353ec 100644
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
index 0089df57bb49..7dd0ab55e700 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -585,7 +585,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 #endif
 
 	old_regs = set_irq_regs(regs);
-	irq_enter();
+
 	trace_timer_interrupt_entry(regs);
 
 	if (test_irq_work_pending()) {
@@ -610,7 +610,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 	}
 
 	trace_timer_interrupt_exit(regs);
-	irq_exit();
+
 	set_irq_regs(old_regs);
 }
 EXPORT_SYMBOL(timer_interrupt);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 31b491d8937a..7baa5ba5cfb3 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1082,7 +1082,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	struct pt_regs *old_regs;
 
 	old_regs = set_irq_regs(regs);
-	irq_enter();
 
 #ifdef CONFIG_VSX
 	/* Real mode flagged P9 special emu is needed */
@@ -1102,7 +1101,6 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 	if (ppc_md.handle_hmi_exception)
 		ppc_md.handle_hmi_exception(regs);
 
-	irq_exit();
 	set_irq_regs(old_regs);
 }
 
@@ -1916,13 +1914,9 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 
 DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async)
 {
-	irq_enter();
-
 	__this_cpu_inc(irq_stat.pmu_irqs);
 
 	perf_irq(regs);
-
-	irq_exit();
 }
 
 void performance_monitor_exception(struct pt_regs *regs)
-- 
2.23.0


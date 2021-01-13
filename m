Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059C2F45A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:03:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0Lw0261zDrNc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:03:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iNWHDoSF; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgY63HBzDqyG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:57 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id c13so687001pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjSybgJgK2gwur0v2lrnNhZdRxnBRjOYQ8pXO9F18Xs=;
 b=iNWHDoSF7iqLdaGG+PYAc5cHBmRaT5CyT1Qvy690pdyIgVI2YudfaH1iSA1FuHouwi
 LdkyCnCxDDIFds9UMBTKY39+ejoL69wdmsMTElegHACQ4sMwmYN2cPTik2pvGq8RuOJb
 Hrgd0cW/tu8vkWVbo4BIuRZ6wZzpw2fvbh/GBVJJ+aNYq8iYH/c623z+jNVVPfICZ7fb
 1/qliML9JX0rkWdm0D/zD43Y167plFyI3w6SjK/5sIxw8TQCANFzHVVXR9aO4m3cBHJK
 4KgjwRjQbbRX0jFy3ZF0/Nw2H6jj+Bs+pDfRlqXR+ZWRXCUR8mrsVdHtG/auFZfL8RyK
 L4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NjSybgJgK2gwur0v2lrnNhZdRxnBRjOYQ8pXO9F18Xs=;
 b=PebqsmC2/8Kyuyo983qt+VqI/PVgqj+PZ1p4V7ePr3Fb04n2fqRKqQdfIBvv4DsTCT
 qFevpOdWXW7pYOOdUw/iWFqYfPEGSypPCxBfvBy7pi3aYN+EJGyOa3sZ1lnxH1Mkzpik
 D4krnh6gr76WapX9nyIbZCjRaZKcDdN6plG82qChkidwFKD6fN24paAaNybtQApUSFG3
 TKD2YHIHiE0Uc8mhSXgAsOGRvakeQRTISjXPcQl7oHSsi28wpF2PzbIbtwD3j1U32XXn
 HeseuTCq1EQj7IiPu3FYF9Etdb4+wIOuZGZxSdxCYtAAAhmxfBSh6c9uKjKXHjc6pF1t
 CJ9g==
X-Gm-Message-State: AOAM533im7RxCPWxFG6RjShDO08F6H55dM696up4OZtZuoT4jofsrQO0
 KI6QnAcqT8qiQwkXj/86fWOab/5X1ec=
X-Google-Smtp-Source: ABdhPJwhsXXwA8dZ6pZ2EFlADTvTfncjZMRdk2famdOJWU+tZbO8lfelXrJmIglRtxlKy5cYfXzDsg==
X-Received: by 2002:aa7:9619:0:b029:1ae:33b2:780f with SMTP id
 q25-20020aa796190000b02901ae33b2780fmr945090pfg.26.1610523174999; 
 Tue, 12 Jan 2021 23:32:54 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 13/21] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Wed, 13 Jan 2021 17:32:07 +1000
Message-Id: <20210113073215.516986-14-npiggin@gmail.com>
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


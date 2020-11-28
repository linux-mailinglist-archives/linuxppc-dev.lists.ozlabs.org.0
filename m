Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD592C6FB9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:04:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvsS2c3fzF1QJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:04:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CoZw0xUB; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMc5GjyzDsGv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:48 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f17so6616108pge.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KsqLyQTjSG+ewC2ayEMdc2tcUwZWrRPv7xdooRoyucU=;
 b=CoZw0xUB7zHdOvgjhgv7RBBLhM3m+AX0kNDaYXpCv8HCPCV5r+uxgYIn1hdnaXqs3E
 SG60qyY0Fk+6J/0bCjVxxxVMYfqwGZ/yubEjjO3z1Y6cIc5HKKOv2JpFSMhncGkRq3qJ
 SJziWEXAb4Bv6yTH4i5/08q8zM3w+EbFdWxET4d8ljMxDhc6C9RQU4GF5Mmm7Ks1vDXd
 GOdA0XVyVKGK66iqIB6w9+vqJZ3Ly4kh3f/IHJKsrfGx8aGMHCNyPc40gIUl4xOmobVS
 WQzhvDN3vw/MkFVb+st3jvMoaNNDIzK0eBxmso/bVAmKWSZzPErjXI3toK4haZ8/TC1z
 BgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KsqLyQTjSG+ewC2ayEMdc2tcUwZWrRPv7xdooRoyucU=;
 b=jXAr+EGa3LyU9lBKgQ2X/EQChSZDUJ7T21TyD1YqyMhfsbdNMWSYItCCWOJ462dJTj
 DfI52G9EHa2fVKRovj4DgeAWZOzU+qDMirol7SOnOOGsIbFXMwlU18vPi/TE9URhB4iq
 3zUrnEpcUTlNIY282PhBB5EquB+a4gqL2/g72UebuJgZFEyCzWMX8WnpAShdnKsC0FEN
 eaT1IBjb4QMtfKsK8N/WZd09kjMfsbA7BZaT4TbTpacjsIK7DjF9DNMy3blyQQsPdZYN
 093GUBR9mBhxjRmsmwcsofVp3rgpYS3saSX1KsXhRTEGzwJfVr3As2E1ATkFt+8jj+Pl
 EHcQ==
X-Gm-Message-State: AOAM533M1AByHNCyiVtG/dtJUoSYrdvjzammc688oxf0fjO4gCdi1kj5
 k6CMM4TkTXkzVcbxyZR8V3CFkJDulQk=
X-Google-Smtp-Source: ABdhPJwOP0Gfd//8+lV423K3s5zbGKUo4dmScLxqyh8doIVFSIlMQsNFElKJGq2IGZHk3fklLhAb6g==
X-Received: by 2002:a17:90b:fd1:: with SMTP id
 gd17mr16317835pjb.148.1606574506636; 
 Sat, 28 Nov 2020 06:41:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/19] powerpc: handle irq_enter/irq_exit in interrupt
 handler wrappers
Date: Sun, 29 Nov 2020 00:41:06 +1000
Message-Id: <20201128144114.944000-12-npiggin@gmail.com>
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
index 8f7db1c8cbe0..21acf0d0154f 100644
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
index f40b45086b93..06b638a7f0b0 100644
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
 
@@ -1918,13 +1916,9 @@ DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 
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


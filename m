Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B060F155
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 09:44:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Myd3h6rTzz3cH0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 18:44:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZMa9b9qd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZMa9b9qd;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Myd2k4Tmlz2xsc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 18:43:26 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id e4so726815pfl.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 00:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyV2HqAYahIfAWWwYChjluGTBPMCZR7nyHbxVJAWMRw=;
        b=ZMa9b9qd4f4MOSAvzKURcHFbbg7FznubRAunAxJ8/g6qxN3DPHemWRbgVr1pUnpDZY
         D7eqekMpMBxbAx51Cpumy8+7wIdD9c29NQME+6x5cxE1ft52tHWxVMSACsxMkgPo/M7r
         WR8AjyUaFw2v8IOh2tt5gcStjzkK9Q0/xtOaj1U2NSfNUhUxhAQonXGGpSv9snLzDsXQ
         9qJcp+Y2IuJl0a9r8MqFDFTuzraQHTvTTsBTEFgtL3tFsxUoDwVUD0A1m1BmDO9AxXM4
         rkjdbD539l6DD6a7nWo/VHidXY6a/khxP6qWFuxJywSws+ZHb+l9G/gwhd4dvH9c55oQ
         II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyV2HqAYahIfAWWwYChjluGTBPMCZR7nyHbxVJAWMRw=;
        b=yxU7jU6ERz6S91Mk5BObaZGBbUr/CpNflEADFL0MtucICXFQjF+Zl+ZY68XgtZVc7n
         P6d/EY6whs6SPsP4oeSuynaccFQBRoBwGJJoFTAzo37BqprAgIJZfcazeRd6KPqceUpX
         pb7e8cDVn2hbo89T/4kTyFVfEaubPvsnWLBkmjWsKuI61fznfEXZwrbzeGNUbRllPNU5
         Q8m+vle4rDS+lRnCJbnYQpVktpyvnn0g2N0KfV9o7H/+7w/mWCC19iizwKmvm+OpwWMr
         0SziFbpBtSJxNphb7kzp080/aNf6KCgN+KbAY9B3hbK53Xe7ZkP31CVSAgJtMon9WfcF
         sR2w==
X-Gm-Message-State: ACrzQf2brRJXgysr/hjajKPNZeHgvBxk6Q+AJ2k/Vj94xR0cPbFhMjcF
	CJ8A+ue9LykqIlBJ3NTI4LL43hJjvhyyIg==
X-Google-Smtp-Source: AMsMyM6vt5trpsMkUZrK/cdepdTpb696nwMjwaG6LEa9sgaVt9T6a1bay09ZpBK5z+eRZaDDAmFo+g==
X-Received: by 2002:a05:6a02:207:b0:46f:53ca:cab8 with SMTP id bh7-20020a056a02020700b0046f53cacab8mr945398pgb.242.1666856602802;
        Thu, 27 Oct 2022 00:43:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id bi6-20020a170902bf0600b0017f36638010sm507782plb.276.2022.10.27.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 00:43:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/books: Never call nmi_enter for real-mode NMIs
Date: Thu, 27 Oct 2022 17:43:13 +1000
Message-Id: <20221027074314.2084016-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NMIs that are taken in real mode (the early MCE and HMI handlers)
skipped calling nmi_enter() in some configurations, in the hope that
more modern configurations like radix suffer fewer restrictions.  This
just turns into whack-a-mole and fragile when core kernel code changes
anything.

A recent such example that breaks with radix, an HMI real mode interrupt
tries to access vmalloc memory, causing it to take a machine check:

 --- interrupt: 200 at perf_trace_rcu_dyntick+0x140/0x190
 NIP:  c0000000001d4720 LR: c0000000001d2bb4 CTR: c0000000001d45e0
 REGS: c000000fffdbfd60 TRAP: 0200   Tainted: G   M                (6.0.0-dirty)
 MSR:  9000000000201003 <SF,HV,ME,RI,LE>  CR: 24024228  XER: 20040000
 CFAR: c0000000001d4648 DAR: c009e000016e29a8 DSISR: 00000008 IRQMASK: 3
 GPR00: c0000000001d2bb4 c000000fffdc7b30 c00000000255c100 c0000000023089f8
 GPR04: c000000001bd0438 4000000000000000 4000000000000002 0000000000964794
 GPR08: 0000000000000000 c009dff0055b29a8 0000000ffc130000 7265677368657265
 GPR12: c0000000001d45e0 c000000ffffd7000 c00000000014e7c8 c00000000ab74280
 GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000000031a64d8
 GPR20: c00000000d9f7b00 0000000000000006 c000000002446a28 c009e000016e29a8
 GPR24: c000000001bd0438 4000000000000000 4000000000000002 0000000000964794
 GPR28: c0000000001d2bb4 4000000000000002 c0000000023089f8 c0002000063f0668
 perf_trace_rcu_dyntick+0x140/0x190
 __traceiter_rcu_dyntick+0x84/0xc0
 --- interrupt: 200
 rcu_read_lock_sched_held+0x10/0xe0 (unreliable)
 __traceiter_rcu_dyntick+0x84/0xc0
 ct_nmi_enter+0x118/0x280
 interrupt_nmi_enter_prepare+0x118/0x1f0
 hmi_exception_realmode+0x38/0xe4
 hmi_exception_early_common+0x114/0x2a0
 --- interrupt: e60 at arch_local_irq_restore+0x11c/0x1b0

Just disable this entirely. It turns out the features that might be
enabled by nmi_enter(), like RCU or printk are unlikely to be usable
in real mode anyway.

Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 49 +++++++++-------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4745bb9998bd..3e87e9ec5117 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -276,6 +276,7 @@ struct interrupt_nmi_state {
 	u8 irq_soft_mask;
 	u8 irq_happened;
 	u8 ftrace_enabled;
+	u8 mmu_enabled;
 	u64 softe;
 #endif
 };
@@ -303,6 +304,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
 	state->softe = regs->softe;
+	state->mmu_enabled = !!(mfmsr() & MSR_DR);
 
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
@@ -333,46 +335,27 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	}
 #endif
 
-	/* If data relocations are enabled, it's safe to use nmi_enter() */
-	if (mfmsr() & MSR_DR) {
-		nmi_enter();
-		return;
-	}
-
-	/*
-	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
-	 * NMI because not everything it touches is within the RMA limit.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-	    firmware_has_feature(FW_FEATURE_LPAR) &&
-	    !radix_enabled())
-		return;
-
 	/*
-	 * Likewise, don't use it if we have some form of instrumentation (like
-	 * KASAN shadow) that is not safe to access in real mode (even on radix)
+	 * If data relocations are enabled, it's safe to use nmi_enter().
+	 * Otherwise avoid using it because the core kernel may touch
+	 * vmalloc (e.g., in per-CPU variables), which is not accessible
+	 * with the MMU off. Linear memory beyond the VRMA limit is also
+	 * a problem for hash guests.
+	 *
+	 * The real-mode machine checks should not use RCU, tracing, lockdep
+	 * locks, and should not printk, access per-CPU variables, among
+	 * many other restrictions.
 	 */
-	if (IS_ENABLED(CONFIG_KASAN))
-		return;
-
-	/* Otherwise, it should be safe to call it */
-	nmi_enter();
+	if (state->mmu_enabled)
+		nmi_enter();
 }
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
-	if (mfmsr() & MSR_DR) {
-		// nmi_exit if relocations are on
-		nmi_exit();
-	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
-		   firmware_has_feature(FW_FEATURE_LPAR) &&
-		   !radix_enabled()) {
-		// no nmi_exit for a pseries hash guest taking a real mode exception
-	} else if (IS_ENABLED(CONFIG_KASAN)) {
-		// no nmi_exit for KASAN in real mode
-	} else {
+	WARN_ON_ONCE(state->mmu_enabled != !!(mfmsr() & MSR_DR));
+
+	if (state->mmu_enabled)
 		nmi_exit();
-	}
 
 	/*
 	 * nmi does not call nap_adjust_return because nmi should not create
-- 
2.37.2


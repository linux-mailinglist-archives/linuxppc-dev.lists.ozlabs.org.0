Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E73582F8359
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:12:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTm116LDzDsnh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:12:01 +1100 (AEDT)
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
 header.s=20161025 header.b=NufYuO7n; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzw2QcQzDsjG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:12 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id b3so5857338pft.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M2DMqU4AT1uVrswMKzSHypM10RSQvt6twHKYovor/ys=;
 b=NufYuO7n+9lq3TNCffdCtc+pU2PjOVTvHY4Q0xWlW6p7X/F4RpEy594Wa8lk0z02WY
 FQ0nLgCqyjz3Z0+n2R1IrlCU7JazTrAkfOiUwepMGiRXce6e+q3Z7K0FUOwNELswTO9o
 1Nr7vnguNwhlZFYptyIaGY8PA40pE1hnK2H4dSVN2+diPgeK0TWSMU72h/wZJVLTaAnD
 98W3zk//tOtI2mOiXi6MHYv0/aBoGNxdE12yUgvCo4+2erLxSiUx5H2sXKVfCKGmWm4j
 /RZJpd798dg0Etu5ZdjlEDscltB34HMzC/pEaOUANkufdHLW7CkNy4HBhsQFTzQq2nC5
 QlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M2DMqU4AT1uVrswMKzSHypM10RSQvt6twHKYovor/ys=;
 b=Nv/ZKRQRsXEGXoBF5IWBh7VZ9kzvu9PBefrs2BsWJlKdXss2+5WzklxwjZsgFFHzPN
 8Qx1UZfTl3jCTcya6Q30XTKQVZWD3hZeruVGBBrnzdfdCRWYedGCIRPjk80OP0n3TrKs
 T/bKem9Wz/wvn23MNJE7W0+NVkakfItdpG/bKterx29tgqJW5CxxOhKrafk2M4ZHvRnd
 QFABZ9S7m5HhCjAP3YM6VmwsuDIP/noyXK9GmFcb7YFyaM+vXssf1Oh031sZQ5dmDbv1
 PH0DsnEOS7XA/yWJz8CtmxnpS0JgOvrb6w8q7iISfm2X0i/EZ723+Q3SV5B6PnJDx7Tl
 fEEg==
X-Gm-Message-State: AOAM531nGSyaT3ZNhCeTxOf/2kACI6TlaJIEGLamIlxz4lupTH1JeRoj
 CsSQ1MdVu+oIdimd62Hc1PQrUhaBO3w=
X-Google-Smtp-Source: ABdhPJyvBaauZAvFCZrpS0xvF276NvZyLX/Eam2pop5Xm4ZTz56eNdNWVPR7ixnJmKJ0jzS5x0/Pqw==
X-Received: by 2002:a63:e24f:: with SMTP id y15mr13263227pgj.366.1610729530273; 
 Fri, 15 Jan 2021 08:52:10 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 32/39] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Sat, 16 Jan 2021 02:50:05 +1000
Message-Id: <20210115165012.1260253-33-npiggin@gmail.com>
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

The interrupt handler wrapper functions are not the ideal place to
maintain context tracking because after they return, the low level exit
code must then determine if there are interrupts to replay, or if the
task should be preempted, etc. Those paths (e.g., schedule_user) include
their own exception_enter/exit pairs to fix this up but it's a bit hacky
(see schedule_user() comments).

Ideally context tracking will go to user mode only when there are no
more interrupts or context switches or other exit processing work to
handle.

64e can not do this because it does not use the C interrupt exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 34 +++++++++++++++++++++++++---
 arch/powerpc/kernel/syscall_64.c     |  9 ++++++++
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 5a1395499508..1c966e47b36f 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -7,16 +7,30 @@
 #include <asm/ftrace.h>
 
 struct interrupt_state {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
 #endif
 };
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	state->ctx_state = exception_enter();
 #endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (user_mode(regs)) {
+		CT_WARN_ON(ct_state() != CONTEXT_USER);
+		user_exit_irqoff();
+	} else {
+		/*
+		 * CT_WARN_ON comes here via program_check_exception,
+		 * so avoid recursion.
+		 */
+		if (TRAP(regs) != 0x700)
+			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+	}
+#endif
 }
 
 /*
@@ -35,9 +49,23 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	exception_exit(state->ctx_state);
 #endif
+
+	/*
+	 * Book3S exits to user via interrupt_exit_user_prepare(), which does
+	 * context tracking, which is a cleaner way to handle PREEMPT=y
+	 * and avoid context entry/exit in e.g., preempt_schedule_irq()),
+	 * which is likely to be where the core code wants to end up.
+	 *
+	 * The above comment explains why we can't do the
+	 *
+	 *     if (user_mode(regs))
+	 *         user_exit_irqoff();
+	 *
+	 * sequence here.
+	 */
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index d7d256a7a41f..42f0ad4b2fbb 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -305,6 +305,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -347,7 +348,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
+	user_enter_irqoff();
 	if (unlikely(!prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -392,6 +395,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
+	/*
+	 * CT_WARN_ON comes here via program_check_exception,
+	 * so avoid recursion.
+	 */
+	if (TRAP(regs) != 0x700)
+		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	amr = kuap_get_and_check_amr();
 
-- 
2.23.0


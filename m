Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0072E8766
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:08:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Mf60RzYzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:08:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pAckwdpZ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lhp0NGvzDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:26:01 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t8so13563900pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0meIkeGth02gQtyPnE+XC8e2+IlgiuL84Gr+gMj5mk=;
 b=pAckwdpZhhFch1X60vfvzfBcsxknGm8DBSp5BI4s6Muy7OhjwhqEoxu0PbrQa2N3On
 LZwLO4N2H5U/jKNP6qKdY9wJ9mTgag2kPOOAsHpA8UKjfBtd8qRDqR6c0hm5k4qR6Nku
 x5D0XcxElcuBJxcQ7eFoIqWnFE54S7FrA80mE/EtRkWMmNLhG4/H/YJwe49gpKLNBRCD
 oRqWYuo+CSDZoBsceS7LdD041fY1bw77IyiAAvX3utu0rTfqwnYJblW8yakbBxKxuohz
 Lm0HZlMizyD+AEsftIcs3j6U63NS6UhpqD4KhEKXkGzsXQK+uKz2bZ1KveW88n/186e5
 Ag/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0meIkeGth02gQtyPnE+XC8e2+IlgiuL84Gr+gMj5mk=;
 b=BN7hDPZddJfjs7la/L/K9fd0coTv3yc6YiSIM0IaD+bK0wKbj9sfvJWN7ZNZTEqTmx
 M+oXq2fuo8Co8whcT62uX45lY5UIHlK24RKI6BjzHugWAeP9nQDfhurkQaHOSPvT6zMK
 XquVcQFJF0qIm6A6TQviDjUN95hs6LJsb0zeg2K0QBcKpWQhd279O3b1khLKJYFE3BW1
 ZhEdhkIpq6qqO56AXhqWV2xV2HeJIPrzV+z5bK+WtQUfYgT4W6ACXK/NeQ4lndo82zvt
 7ZDxATMKxi8shdXfmheNlpdgBjd0gJhn9xYCZ3aKjlWgkRuvNFogLj5/WHDp4ny+TruK
 yr0g==
X-Gm-Message-State: AOAM532iqKAbotUtdt5QVIx3qRmwwrvyJ9twdocjUcSCtdz+Co6ZmR6H
 4Hd3PDiKNkwaQBOJx9Tm8BFTGXYtTqs=
X-Google-Smtp-Source: ABdhPJwzXHecZinZxfU+lyiKZ5wRqieFCGEzEcW4V52L0AkbdFLezo0El82ZeqUEl/ZzJiF6Bahl/Q==
X-Received: by 2002:a05:6a00:170a:b029:19d:afca:4704 with SMTP id
 h10-20020a056a00170ab029019dafca4704mr37965405pfc.7.1609590359192; 
 Sat, 02 Jan 2021 04:25:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 14/21] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Sat,  2 Jan 2021 22:25:01 +1000
Message-Id: <20210102122508.1950592-15-npiggin@gmail.com>
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
index bee393c72fe5..34d7cca2cb2e 100644
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


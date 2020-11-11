Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 207402AEEB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 11:27:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWLX40P1qzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:27:32 +1100 (AEDT)
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
 header.s=20161025 header.b=RMwsHDXr; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWKZh4yV1zDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 20:44:44 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id w6so1309918pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKF0vtgUBywRTc7Ch0/bKLp3jz1ExfUsrWDDXbvDcCE=;
 b=RMwsHDXrIoQdPU7Al/ZKper1XhDocncvV2rtLSepBgrGQSpFgX8c2dsUy2OgRgCPFe
 eRhevSDcNumfB+28dFXGAZ0t12wZKBrY1GYtkbEpCbs9jZsDqpW9IPAFqgk9zcAtHaG4
 6IaV9MsUkVC7u7tR0fg/ilpME2XDqzy7/or1klhgtVhN3wFgYQ19Jkeex6Jv7dE2gglM
 OJNRL8753ZtZlSZ/GG+r3JOwLkqRcH9//HL4cxIn8jJfkME+BGNt2pLKa/L52RXxzIS+
 7a2HIu17rzyO+NtgjOcvQsxYoruVBMj/7o54JMvQf/LAeBefALYwsRVJvksARPdEJ5jd
 /njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKF0vtgUBywRTc7Ch0/bKLp3jz1ExfUsrWDDXbvDcCE=;
 b=F+0X66UXKNZLlEMOJTxechBrvd/AstaRrTKhpiY6BV5DMG/I/OlYtYpegDzzDkJgVM
 q2JbFxUccc9qY+4PkUZ7FpXJcA20KMpZaf5sjIg/nVXfXJfFaTgLjlLlnRFOpNUvS/qG
 Gk5fCvoi+LWDQC12qLkcRkmL/EbbW2ckh3Vbo3ydZVQPAqz7HHME0wHAk9Ag431o3L8p
 9sP9nKl1JuRRjU89HlyGxIlCMMdDeJuETA3e5gFgm+vfvXnJh9dH/cY/R8Lh5MpySBfT
 7ze2fztFV9aBivBKFZ7z0bKXzCkVyh/fdjTG+49C6re1gtyCtA3R7EnqJOBMzgAS1S9R
 4k9A==
X-Gm-Message-State: AOAM532zxkti8cryUWxMx4BCgejNc3DnBYwe+hEQq94pTo+pT5lMvSlb
 4T0FzfVoA0kiHDg70JpCsofc2IHbiI4=
X-Google-Smtp-Source: ABdhPJzufXs6Oo3311DotxXnkkZYZwnL2tTXDp+op7XhC5XippFgK0NgOYuZhjGvbTQkTDN2l+bksw==
X-Received: by 2002:a63:fd04:: with SMTP id d4mr4201777pgh.196.1605087882221; 
 Wed, 11 Nov 2020 01:44:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a3sm2046129pfd.58.2020.11.11.01.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:44:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/19] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Wed, 11 Nov 2020 19:44:03 +1000
Message-Id: <20201111094410.3038123-13-npiggin@gmail.com>
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
index a354da1353ec..ad0389601d01 100644
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
index d9df6d14533e..5820a18672bc 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -275,6 +275,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -317,7 +318,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
+	user_enter_irqoff();
 	if (unlikely(!prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -358,6 +361,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
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


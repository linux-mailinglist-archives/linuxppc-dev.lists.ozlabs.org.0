Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 613723095F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:39:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScKz4fJJzDsbH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qBquKeYT; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMq1DjjzDrS4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:02 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id b8so7079784plh.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPSmf+8rP9C/W9wLfNx40Nvhz0dRIn90e0hAzAk4sQ0=;
 b=qBquKeYTlAVecJyTvHh7ftlbvtQ7M6GfHcoM/iax1ol5ruFu2wQulQsThR2523VJVr
 SlMbmWyiR0RUxvS37jeBUzGYjDYiKeQ9kk7DsP9kHsuinWc7PRvRiuddlU9W9a943A6v
 gZLz8jWxPBYqmQqvYKQ03D87LUVhvuszi48FVDnuZss7CqKrVipN3doQHpW/vmBQYJ88
 7bgGPAKshg4Zi/SK9lDf+qK0lwU/tkb4tHOsM8jdv1yjxlYKgo/oIyNvew/9S/O0mgfx
 Pxjnmk+5FSj8ZYf+7CR/9Ab8cXa3HDS7vuzcdN0elBxz+K00D/ilObSDyqAMtI3DzOMI
 kZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPSmf+8rP9C/W9wLfNx40Nvhz0dRIn90e0hAzAk4sQ0=;
 b=Ad7kpm+uQFYr13U3mTxko8ZfXeMsaMAZpiur2vnTdhDOpmtwgLfqlAttgTithfJ65d
 RPyOHyNRpIkm9t9NYkHsfO76EaNKy8kJ135z5vym0g9CV6L8MvjPYjxwqQ981oI5o2W9
 w1JX/mPeb8vFW/VXG/r0lvXEEdagwcm0rUDOW9c9ugWObNznX6swpmSjSKRXDyO9alAr
 EXZgGQH7lM6f0dCLKLXBdxmfIxh+W++NXjurPO00Fd2fT2b8Lqp+XYOiwVsJ1/abNOBw
 ctz29JshMCsDmZBlyrNX5CWjArSF5DvstPptTe2rQXMlhxtIkzwnvT2sgxZ/dd3R8jdo
 8PcQ==
X-Gm-Message-State: AOAM533FW43cu/tqpnWlBuoxdBsJW8TUpDKvTdBq6H4XSHdYXYPiS5+u
 gkKLvqAZEh3GCySgGF8GAsYovlL8lfM=
X-Google-Smtp-Source: ABdhPJwt+w4UETv3oMyMsLCmTFaI3fuZ7Mj0D8+4HSzfmWDPhAZ0UXBecxaC+fIUJnPJxF/ajuWasw==
X-Received: by 2002:a17:902:8f86:b029:df:fbf0:f725 with SMTP id
 z6-20020a1709028f86b02900dffbf0f725mr9538568plo.68.1612012256491; 
 Sat, 30 Jan 2021 05:10:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 35/42] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Sat, 30 Jan 2021 23:08:45 +1000
Message-Id: <20210130130852.2952424-36-npiggin@gmail.com>
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
 arch/powerpc/kernel/syscall_64.c     | 18 +++++++++++++--
 2 files changed, 47 insertions(+), 5 deletions(-)

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
index 45c4420fe339..a2102e7a2713 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -255,9 +255,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
-again:
 	local_irq_disable();
 
+again:
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
@@ -307,6 +307,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	if (unlikely(!__prep_irq_for_enabled_exit(!scv))) {
 		user_exit_irqoff();
 		local_irq_enable();
+		local_irq_disable();
 		goto again;
 	}
 
@@ -341,6 +342,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -383,8 +385,14 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
+	user_enter_irqoff();
+
+	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
+		local_irq_enable();
+		local_irq_disable();
 		goto again;
+	}
 
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
@@ -425,6 +433,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
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


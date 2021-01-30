Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E8309544
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:18:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSZWq0yB4zDqss
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pYXmkWRa; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZKn0Z3xzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:16 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id o7so8515742pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9LWvoPnFnPN7TwzFaDtGCzLImD5+JtrCqQ+HfjHkV0=;
 b=pYXmkWRagLgDplHcrHzf28kDm3PKcXa/CDUKFQABf68G62k9gKEmuHZbWWTk40t+CF
 uuxZtz0ba0FUYx/4Pu+XOpIJM/XYEJXEVgUj2UiJ/jKdQlQLkjpP4HhjJTKaBxfoCSwQ
 05S9vN5huFdbdXagZMd5TxhgNClTg1pbQVS4734svA6k4uw9/idm+JzzgQhaHZ50yngU
 FeByvdaGXqWtnRZPQABFVUd+KQ9MwBDhx9i1WXb/p9Rbrp0wjFNq1nrqI0Kg1h5KhCl4
 XYyakqfHJoWJB3+nE07YJGuVqFjzFtQdGsr22T/kAKYycA+1ihiTl8XLGTCNKWpb13u1
 lmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9LWvoPnFnPN7TwzFaDtGCzLImD5+JtrCqQ+HfjHkV0=;
 b=LmGF1dvQRj/oAytDRj+YvIjDUY/SXZLPUWGVwET8z2RGO1LOamiVsoOPfxSdnmt7vu
 agyIPUQtwAFQF6S2IsW8KrGUfJsm7/6YrSxeMi0Bd39OZqwcGScLeXpLuBTO1mh+1Aug
 +JDaEfkp4Icj7y5fMxmSnHnZ3rztYvfRQcmJUjCp7LAbRFydxse8+bqssn6X49gPJGBk
 B0h50L9uKNWboKIs2L7DmOV/3Y+PeqfA/6RaqTKQsbJ+pBSpdf+g02v9xmP76l4TNgd5
 66zMZb30BxGeN9bC+7ZUzApihwR4D58MQk0blKPXCtQB/T12GbRUTTyz6LpJzGPwtiNm
 Jnzw==
X-Gm-Message-State: AOAM533tJoIVIcp0SEnaCso1GspjxxkZbEPheiv2oelp6R9E5I+jqiuW
 gAg+ihVSosgBMJ6k8hRPcikAv1uv9zk=
X-Google-Smtp-Source: ABdhPJzYDszCLjP5PUzJxcIYiqbtQLp7JZ/2+KVJk9EQp77ZlBJC50ThwoCLl1KwLWcbU4KN8CnPWw==
X-Received: by 2002:a65:450d:: with SMTP id n13mr8834608pgq.208.1612012153112; 
 Sat, 30 Jan 2021 05:09:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 01/42] powerpc/64s: interrupt exit improve bounding of
 interrupt recursion
Date: Sat, 30 Jan 2021 23:08:11 +1000
Message-Id: <20210130130852.2952424-2-npiggin@gmail.com>
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

When replaying pending soft-masked interrupts when an interrupt returns
to an irqs-enabled context, there is a special case required if this was
an asynchronous interrupt to avoid unbounded interrupt recursion.

This case was not tested for in the case the asynchronous interrupt hit
in user context, because a subsequent nested interrupt would by definition
hit in kernel mode, which then exits via the kernel path which does test
this case.

There is no reason to allow this for such interrupts. While recursion is
bounded at the next level, it's simpler and uses less stack to apply the
replay logic consistently.

This also expands the comment which was really pretty poor and didn't
explain the problem (I can say that because I wrote it).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/syscall_64.c | 55 +++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 7c85ed04a164..e0eb2a502db3 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -138,8 +138,12 @@ notrace long system_call_exception(long r3, long r4, long r5,
 /*
  * local irqs must be disabled. Returns false if the caller must re-enable
  * them, check for new work, and try again.
+ *
+ * This should be called with local irqs disabled, but if they were previously
+ * enabled when the interrupt handler returns (indicating a process-context /
+ * synchronous interrupt) then irqs_enabled should be true.
  */
-static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri)
+static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_enabled)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
@@ -156,6 +160,29 @@ static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri)
 		trace_hardirqs_off();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
+		/*
+		 * Must replay pending soft-masked interrupts now. Don't just
+		 * local_irq_enabe(); local_irq_disable(); because if we are
+		 * returning from an asynchronous interrupt here, another one
+		 * might hit after irqs are enabled, and it would exit via this
+		 * same path allowing another to fire, and so on unbounded.
+		 *
+		 * If interrupts were enabled when this interrupt exited,
+		 * indicating a process context (synchronous) interrupt,
+		 * local_irq_enable/disable can be used, which will enable
+		 * interrupts rather than keeping them masked (unclear how
+		 * much benefit this is over just replaying for all cases,
+		 * because we immediately disable again, so all we're really
+		 * doing is allowing hard interrupts to execute directly for
+		 * a very small time, rather than being masked and replayed).
+		 */
+		if (irqs_enabled) {
+			local_irq_enable();
+			local_irq_disable();
+		} else {
+			replay_soft_interrupts();
+		}
+
 		return false;
 	}
 	local_paca->irq_happened = 0;
@@ -212,8 +239,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
-again:
 	local_irq_disable();
+
+again:
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
@@ -258,10 +286,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 
 	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!prep_irq_for_enabled_exit(!scv))) {
-		local_irq_enable();
+	if (unlikely(!prep_irq_for_enabled_exit(!scv, true)))
 		goto again;
-	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -336,11 +362,8 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	if (unlikely(!prep_irq_for_enabled_exit(true))) {
-		local_irq_enable();
-		local_irq_disable();
+	if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
 		goto again;
-	}
 
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
@@ -403,20 +426,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			}
 		}
 
-		if (unlikely(!prep_irq_for_enabled_exit(true))) {
-			/*
-			 * Can't local_irq_restore to replay if we were in
-			 * interrupt context. Must replay directly.
-			 */
-			if (irqs_disabled_flags(flags)) {
-				replay_soft_interrupts();
-			} else {
-				local_irq_restore(flags);
-				local_irq_save(flags);
-			}
-			/* Took an interrupt, may have more exit work to do. */
+		if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
 			goto again;
-		}
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
-- 
2.23.0


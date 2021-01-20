Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E592FCC17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 08:56:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLHss5CQ0zDqvH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 18:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ngyX+jv3; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLHkM43x7zDqw0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 18:50:17 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id x18so12071018pln.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 23:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NVUQStI8R3vooOw/aI2S7mU/fM8wYcvR1cyugASxQcc=;
 b=ngyX+jv3o6ZoWfN55UCVS3lUgVf1B9naosJt/CxL/pgGiirDmXWnefCgR2AKxSt0HD
 K9B5mKVOuhCPJWJWb12il4SabcA5264GXWdB4xZcRpMSRwH73FqhECk2miU/rt0R050A
 da1qarXQYjMSVGmgKPzb8SbV5GntuhlaM9ryAjQDQqKBk3R96qUswpdmaqGek+AsHLbh
 GsSOPlQQzAy2xmA6mtM5P48SK3rnBnHdB/AbnCKEXbav6Jbemd/C43fzfcsF9TRi2zrD
 INSRCO4cQToUj/4wEtdgMLsWTRIA89ZVKVdOHUaOoU7TGNGY/3ZKqA1mOPI67KpuPvJR
 zF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NVUQStI8R3vooOw/aI2S7mU/fM8wYcvR1cyugASxQcc=;
 b=KMNCerZtaCtsgNH5rYyTcgZ1qbh6jphzgg4O0Uo4hAtWYbeuNuA+rA2PWBivzpW1WA
 R/1Rlcg0UolYWdEnoCjMyVHCu+R6g061oEUaKcjeG05Ui3FFXmJVeiBgLCNnNKjTXC3O
 ueczyCpTjkW44u0HhmmJVHNMSfkp2NigafHZz7t3/6eqqnwA0BMesf3YDD3e3VhuLA2f
 bBfGoOQylr2kWggGtfxWIeq4Fi8XSpQ16tONxVn6a/nP6HGnjKTJbZ/dmQ2t5QCktsYj
 0/lqBXpvgQHcP64u6Feumwt2CZ+/LCBbOsviDTzjKBsu2EoH7b9IqC8Oh/xgdyGihuB0
 awAg==
X-Gm-Message-State: AOAM530UCya5lmAzNG8bo5xYSWitaLbRSxMSOMj38+QtlNSO+rRZcoNZ
 lfA9mUf657SDHdG5lW94xs3yLEXVC3U=
X-Google-Smtp-Source: ABdhPJx8OxgsfbAy0WQpQKVyY+8XxWUlnp+dpw7sS2ZohbZt+vEvu4UP8XZnoEo8lBv4KNjIeZZGOw==
X-Received: by 2002:a17:90b:1a86:: with SMTP id
 ng6mr4198091pjb.113.1611129012952; 
 Tue, 19 Jan 2021 23:50:12 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id a5sm1218092pgl.41.2021.01.19.23.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 23:50:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: prevent replayed interrupt handlers from running
 softirqs
Date: Wed, 20 Jan 2021 17:50:05 +1000
Message-Id: <20210120075005.1678565-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Running softirqs enables interrupts, which can then end up recursing
into the irq soft-mask code we're adjusting, including replaying
interrupts itself, which might be theoretically unbounded.

This abridged trace shows how this can occur:

! NIP replay_soft_interrupts
  LR  interrupt_exit_kernel_prepare
  Call Trace:
    interrupt_exit_kernel_prepare (unreliable)
    interrupt_return
  --- interrupt: ea0 at __rb_reserve_next
  NIP __rb_reserve_next
  LR __rb_reserve_next
  Call Trace:
    ring_buffer_lock_reserve
    trace_function
    function_trace_call
    ftrace_call
    __do_softirq
    irq_exit
    timer_interrupt
!   replay_soft_interrupts
    interrupt_exit_kernel_prepare
    interrupt_return
  --- interrupt: ea0 at arch_local_irq_restore

Fix this by disabling bhs (softirqs) around the interrupt replay.

I don't know that commit 3282a3da25bd ("powerpc/64: Implement soft
interrupt replay in C") actually introduced the problem. Prior to that
change, the interrupt replay seems like it should still be subect to
this recusion, however it's done after all the irq state has been fixed
up at the end of the replay, so it seems reasonable to fix back to this
commit.

Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6b1eca53e36c..7064135f9dc3 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -188,6 +188,18 @@ void replay_soft_interrupts(void)
 	unsigned char happened = local_paca->irq_happened;
 	struct pt_regs regs;
 
+	/*
+	 * Prevent softirqs from being run when an interrupt handler returns
+	 * and calls irq_exit(), because softirq processing enables interrupts.
+	 * If an interrupt is taken, it may then call replay_soft_interrupts
+	 * on its way out, which gets messy and recursive.
+	 *
+	 * softirqs created by replayed interrupts will be run at the end of
+	 * this function when bhs are enabled (if they were enabled in our
+	 * caller).
+	 */
+	local_bh_disable();
+
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
 
@@ -263,6 +275,8 @@ void replay_soft_interrupts(void)
 		trace_hardirqs_off();
 		goto again;
 	}
+
+	local_bh_enable();
 }
 
 notrace void arch_local_irq_restore(unsigned long mask)
-- 
2.23.0


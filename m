Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112226A479
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:57:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrMCc06fhzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kCa2iCZ0; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0M2pM2zDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:15 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id f18so1766461pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDV8UymKx2QhiZ1gt1TI/vzp50RKEJhmteuLnX33owA=;
 b=kCa2iCZ0h6iuVxYaYAIkES+u4UqdEBe2xxv2hs2BnXiNs8kFQnY4Wntvrg5vt1fzbG
 w06NmvgCtCGBtKhl0f1yc9bqgoppn+uKd/SofloUYaHhvF4ouoCjodlN1AwlAp1BvEm+
 xITsfbM2H28Bdi7fFD7tUlpHJbtZgPb76dii8aTqAu9sNOTZY7925dmtZIeq0Y2lDTec
 5836PlQVlpxbqTnXUi9b2ZpUpQjuTR5AJ8O1IL6fe1wpRd3wXSGhs+ddQvgy47N0YScu
 QmMoKwE1OZyM7nK6sX9z7OzVst/8a4ooUeAFtg596Ty7ZHPnl3L3Cqta7LDK0uZgnIqo
 QjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDV8UymKx2QhiZ1gt1TI/vzp50RKEJhmteuLnX33owA=;
 b=av0MpcjxHxlazL7Z/B5TxiVQteiAOPssZ2mHSeaCeiQ4NAYngX7rbwhMCCU7R8CagH
 OXc2e5+yhJLTA+ls0AIlpUNvex1kzbBVAGn8mXF/FOYmxJBXU3XRyeRYJWa0hs/5xTmJ
 qRth3+o/QWbF0hBsMiIVeF+c5zpgQVEd24UdY9EW4QeuskhTA/jiXQ+9aQPDtUSKGtBg
 JV/69XhVwX0H5OUk03Cdu+/okfQc5dvjvsG67udfeY3NeLYvEaASBhF8PSK/5ZhM9ASv
 4Gac1/U2JgBV99aHSH/sHdbduvvH6cWgw9sF21cuWem6rrZhbjYap4ec+p2iLrZLNQFm
 4wPQ==
X-Gm-Message-State: AOAM532kCqmW6ERndYYFXv8Tm2SMzuYqBoduMFyK5UPev59bq2AyWdmj
 zFhktq0KFzXPNw7yrqEAzHVFpoDB546XTw==
X-Google-Smtp-Source: ABdhPJwvduwya7FcGBvNRdIayWbsWQLns12/Ht+4NR7wIkq0JVtZWqDyhc9rGbJMaO2HcWE5MnjcuA==
X-Received: by 2002:a63:1c1b:: with SMTP id c27mr13012685pgc.439.1600170432584; 
 Tue, 15 Sep 2020 04:47:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:47:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64: irq replay remove decrementer overflow check
Date: Tue, 15 Sep 2020 21:46:50 +1000
Message-Id: <20200915114650.3980244-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
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

This is an ad-hoc way to catch some cases of decrementer overflow. It
won't catch cases where interrupts were hard disabled before any soft
masked interrupts fired, for example. And it doesn't catch cases that
have overflowed an even number of times.

It's not clear what exactly what problem s being solved here. A lost
timer when we have an IRQ off latency of more than ~4.3 seconds could
be avoided (so long as it's also less than ~8.6s) but this is already
a hard lockup order of magnitude event, and the decrementer will wrap
again and provide a timer interrupt within the same latency magnitdue.

So the test catches some cases of lost decrementers in very exceptional
(buggy) latency event cases, reducing timer interrupt latency in that
case by up to 4.3 seconds. And for large decrementer, it's useless. It
is performed in potentially quite a hot path, reading the TB can be
a noticable overhead.

Perhaps more importantly it allows the clunky MSR[EE] vs
PACA_IRQ_HARD_DIS incoherency to be removed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 50 +--------------------------------------
 1 file changed, 1 insertion(+), 49 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 631e6d236c97..d7162f142f24 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -102,14 +102,6 @@ static inline notrace unsigned long get_irq_happened(void)
 	return happened;
 }
 
-static inline notrace int decrementer_check_overflow(void)
-{
- 	u64 now = get_tb_or_rtc();
-	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
- 
-	return now >= *next_tb;
-}
-
 #ifdef CONFIG_PPC_BOOK3E
 
 /* This is called whenever we are re-enabling interrupts
@@ -142,35 +134,6 @@ notrace unsigned int __check_irq_replay(void)
 	trace_hardirqs_on();
 	trace_hardirqs_off();
 
-	/*
-	 * We are always hard disabled here, but PACA_IRQ_HARD_DIS may
-	 * not be set, which means interrupts have only just been hard
-	 * disabled as part of the local_irq_restore or interrupt return
-	 * code. In that case, skip the decrementr check becaus it's
-	 * expensive to read the TB.
-	 *
-	 * HARD_DIS then gets cleared here, but it's reconciled later.
-	 * Either local_irq_disable will replay the interrupt and that
-	 * will reconcile state like other hard interrupts. Or interrupt
-	 * retur will replay the interrupt and in that case it sets
-	 * PACA_IRQ_HARD_DIS by hand (see comments in entry_64.S).
-	 */
-	if (happened & PACA_IRQ_HARD_DIS) {
-		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
-
-		/*
-		 * We may have missed a decrementer interrupt if hard disabled.
-		 * Check the decrementer register in case we had a rollover
-		 * while hard disabled.
-		 */
-		if (!(happened & PACA_IRQ_DEC)) {
-			if (decrementer_check_overflow()) {
-				local_paca->irq_happened |= PACA_IRQ_DEC;
-				happened |= PACA_IRQ_DEC;
-			}
-		}
-	}
-
 	if (happened & PACA_IRQ_DEC) {
 		local_paca->irq_happened &= ~PACA_IRQ_DEC;
 		return 0x900;
@@ -229,18 +192,6 @@ void replay_soft_interrupts(void)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON_ONCE(mfmsr() & MSR_EE);
 
-	if (happened & PACA_IRQ_HARD_DIS) {
-		/*
-		 * We may have missed a decrementer interrupt if hard disabled.
-		 * Check the decrementer register in case we had a rollover
-		 * while hard disabled.
-		 */
-		if (!(happened & PACA_IRQ_DEC)) {
-			if (decrementer_check_overflow())
-				happened |= PACA_IRQ_DEC;
-		}
-	}
-
 	/*
 	 * Force the delivery of pending soft-disabled interrupts on PS3.
 	 * Any HV call will have this side effect.
@@ -345,6 +296,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 		__hard_irq_disable();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 	} else {
 		/*
 		 * We should already be hard disabled here. We had bugs
-- 
2.23.0


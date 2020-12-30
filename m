Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C92E7946
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 14:13:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5WvH2sBbzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 00:13:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A+FbJH8K; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5WgW5H0zzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 00:03:35 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B94F0222F9;
 Wed, 30 Dec 2020 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333413;
 bh=g2Fon07Qd3sTnPTV8LLOjNJ5NIrMxxWNxKGJRrGT4Vk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A+FbJH8Kbge+ztJzCs0bEFZLwRw8Llb5v77V+syWlJs+8fFWh5p9zKqSoqmq+t+w2
 z1Z1s51qFdXXaqY4vRClWWyu9Uw20tsFHXTu3Uq+/eVCJHeYbUFdKDQR/hApfnd1Wg
 StaiA5ZmQkO9bqexHYpECATmLXvOyxXv715Sbb4odHvkxDIkP0lPNkm9h5RzkmNDMw
 FNF6eSa0EeXSs78sQdnBsd1qQRZiJMPJzomuKSWVIRsTmTYTlNiNh2I7sumT2S3o89
 LvULXtcdWpo4sd0J1m8FntDqbwisiXC0ANsBiqDc2vz9cpAziud0oAucqKl13CV8B9
 UJLHbZzWMvbjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/31] powerpc/64: irq replay remove decrementer
 overflow check
Date: Wed, 30 Dec 2020 08:02:56 -0500
Message-Id: <20201230130314.3636961-14-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130314.3636961-1-sashal@kernel.org>
References: <20201230130314.3636961-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 59d512e4374b2d8a6ad341475dc94c4a4bdec7d3 ]

This is way to catch some cases of decrementer overflow, when the
decrementer has underflowed an odd number of times, while MSR[EE] was
disabled.

With a typical small decrementer, a timer that fires when MSR[EE] is
disabled will be "lost" if MSR[EE] remains disabled for between 4.3 and
8.6 seconds after the timer expires. In any case, the decrementer
interrupt would be taken at 8.6 seconds and the timer would be found at
that point.

So this check is for catching extreme latency events, and it prevents
those latencies from being a further few seconds long.  It's not obvious
this is a good tradeoff. This is already a watchdog magnitude event and
that situation is not improved a significantly with this check. For
large decrementers, it's useless.

Therefore remove this check, which avoids a mftb when enabling hard
disabled interrupts (e.g., when enabling after coming from hardware
interrupt handlers). Perhaps more importantly, it also removes the
clunky MSR[EE] vs PACA_IRQ_HARD_DIS incoherency in soft-interrupt replay
which simplifies the code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20201107014336.2337337-1-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/irq.c             | 53 ++-------------------------
 arch/powerpc/kernel/time.c            |  9 ++---
 arch/powerpc/platforms/powernv/opal.c |  2 +-
 3 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 7d0f7682d01df..6b1eca53e36cc 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -102,14 +102,6 @@ static inline notrace unsigned long get_irq_happened(void)
 	return happened;
 }
 
-static inline notrace int decrementer_check_overflow(void)
-{
-	u64 now = get_tb();
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
@@ -186,6 +149,9 @@ notrace unsigned int __check_irq_replay(void)
 		return 0x280;
 	}
 
+	if (happened & PACA_IRQ_HARD_DIS)
+		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+
 	/* There should be nothing left ! */
 	BUG_ON(local_paca->irq_happened != 0);
 
@@ -229,18 +195,6 @@ void replay_soft_interrupts(void)
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
@@ -345,6 +299,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 		__hard_irq_disable();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 	} else {
 		/*
 		 * We should already be hard disabled here. We had bugs
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 74efe46f55327..7d372ff3504b2 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -552,14 +552,11 @@ void timer_interrupt(struct pt_regs *regs)
 	struct pt_regs *old_regs;
 	u64 now;
 
-	/* Some implementations of hotplug will get timer interrupts while
-	 * offline, just ignore these and we also need to set
-	 * decrementers_next_tb as MAX to make sure __check_irq_replay
-	 * don't replay timer interrupt when return, otherwise we'll trap
-	 * here infinitely :(
+	/*
+	 * Some implementations of hotplug will get timer interrupts while
+	 * offline, just ignore these.
 	 */
 	if (unlikely(!cpu_online(smp_processor_id()))) {
-		*next_tb = ~(u64)0;
 		set_dec(decrementer_max);
 		return;
 	}
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index d95954ad4c0af..c61c3b62c8c62 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -731,7 +731,7 @@ int opal_hmi_exception_early2(struct pt_regs *regs)
 	return 1;
 }
 
-/* HMI exception handler called in virtual mode during check_irq_replay. */
+/* HMI exception handler called in virtual mode when irqs are next enabled. */
 int opal_handle_hmi_exception(struct pt_regs *regs)
 {
 	/*
-- 
2.27.0


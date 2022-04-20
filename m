Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFA508A9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 16:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk2nS1GmFz3bfq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Apr 2022 00:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pGaL3xj1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk2mq4jxFz2yNF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Apr 2022 00:17:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pGaL3xj1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kk2mk2cXLz4xXj;
 Thu, 21 Apr 2022 00:17:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650464230;
 bh=CRjmxCz6iBqvOPDZnQ7tgA2kXfn+x8a+axB6qW8tiCQ=;
 h=From:To:Cc:Subject:Date:From;
 b=pGaL3xj1WY0hE0xp5AOOlYNdTwaqkCstUwzFVs/2PLQPjRQmTVonpnuqbU1pe96ow
 VePeZmBQWPWMhmEuJ8ZebCBN99BY3J2DcDKE0P75uzd8AeSkTtlhiRrW8sIk6U0dZf
 /g03VusojcDxdR0kWoMRB5/PYA+lzvuHUaxIESmFGhBt+U9lORZN1Q1RrPg9euZ9qf
 BvipnB656RRtUKxaWei0sIWIoxnZ/YufPKpyzKLYfVgOwGq2fs0NFwnf5ottl36DUU
 bKR/8o2q8RflV8iM5nW6fZIMZ0/grnJJwNFkiZff9DifmYrP7psQSzTwoYYlYe8rWX
 O3YHyj8Fs1UVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/time: Always set decrementer in timer_interrupt()
Date: Thu, 21 Apr 2022 00:16:57 +1000
Message-Id: <20220420141657.771442-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: miguel.ojeda.sandonis@gmail.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a partial revert of commit 0faf20a1ad16 ("powerpc/64s/interrupt:
Don't enable MSR[EE] in irq handlers unless perf is in use").

Prior to that commit, we always set the decrementer in
timer_interrupt(), to clear the timer interrupt. Otherwise we could end
up continuously taking timer interrupts.

When high res timers are enabled there is no problem seen with leaving
the decrementer untouched in timer_interrupt(), because it will be
programmed via hrtimer_interrupt() -> tick_program_event() ->
clockevents_program_event() -> decrementer_set_next_event().

However with CONFIG_HIGH_RES_TIMERS=n or booting with highres=off, we
see a stall/lockup, because tick_nohz_handler() does not cause a
reprogram of the decrementer, leading to endless timer interrupts.
Example trace:

  [    1.898617][    T7] Freeing initrd memory: 2624K^M
  [   22.680919][    C1] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:^M
  [   22.682281][    C1] rcu:     0-....: (25 ticks this GP) idle=073/0/0x1 softirq=10/16 fqs=1050 ^M
  [   22.682851][    C1]  (detected by 1, t=2102 jiffies, g=-1179, q=476)^M
  [   22.683649][    C1] Sending NMI from CPU 1 to CPUs 0:^M
  [   22.685252][    C0] NMI backtrace for cpu 0^M
  [   22.685649][    C0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc2-00185-g0faf20a1ad16 #145^M
  [   22.686393][    C0] NIP:  c000000000016d64 LR: c000000000f6cca4 CTR: c00000000019c6e0^M
  [   22.686774][    C0] REGS: c000000002833590 TRAP: 0500   Not tainted  (5.16.0-rc2-00185-g0faf20a1ad16)^M
  [   22.687222][    C0] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24000222  XER: 00000000^M
  [   22.688297][    C0] CFAR: c00000000000c854 IRQMASK: 0 ^M
  ...
  [   22.692637][    C0] NIP [c000000000016d64] arch_local_irq_restore+0x174/0x250^M
  [   22.694443][    C0] LR [c000000000f6cca4] __do_softirq+0xe4/0x3dc^M
  [   22.695762][    C0] Call Trace:^M
  [   22.696050][    C0] [c000000002833830] [c000000000f6cc80] __do_softirq+0xc0/0x3dc (unreliable)^M
  [   22.697377][    C0] [c000000002833920] [c000000000151508] __irq_exit_rcu+0xd8/0x130^M
  [   22.698739][    C0] [c000000002833950] [c000000000151730] irq_exit+0x20/0x40^M
  [   22.699938][    C0] [c000000002833970] [c000000000027f40] timer_interrupt+0x270/0x460^M
  [   22.701119][    C0] [c0000000028339d0] [c0000000000099a8] decrementer_common_virt+0x208/0x210^M

Possibly this should be fixed in the lowres timing code, but that would
be a generic change and could take some time and may not backport
easily, so for now make the programming of the decrementer unconditional
again in timer_interrupt() to avoid the stall/lockup.

Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless perf is in use")
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/time.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f5cbfe5efd25..f80cce0e3899 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -615,23 +615,22 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		return;
 	}
 
-	/* Conditionally hard-enable interrupts. */
-	if (should_hard_irq_enable()) {
-		/*
-		 * Ensure a positive value is written to the decrementer, or
-		 * else some CPUs will continue to take decrementer exceptions.
-		 * When the PPC_WATCHDOG (decrementer based) is configured,
-		 * keep this at most 31 bits, which is about 4 seconds on most
-		 * systems, which gives the watchdog a chance of catching timer
-		 * interrupt hard lockups.
-		 */
-		if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
-			set_dec(0x7fffffff);
-		else
-			set_dec(decrementer_max);
+	/*
+	 * Ensure a positive value is written to the decrementer, or
+	 * else some CPUs will continue to take decrementer exceptions.
+	 * When the PPC_WATCHDOG (decrementer based) is configured,
+	 * keep this at most 31 bits, which is about 4 seconds on most
+	 * systems, which gives the watchdog a chance of catching timer
+	 * interrupt hard lockups.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
+		set_dec(0x7fffffff);
+	else
+		set_dec(decrementer_max);
 
+	/* Conditionally hard-enable interrupts. */
+	if (should_hard_irq_enable())
 		do_hard_irq_enable();
-	}
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 	if (atomic_read(&ppc_n_lost_interrupts) != 0)
-- 
2.34.1


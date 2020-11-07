Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 590012AA213
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 02:45:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSg7B5VBgzDrR6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 12:45:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mZHY1xri; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSg5d2zNKzDrKV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 12:43:47 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id e21so2431893pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 17:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49qjLnTAfB4AbkDbNfb5Yu6fp6UAjaG4C1ItQ+3Rw4s=;
 b=mZHY1xri2Re/40xr/MuF9t7YJxco2Iw/WEGI0cM9KFZWdkjm3mzPN7MKb28/+9jdXn
 SRDQRbbls0dyepO4TTw4B4v8iTs7q3f/itXx3wQj1jTlu6dil/5FAGm6qZJdfdwZj7YK
 V/UkQmZnCq2MPtiVmjzLndF2jyDCMTL4YcKngwaegp5Y8xgKnYsx3fllk8KmFVIjlNp2
 ZMdD7DO/Vf3y6hh8d+ukpUh0sySdlLnCRAe3DnlHTw55p5mmTHhEJf6xgynFzmC0pXkv
 9MC31Nx9QCIUupbAGPyRWlI8tRi/FKzDHBHSBVz85YfHyOrtLKSnaXfPBQQHH/m3c5BM
 u0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49qjLnTAfB4AbkDbNfb5Yu6fp6UAjaG4C1ItQ+3Rw4s=;
 b=eNAHcjj8Lg4tg0cg3gGXdAS3iB3CD03E0rSH6dGaZ1vhcECvpHPGDdEk7CwH2YpgeR
 bDDOl4XzilYlkeN4xbbPs/juVmqm3SjidrReGL7GZqIDSPph2djcfwYmuCiHkoLoVGjk
 cOhl23wpNz1pQ9+GS20oA1yej9Ta6NDRtUH4cfnWum1l7OdgiqwzEeVsiUhc4dpEE2J8
 qzcaCnnRp0zEBpF6NYp5fFXEy/Lh9lN2GBXaSd6XWQ4/KDmYGAaE2jBuQAxmcFVCwD8n
 rjmRxvQq7wCDO0ZUmt+dNwzoHmgFr1RZfHT6XoiolK40HlT4YQCZygcbpesAC4pwSfmA
 wZ6A==
X-Gm-Message-State: AOAM533UVmQs3ZzyjkEA4krH8UW6pukQV7JMp1GSC6IgiPbkj/Hg5zC1
 5WS3eUoTA1SIyyeMna4KGg5rhHrBTYg=
X-Google-Smtp-Source: ABdhPJy+/PR87EG0tq7xRr272TpTR7HwjIFeUeQ79E8szY0lGYtP7UapSCqkB77+GtRkVxPgmREH2A==
X-Received: by 2002:aa7:8545:0:b029:163:c9a5:97d with SMTP id
 y5-20020aa785450000b0290163c9a5097dmr4402971pfn.38.1604713422426; 
 Fri, 06 Nov 2020 17:43:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id d22sm2844856pgv.87.2020.11.06.17.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 17:43:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64: irq replay remove decrementer overflow check
Date: Sat,  7 Nov 2020 11:43:36 +1000
Message-Id: <20201107014336.2337337-1-npiggin@gmail.com>
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
---
v2: Fixed 64e warnings

 arch/powerpc/kernel/irq.c             | 53 ++-------------------------
 arch/powerpc/kernel/time.c            |  9 ++---
 arch/powerpc/platforms/powernv/opal.c |  2 +-
 3 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 7d0f7682d01d..6b1eca53e36c 100644
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
index 74efe46f5532..7d372ff3504b 100644
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
index d95954ad4c0a..c61c3b62c8c6 100644
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
2.23.0


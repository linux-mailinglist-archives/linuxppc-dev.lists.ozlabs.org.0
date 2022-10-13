Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6B5FD518
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 08:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp0QQ1ndJz3dqd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:45:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PCpBEInZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PCpBEInZ;
	dkim-atps=neutral
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp0PS6sywz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 17:44:42 +1100 (AEDT)
Received: by mail-vs1-xe2d.google.com with SMTP id p7so830990vsr.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNHH8Vnp59mgH209Ys2mTX5TZgQ+Zz3xQ+wPClE8geA=;
        b=PCpBEInZ7hm1OMnS/cEKA+sJmhRGZi4sdGaNt0MQ+MTWAqO4E8gVUfOHGkW4L7DbiJ
         CuEOTqYtleELdgJAQtX/FJWNvgoPhLHzxo5vXmoAFyvukZJKybZuroc9Zxb5kzI6M/sF
         +DaySnPRMWZvgbAcUk9wpw9ncePhsM/NI/xmhHu4gPYkj3Y0VDXscx+5E6VRSwiqsFnm
         u2qZoEcsq47TRr58KwlH3bdob7WiMkcpsHQolLdzupkCOmokC1ezEQIcJScju9PGRq6V
         HPi2Tpq/4peo/b+a97x1buNxiE4z39C9/vvWDLphwSTZvxGQe0NoPCPxqlkXCnl/269m
         q0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNHH8Vnp59mgH209Ys2mTX5TZgQ+Zz3xQ+wPClE8geA=;
        b=vn/7ARVNH70r0l1GP7KEi60HoGIPyyg5UGTqJEyJQCfpfEXry0WGooUkKrx9ReBlQN
         SbufIBd9BYBKM/xUoPPLkE0HYRNU9z5l8nSl+llArs/rDWYxsDUt3/Y3UHVEcSUG1PQH
         jgTpjJdyHFmoe0GwXHxU0WUhTVjIXI/XI4SvCgVtaQZM+ZnyjIUzzn00NxQVs4Ak/WAb
         cKP2WNtHZleTBDlXjX6Car30PLEXdNiMmFQZrcr0uWDlxaft4WO93rooyfL97plm5DLT
         ck5CpRzd9IMi9TmHI6vS+cymKHm/RYNOJQXNJmZMovwh1LCQoVZPe/bT2KrZfe9gA8do
         FPRg==
X-Gm-Message-State: ACrzQf1l2AWHlhhdEJNTvRVxUnENOfCxXjbAPdJADDRLARuXwzaBUuTa
	T/H9ti6Lnkc3xNFdi3h0S6W05xyBmnhUBg==
X-Google-Smtp-Source: AMsMyM6gkMQ05cz9TeBfkxz5b47c+VlKVQrcZgi36ieK6KPRgcl1ycxGVaho0Bc4QPus+CuwSczrkg==
X-Received: by 2002:a17:902:a612:b0:17e:539:c415 with SMTP id u18-20020a170902a61200b0017e0539c415mr32413834plq.173.1665643467567;
        Wed, 12 Oct 2022 23:44:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a460300b00203c0a1d56bsm2500635pjg.35.2022.10.12.23.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 23:44:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context
Date: Thu, 13 Oct 2022 16:44:18 +1000
Message-Id: <20221013064418.1311104-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Guenter Roeck <linux@roeck-us.net>, Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's possible for an interrupt returning to an irqs-disabled context to
lose a pending soft-masked irq because it branches to part of the exit
code for irqs-enabled contexts, which is meant to clear only the
PACA_IRQS_HARD_DIS flag from PACAIRQHAPPENED by zeroing the byte. This
just looks like a simple thinko from a recent commit (if there was no
hard mask pending, there would be no reason to clear it anyway).

This also adds comment to the code that actually does need to clear the
flag.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: e485f6c751e0a ("powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
I credit Sachin as well because he likely ran into it here,

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-March/240971.html

It was much more difficult to hit on his setup so when I asked him to
re-test with a later kernel and it didn't reproduce, I thought it
could have been unrelated. I stared at the patch for ages back then and
didn't see the bug. I should have known better :(

I'm pretty confident this is the hang problem. Reproducer is intermittent
for me, but I did catch it losing pending irqs here using debug code, so
this certainly is _a_ bug that can explain the symptoms.

Thanks,
Nick

 arch/powerpc/kernel/interrupt_64.S | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 904a5608cbe3..978a173eb339 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -538,7 +538,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	beq	.Lfast_kernel_interrupt_return_\srr\() // EE already disabled
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r10,r11,PACA_IRQ_MUST_HARD_MASK
-	beq	1f // No HARD_MASK pending
+	beq	.Lfast_kernel_interrupt_return_\srr\() // No HARD_MASK pending
 
 	/* Must clear MSR_EE from _MSR */
 #ifdef CONFIG_PPC_BOOK3S
@@ -555,12 +555,23 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	b	.Lfast_kernel_interrupt_return_\srr\()
 
 .Linterrupt_return_\srr\()_soft_enabled:
+	/*
+	 * In the soft-enabled case, need to double-check that we have no
+	 * pending interrupts that might have come in before we reached the
+	 * restart section of code, and restart the exit so those can be
+	 * handled.
+	 *
+	 * If there are none, it is be possible that the interrupt still
+	 * has PACA_IRQ_HARD_DIS set, which needs to be cleared for the
+	 * interrupted context. This clear will not clobber a new pending
+	 * interrupt coming in, because we're in the restart section, so
+	 * such would return to the restart location.
+	 */
 #ifdef CONFIG_PPC_BOOK3S
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
 	bne-	interrupt_return_\srr\()_kernel_restart
 #endif
-1:
 	li	r11,0
 	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
 
-- 
2.37.2


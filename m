Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BFD608481
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 07:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvV946VVdz3drZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 16:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h9FBBNYs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h9FBBNYs;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvV893X5Cz3bjh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 16:22:16 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id y1so4498279pfr.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otLUHhulLpueLxpBEaW5/pvg9rasrTUF1MJmFYKUK4o=;
        b=h9FBBNYscRElxEeBIgd3Y7vekvAteJr7LZoJatpj/33fOQ9+m1nzDJ3u3qsKI1OhkZ
         NmRyoPKajHhykEqLF0/pVO60kawAAdT7fE2ZqaHCAx++AMs/yNtEYjzRwBbqQ1Ig+RnX
         S8NqNEafxgwvMoC8ESevCAzFW5ou+QRwqeoOJy1RLN4XIUCD5YyVG4HuVAyRURtdv6d/
         si59qJHoQAKonC/ObeVzQ6ekDHwDjEoM1AsA/SO17oqy4AaiogThHaFEf8zV/C62VRzr
         wCZwtqXGN2IjPcIlHKeKiHq5ay2ZcFnpd1x8MtjgZTObN+5avPmYbOaMT7I43Rc+W9Hu
         77tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otLUHhulLpueLxpBEaW5/pvg9rasrTUF1MJmFYKUK4o=;
        b=MeUsAI8borhguJtX8BshVT4Y7iYJKuuCDMoDxQR76tmlNQHWxCNLNnDEHJMsnT0Scb
         lDPHLLMOvKxmnTFu9tazBcRaiD/58ruam3TuKbPoLDMMMtH7TITFv/nEM0wqkMRRtomg
         4i9yU5SPulPlIW5uOCb+65k1gw4d1X7nXehidBy7wuyhwDXqhMKhgRXuSJkVKNqDFHnA
         0v6pVoKanMbHbt2aIPMWtRovLE8jic+R6pJisQWGNMpjpKzufiIvMrdyNSipkG1jTXhK
         A0K0LSCz1UQKrxXhRGjqng2LA1RkBg0p9gsPxdeD8J2gB7951tdtg84fpYrdQjXxOngr
         9Khg==
X-Gm-Message-State: ACrzQf2uWfjdhgBSJ2jL3asOma/+m3bI7Y7nz9oo7S3S/ZQSIkS7x2Ck
	rAvDCxM8neddeiZlZ/8vUbPATQzMKDi1bg==
X-Google-Smtp-Source: AMsMyM5+ifK55hKUfuh8BdRRcGJc8H/dbEX0LHVEymuM/9pnJ+8Nor/QXPnWU4llMFUis4r7tQa2dg==
X-Received: by 2002:a63:251:0:b0:46e:9da8:1f93 with SMTP id 78-20020a630251000000b0046e9da81f93mr9830639pgc.490.1666416134131;
        Fri, 21 Oct 2022 22:22:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.150.62])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902dacf00b001868981a18esm484745plx.6.2022.10.21.22.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 22:22:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS when returning to soft-masked context
Date: Sat, 22 Oct 2022 15:22:07 +1000
Message-Id: <20221022052207.471328-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a4cb3651a1743 ("powerpc/64s/interrupt: Fix lost interrupts when
returning to soft-masked context") fixed the problem of pending irqs
pending cleared when clearing the HARD_DIS bit, but then it didn't clear
the bit at all. This change clears HARD_DIS without affecting other bits
in the mask.

When an interrupt hits in a soft-masked section that has MSR[EE]=1, it
can hard disable and set PACA_IRQS_HARD_DIS,which  must be cleared
when returning to the EE=1 caller (unless it was set due to a
MUST_HARD_MASK interrupt becoming pending). Failure to clear this leaves
the returned-to context running with MSR[EE]=1 and PACA_IRQS_HARD_DIS,
which confuses irq assertions and could be dangerous for code that might
test the flag.

This was observed in a hash MMU kernel where a kernel hash fault hits in
a local_irqs_disabled region that has EE=1. The hash fault also runs
with EE=1, then as it returns, a decrementer hits in the restart section
and the irq restart code hard-masks which sets the PACA_IRQ_HARD_DIS
flag, which is not clear when the original context is returned to.

Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: a4cb3651a1743 ("powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 978a173eb339..a019ed6fc839 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -532,15 +532,24 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	 * Returning to soft-disabled context.
 	 * Check if a MUST_HARD_MASK interrupt has become pending, in which
 	 * case we need to disable MSR[EE] in the return context.
+	 *
+	 * The MSR[EE] check catches among other things the short incoherency
+	 * in hard_irq_disable() between clearing MSR[EE] and setting
+	 * PACA_IRQ_HARD_DIS.
 	 */
 	ld	r12,_MSR(r1)
 	andi.	r10,r12,MSR_EE
 	beq	.Lfast_kernel_interrupt_return_\srr\() // EE already disabled
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r10,r11,PACA_IRQ_MUST_HARD_MASK
-	beq	.Lfast_kernel_interrupt_return_\srr\() // No HARD_MASK pending
+	bne	1f // HARD_MASK is pending
+	// No HARD_MASK pending, clear possible HARD_DIS set by interrupt
+	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
+	stb	r11,PACAIRQHAPPENED(r13)
+	b	.Lfast_kernel_interrupt_return_\srr\()
+
 
-	/* Must clear MSR_EE from _MSR */
+1:	/* Must clear MSR_EE from _MSR */
 #ifdef CONFIG_PPC_BOOK3S
 	li	r10,0
 	/* Clear valid before changing _MSR */
-- 
2.37.2


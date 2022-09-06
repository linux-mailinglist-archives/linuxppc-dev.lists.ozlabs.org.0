Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC045ADF5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 08:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFGd3vfqz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:04:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KM4nsaXx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KM4nsaXx;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFFM6w60z2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 16:03:51 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id fs14so5402400pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 23:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3jB4Ii7xaomyhGENhnU8c09sqglMkNd9vUaTObmjEbw=;
        b=KM4nsaXxKm2495KEwlo0lNbLa8fdcx0iLRz6KM+A38K38ys4nIS+Ko4ToOuE/haNeb
         rL/9QE8ZXmiDyoO+owOxuQZvlXDN69HwUAI8Qb/L9I/iXtiYaXVE6q1s4amTS7zzE89F
         iWKAHfuNy8fuqteWMKaeM/d4Ge2Y6QUzJFrCiXKJ7W4FP83pin/7vmkMvl5BRJRKs8c2
         qYYIiVSgLnisZi1BITiNrP9qOOjccnniLhEiWRhOhbom8R4AhLM/J081gpAek8VG2+Ic
         KXL7gkHQl6zomZ4Zp2BBcAh3lsqhZBbnhQftEUJeezWIhztDy2AyblHlqRYOnpPYaUMI
         TiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3jB4Ii7xaomyhGENhnU8c09sqglMkNd9vUaTObmjEbw=;
        b=nMAnryK95gedgLiBcZR3PAbuP2ih4XURwWagBvHmSS0xIRrAke+BT96q13DhlM/F2q
         MBMQNEkS7dVv0nmKRmsbNbMwcUzN0eL5jo5wR9YRYptjwDdQ9XOxobm0IAfxqSmH5VgV
         WzCIWTKZoX5Pq0G4mgsP1Yv61slgEZwNbi2w/AWPOcK0rX7b3YDtDYDQk2nuAR1yp+zt
         +13QfbzUVVSBoWiYRYxAbrXOF5mrCHYjSGxncy6dMNoAy/XwXYm2W0FsRU44ZJKDkZ+q
         yvnrVotXiG9rg9l+pnMjlKCNuoHe38ZDfGBJhT45oCLqFyPt49RqGNuZBQmCoBYMHDCq
         Vtkw==
X-Gm-Message-State: ACgBeo3f4hw3Vt9uBrlgedD/DgmS0Qo5D/ezb/zZQVM4Mm1vqA7gUYlf
	JKLBDZAbtw+hG70Yztvd9XUGw8wO/rE=
X-Google-Smtp-Source: AA6agR6M2jKrE+UFqn26ai7Dig/odDL5fmZcXiRWrP7otVCGl1QNRwDsh2zdO/E44rsbOeIIjhcsnA==
X-Received: by 2002:a17:90b:2242:b0:200:1c81:c108 with SMTP id hk2-20020a17090b224200b002001c81c108mr15632974pjb.89.1662444228727;
        Mon, 05 Sep 2022 23:03:48 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id u126-20020a626084000000b005383988ec0fsm8934864pfb.162.2022.09.05.23.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:03:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
Date: Tue,  6 Sep 2022 16:03:35 +1000
Message-Id: <20220906060337.3302557-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906060337.3302557-1-npiggin@gmail.com>
References: <20220906060337.3302557-1-npiggin@gmail.com>
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

If a synchronous interrupt (e.g., hash fault) is taken inside an
irqs-disabled region which has MSR[EE]=1, then an asynchronous interrupt
that is PACA_IRQ_MUST_HARD_MASK (e.g., PMI) is taken inside the
synchronous interrupt handler, then the synchronous interrupt will
return with MSR[EE]=1 and the asynchronous interrupt fires again.

If the asynchronous interrupt is a PMI and the original context does not
have PMIs disabled (only Linux IRQs), the asynchronous interrupt will
fire despite having the PMI marked soft pending. This can confuse the
perf code and cause warnings.

This patch changes the interrupt return so that irqs-disabled MSR[EE]=1
contexts will be returned to with MSR[EE]=0 if a PACA_IRQ_MUST_HARD_MASK
interrupt has become pending in the meantime.

The longer explanation for what happens:
1. local_irq_disable()
2. Hash fault interrupt fires, do_hash_fault handler runs
3. interrupt_enter_prepare() sets IRQS_ALL_DISABLED
4. interrupt_enter_prepare() sets MSR[EE]=1
5. PMU interrupt fires, masked handler runs
6. Masked handler marks PMI pending
7. Masked handler returns with PACA_IRQ_HARD_DIS set, MSR[EE]=0
8. do_hash_fault interrupt return handler runs
9. interrupt_exit_kernel_prepare() clears PACA_IRQ_HARD_DIS
10. interrupt returns with MSR[EE]=1
11. PMU interrupt fires, perf handler runs

Fixes: 4423eb5ae32e ("powerpc/64/interrupt: make normal synchronous interrupts enable MSR[EE] if possible")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c    | 10 ---------
 arch/powerpc/kernel/interrupt_64.S | 34 +++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 0e75cb03244a..f9db0a172401 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -431,16 +431,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
 		if (unlikely(stack_store))
 			__hard_EE_RI_disable();
-		/*
-		 * Returning to a kernel context with local irqs disabled.
-		 * Here, if EE was enabled in the interrupted context, enable
-		 * it on return as well. A problem exists here where a soft
-		 * masked interrupt may have cleared MSR[EE] and set HARD_DIS
-		 * here, and it will still exist on return to the caller. This
-		 * will be resolved by the masked interrupt firing again.
-		 */
-		if (regs->msr & MSR_EE)
-			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
 #endif /* CONFIG_PPC64 */
 	}
 
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index ce25b28cf418..d76376ce7291 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -559,15 +559,43 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	ld	r11,SOFTE(r1)
 	cmpwi	r11,IRQS_ENABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bne	1f
+	beq	.Linterrupt_return_\srr\()_soft_enabled
+
+	/*
+	 * Returning to soft-disabled context.
+	 * Check if a MUST_HARD_MASK interrupt has become pending, in which
+	 * case we need to disable MSR[EE] in the return context.
+	 */
+	ld	r12,_MSR(r1)
+	andi.	r10,r12,MSR_EE
+	beq	.Lfast_kernel_interrupt_return_\srr\() // EE already disabled
+	lbz	r11,PACAIRQHAPPENED(r13)
+	andi.	r10,r11,PACA_IRQ_MUST_HARD_MASK
+	beq	1f // No HARD_MASK pending
+
+	/* Must clear MSR_EE from _MSR */
+#ifdef CONFIG_PPC_BOOK3S
+	li	r10,0
+	/* Clear valid before changing _MSR */
+	.ifc \srr,srr
+	stb	r10,PACASRR_VALID(r13)
+	.else
+	stb	r10,PACAHSRR_VALID(r13)
+	.endif
+#endif
+	xori	r12,r12,MSR_EE
+	std	r12,_MSR(r1)
+	b	.Lfast_kernel_interrupt_return_\srr\()
+
+.Linterrupt_return_\srr\()_soft_enabled:
 #ifdef CONFIG_PPC_BOOK3S
 	lbz	r11,PACAIRQHAPPENED(r13)
 	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
 	bne-	interrupt_return_\srr\()_kernel_restart
 #endif
-	li	r11,0
-	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
 1:
+	li	r11,0
+	stb	r11,PACAIRQHAPPENED(r13) // clear the possible HARD_DIS
 
 .Lfast_kernel_interrupt_return_\srr\():
 	cmpdi	cr1,r3,0
-- 
2.37.2


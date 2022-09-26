Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C035E98EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWty02Lfz3f1c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9rROWA7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9rROWA7;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrT51wMz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:21 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so5687721pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3jB4Ii7xaomyhGENhnU8c09sqglMkNd9vUaTObmjEbw=;
        b=i9rROWA7MQSRV9lfc+HRWsTPufV6e+ohsffrhtXluiFCb1pqLQNbNAIOxnJjhrbkqj
         ZjKNzarrY+a6tgin2Lmpg8ENv8i5K0BCD5acCKJQkVUte+0rQ1r4swCOQ94eI3E91GdR
         9PRT8TilGwkhxMfXwY2sTzCg33mxWgZrvQpbQ7XXqiSPA4Vduo9R3SL1BmV/tUnBnJiH
         /h0Nuno6K0gIBw/Xo0lvGy+FQcfuD9e3ITHQpF3czwejk7mZlFB83trGzect9orn4AIn
         ZV62wgUeWpOdoacC/kT9qELJfNK/iYe7QCgZ3muRTeqaBD1vLhW55v5LT5gZJ05t+i92
         cCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3jB4Ii7xaomyhGENhnU8c09sqglMkNd9vUaTObmjEbw=;
        b=KY7FheW9SQ1iv19ZYWB0bzPm+ZamDJ4iB9tOs+5ipKTStGeooSBGENnjPnyhFs2w94
         w0IllYTgjGgJ+ue2qwkrtK1S3nmqIBtkaJU4e7zoHBjQ0mKIGaCR1zWeUZKuCkgp2u0j
         DGvaC2o2Jy+SIy06cyc4PEKP3J9HqrJOHHUDeXrJ58daeLcjWe/unWjWGmhO1j5HLsOn
         bFTCqFNCSR+XJilhsyglzS5ayEO53wjezaEIUjC1pCei14veRLOqzIU5wRjB3NUaey0y
         gfNd1T13w6qkbiB8zEFED8fZYCQZWxgx1G9Ven/Oon2nnNc8KqVE68+ofdeWvttS889B
         eyTw==
X-Gm-Message-State: ACrzQf0u7iA/j0lEGJ89xWV4xW8Zv8IvxVtosUemht1aOF0ysdA1hItF
	YVdnAsxRpMO/GHAegbMfua3oG144eiRADA==
X-Google-Smtp-Source: AMsMyM4fmtELTs83PyV7uNFaHb9OBylupw+KzCIdPyMmkRownvCL77uNmO2rzbB4KEmniFE+wVpDLQ==
X-Received: by 2002:a17:902:e54e:b0:178:5371:5199 with SMTP id n14-20020a170902e54e00b0017853715199mr20620773plf.59.1664170998779;
        Sun, 25 Sep 2022 22:43:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/7] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
Date: Mon, 26 Sep 2022 15:43:01 +1000
Message-Id: <20220926054305.2671436-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750314D0200
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 15:52:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC1fB2L1cz3bVN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 01:52:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WBBws3Sk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WBBws3Sk; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC1dT2nGLz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 01:52:12 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id t14so13764230pgr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 06:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJOT0vE1j2mh04bzB9QDu5Ad05NvoUhX8Yc1oWb+20I=;
 b=WBBws3Sk0Ajgnro1oUWlvSgwFFdI0IpbGoP6d7lUMfHdGo8DNqNMW5tgk8LQNRr1Wl
 TLkiYTYEeB/7+FOewf9dEH/PnmC8gerPKLU1zuGO3UnhDa3jUlH+Gd/Me8ipvkJwzsRx
 1WlPB1rpiQA2vdC2LY28BbCKx6PzntgH8pzBHf6IQACS8CYDQz3pV34snk+G9IPzVTcc
 WZAqX8q7ksz4o4e6Cl0rIKOXQ3OobcVjFhuiNGkgpFcEcC7ckGFQu/b2VUTBysjy7QIB
 lraYy+2w5zFW5TlEdN6FfoMRSWY5+/w7G5Ce/6Rz1jqWIcngVrTPWHTbzACVRIiFbtly
 MBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJOT0vE1j2mh04bzB9QDu5Ad05NvoUhX8Yc1oWb+20I=;
 b=EYucfPPTcFe9Syfq3Nq/jjP1R8t2hNjn1v0QXLvOB4Nwh1yomhmj5IdG4+WZEwEM7Y
 eHHRiPmmwljvDLdFsd9AgwN7EpKNnavjKiS1i9ORo1PFNbs/zfEKj+odW/5579wnXfVs
 za3pHL+lQI8gWXMXQ6roe9WGJx2fCQieGVKs1bC2GsUBboOp6MmRtml0doHw089/iHy7
 qfWV9XwGERfKWOjafPTKDasyuMPBk6Y4R4P4+ZlqKhedtahhHHvGRV80fuydFzXNppcq
 nESd6PCe7ZnsOtGFWz5laM6o7LYoBEbkNyyW62tns0thK/MNaEIRH0ZORXfS/ehhJZnD
 oSEg==
X-Gm-Message-State: AOAM533mlzApM4HBme+LkaEM7bjsi3qXKMtZ+hDFiwCF7qRunR4HKSJg
 g8O/t2Cf9NVS1sW0RbAK/vZ4rMd5+WM=
X-Google-Smtp-Source: ABdhPJwPaO1dB4XSLd0QkjUeel8rDM8D/9Usu6rPCZHW9NoJP/JMBgKNN+zRrXxBg/zktPSBnePyGg==
X-Received: by 2002:a62:7a07:0:b0:4f6:d0a2:fe1b with SMTP id
 v7-20020a627a07000000b004f6d0a2fe1bmr13200689pfc.84.1646664726357; 
 Mon, 07 Mar 2022 06:52:06 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm16581836pfh.84.2022.03.07.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 06:52:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64/interrupt: Fix return to masked context after
 hard-mask irq becomes pending
Date: Tue,  8 Mar 2022 00:51:59 +1000
Message-Id: <20220307145159.166519-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a synchronous interrupt[1] is taken in a local_irq_disable() region
which has MSR[EE]=1, the interrupt handler will enable MSR[EE] as part
of enabling MSR[RI], for peformance and profiling reasons.

[1] Typically a hash fault, but in error cases this could be a page
    fault or facility unavailable as well.

If an asynchronous interrupt hits here and its masked handler requires
MSR[EE] to be cleared (it is a PACA_IRQ_MUST_HARD_MASK interrupt), then
MSR[EE] must remain disabled until that pending interrupt is replayed.
The problem is that the MSR of the original context has MSR[EE]=1, so
returning directly to that causes MSR[EE] to be enabled while the
interrupt is still pending.

This issue was hacked around in the interrupt return code by just
clearing the hard mask to avoid a warning, and taking the masked
interrupt again immediately in the return context, which would disable
MSR[EE]. However in the case of a pending PMI, it is possible that it is
not maked in the calling context so the full handler will be run while
there is a PMI pending, and this confuses the perf code and causes
warnings with its PMI pending management.

Fix this by removing the hack, and adjusting the return MSR if it has
MSR[EE]=1 and there is a PACA_IRQ_MUST_HARD_MASK interrupt pending.

Fixes: 4423eb5ae32e ("powerpc/64/interrupt: make normal synchronous interrupts enable MSR[EE] if possible")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c    | 10 ---------
 arch/powerpc/kernel/interrupt_64.S | 34 +++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 7cd6ce3ec423..819d42c0ce9f 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -593,16 +593,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 
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
index 7bab2d7de372..2641bbcb6e49 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -569,15 +569,43 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
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
2.23.0


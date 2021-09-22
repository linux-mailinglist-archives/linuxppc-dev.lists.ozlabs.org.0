Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72420414C81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1Zc2H45z3c55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N5g60BQr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N5g60BQr; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YL0fSFz2xfG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:01 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id g184so2935652pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Tcv+/UGWuPCmKnbG12HWWhSzxtEDefY9Tw8AjNn/x8=;
 b=N5g60BQr2zB3QRf5ATrYPyF1tW9tPGXBnEG7AQ7X2EP1iu4i6A1YZBCs4KWzwaeicz
 9zKSoXdIRc2q/AMJ2ALLCZosB0Te+37gLyO3TRZxz24Iof7WvbdCJY6N+XybnBqX9N2V
 YtifLqNDgz7CrBV0TF7qetoLKGTeoZo4kOHUQHQ59TuhfAMksmvpcylkzM6Cqitc6Lts
 scCTZxVAzWIkoOl7DGRukDgNE0pWp87uw14nDrCZbnXM5JiLiapV1H8n58k1Cl54ylr7
 aFovezPBaKq60Fj95lPRrT2DOH/QCc1NKRuucuTHMZl4wZgfNgaYZPPuvzZr3gLLCwns
 TV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Tcv+/UGWuPCmKnbG12HWWhSzxtEDefY9Tw8AjNn/x8=;
 b=KF44TeytOcTgR9kNu7NOpn+47uhoPvtkLCzqMpxaccqR86x4GfP+rug650aADShj7i
 WDraRpVqO3QTc5q5AMzbKYGxc2TzOeeEs3ekenAfyfCevslj7WDgQn6mO7c4QrnOnnwN
 57a8mxBIei7I+Ixa3/iGTk81jYcx40QqEkIq/uR1W5scfpKjCjewXRmkJSRPnDJwOky7
 2Vq/YYqdIxVLnsWI2LZLHA8ziOxqEX0YrizZgXOp9uwQa+xxt5oH5VYu/jxxyLWOSDiq
 3CyaJ8249GskZqkuQPynhh2/Ki5eTl/HB1ugzMiCP/R4Gr6wWIleILLN6JXVR1zHKG1N
 h2LQ==
X-Gm-Message-State: AOAM531yVOY3kDg8y0TxM0/craAQNZ1L8OJGIT/X106xKyspgR3zNw0t
 hhDFvk89dD+kt64ykQYkdhhv9RWA//A=
X-Google-Smtp-Source: ABdhPJzEXzgkqQYX/9L5Wd4WN3/axwO7k2l4TzZVZVxiv9ZC4qByKNi+H4gpBRu+lp3s4lIKU1gLAw==
X-Received: by 2002:a63:904c:: with SMTP id a73mr85871pge.134.1632322499442;
 Wed, 22 Sep 2021 07:54:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:54:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc/64/interrupt: make normal synchronous
 interrupts enable MSR[EE] if possible
Date: Thu, 23 Sep 2021 00:54:47 +1000
Message-Id: <20210922145452.352571-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
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

Make synchronous interrupt handler entry wrappers enable MSR[EE] if
MSR[EE] was enabled in the interrupted context. IRQs are soft-disabled
at this point so there is no change to high level code, but it's a
masked interrupt could fire.

This is a performance disadvantage for interrupts which do not later
call interrupt_cond_local_irq_enable(), because an an additional mtmsrd
or wrtee instruction is executed. However the important synchronous
interrupts (e.g., page fault) do enable interrupts, so the performance
disadvantage is mostly avoided.

In the next patch, MSR[RI] enabling can be combined with MSR[EE]
enabling, which mitigates the performance drop for the former and gives
a performance advanage for the latter interrupts, on 64s machines. 64e
is coming along for the ride for now to avoid divergences with 64s in
this tricky code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b76ab848aa0d..3802390d8eea 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -150,7 +150,20 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #ifdef CONFIG_PPC64
 	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
 		trace_hardirqs_off();
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	/*
+	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
+	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
+	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
+	 * soft-masked. The interrupt handler may later call
+	 * interrupt_cond_local_irq_enable() to achieve a regular process
+	 * context.
+	 */
+	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+			BUG_ON(!(regs->msr & MSR_EE));
+		__hard_irq_enable();
+	}
 
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
@@ -200,6 +213,10 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC64
+	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_CTRL) &&
 	    !test_thread_local_flags(_TLF_RUNLATCH))
-- 
2.23.0


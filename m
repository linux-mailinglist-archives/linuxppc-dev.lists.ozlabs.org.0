Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E967658A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 10:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzX0X2lZpz3fLY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 20:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NkxsNtil;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NkxsNtil;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzWyc5Mttz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 20:58:16 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id bj3so7790190pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 01:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e22GCLIjL67ksxsjWqhabq7PNyIfEI5Gwj67Xk1k9kg=;
        b=NkxsNtilhow+roQ5PI/zro+vryu9FFkMLb5Z0Nlasz3SODNzOoMX40xVpQS6mwZh7g
         3aeSnTRVvaxrJjjp/YvGTzUdZzo1IO9fYoqx1mzFm1DCS968pvSowwN5rFe8Oa/gfJqQ
         WLZpAD6D/JPl6ifBWNVGERQ1vN9inB/44d7AsHd6H1NtE3ip120kT06wyp3RxGr8zSVA
         H2tXU7TI/tZtGrGCbx0nzVIaQ5CiUqhhdv+eQVaXCgRmjVPJhoN8R9ettYmxOOTRqFFs
         r8O+6uGdEY3TjEXgD/KPUAP+Y9pseI7ltKs/zwu2X5ysfWBQULnEO+IzMWiVqq+5thwk
         QogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e22GCLIjL67ksxsjWqhabq7PNyIfEI5Gwj67Xk1k9kg=;
        b=j8nGBE0gK7bnakM6x5DsOttC17hB9yR+fkxIBpaZ+ZIx7KdE/tj+qW+I9SAFDRtiBH
         4uSvP8wTCogWY5AEoIQq6cD4MBR6DsPqOXy9/MBkfgxON5skzizHDtp759o7kw9pAy1s
         E2Z9c7BT2/n0GPF8ZJUKTJwp1Rp+nsbp2FVOJKMibyS22tVu4aqG8iWeWBTWHYdFjw8s
         8VKUFTDHSGduuq1O0STAKvtz+MLKEb0Aa9K3n0THv8Bi55K5eCAjwlRI5zWctO1bIN6e
         3H1N/u+Z7SgxnDgrvpFaHj7T8slRKjwktHnzvaSpFEzQoIBQkM4fVya4YooE7HRxYUs/
         9vfg==
X-Gm-Message-State: AFqh2ko4qTBCHbeCZF3zj5DP6bTAA9Rdsp5gKnUkEIvH1/aMAMpU6brF
	IxQD7Z3hD4EXgf3dpI435ecP7nu/oqU=
X-Google-Smtp-Source: AMrXdXusKSIfe6DRdDncIj0QKwH8Ab+1GaQ9NB1ABiiEWqZI7Qp78iVYNg1TAL2Tka9/nTwN7YkpLg==
X-Received: by 2002:a05:6a20:60d5:b0:af:7939:5fed with SMTP id q21-20020a056a2060d500b000af79395fedmr15546222pza.43.1674295093890;
        Sat, 21 Jan 2023 01:58:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id r33-20020a635161000000b0046f56534d9fsm23733539pgl.21.2023.01.21.01.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:58:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc: Consolidate 32-bit and 64-bit interrupt_enter_prepare
Date: Sat, 21 Jan 2023 19:58:03 +1000
Message-Id: <20230121095805.2823731-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230121095805.2823731-1-npiggin@gmail.com>
References: <20230121095805.2823731-1-npiggin@gmail.com>
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

There are two separeate implementations for 32-bit and 64-bit which
mostly do the same thing. Consolidating on one implementation ends
up being smaller and simpler, there is just irq soft-mask reconcile
that is specific to 64-bit.

There should be no real functional change with this patch, but it
does make the context tracking calls necessary for 32-bit to support
context tracking.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 35 +++++++---------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6d8492b6e2b8..a4196ab1d016 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -74,17 +74,18 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
 /*
  * WARN/BUG is handled with a program interrupt so minimise checks here to
  * avoid recursion and maximise the chance of getting the first oops handled.
  */
 #define INT_SOFT_MASK_BUG_ON(regs, cond)				\
 do {									\
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) &&		\
-	    (user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
+	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
 		BUG_ON(cond);						\
 } while (0)
+#else
+#define INT_SOFT_MASK_BUG_ON(regs, cond)
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -151,28 +152,8 @@ static inline void booke_restore_dbcr0(void)
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
-#ifdef CONFIG_PPC32
-	if (!arch_irq_disabled_regs(regs))
-		trace_hardirqs_off();
-
-	if (user_mode(regs))
-		kuap_lock();
-	else
-		kuap_save_and_lock(regs);
-
-	if (user_mode(regs))
-		account_cpu_user_entry();
-#endif
-
 #ifdef CONFIG_PPC64
-	bool trace_enable = false;
-
-	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
-		if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
-			trace_enable = true;
-	} else {
-		irq_soft_mask_set(IRQS_ALL_DISABLED);
-	}
+	irq_soft_mask_set(IRQS_ALL_DISABLED);
 
 	/*
 	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
@@ -188,9 +169,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	} else {
 		__hard_RI_enable();
 	}
+	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
+#endif
 
-	/* Do this when RI=1 because it can cause SLB faults */
-	if (trace_enable)
+	if (!arch_irq_disabled_regs(regs))
 		trace_hardirqs_off();
 
 	if (user_mode(regs)) {
@@ -215,7 +197,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	}
 	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
 				   !(regs->msr & MSR_EE));
-#endif
 
 	booke_restore_dbcr0();
 }
-- 
2.37.2


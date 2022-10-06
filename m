Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BDC5F6989
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjtxd25wsz3cfN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:24:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jf9rYpvC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jf9rYpvC;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjtvk2XZtz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:23:14 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id n7so1884772plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=46iETqQEMVejMlKlSid1ygzensoLPvNCwYvaqH5zX8A=;
        b=Jf9rYpvCiBytUpogcZd/9KZ7Qx+rzd9Wi2VnytmixqSzIYuVGIuc+RvlYHOC9NAwgU
         PSsDmagSd555ZhDgO0UKE3kh0GDL3doZzCQCy28LEKzXsMzeTWUD+kQSSpOwKhBDuB6R
         0bbMxJwC3NNk8vYX1vZd8ymvisn0V5mCdFFxjBVXYBX0W41mWTVGB5ZkISKIF73C1Dlt
         LiEAjpnaMX5A9XjSomrk98GmFH3zDqUb3KL9yCtj0DWd2gHg3hRV6Fz68KnnNtf0RMFo
         WWsHVNSWrEb9lo7QGdIJhCP2RZapPm/uUjXl9vinSX/GfBUjjHAPiP2gf2hof1GaFXQk
         r+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=46iETqQEMVejMlKlSid1ygzensoLPvNCwYvaqH5zX8A=;
        b=GT7mfz2F14JKQWif37j+0Cz4jKlOSvuocA4i4DOPpLfdQmmVGFJjPYjnI4PSUN1vVi
         pA/C52RgeDcQrnVlh85GlVxoMF1wgtaTQhuRysLnrUxQfXEQqZqEYJgwN6/+KlCItZim
         mROQJmkTLvmt3vjN4Rv6fkiukTGWGIZTKGd/UD7IjEYuiEmIwYdtOdMbCv9J3VyL1SdA
         rfhrAOpkN118w7DvoCvYMX4t+jXnwNudo9zuBIaqJ3+Nozzx3AJQvre0dY/37CsL5C3y
         c2z1PO+K+dZVfV45UVgfiP/NtmyAyRRrwPCOl956fWFuUnGTTvkU8qSg8LaaUPXJbFIx
         jShw==
X-Gm-Message-State: ACrzQf27dHCR60lHDGx3nRPGmW0vQjz1jCJg3SXOvkVg+Yz5gCQPsZuR
	ENDsvKFGnzJRMSa9xPPlPIZruTMiRo8=
X-Google-Smtp-Source: AMsMyM5f/QyryrKnzEpCM9xxqRxFYqDQ3DA3lOie7sxuJdCv1ouoFwzy1f6vjbxxjDop9EHOTDwIeA==
X-Received: by 2002:a17:902:8542:b0:179:eb8d:f41d with SMTP id d2-20020a170902854200b00179eb8df41dmr4834553plo.62.1665066190612;
        Thu, 06 Oct 2022 07:23:10 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902c40600b0017f8094a52asm3004784plk.29.2022.10.06.07.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:23:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
Date: Fri,  7 Oct 2022 00:22:59 +1000
Message-Id: <20221006142300.128189-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006142300.128189-1-npiggin@gmail.com>
References: <20221006142300.128189-1-npiggin@gmail.com>
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

Context tracking involves tracking user, kernel, guest switches. This
enables existing context tracking code for interrupt entry on 32-bit.
interrupt exit already has context tracking calls, and KVM can not be
selected if CONTEXT_TRACKING_USER=y.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                 |  2 +-
 arch/powerpc/include/asm/interrupt.h | 35 +++++++---------------------
 2 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 81c9f895d690..f667279ec74c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -204,7 +204,7 @@ config PPC
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
-	select HAVE_CONTEXT_TRACKING_USER		if PPC64
+	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4745bb9998bd..f88a145fb61a 100644
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


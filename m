Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A815E98F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:47:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWx44zx3z3fC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:47:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sd/FMCoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sd/FMCoT;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrb6hCMz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:27 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id s90-20020a17090a2f6300b00203a685a1aaso5696916pjd.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nZy4uxEt5h7DKz5jIhv2KcDDKz2QLaUO1KgGLJtUmsg=;
        b=Sd/FMCoT9ojX59SYhGCwnk94Gcy/jAw4o+m8O3Q8XLbayhJwAqevHJLYZkxMCxPFr6
         F8ydIzd1T0uy7jBhRxoMPM51EH8xKAePN52kfUzBXmuKXMX/e7mlFgNJkRuq3XiXGusO
         FHFqk17tjD+VfJBahVrwKwKFdSNJtaBpkVOInSwO6K+bkRunpFhqq9qxnGSs64A4X9xn
         RrpmXCrtEULjB2s1WVGffRk0AAplNhSu3Jp+hwBY+OBkUbIa5eWbnW7oJb/gi76xHMTt
         2/pXfnW3Qc8CDcD7hs/uyCoSr4/LoCk2diCfa+E6VsP8B1IsxEwrJrbVtxuM+HL/MLYE
         v9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nZy4uxEt5h7DKz5jIhv2KcDDKz2QLaUO1KgGLJtUmsg=;
        b=n1pjYededeZMiduOkkB0i7b+jBjV+7lKaBpz8UpaABDmJa1Zd9jxOVoMJFHkr9zetj
         7CzP2w22bGIsIndJjxUiFJGGlvFVBX38et2xjrzDCiPbUha8bueMPLBoX8UP0ESmYsO9
         Jv1bBxNHUzB6uvFo/jZjAvGFb96jFslEpNnzUyvYKe32/nPKdVw/JCQgsP5SEX98KM3I
         9VjrOqa1hyyUgeKNmLcUZQd0Sp67S+/fPgJ0KM0m4+U6jfKHdK2S8yYaDlVIXBBM1b0X
         p/naD1mI+Bh7Gv8+I4z3AcDN3mqtH+d/dOTSmUKCj5EbjZMF1nw5lJVcXtw0+pdlDo78
         y2Mg==
X-Gm-Message-State: ACrzQf1mfU1MO0CF9KrdL470CvhqNLmJPrjdVLAkozOu7jG+CoyV1d09
	Wm5uUz1WJCjgOf4c5knC5F+yLiudiE2Y2w==
X-Google-Smtp-Source: AMsMyM5H8hB2yDCTpktOWNvdES5sKRKHzPyPBJ8lpijpj3C36URsp+VJ2VXG0HKX9zYihNMWb+wEKw==
X-Received: by 2002:a17:90b:3b81:b0:202:597a:c71d with SMTP id pc1-20020a17090b3b8100b00202597ac71dmr34167368pjb.105.1664171005696;
        Sun, 25 Sep 2022 22:43:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/7] powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
Date: Mon, 26 Sep 2022 15:43:04 +1000
Message-Id: <20220926054305.2671436-7-npiggin@gmail.com>
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

BUG/WARN are handled with a program interrupt which can turn into an
infinite recursion when there are bugs in interrupt handler entry
(which can be irritated by bugs in other parts of the code).

There is one feeble attempt to avoid this recursion, but it misses
several cases. Make a tidier macro for this and switch most bugs in
the interrupt entry wrapper over to use it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index b61555e30c7c..7f3180047115 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -74,6 +74,19 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
 
+#ifdef CONFIG_PPC64
+/*
+ * WARN/BUG is handled with a program interrupt so minimise checks here to
+ * avoid recursion and maximise the chance of getting the first oops handled.
+ */
+#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
+do {									\
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) &&		\
+	    (user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
+		BUG_ON(cond);						\
+} while (0)
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64
 extern char __end_soft_masked[];
 bool search_kernel_soft_mask_table(unsigned long addr);
@@ -170,8 +183,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	 * context.
 	 */
 	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-			BUG_ON(!(regs->msr & MSR_EE));
+		INT_SOFT_MASK_BUG_ON(regs, !(regs->msr & MSR_EE));
 		__hard_irq_enable();
 	} else {
 		__hard_RI_enable();
@@ -194,20 +206,15 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != INTERRUPT_PROGRAM) {
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL &&
 				   ct_state() != CONTEXT_IDLE);
-			if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-				BUG_ON(is_implicit_soft_masked(regs));
-		}
-
-		/* Move this under a debugging check */
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) &&
-				arch_irq_disabled_regs(regs))
-			BUG_ON(search_kernel_restart_table(regs->nip));
+		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
+		INT_SOFT_MASK_BUG_ON(regs, arch_irq_disabled_regs(regs) &&
+					   search_kernel_restart_table(regs->nip));
 	}
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
+	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
+				   !(regs->msr & MSR_EE));
 #endif
 
 	booke_restore_dbcr0();
-- 
2.37.2


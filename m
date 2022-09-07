Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE65B0390
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:05:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN1Cn0wdQz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:05:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G5GFi42b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G5GFi42b;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1BV4Cfpz2yXH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 22:04:01 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id jm11so14245958plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ktsDWPCfLlv0FYYkSkC9Ska5NNqZHoUp+WMlZM1IXN0=;
        b=G5GFi42b0No7SukN79Gx76pW2DaWA8XN4yPwupoetJUMoUr5U2HvRPgcxjU/Pc/To5
         FkJedaUWgn8iTgoDrLkAQlG30kuJc8addkNtzZQuKTA879gRhVaiLJMz3Liqeojts2bw
         5m/L2RqqafY9MA0zVSXJPpjbrtj1zlm9nqhwM2ycPPFXfrkJkbQ2dGJ68g+qG1wgTuwx
         1L/jVFFzYm72X+r6Ug3MQ0Z40ErHyENIETYisEKVkuLOPA986qxvdnuiAnjt3NQlbGKr
         SYwPT8U2krRpY39oj2iedM+oJBF6ZW0rWW1EcpZU6TEh+z/BTLZGJga6uOFH7e9Od/yE
         5G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ktsDWPCfLlv0FYYkSkC9Ska5NNqZHoUp+WMlZM1IXN0=;
        b=DWDt0khaEMmDOH2a3lRxou/ywE1Al24T6enALDnthmCDwuNfW+Euu6W37jui4Ba+28
         i5YWkYUcI7CQHF0uT7XuwiRGlKk8jC5Y7Zq/vvEhdY5kA0h8wBxWL8DYFtdZzPVKRl4R
         M1USFwTMqwefita5ON+RP+RigLA1bp/w/ZZx/GGi/TrdnUZQUGQfWO3PAwF1yULnVaIp
         a+ZdYSUYPEAVclT1Ig62yvWmHRUkYubxdm6V4VBVpU7DBHWbMzMItbG3k625MCJu6ZA7
         9hnE4x7wZyXLv7P4J4zYOIh+slDQaZ02ilNsNmMhLL2Q4SW3+/hzYN0wzD+bSJ8TD5VM
         PPqw==
X-Gm-Message-State: ACgBeo0dED47OwLYCqpzfzBIGg02MBlbRAkPWOfQdYfjhXXBQsymmw3r
	LxG9dCByowCUtzjTkq3D0o6IDE0QfV0=
X-Google-Smtp-Source: AA6agR5sncprO5nS4OX9MpFkIEG9m8YQzMg9LiofQfidrbUbd8D5Axiz3Y7s7f1Cw5FUsYVo4rMBbA==
X-Received: by 2002:a17:902:e405:b0:176:8bc1:b09c with SMTP id m5-20020a170902e40500b001768bc1b09cmr3274381ple.1.1662552236746;
        Wed, 07 Sep 2022 05:03:56 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090acf0a00b0020061f4c907sm6320212pju.7.2022.09.07.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 05:03:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
Date: Wed,  7 Sep 2022 22:03:46 +1000
Message-Id: <20220907120347.3684283-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907120347.3684283-1-npiggin@gmail.com>
References: <20220907120347.3684283-1-npiggin@gmail.com>
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
index 8069dbc4b8d1..690ca27d8dd1 100644
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
@@ -194,19 +206,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 		 * CT_WARN_ON comes here via program_check_exception,
 		 * so avoid recursion.
 		 */
-		if (TRAP(regs) != INTERRUPT_PROGRAM) {
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
 			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16F5F3CCA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 08:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhScR6V83z3bNj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 17:35:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E+k6oED2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E+k6oED2;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhSZV466Lz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 17:33:22 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q9so11895945pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 23:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZvcMhQpEZO9ee2aRch+2vlMv6P4c3RHu4CJhPHMSUzo=;
        b=E+k6oED2rM2GQxsyClMWAkVjxdNWQn+fJKYOY2EFEeChfXXJ/T/sBt+kxPa2ctZJz8
         NjJ64rQKzS9yhW1M05Q3Pv2n3s3Si/LAGG5tQZ5b8jzA179Ie4raQkLEVIhQqropXYN2
         OWWCXLp8Wu0O6vJGeaw89+QwsRc+rd6Iil2pr+/Nl/GNig/G01d+PZ2iSZ92rIuqeVyw
         uyojTPp5kSbqkoKWBMDrkDMW9jJ/tWZsk3l5gWRSAYlS14JmKHEb4fjb35NSbXhY3n5n
         GYbSS22fCRzsJn679RnvMNgXdBeThrv3OA5l7WJbFxP7HAjKLBr0bj4IaoAywGkhlh7/
         GQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZvcMhQpEZO9ee2aRch+2vlMv6P4c3RHu4CJhPHMSUzo=;
        b=vEcyGI9l0btGLlvzZzcqeuRqS3jcIovTdhdSGEnbDlc+Uc3w79cN9q5D6KlPreqxlb
         pNiKthgI4//dOArcAvm8AJ8CaoLiz9moji0XT+bbbX38Ll++eoAYDx7wpeYgqm9W3g/n
         Z0FTQT6pBDWdlZv2bYvjhFSa+uNRNKeOpvs/oFUcworC0PAyJ5ZbW1naUJiipMfFp4Ap
         rbj4fOsudCQW53XBGSR3Fv6kinTxwXFvAzyv8vTehPPQB9eV3AC4zmhRkZ98o0B6XCIA
         U6BCHEi3tDtNwpiZGWtwOXAYlB8y8Zud1Q6ElQnwJr+//h4PJJZVwrESg8WbTmuBRl6d
         0Qgw==
X-Gm-Message-State: ACrzQf2uz5CAkgfXlrEl4/HXFYMWMawXMZGs5BChWbB0uPJbeozfCguX
	omNxeTcMtotrJpHkTBNVrvB73/PF2Xc=
X-Google-Smtp-Source: AMsMyM53jBr5anE4bYo6urBjBdwABP6uyf+JXgQveX/M9jXznbeKKyd0qpXnIAPMum6b+kvpiLLtgA==
X-Received: by 2002:a62:190e:0:b0:561:a818:41bb with SMTP id 14-20020a62190e000000b00561a81841bbmr4945736pfz.50.1664865199882;
        Mon, 03 Oct 2022 23:33:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id s17-20020aa78bd1000000b0056160437e88sm3701782pfd.20.2022.10.03.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:33:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/3] powerpc/32: Implement HAVE_CONTEXT_TRACKING_USER support
Date: Tue,  4 Oct 2022 16:33:04 +1000
Message-Id: <20221004063306.511154-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221004063306.511154-1-npiggin@gmail.com>
References: <20221004063306.511154-1-npiggin@gmail.com>
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
KVM and interrupt exit already has context tracking calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                 |  2 +-
 arch/powerpc/include/asm/interrupt.h | 21 ++++++---------------
 2 files changed, 7 insertions(+), 16 deletions(-)

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
index 4745bb9998bd..8860a246d51a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -85,6 +85,8 @@ do {									\
 	    (user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
 		BUG_ON(cond);						\
 } while (0)
+#else
+#define INT_SOFT_MASK_BUG_ON(regs, cond)
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -152,19 +154,8 @@ static inline void booke_restore_dbcr0(void)
 static inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC32
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
-#ifdef CONFIG_PPC64
+	bool trace_enable = !arch_irq_disabled_regs(regs);
+#else
 	bool trace_enable = false;
 
 	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
@@ -188,8 +179,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	} else {
 		__hard_RI_enable();
 	}
+	/* Only call trace_hardirqs_off when RI=1, it can cause SLB faults */
+#endif
 
-	/* Do this when RI=1 because it can cause SLB faults */
 	if (trace_enable)
 		trace_hardirqs_off();
 
@@ -215,7 +207,6 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	}
 	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
 				   !(regs->msr & MSR_EE));
-#endif
 
 	booke_restore_dbcr0();
 }
-- 
2.37.2


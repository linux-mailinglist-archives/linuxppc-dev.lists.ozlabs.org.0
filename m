Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8471BD494
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:26:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpS23JpYzDr3R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A3l5BWEM; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpQD1bgSzDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:24:33 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id 7so1998797pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MArBktuFmUqJMSQ+WuCmzWna30vxwiNMUHYwFFzQPN4=;
 b=A3l5BWEMgDY9S8FFAFXXCRVapLjTD0/W3lOo5GvjmdkPGxdnbKozb7ergoXtJq5d3n
 WYeItlO/GEzqHziN0evVD4Aq69vrL/8k71MzIIYMG9tSQJVo/+DerQuvVLtDteleUFAw
 E3yx/tkwoy6UYOoLrZ0+iMZzStxJ/UuF+Ug/cmINZlKcQIlBPWJQmiugqUrGNMTlhYRP
 OAxDr2t2ocObz1tBgrpl0SO+2F1DG9RH9MYsuOq/p8QcYq5vWDEndE04sn9TbW3r55cw
 SxnQjsXV3myJwiaCyI1dz7kugohiciS1gFTeBihJpfPptxHvFMYJV5LsKjY5SX1wF6no
 hijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MArBktuFmUqJMSQ+WuCmzWna30vxwiNMUHYwFFzQPN4=;
 b=XGcvZMKJ++FWdPPHNDBfqeawj4Em1zB4G1qgxePaflzBsHBCYmn4ZN1t7pGdQIGWvZ
 5IO23hU6KSLZ2Y9L2Au7wJwCIAPOyPodC2Kd9+kNEYVai8sjnsSmM7Y586H5R7qXDWCR
 rYua/wLlEBEoqheY2ao3StvhehF3bVoy+LTbnQrw2DnGHe6bo7R8Ns5r/WHft+HsdfEo
 GwJyIoD0gc5WZJDlvHqw6jF92M76oK/xKU7nhfZmLcL73U8C0EBGjapK0yWe87zgV3ks
 XvALfqfrRhNpfBdI386vmMELt26trYspXZqVZw767pvz5cVMkBWoxmsj2TVtRdtxkmUr
 RZMQ==
X-Gm-Message-State: AGi0PuaEwrloCgL3zKxp4jPAzf70mdlDn9HYovVqGeBWej4Q3NNqyJqS
 FRwiW/nG3eqHE3XNUURPFwVsLjWx
X-Google-Smtp-Source: APiQypL2GUEMBemJHOMkJdyaYQrqPXlPmHkBwuiwLu5DELm/BoGUZpo3u+Sr6xz1KJ7GZtyOXlG2eQ==
X-Received: by 2002:a17:90a:648a:: with SMTP id
 h10mr1292530pjj.69.1588141469434; 
 Tue, 28 Apr 2020 23:24:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id m3sm203411pgt.27.2020.04.28.23.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:24:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: refactor interrupt exit irq disabling sequence
Date: Wed, 29 Apr 2020 16:24:21 +1000
Message-Id: <20200429062421.1675400-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The same complicated sequence for juggling EE, RI, soft mask, and
irq tracing is repeated 3 times, tidy these up into one function.

This differs qiute a bit between sub architectures, so this makes
the ppc32 port cleaner as well.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/syscall_64.c | 58 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index c74295a7765b..8f7e268f3294 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -101,6 +101,31 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	return f(r3, r4, r5, r6, r7, r8);
 }
 
+/*
+ * local irqs must be disabled. Returns false if the caller must re-enable
+ * them, check for new work, and try again.
+ */
+static notrace inline bool prep_irq_for_enabled_exit(void)
+{
+	/* This must be done with RI=1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+	/* This pattern matches prep_irq_for_idle */
+	__hard_EE_RI_disable();
+	if (unlikely(lazy_irq_pending())) {
+		/* Took an interrupt, may have more exit work to do. */
+		__hard_RI_enable();
+		trace_hardirqs_off();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+		return false;
+	}
+	local_paca->irq_happened = 0;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+	return true;
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -184,21 +209,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-	/* This pattern matches prep_irq_for_idle */
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
@@ -262,19 +276,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
-	trace_hardirqs_on();
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
 		local_irq_disable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened = 0;
-	irq_soft_mask_set(IRQS_ENABLED);
 
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
@@ -332,13 +338,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			}
 		}
 
-		trace_hardirqs_on();
-		__hard_EE_RI_disable();
-		if (unlikely(lazy_irq_pending())) {
-			__hard_RI_enable();
-			irq_soft_mask_set(IRQS_ALL_DISABLED);
-			trace_hardirqs_off();
-			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		if (unlikely(!prep_irq_for_enabled_exit())) {
 			/*
 			 * Can't local_irq_restore to replay if we were in
 			 * interrupt context. Must replay directly.
@@ -352,8 +352,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 			/* Took an interrupt, may have more exit work to do. */
 			goto again;
 		}
-		local_paca->irq_happened = 0;
-		irq_soft_mask_set(IRQS_ENABLED);
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
-- 
2.23.0


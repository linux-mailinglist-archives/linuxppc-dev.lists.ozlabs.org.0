Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CB2C6FB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:55:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjvg80l0xzF1DH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a6BVtBxJ; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMS3swVzDsNc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:40 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w202so6962374pff.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOuaFMNUV8Ecub6Ukg61d9g61CMrwF1GuOID9Wy/Qb0=;
 b=a6BVtBxJ8AvO+0+UgD8LTEJMPPD+fgwsC0Q/vX4JxVvnqqvF5TYhxTfJrtUb7y6EUR
 gIVTKZRImsnpVXaz0Sx56/LKyAfxoWfCjuh4DuSME4odDo6Rxo1sEIEqyZcsUtJKBlty
 3+XjFm0UVioIhjcGyfTFB04FLMz/ndoM29h6IjcXps9flmo+1fioChReAJCl63VcdByw
 NqNHJHKn5mAd/jg+LYObTON5R4fVg6ljHAtH5DbyG4SQbyZ/Cg5/6DVCifwBqGVro+cF
 JjzPbpHGotJbk0+HJ1tsLqK70sYkiNN5Yw0wkJ7scELNhZYgUSMa/SKUYrqf1wozYJLk
 dcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOuaFMNUV8Ecub6Ukg61d9g61CMrwF1GuOID9Wy/Qb0=;
 b=dR/A+VUr1gwp51QckO6EjIR9B4FYEwcKRuosOyI/nYeg2G1bA213gcklVLwN8zh6Un
 P6ItDK2U0LQLKiOwM5Dl9aE+4fiy6o2y9bGC/Uco9bXJxIaEBtUU58yPHWufl7UKLX0F
 MUsMn5MWYJX9IC79MKR4da/XScAzWrI3ZoGTBZJPFA6m0ygYyKS6MqUEZmxtce/ebvVQ
 eRuczyvM7qHVAWx65jXlHUrAVULRUGkJsSoPPd0024omC2FUn2YdjV8k7usssbxv6eNj
 syQ7Rr3ijQsWfyQ1HTJxyyqp8Ai+ebVpMxvRngMhzBLzGT+4cdFLCouhiCg6PLoUa9B3
 VI9Q==
X-Gm-Message-State: AOAM532+Jgj0gjLE0E2DwoKT7/++XeC10aaklWzCJml4PbQkLEJp5zFB
 qtkya9SoXvfhaKWnNW9/QkbQSA7ej6c=
X-Google-Smtp-Source: ABdhPJwJsm1yxqYEjk7g4IzU+7LaaibdNO86xRxgC1JZjYWfYIoQ38bgxmZBS9ejkDeHhXjZOShywA==
X-Received: by 2002:a17:90a:df0a:: with SMTP id
 gp10mr3401474pjb.216.1606574497628; 
 Sat, 28 Nov 2020 06:41:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/19] powerpc: add interrupt_cond_local_irq_enable helper
Date: Sun, 29 Nov 2020 00:41:02 +1000
Message-Id: <20201128144114.944000-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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

Simple helper for synchronous interrupt handlers to use to enable
interrupts if they were taken in interrupt-enabled context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  7 +++++++
 arch/powerpc/kernel/traps.c          | 24 +++++++-----------------
 arch/powerpc/mm/fault.c              |  4 +---
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 516b32f5b3cc..2ab0675c27aa 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_INTERRUPT_H
 
 #include <linux/context_tracking.h>
+#include <linux/hardirq.h>
 #include <asm/ftrace.h>
 
 struct interrupt_state {
@@ -268,4 +269,10 @@ DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
 void replay_system_reset(void);
 void replay_soft_interrupts(void);
 
+static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
+{
+	if (!arch_irq_disabled_regs(regs))
+		local_irq_enable();
+}
+
 #endif /* _ASM_POWERPC_INTERRUPT_H */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index e726fe5c384d..8a6cb2838ce6 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -343,8 +343,8 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 
 	show_signal_msg(signr, regs, code, addr);
 
-	if (arch_irqs_disabled() && !arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	if (arch_irqs_disabled())
+		interrupt_cond_local_irq_enable(regs);
 
 	current->thread.trap_nr = code;
 
@@ -1575,9 +1575,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	if (!user_mode(regs))
 		goto sigill;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
 	 * but there seems to be a hardware bug on the 405GP (RevD)
@@ -1631,9 +1629,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	int sig, code, fixed = 0;
 	unsigned long  reason;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	reason = get_reason(regs);
 
@@ -1794,9 +1790,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 		die("Unexpected facility unavailable exception", regs, SIGABRT);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	if (status == FSCR_DSCR_LG) {
 		/*
@@ -2176,9 +2170,7 @@ void SPEFloatingPointException(struct pt_regs *regs)
 	int code = FPE_FLTUNK;
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	flush_spe_to_thread(current);
 
@@ -2225,9 +2217,7 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
 	extern int speround_handler(struct pt_regs *regs);
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	preempt_disable();
 	if (regs->msr & MSR_SPE)
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 93663f7fbe9e..4896f44c8374 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -443,9 +443,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return bad_area_nosemaphore(regs, address);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
-- 
2.23.0


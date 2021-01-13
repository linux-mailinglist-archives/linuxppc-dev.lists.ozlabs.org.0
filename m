Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06E2F4592
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:53:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG06g5LMczDr30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:52:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RatApyzw; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgL5MRZzDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:46 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2so709594pfq.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nW6OPWH8yQ4YrbNp0duyMLqONR8RG8M3438qy9XOWI=;
 b=RatApyzwELI7lv9r+Ods17zE5NTYHlpPHREfedvg77HR88mcTpXODxEGTZw2QP/EoK
 Mp3TaJpd5jewup+TJP/xXo48CW706lsgQzZKqFX3SQdw01+VyJ0p6upoYLKfrDDHQoXx
 3nzKOM3BXB12KKxGF1+CiYYAwzduzHI9H9CMHaTHFOqT9AThj/EAoR5FqUo2Jx92gNRG
 BGIx1/Ue5+iQ9X6dAD3724+k/iGM1BSJGobmJToJ4VLDUTiOymkAi1eT+7COaab9ni7a
 T/XYH+XOVh8eNAUakq9G5uIU7AHu3HGdxgEjSKZoLtdrEUHgqQ87/mlg4nDVtGBnJ9Xc
 P+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nW6OPWH8yQ4YrbNp0duyMLqONR8RG8M3438qy9XOWI=;
 b=eQEWZYL6SD/qlLP3pJV/VPJcLEhudUA26S1/JdQqYuXQiEVbWBAl12ke6l8gz/fwAQ
 gWT5AtG6UFlA57W9uuQujCwnX8iekzZfFLqzdqGNYg5Z/o0T92f1mWbXZekVoGBEzsK0
 M0bmfRKW79Tt/pBHexiSN5g4zktdagPveYCU4oCGQNtHyEgIh7jQKAFQztplaFku+ugU
 nR6h6Y6O29bxrSK977UB93/dMcNFspeHlakPqYUlJpfFPylrCp7tq7CoqByocJrRdYD4
 0o2HduIFLj7Xu+8Je+6cMDsToprOjYwqiDIlOLXAXqHdJfZCRqDfUAh9LCNqmgd1N/p9
 VxRQ==
X-Gm-Message-State: AOAM530+Px8fVspvrTiyUM9BEnZTSUt6AXcxol7ZkRiTy3e0WzKIbnH9
 7eTewZzu36D6Q8jdGl5jNCHV+2dMbjM=
X-Google-Smtp-Source: ABdhPJx3QwCj5+Gu57NUeljXp1S73Cpud84A2OPWd1Np2fIj8LCd3CG1TYpBPCes5kSeqNli98PfkQ==
X-Received: by 2002:a63:1152:: with SMTP id 18mr919295pgr.268.1610523163125;
 Tue, 12 Jan 2021 23:32:43 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 08/21] powerpc: add interrupt_cond_local_irq_enable helper
Date: Wed, 13 Jan 2021 17:32:02 +1000
Message-Id: <20210113073215.516986-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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

Simple helper for synchronous interrupt handlers (i.e., process-context)
to enable interrupts if it was taken in an interrupts-enabled context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  7 +++++++
 arch/powerpc/kernel/traps.c          | 24 +++++++-----------------
 arch/powerpc/mm/fault.c              |  4 +---
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7c72c91c21ce..dfa846ebae43 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_INTERRUPT_H
 
 #include <linux/context_tracking.h>
+#include <linux/hardirq.h>
 #include <asm/ftrace.h>
 
 struct interrupt_state {
@@ -281,4 +282,10 @@ DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
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
index f4462b481248..0b712c40272b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -343,8 +343,8 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 
 	show_signal_msg(signr, regs, code, addr);
 
-	if (arch_irqs_disabled() && !arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	if (arch_irqs_disabled())
+		interrupt_cond_local_irq_enable(regs);
 
 	current->thread.trap_nr = code;
 
@@ -1546,9 +1546,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	if (!user_mode(regs))
 		goto sigill;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
 	 * but there seems to be a hardware bug on the 405GP (RevD)
@@ -1602,9 +1600,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	int sig, code, fixed = 0;
 	unsigned long  reason;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	reason = get_reason(regs);
 
@@ -1765,9 +1761,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 		die("Unexpected facility unavailable exception", regs, SIGABRT);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	if (status == FSCR_DSCR_LG) {
 		/*
@@ -2147,9 +2141,7 @@ void SPEFloatingPointException(struct pt_regs *regs)
 	int code = FPE_FLTUNK;
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	flush_spe_to_thread(current);
 
@@ -2196,9 +2188,7 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
 	extern int speround_handler(struct pt_regs *regs);
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	preempt_disable();
 	if (regs->msr & MSR_SPE)
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 9e1cd74ebb13..e971712c95c6 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -441,9 +441,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return bad_area_nosemaphore(regs, address);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA32F8324
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:58:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTSf6MN6zDspZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sUPboZi8; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzd2gTWzDsMm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:57 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id x12so4979492plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ln73yILkIbrbBkCtyIHl+F1C4HQGbiBytv7yYKmYUmg=;
 b=sUPboZi83wcGs3x3JOI2K87eAPSiPLu3nuA0/Ovo2+Dl1rPMFLIBBdgQS4fge3w/bA
 +MenUTJ5bIL33BlSP3n7cDOWijUnfmufVPg7sAjipzSz+czJ4ublkYCgBu4b+bpR261d
 Kdc+bEe7GpEtR+l8nOYgZrQR6t5DnSxdIIm1/BcBrxivArjuMjmtSSh/kDvWz4L9LEzr
 evehiEUkuK1e6gQeXZaJLzj4C6WWPFHgsTsKhyWInFeNMkVCuueNcH4Yz6Th8d9jAkD5
 gKWGlxta7c7oxF85w8a5plkcplPULr8VYMNbvgCuOUBCIbIYqiIcGiWJo5hzOHqCQAGZ
 SbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ln73yILkIbrbBkCtyIHl+F1C4HQGbiBytv7yYKmYUmg=;
 b=L90aJaaZMzplDZG3VxDn9SKA4rX+OW8cGlo2XIguzKTiqhk88Qhq+ekLNVhnK31gq0
 DCVUlD3s/fauyOboqdjjom0MCHyer0Eh0CcBoZlj7fGLYnGmcaMPrImTuqyJB6AOmpsX
 hVaecL0BEJYEmu+xqADNQsoQPpIIhnef3WKyQT5BUkzqB2rLl05rowd5mDGdcC6nzzeu
 qdkao0Vhvm2sT4EQUYDF+o15FisKbs+ZH96gRnB40D+iqrMQSYxff5+ttyXfoQMuuX72
 DQoY/HwZOydI2gF7rhLCsxS2Tf/5MJSxEJ1/H4S6pKv8uJAl+EPt1CGpvi46+mXh24uy
 kE3Q==
X-Gm-Message-State: AOAM531W9+eRmKWODQ8jI6sLBKlwupymM8jC1u6lvJNdnkfAKFQWCfiz
 h4f/vNeL8DdlBRs0DO+VfBlvHrnR6iM=
X-Google-Smtp-Source: ABdhPJxOtyApE7VUTCFvehIrJIfd1zeBlab7A0l4zoRtORqtJ94I1M0/UcUQit2/AffvohxV0gYyyg==
X-Received: by 2002:a17:90b:3907:: with SMTP id
 ob7mr11580630pjb.18.1610729513931; 
 Fri, 15 Jan 2021 08:51:53 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 26/39] powerpc: add interrupt_cond_local_irq_enable helper
Date: Sat, 16 Jan 2021 02:49:59 +1000
Message-Id: <20210115165012.1260253-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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
index 4ffbd3d75324..488bdd5bd922 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_INTERRUPT_H
 
 #include <linux/context_tracking.h>
+#include <linux/hardirq.h>
 #include <asm/ftrace.h>
 
 struct interrupt_state {
@@ -298,4 +299,10 @@ DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
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
index b000956cde3f..076e5ff75cf7 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -343,8 +343,8 @@ static bool exception_common(int signr, struct pt_regs *regs, int code,
 
 	show_signal_msg(signr, regs, code, addr);
 
-	if (arch_irqs_disabled() && !arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	if (arch_irqs_disabled())
+		interrupt_cond_local_irq_enable(regs);
 
 	current->thread.trap_nr = code;
 
@@ -1556,9 +1556,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	if (!user_mode(regs))
 		goto sigill;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
 	 * but there seems to be a hardware bug on the 405GP (RevD)
@@ -1612,9 +1610,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	int sig, code, fixed = 0;
 	unsigned long  reason;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	reason = get_reason(regs);
 
@@ -1775,9 +1771,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 		die("Unexpected facility unavailable exception", regs, SIGABRT);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	if (status == FSCR_DSCR_LG) {
 		/*
@@ -2160,9 +2154,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointException)
 	int code = FPE_FLTUNK;
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	flush_spe_to_thread(current);
 
@@ -2209,9 +2201,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
 	extern int speround_handler(struct pt_regs *regs);
 	int err;
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	preempt_disable();
 	if (regs->msr & MSR_SPE)
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b84794d53664..eef7281507f9 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -434,9 +434,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return bad_area_nosemaphore(regs, address);
 	}
 
-	/* We restore the interrupt state now */
-	if (!arch_irq_disabled_regs(regs))
-		local_irq_enable();
+	interrupt_cond_local_irq_enable(regs);
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
-- 
2.23.0


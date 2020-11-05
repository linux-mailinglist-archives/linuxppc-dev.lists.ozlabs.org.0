Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A59EF2A81CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:04:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmy14yQxzDr3y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=heKIM4Wx; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJj3LbCzDr0Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:17 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 13so1603594pfy.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9ce/bmEeZx801gL8OLqiX1sQbxeaMQKsoDHK8f59ns=;
 b=heKIM4Wxx2DuiIg2yctIlSkTdTaiS87W/aeVULVzbBM+ZoRx84jbULPC1iyGRsu+d+
 Y9IeVD5sYKMh8WVM/+lcALdjOn34tlBQGs0XG755MB2X2TiwfOe3AdSMbAY3r11dnyLr
 mNXauOucK1Qj5Oh4C+Utgo4xVFNtJcG/4i5IhxZibNOozB1qZwAcfFIisFZFmEQUvgjw
 l7Ep0IwyHMv/aDDUdJVulA9FTds7ykU22WKUR3AVbzbwT7GUlxV2xm8Q6OwGY2MiACkW
 WRYNfhWuCDuvMkTj7Ex9nP3JMrqY7uopWM8LMB4xQmxrQFi2JeEx9JkY8BkQJ9FONl0t
 E9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9ce/bmEeZx801gL8OLqiX1sQbxeaMQKsoDHK8f59ns=;
 b=JhsdTIexbHWlG/aiDf8H5xezXDdSikIaA3JMUY9RJ2GwxxSewEnqoFzmIuHWmcJWjk
 0qNc1b9eBydChJ0j7A9RhKdqY96CSxWZG2HmGAx5Vbv5uZoi+NmMW1dWnEdmV5fC5DFX
 5FogD/K2S0B3hgLJNEtnZBY0qxQXRboZPXAc/fVbl7IXiGnDDKxkU9svLIpiZs3Af0v2
 Amt404y1oyJ0N6FQ+7odUf933YhNPrgg/Si8zPy3XpvtA1xOAcG/aGLl8c7zN84plQhq
 MLoFDWCQ3P/IKV6NIGrv9+UU5sxuQ7EDrL+6bFGooyrDu9VTd1PR4H0+Bu/UACNefif9
 SAsA==
X-Gm-Message-State: AOAM531maTc5+0u+fQpPzKQBWCX9wX2jz5mpGuY4EYMZlQk7hBvtOz4L
 6Rewtf8vXeKsxI/s2EHi9ldW67VClJuF3Q==
X-Google-Smtp-Source: ABdhPJwZVp3toNouxXVJwSY1qXau3xjudPOZJGqoZ5IYqrqC0RG9siIFqw/Wu3FWcLBn54sVes9VQA==
X-Received: by 2002:a65:560d:: with SMTP id l13mr2607657pgs.375.1604586913183; 
 Thu, 05 Nov 2020 06:35:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/18] powerpc/64s: move context tracking exit to interrupt
 exit path
Date: Fri,  6 Nov 2020 00:34:23 +1000
Message-Id: <20201105143431.1874789-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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

The interrupt handler wrapper functions are not the ideal place to
maintain context tracking because after they return, the low level exit
code must then determine if there are interrupts to replay, or if the
task should be preempted, etc. Those paths (e.g., schedule_user) include
their own exception_enter/exit pairs to fix this up but it's a bit hacky
(see schedule_user() comments).

Ideally context tracking will go to user mode only when there are no
more interrupts or context switches or other exit processing work to
handle.

64e can not do this because it does not use the C interrupt exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 27 ++++++++++++++++++++++++---
 arch/powerpc/kernel/syscall_64.c     |  9 +++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 55f544dbf434..0b29d363988d 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -7,23 +7,44 @@
 #include <asm/ftrace.h>
 
 struct interrupt_state {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
 #endif
 };
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	state->ctx_state = exception_enter();
 #endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (user_mode(regs)) {
+		CT_WARN_ON(ct_state() != CONTEXT_USER);
+		user_exit_irqoff();
+	} else {
+		/*
+		 * CT_WARN_ON comes here via program_check_exception,
+		 * so avoid recursion.
+		 */
+		if (TRAP(regs) != 0x700)
+			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
+	}
+#endif
 }
 
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3E_64
 	exception_exit(state->ctx_state);
 #endif
+
+	/*
+	 * Book3S exits to user via interrupt_exit_user_prepare(), which does
+	 * context tracking, which is a cleaner way to handle PREEMPT=y
+	 * and avoid context entry/exit in e.g., preempt_schedule_irq()),
+	 * which is likely to be where the core code wants to end up.
+	 */
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index d9df6d14533e..5820a18672bc 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -275,6 +275,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -317,7 +318,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
+	user_enter_irqoff();
 	if (unlikely(!prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -358,6 +361,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
+	/*
+	 * CT_WARN_ON comes here via program_check_exception,
+	 * so avoid recursion.
+	 */
+	if (TRAP(regs) != 0x700)
+		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	amr = kuap_get_and_check_amr();
 
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C950D2F8273
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:32:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHStF5lGYzDqC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:32:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ULxRs5Sz; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRz511CjzDshY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:28 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id y205so17944pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z317hW2Txl9c4yYLL5iRt3v1VXzKopLn1scM1YoAuNM=;
 b=ULxRs5SzCiIqQVUXHBErL1XJrZjU1laERTAoDHxNV2MA8syRtwbgOp+ETmkJzB6RGK
 lPn6xZs9yLwe5lyYXDm39lokyRrbFHN3R84blFQ1R44u2+DKwegADQWL9QuO9VcEufP3
 C76QK9LIpVphbQ0oq4N10sd2qO0sflwK/ruEYgDTUV+YDqIK8O1FFW9D5zQiECKf9h/0
 GKmiFNxvrYikeRBzB1hNE1rdmIYQATKiVMIW0HA8zqMo15kqdZT0noFAN1QlUQcSRPCq
 dNYlRN3x4BV8kFDkZp2p+yYa7g44p9TCEQGFkuAgSkxTZDmQNFevxsiRubySPJHG9D25
 4PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z317hW2Txl9c4yYLL5iRt3v1VXzKopLn1scM1YoAuNM=;
 b=RejgZP/iwOpYGvBiLWhp8WtgnTQwLRh6qo5Hz/OgDDq+UPj9PBfkbUDgrqUbhQ4xv2
 Hc2eRJmwnB71ftCRSvnFDzAslnXeLVImrjcqJ1pWRhW5gtdMlDtY126es47CDreAUmVQ
 1ry9ej01ZASF6QQYzA4ZtcAkHcM/MOfMqeLEpFZA0wuTPqt5HOK9e8Cpkh/9pt5J+Bi9
 xDhNrCd6tMwJ9mZbGYewcgtUxA1gO4USeYvBBesjPpFjE6HXTUHJd78oD/HFZTfjaXqC
 2fQmwmP4ytRT4wtFSIM9NEvry4yG4/nwZWjBOBQHuUQAXRjaqvmZ/YRTT7Oxpa0OlbAJ
 KcXw==
X-Gm-Message-State: AOAM530AeXKht4I+wZckHnotN036cnN/n0Hb3G0BQiwBPEH8WrPKbBmk
 GM32eJmQjXZjxHxQNqyYK3cpiUETdgk=
X-Google-Smtp-Source: ABdhPJzrg2gmdb7hyB3yi0axTOIMrK7odGsgi/RPplVtFM7D72QaM1ZZ2LA9BF/yhL0TrNRQoJnD9g==
X-Received: by 2002:a63:5309:: with SMTP id h9mr13561322pgb.19.1610729485641; 
 Fri, 15 Jan 2021 08:51:25 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 16/39] powerpc: add and use unknown_async_exception
Date: Sat, 16 Jan 2021 02:49:49 +1000
Message-Id: <20210115165012.1260253-17-npiggin@gmail.com>
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

This is currently the same as unknown_exception, but it will diverge
after interrupt wrappers are added and code moved out of asm into the
wrappers (e.g., async handlers will check FINISH_NAP).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h    |  1 +
 arch/powerpc/kernel/exceptions-64s.S |  4 ++--
 arch/powerpc/kernel/head_book3s_32.S |  6 +++---
 arch/powerpc/kernel/traps.c          | 12 ++++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e5def36212cf..75c2b137fc00 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -57,6 +57,7 @@ extern void timer_interrupt(struct pt_regs *);
 extern void performance_monitor_exception(struct pt_regs *regs);
 extern void WatchdogException(struct pt_regs *regs);
 extern void unknown_exception(struct pt_regs *regs);
+void unknown_async_exception(struct pt_regs *regs);
 
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e69a912c2cc6..fe33197ea8fb 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1926,7 +1926,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
@@ -2312,7 +2312,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 94ad1372c490..9b4d5432e2db 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -238,8 +238,8 @@ __secondary_hold_acknowledge:
 
 /* System reset */
 /* core99 pmac starts the seconary here by changing the vector, and
-   putting it back to what it was (unknown_exception) when done.  */
-	EXCEPTION(0x100, Reset, unknown_exception, EXC_XFER_STD)
+   putting it back to what it was (unknown_async_exception) when done.  */
+	EXCEPTION(0x100, Reset, unknown_async_exception, EXC_XFER_STD)
 
 /* Machine check */
 /*
@@ -631,7 +631,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 #endif
 
 #ifndef CONFIG_TAU_INT
-#define TAUException	unknown_exception
+#define TAUException	unknown_async_exception
 #endif
 
 	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index bd55f201115b..639bcafbad5e 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1073,6 +1073,18 @@ void unknown_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
+void unknown_async_exception(struct pt_regs *regs)
+{
+	enum ctx_state prev_state = exception_enter();
+
+	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
+	       regs->nip, regs->msr, regs->trap);
+
+	_exception(SIGTRAP, regs, TRAP_UNK, 0);
+
+	exception_exit(prev_state);
+}
+
 void instruction_breakpoint_exception(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
-- 
2.23.0


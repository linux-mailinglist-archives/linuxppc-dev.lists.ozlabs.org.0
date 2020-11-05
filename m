Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853192A81F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:15:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnCV4gG3zDrC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tUSmEUE+; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmK00kQmzDr0T
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:32 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id z24so1554896pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLFWTMYO9/nAMLJlTNDq18RPcyQuqLjY5QdPpDE2Xho=;
 b=tUSmEUE+7r3qcA0fjOdFOctha9TR/xH8bXO3ysQdfW1ySK0EN0ia/Z6nPTOUlOdJZy
 d505e732EcFFb1vEHUmcPLlcZn7MufQekMZa21hPPxczJDdwYTIV0W4W7V23ZKW/PM7R
 x76aZEgdtpSzgZ9tODpv415ObSxclGwNXW43b3tRBxrWMaONrcLcQ8xubnPEPgIsXwtR
 dGJ11Qdeb1SXOPBs48aQBp+zkcW0w/1g6puAmHNwhhAzzfSEftxeGhk56WafcJATGWa0
 1MwC+JDD8q6qnoIJQctmrUOriHA6NSjNEePkJ0HK184L4oh8MqgO/c+kEb4EJpzmRwcV
 INgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLFWTMYO9/nAMLJlTNDq18RPcyQuqLjY5QdPpDE2Xho=;
 b=kqH9sONOkUzT7pSnEbkFgufhdHgp4RapUB4tYN9VxaZGoBDweTiILd0uY5qMwnAQ/D
 HIulwSVmLpQdTj7hbB+VXiQVNq5tbMyy1mGb2N+5OK8y+XI0yMCuHMV/lrL3EnbVRraY
 5YO/Da6A9DGW+E0eUf40QC0knPZb7bcJwfTGb4L9KdLL7WBVHcL+c2eNo9b8WoVqY9eC
 lsx8TNxFYqrITsyol1spAPbIa/5ETUh8G2iR/z/rWi/8qWKFpNqwp936wHhb0aLMS+kK
 uq7C0edxiy7MJIX/QpxmOiloO/iauY/K0icmehRIl4m5XOtXgyamI504oHXdjoVQ4EW4
 xW3Q==
X-Gm-Message-State: AOAM531NiJw2oOOt/YNWQ+raakPgGWWscvYKWGxvSikZtHv/u7tgjzlC
 +Xm/C5kF4ziucTHXRaF2anA7pNogWEbiJg==
X-Google-Smtp-Source: ABdhPJz+I50qrtc51+ogBMJzwtPx635Sv/h09lgWRk0SIOEvpMqccIWMYzmSBdCkRnV0NqNKMpKI0w==
X-Received: by 2002:a63:e4d:: with SMTP id 13mr2573906pgo.414.1604586929980;
 Thu, 05 Nov 2020 06:35:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/18] powerpc/64s: runlatch interrupt handling in C
Date: Fri,  6 Nov 2020 00:34:29 +1000
Message-Id: <20201105143431.1874789-17-npiggin@gmail.com>
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

There is no need for this to be in asm, use the new intrrupt entry wrapper.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  7 +++++++
 arch/powerpc/kernel/exceptions-64s.S | 18 ------------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 5ece57dd0455..46846fe332b9 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,7 @@
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
 #include <asm/ftrace.h>
+#include <asm/runlatch.h>
 
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -60,6 +61,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+#endif
+
 	interrupt_enter_prepare(regs, state);
 }
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0949dd47be59..227bad3a586d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -692,14 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r1,GPR1(r1)
 .endm
 
-#define RUNLATCH_ON				\
-BEGIN_FTR_SECTION				\
-	ld	r3, PACA_THREAD_INFO(r13);	\
-	ld	r4,TI_LOCAL_FLAGS(r3);		\
-	andi.	r0,r4,_TLF_RUNLATCH;		\
-	beql	ppc64_runlatch_on_trampoline;	\
-END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
-
 /*
  * When the idle code in power4_idle puts the CPU into NAP mode,
  * it has to do so in a loop, and relies on the external interrupt
@@ -1581,7 +1573,6 @@ EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1767,7 +1758,6 @@ EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1853,7 +1843,6 @@ EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2208,7 +2197,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2238,7 +2226,6 @@ EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2272,7 +2259,6 @@ EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2319,7 +2305,6 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3030,9 +3015,6 @@ kvmppc_skip_Hinterrupt:
 	 * come here.
 	 */
 
-EXC_COMMON_BEGIN(ppc64_runlatch_on_trampoline)
-	b	__ppc64_runlatch_on
-
 USE_FIXED_SECTION(virt_trampolines)
 	/*
 	 * All code below __end_interrupts is treated as soft-masked. If
-- 
2.23.0


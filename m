Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80025E9AA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:18:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkN8l0cHYzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 04:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r5+zczhh; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNv5Dw1zDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:44:15 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id q3so2574846pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShAfjRJTNEk+0EWaa5O20a4sL/xXaNo5eJTwtftDvKA=;
 b=r5+zczhhVLQCBwI6woIJvkB1fe7tNBE5iE9jNzXLGKgpGdUA7QD8BR/+aZHWWBbMK5
 ab9cV+RJUqqwpTxo167gi07QYPhQpn7yH5J0EDlCIVgSwd4KrWB3DVfF8dngGcD0NLXj
 hPIfmOjx0txUv8RHPpGDreNgyGCpb5qE0GhUoVSlcEwtiTyvM6Iz4to/XTDvKRnoJy/f
 Yt7Mm2+VqOZYwewsa5IoUzOvLWU2cSsWT68wlp/3iEXy0eZw2xwCM+296yg4Zw08mESZ
 ZVYVuiBPMiTsOrqzplX5LjTHWyhJU+bHs5RbSPTJkFkcal2pTaBnXMt3q7bu9d/23e33
 TT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShAfjRJTNEk+0EWaa5O20a4sL/xXaNo5eJTwtftDvKA=;
 b=Mo7y4LAy/857SYaswAVUomccWjw5rHOjotlwbAMBi+hwiLgLNAy6TOtY/m8LV87ps/
 6MlEMgY3VO76aQwl3t4lApiGdY+WyyfO+U/GKysOPT4dTcqojxF6zINC9whRfW9T7BRe
 nboVFYGhWgyXcFs2I7zMKbBY/fn9AIjnV4+AmeWm5rvmB54wXF3qZobka2oe/cPQl8u2
 7BFtfl6otxYLYscfxE4PyNoaIWaHLszh8rqD4LfpbeKkkO3KvchM2hBoOXJErOkRzxjT
 jQkv8wibQyZvmGHNTG2H3+GLfNYh0nJXpgAQDK2uNErTEIV6fnsRkHRCTaEYoT0baPNR
 mArQ==
X-Gm-Message-State: AOAM532vGz8/VDENVlkZpmntGHyFRKNpgZcrcz7aqdN1oVZzYBWuVO/M
 PnHqAatr76XfXnylJovFAj2hMtsv6g4=
X-Google-Smtp-Source: ABdhPJzG0tFpqRZPmvUaYaXGlqPVTLhGObeFn2iFB750cs6tuCHylbo6deR1PX1HEkygVBRIcG5eVQ==
X-Received: by 2002:a17:902:9a45:: with SMTP id
 x5mr13695387plv.208.1599327852765; 
 Sat, 05 Sep 2020 10:44:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:44:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 11/12] powerpc/64s: runlatch interrupt handling in C
Date: Sun,  6 Sep 2020 03:43:34 +1000
Message-Id: <20200905174335.3161229-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200905174335.3161229-1-npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need for this to be in asm, use the new intrrupt entry wrapper.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 16 ++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S | 18 ------------------
 2 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index c26a7c466416..3ae3d2f93b61 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,7 @@
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
 #include <asm/ftrace.h>
+#include <asm/runlatch.h>
 
 #ifdef CONFIG_PPC_BOOK3S_64
 static inline void interrupt_enter_prepare(struct pt_regs *regs)
@@ -25,10 +26,22 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	}
 }
 
+static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
+{
+	interrupt_enter_prepare(regs);
+
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+}
+
 #else /* CONFIG_PPC_BOOK3S_64 */
 static inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
 }
+static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
+{
+}
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 struct interrupt_nmi_state {
@@ -76,7 +89,6 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 #endif
 }
 
-
 /**
  * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
  * @func:	Function name of the entry point
@@ -193,7 +205,7 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
-	interrupt_enter_prepare(regs);					\
+	interrupt_async_enter_prepare(regs);				\
 									\
 	___##func (regs);						\
 }									\
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


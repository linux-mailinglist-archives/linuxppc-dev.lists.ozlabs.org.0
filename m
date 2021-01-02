Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F42E8775
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:23:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Mz15GsZzDr13
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fj1DmPNW; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lj86YwgzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:26:20 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id t6so12054871plq.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ni/D9khR0eQz0INnFGUEyIliDMWoFa5F/AUgCFbEHs=;
 b=fj1DmPNW7/+hv2bvlSUrj1Hj+MZ0RUaPlvOq00sFMldH62gBlL2H6UNq0hBKznhdXL
 69HFPT7udU48zJz+Ps13uoaQQnmTMCk/9h2NNYFSOIr+UsfExphQ/fwcJyXWCactQx/q
 VhZIJHE7+z0L1ShD4CG6iEKSBFUPNpuI6MctmvtxqCfYJvCd+rjIsBjopHJOJWizFdGI
 9kDpsDHKEKtzMEFXtQ/SPNj0Ojyz/sr7k1bGGgLdsaOISYsQgO6RsqCz+T9DxMp6GbhC
 XyC/z+4Zmj+qgaBritH+Ui+1kXrs8FderdKyGvT5sFqtrcq4gtq7VFiPFrycNrY9ai2E
 dLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ni/D9khR0eQz0INnFGUEyIliDMWoFa5F/AUgCFbEHs=;
 b=U4YV8ZXuI+f9Dfp6m1eFgshA44MvgJfhc4MN6JdYNP7hSx795soxEZOGUtW7WW6Czk
 NhpCR5iFElCaA8NjGRL7j4yUdwQo3NOQbUD92UQvUxqQqjM1YXQuvNMeWypTJirQzLub
 ScgsohOrIjIy3ts9X7Sds5gP5zBhDiNyauUnPK+GzOGQie8vhIMHsARVNyD3pEe2m99V
 NZ9d8YrXs4F6ImTylRg1we02NuBtVaJT9PkVde6WiJbWpoitzK/NpXRJjKSn3Vg0PhHa
 bUe8LtRQ9vW0PK5d1xAr0C5r3+qRGp0bKTxxc6DdnjWPpi8hIjNvOY7ZAZaHfWKe5MF1
 WC/g==
X-Gm-Message-State: AOAM532g/o7mEj38t45buzYVOP9to7ZcZPLuUP0Ss2npETx6RtRTLi1v
 S00OphGeGXQCj6ndfUom9soP7dfgCVI=
X-Google-Smtp-Source: ABdhPJzVYQvHa7fbPUcxF5t7KwOh51cnSuixMoZZroP8DgiL0moVlm87NJvqAUuXA1zcNX7bODYz9Q==
X-Received: by 2002:a17:90a:764f:: with SMTP id
 s15mr21057908pjl.98.1609590377157; 
 Sat, 02 Jan 2021 04:26:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:26:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 20/21] powerpc/64s: runlatch interrupt handling in C
Date: Sat,  2 Jan 2021 22:25:07 +1000
Message-Id: <20210102122508.1950592-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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
index db89ecfef762..9c16e9a48df6 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,7 @@
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
 #include <asm/ftrace.h>
+#include <asm/runlatch.h>
 
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -84,6 +85,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+#endif
+
 	interrupt_enter_prepare(regs, state);
 	irq_enter();
 }
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f9a2751570ef..05a358559274 100644
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
@@ -1582,7 +1574,6 @@ EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1768,7 +1759,6 @@ EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1854,7 +1844,6 @@ EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2209,7 +2198,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2239,7 +2227,6 @@ EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2273,7 +2260,6 @@ EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2320,7 +2306,6 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3035,9 +3020,6 @@ kvmppc_skip_Hinterrupt:
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


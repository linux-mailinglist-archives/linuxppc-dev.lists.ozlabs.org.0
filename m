Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C1309602
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:48:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScXb2NxpzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EOAAhfux; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZNK55YmzDrVx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:28 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id u11so7068573plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDGNpKAZieUBwR7gYAGlcpTz+6cSfuzaNS+oO0PpJCc=;
 b=EOAAhfuxrRrldKHS7GURhpiPphhwgGe7AlYMg17+lRBMmbi/fzQkbrIo18TrhBL5sM
 V4r/w8DjKVEAuc2yi0zUAwytP+uHLNnEaTc4L+wW0xK5W5FR1KJaf+w0LgAjqG7lYwcn
 +XIIRzdXXtjYP2UrikLjum3x7ToX4CHWdBzbKOG7PPYH3pm4p/uWHO8FyrVDXrCFAKnO
 3BhXWoIC5mce1lLzpsh6WFfTGtWWZbg8K+9/5rnZk1PSB4566OXUkNpGllab3SOiypUn
 Y/fhB3UAwBy/545o/X0whx5dCFj8zj6tTILYXap5Zi/LHYY7xPUoBvWpKZHVFJh7UGSS
 4YHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDGNpKAZieUBwR7gYAGlcpTz+6cSfuzaNS+oO0PpJCc=;
 b=DkCSZh24rQuvpz+RJJMetXN/MVtoF09855ddqIYlI4vaL6VBPyL6ayHxk0ot210zRg
 CpyqvY/iybVlcFHfrGPZ/doLOPQ95qark1dzPA8KyU55auDVvQjNqDnsFztTyIFUS2Gi
 w6+HnlPsfSfloFG0udf4vvKZ1dKwVQzWD+0/pS4trpEGxsfQLqIaOs6aP/gVPgs9fnbQ
 MEgaPMoSQ0t8RrR6gYgbhZ0tTufrHExllcA+yV6ZQvB4baueB3GRPpxij5FQ6d2y58US
 Q8vash72ly7rLcaQ3/685JqCmUvkbJunO4eePzhzIw6HdMOhQ+AmuljmfyJPnaqGrJsk
 LaOQ==
X-Gm-Message-State: AOAM530xpqM9PLJqPF9l6osiTwnzVigRrQbh/MXnNZ5euz5SfykVMh5o
 oj+rP/pbElk1OMyegK0pAi7DIaFhMN0=
X-Google-Smtp-Source: ABdhPJyRnFlkJP/EV7DVzm7mQrW3rW3EPEQxDE0id2ixigPGnA8R+5rHx4AB2zrw3QLw1qK+rN+Cgg==
X-Received: by 2002:a17:902:d686:b029:de:7845:c0b2 with SMTP id
 v6-20020a170902d686b02900de7845c0b2mr3797032ply.11.1612012286251; 
 Sat, 30 Jan 2021 05:11:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 41/42] powerpc/64s: runlatch interrupt handling in C
Date: Sat, 30 Jan 2021 23:08:51 +1000
Message-Id: <20210130130852.2952424-42-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index 72a585084066..4badb3e51c19 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,7 @@
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
 #include <asm/ftrace.h>
+#include <asm/runlatch.h>
 
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -83,6 +84,12 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
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
index 2fca2bad6b02..27351276c54b 100644
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
@@ -1585,7 +1577,6 @@ EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1771,7 +1762,6 @@ EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1857,7 +1847,6 @@ EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2212,7 +2201,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2242,7 +2230,6 @@ EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2276,7 +2263,6 @@ EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2323,7 +2309,6 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	FINISH_NAP
-	RUNLATCH_ON
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3057,9 +3042,6 @@ kvmppc_skip_Hinterrupt:
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


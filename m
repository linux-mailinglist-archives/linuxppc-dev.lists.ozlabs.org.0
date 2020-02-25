Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6A16EE61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:52:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rp2511g8zDqNW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oXXuk/zp; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSK3VN1zDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:04 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d5so1568714pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4TOVXFysGRIZW6pwxwxGV1bV5ObVW/9LZFIl3aSaKU=;
 b=oXXuk/zp+p0QRlrA0GRI5QVgvUSbpFEKF1yoyCwy3GYNG+0BWipbkbSn9EZy7ciXuG
 jJSp2KsY8EbxEI0UscfamNLCEg/XhoqqXXGL6IJIBlmTrTtpFG/TB1jX7wevp5diDyOz
 VHOTe1tYcZ4XnOXZrMAfYI0z6Cm8WImt/IKdzyPPbhhE87S717KvqbI9O8ygQ+fVcVeh
 WZxD8BlphdUV7gUNCPrOY2Uz3nslm1mQlhEW4RicsfWtYyQc+SEiHgMBsmNb99yhnxMR
 lF53Lo9i65iaF1yupjC7RjNKhNOZfUlwJa6mKYfiUuAjVVPxHAc52o7gpQIUwVz/10aW
 I0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4TOVXFysGRIZW6pwxwxGV1bV5ObVW/9LZFIl3aSaKU=;
 b=rhf5KFLA0iboM1AoM2Dz61hLQtmhN7JQaSTmAxX1QtiLjkl4fr98Cpg5llDC7a+EeY
 q5KOAJ+v7LaVAoFPJSllf7rXGNARx3uoDpUM8455adHT5IQadEnpcsFQfOLo5JNVRIMm
 RXTxI+MPAPv4lMy3XNXY2Z81+HLaIPjHAYWRbEs0HdALnFaD3Er2oUAfABbove8wx0ZI
 1A1kef/6J9JyiEUyhbb0UVbbWAK9Hf019LIpJfDM3BLaoYsB1j5/YnbuSB4J5KZTi1EE
 ZYeD9NwaLC3irjFg/OsPmV0/pRjZ+UzLWYtyM901HeOKI8paUXFXGJr5vexfZh8D42Yu
 k3Gg==
X-Gm-Message-State: APjAAAWEIleohqRHUOE5bMGm4sulnC+tfAtLxf1r7ebXefpLK7PLiw7n
 sKAGv9wooBOS6PLaODRTUIg+tDkN
X-Google-Smtp-Source: APXvYqz7dEz+bsEburmD+zT0HlhZPvPy9D4F/JJQl9PoAecP1eDatFl2YOfzjJReGuUhwDnQ6D/aCw==
X-Received: by 2002:a17:902:7b89:: with SMTP id
 w9mr57581229pll.46.1582652461164; 
 Tue, 25 Feb 2020 09:41:01 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:41:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 27/32] powerpc/64: implement soft interrupt replay in C
Date: Wed, 26 Feb 2020 03:35:36 +1000
Message-Id: <20200225173541.1549955-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When local_irq_enable() finds a pending soft-masked interrupt, it
"replays" it by setting up registers like the initial interrupt entry,
then calls into the low level handler to set up an interrupt stack
frame and process the interrupt.

This is not necessary, and uses more stack than needed. The high level
interrupt handler can be called directly from C, with just pt_regs set
up on stack. This should be faster and use less stack.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h    |   1 -
 arch/powerpc/kernel/exceptions-64e.S |  32 ------
 arch/powerpc/kernel/exceptions-64s.S |  47 --------
 arch/powerpc/kernel/irq.c            | 165 +++++++++++++++++++++------
 4 files changed, 130 insertions(+), 115 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 310583e62bd9..0e9a9598f91f 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -52,7 +52,6 @@
 #ifndef __ASSEMBLY__
 
 extern void replay_system_reset(void);
-extern void __replay_interrupt(unsigned int vector);
 
 extern void timer_interrupt(struct pt_regs *);
 extern void timer_broadcast_interrupt(void);
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index e4076e3c072d..4efac5490216 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1002,38 +1002,6 @@ masked_interrupt_book3e_0x280:
 masked_interrupt_book3e_0x2c0:
 	masked_interrupt_book3e PACA_IRQ_DBELL 0
 
-/*
- * Called from arch_local_irq_enable when an interrupt needs
- * to be resent. r3 contains either 0x500,0x900,0x260 or 0x280
- * to indicate the kind of interrupt. MSR:EE is already off.
- * We generate a stackframe like if a real interrupt had happened.
- *
- * Note: While MSR:EE is off, we need to make sure that _MSR
- * in the generated frame has EE set to 1 or the exception
- * handler will not properly re-enable them.
- */
-_GLOBAL(__replay_interrupt)
-	/* We are going to jump to the exception common code which
-	 * will retrieve various register values from the PACA which
-	 * we don't give a damn about.
-	 */
-	mflr	r10
-	mfmsr	r11
-	mfcr	r4
-	mtspr	SPRN_SPRG_GEN_SCRATCH,r13;
-	std	r1,PACA_EXGEN+EX_R1(r13);
-	stw	r4,PACA_EXGEN+EX_CR(r13);
-	ori	r11,r11,MSR_EE
-	subi	r1,r1,INT_FRAME_SIZE;
-	cmpwi	cr0,r3,0x500
-	beq	exc_0x500_common
-	cmpwi	cr0,r3,0x900
-	beq	exc_0x900_common
-	cmpwi	cr0,r3,0x280
-	beq	exc_0x280_common
-	blr
-
-
 /*
  * This is called from 0x300 and 0x400 handlers after the prologs with
  * r14 and r15 containing the fault address and error code, with the
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5ddfc32cacad..bad8cd9e7dba 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3146,50 +3146,3 @@ doorbell_super_common_msgclr:
 	LOAD_REG_IMMEDIATE(r3, PPC_DBELL_MSGTYPE << (63-36))
 	PPC_MSGCLRP(3)
 	b 	doorbell_super_common
-
-/*
- * Called from arch_local_irq_enable when an interrupt needs
- * to be resent. r3 contains 0x500, 0x900, 0xa00 or 0xe80 to indicate
- * which kind of interrupt. MSR:EE is already off. We generate a
- * stackframe like if a real interrupt had happened.
- *
- * Note: While MSR:EE is off, we need to make sure that _MSR
- * in the generated frame has EE set to 1 or the exception
- * handler will not properly re-enable them.
- *
- * Note that we don't specify LR as the NIP (return address) for
- * the interrupt because that would unbalance the return branch
- * predictor.
- */
-_GLOBAL(__replay_interrupt)
-	/* We are going to jump to the exception common code which
-	 * will retrieve various register values from the PACA which
-	 * we don't give a damn about, so we don't bother storing them.
-	 */
-	mfmsr	r12
-	LOAD_REG_ADDR(r11, replay_interrupt_return)
-	mfcr	r9
-	ori	r12,r12,MSR_EE
-	cmpwi	r3,0x900
-	beq	decrementer_common
-	cmpwi	r3,0x500
-BEGIN_FTR_SECTION
-	beq	h_virt_irq_common
-FTR_SECTION_ELSE
-	beq	hardware_interrupt_common
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_300)
-	cmpwi	r3,0xf00
-	beq	performance_monitor_common
-BEGIN_FTR_SECTION
-	cmpwi	r3,0xa00
-	beq	h_doorbell_common_msgclr
-	cmpwi	r3,0xe60
-	beq	hmi_exception_common
-FTR_SECTION_ELSE
-	cmpwi	r3,0xa00
-	beq	doorbell_super_common_msgclr
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
-replay_interrupt_return:
-	blr
-
-_ASM_NOKPROBE_SYMBOL(__replay_interrupt)
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5c9b11878555..afd74eba70aa 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -70,6 +70,7 @@
 #include <asm/paca.h>
 #include <asm/firmware.h>
 #include <asm/lv1call.h>
+#include <asm/dbell.h>
 #endif
 #define CREATE_TRACE_POINTS
 #include <asm/trace.h>
@@ -230,10 +231,121 @@ notrace unsigned int __check_irq_replay(void)
 	return 0;
 }
 
+static void replay_soft_interrupts(void)
+{
+	/*
+	 * We use local_paca rather than get_paca() to avoid all
+	 * the debug_smp_processor_id() business in this low level
+	 * function
+	 */
+	unsigned char happened = local_paca->irq_happened;
+	struct pt_regs regs;
+
+	ppc_save_regs(&regs);
+	regs.softe = IRQS_ALL_DISABLED;
+
+again:
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(mfmsr() & MSR_EE);
+
+	if (happened & PACA_IRQ_HARD_DIS) {
+		/*
+		 * We may have missed a decrementer interrupt if hard disabled.
+		 * Check the decrementer register in case we had a rollover
+		 * while hard disabled.
+		 */
+		if (!(happened & PACA_IRQ_DEC)) {
+			if (decrementer_check_overflow())
+				happened |= PACA_IRQ_DEC;
+		}
+	}
+
+	/*
+	 * Force the delivery of pending soft-disabled interrupts on PS3.
+	 * Any HV call will have this side effect.
+	 */
+	if (firmware_has_feature(FW_FEATURE_PS3_LV1)) {
+		u64 tmp, tmp2;
+		lv1_get_version_info(&tmp, &tmp2);
+	}
+
+	/*
+	 * Check if an hypervisor Maintenance interrupt happened.
+	 * This is a higher priority interrupt than the others, so
+	 * replay it first.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_HMI)) {
+		local_paca->irq_happened &= ~PACA_IRQ_HMI;
+		regs.trap = 0xe60;
+		handle_hmi_exception(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	if (happened & PACA_IRQ_DEC) {
+		local_paca->irq_happened &= ~PACA_IRQ_DEC;
+		regs.trap = 0x900;
+		timer_interrupt(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	if (happened & PACA_IRQ_EE) {
+		local_paca->irq_happened &= ~PACA_IRQ_EE;
+		regs.trap = 0x500;
+		do_IRQ(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	/*
+	 * Check if an EPR external interrupt happened this bit is typically
+	 * set if we need to handle another "edge" interrupt from within the
+	 * MPIC "EPR" handler.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E) && (happened & PACA_IRQ_EE_EDGE)) {
+		local_paca->irq_happened &= ~PACA_IRQ_EE_EDGE;
+		regs.trap = 0x500;
+		do_IRQ(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (happened & PACA_IRQ_DBELL)) {
+		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
+		if (IS_ENABLED(CONFIG_PPC_BOOK3E))
+			regs.trap = 0x280;
+		else
+			regs.trap = 0xa00;
+		doorbell_exception(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	/* Book3E does not support soft-masking PMI interrupts */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (happened & PACA_IRQ_PMI)) {
+		local_paca->irq_happened &= ~PACA_IRQ_PMI;
+		regs.trap = 0xf00;
+		performance_monitor_exception(&regs);
+		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+			hard_irq_disable();
+	}
+
+	happened = local_paca->irq_happened;
+	if (happened & ~PACA_IRQ_HARD_DIS) {
+		/*
+		 * We are responding to the next interrupt, so interrupt-off
+		 * latencies should be reset here.
+		 */
+		trace_hardirqs_on();
+		trace_hardirqs_off();
+		goto again;
+	}
+}
+
 notrace void arch_local_irq_restore(unsigned long mask)
 {
 	unsigned char irq_happened;
-	unsigned int replay;
 
 	/* Write the new soft-enabled value */
 	irq_soft_mask_set(mask);
@@ -255,24 +367,16 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	 */
 	irq_happened = get_irq_happened();
 	if (!irq_happened) {
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
-#endif
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 		return;
 	}
 
-	/*
-	 * We need to hard disable to get a trusted value from
-	 * __check_irq_replay(). We also need to soft-disable
-	 * again to avoid warnings in there due to the use of
-	 * per-cpu variables.
-	 */
+	/* We need to hard disable to replay. */
 	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
-#endif
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 		__hard_irq_disable();
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
 	} else {
 		/*
 		 * We should already be hard disabled here. We had bugs
@@ -280,35 +384,26 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		 * warn if we are wrong. Only do that when IRQ tracing
 		 * is enabled as mfmsr() can be costly.
 		 */
-		if (WARN_ON_ONCE(mfmsr() & MSR_EE))
-			__hard_irq_disable();
-#endif
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
+				__hard_irq_disable();
+		}
+
+		if (irq_happened == PACA_IRQ_HARD_DIS) {
+			local_paca->irq_happened = 0;
+			__hard_irq_enable();
+			return;
+		}
 	}
 
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
 	trace_hardirqs_off();
 
-	/*
-	 * Check if anything needs to be re-emitted. We haven't
-	 * soft-enabled yet to avoid warnings in decrementer_check_overflow
-	 * accessing per-cpu variables
-	 */
-	replay = __check_irq_replay();
+	replay_soft_interrupts();
+	local_paca->irq_happened = 0;
 
-	/* We can soft-enable now */
 	trace_hardirqs_on();
 	irq_soft_mask_set(IRQS_ENABLED);
-
-	/*
-	 * And replay if we have to. This will return with interrupts
-	 * hard-enabled.
-	 */
-	if (replay) {
-		__replay_interrupt(replay);
-		return;
-	}
-
-	/* Finally, let's ensure we are hard enabled */
 	__hard_irq_enable();
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
-- 
2.23.0


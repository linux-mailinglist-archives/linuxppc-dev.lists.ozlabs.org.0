Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB12E8774
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:21:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MwN1BDxzDrPp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f2w+yWbB; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lj50HhrzDqJP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:26:16 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id r4so12031431pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5UAwzLFO5TvLOq/IMH2drBgv7LNQGOM+LyddVV7ctw=;
 b=f2w+yWbBN4KmnV8k8HQF+ZQHMTPk4GYUN28l03IPRqfM4FCaguHF1ZSZLeOZ7R38LU
 P6tO8suip3bexI+TD4qT4EOiLWK/nmJ1NGIk2i8kccl9MCFVjBy09qSrkEgdzJcC5dLx
 QvbK5hflH9I9hQqIG6DmvByfJQUOIsfRT4b1SuAhP8NR2O0PsomgTmbIUwD2kvn/9oEa
 Ka8zif48HbQ2kN5H9F9y+esoBYjH2qSws8v8WWt819N1IhzNnkajm2IJbe0NcbKBUmaO
 kwjBvvubKWrLJxRWveWQWYo3hLucNSxcHbEEzB+aiZoINbOM7z7AgksQ9NFZqmNQpalL
 hZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x5UAwzLFO5TvLOq/IMH2drBgv7LNQGOM+LyddVV7ctw=;
 b=r1APdKzfKFVxCGnIv/5I/EuUNm5lGyAfXAvfBSuZESqXo3BVGz4UWd0kX3n4J6Z1fR
 u1HQg/mwcl8K6FnPdBlj/HGHoLOfJ8uQGdhOjETBnNcQ98+PVogat+X8cGBtvpcUov7a
 qkCPsIFUSDlJbKjLauwRuPsluug6Qh1cAagGCFVu1D8WdXNDH1zte/M94e3xnayWHvGq
 EjKQ+wuhG//88x1yWAJmMFbdA36J+xikwsSDyYnwEt3b71XS6W0K0ZGp5AyhNTGX4Wyy
 NWlvbMiUiiT8QR1ODUswdnl/gXn6CqcR7d0UyHIZHVZXbyOqMoRhdN6OrnoE7nL1A5uY
 YSig==
X-Gm-Message-State: AOAM533FuS+sHvCuKAIRErS7qHtg8HxmEYjxdaFW9LkqhyRDEK+Nx3rV
 Jvcau7r109RaFw50g2qTWT/i1+wCMjc=
X-Google-Smtp-Source: ABdhPJxUCxEsTkgotfwUJ9mFFPhG99UyFCU/rE/DTTVZ223ScIxvLDSl8eraXsgdGj7DtGEKMliUbg==
X-Received: by 2002:a17:902:e901:b029:db:c0d6:62cc with SMTP id
 k1-20020a170902e901b02900dbc0d662ccmr64482848pld.7.1609590373798; 
 Sat, 02 Jan 2021 04:26:13 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:26:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 19/21] powerpc/64s: move NMI soft-mask handling to C
Date: Sat,  2 Jan 2021 22:25:06 +1000
Message-Id: <20210102122508.1950592-20-npiggin@gmail.com>
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

Saving and restoring soft-mask state can now be done in C using the
interrupt handler wrapper functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 26 ++++++++++++
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 2 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 01192e213f9a..db89ecfef762 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -96,6 +96,10 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 
 struct interrupt_nmi_state {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+#endif
 	u8 ftrace_enabled;
 #endif
 };
@@ -103,6 +107,21 @@ struct interrupt_nmi_state {
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	state->irq_soft_mask = local_paca->irq_soft_mask;
+	state->irq_happened = local_paca->irq_happened;
+
+	/*
+	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
+	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
+	 * because that goes through irq tracing which we don't want in NMI.
+	 */
+	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	/* Don't do any per-CPU operations until interrupt state is fixed */
+	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+#endif
 	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 	this_cpu_set_ftrace_enabled(0);
 #endif
@@ -126,6 +145,13 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 #ifdef CONFIG_PPC64
 	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* Check we didn't change the pending interrupt mask. */
+	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	local_paca->irq_happened = state->irq_happened;
+	local_paca->irq_soft_mask = state->irq_soft_mask;
+#endif
 #endif
 }
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e6e61c6f7298..f9a2751570ef 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1008,20 +1008,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY system_reset
-	/*
-	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
-	 * the right thing. We do not want to reconcile because that goes
-	 * through irq tracing which we don't want in NMI.
-	 *
-	 * Save PACAIRQHAPPENED to RESULT (otherwise unused), and set HARD_DIS
-	 * as we are running with MSR[EE]=0.
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
@@ -1037,14 +1023,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	subi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
@@ -1190,30 +1168,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 
-	/*
-	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
-	 * system_reset_common)
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
@@ -2815,17 +2774,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY soft_nmi
 
-	/*
-	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
-	 * system_reset_common)
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 
@@ -2833,14 +2781,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	li	r9,0
 	mtmsrd	r9,1
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
-- 
2.23.0


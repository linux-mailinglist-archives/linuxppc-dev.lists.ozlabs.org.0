Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F872F8453
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:27:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHV5z540hzDscG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fp0JEOw8; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHS0C0PPXzDsj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:52:27 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 30so6360082pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89l14hpbJ580UjyEPYkdK6iLo+0WECGV15d5/HxlPdM=;
 b=fp0JEOw8b87wVAdBIKSLiV8sLn2akmbyhYCCDwVzyEcM0EiudxOsXrQakzOMwf4j8d
 3TMtNR6hq2an04CT8z5LKQvtw5+LZzAZmA2KB/nmBjblNAfy4/6DUZRzI46JkBO1ohu9
 zVq+Wk8yQutAdFgBfjzg9HAQDEm/VJ2Z3ycGDP2oE/uQPfH1F4t49sPurIZ3yHdT4A1B
 LPgqgwE+2Y/v04lqQvDwmcVKWFX9b3fGXMHPQMamoxggfTal8OogHkG87QjSNSVHp5x9
 kMz0FIGEeJLe+8446v82U5vxgsi3iRH9xppXdkdXxOeHSaDvniSv89+aOjBJ/zer6roH
 Qeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89l14hpbJ580UjyEPYkdK6iLo+0WECGV15d5/HxlPdM=;
 b=WbUgVHg6FP3ZJSzTitJgd3WxpvT9996lRxJyC4dxMX6qSdmtbGzK61dvrHQcOUtfK/
 vPAm/yiApP+YiWgQk9xBUTJFmz8dqf6inVj6Tf9PeEjasNHfGnC2OoBUO4zDERjMbaiw
 anwq9ANaN/o8VO8cHC0j5rx9xy3VtRJNi8d7+1RHw5L6mt/oebYJ7fNojNoz+3r6FZQD
 nSNf0bRFvrp2bK8GG79xTyZ/hm2ug23bQlN4cNU5AUzlcqYGMxbJH32Q+wEJGLOcjcD8
 QOaKqJzAH4AyuFDmhr+ZmWUbBH9spyD5DnI+FtaFlVSLTQ1s66N+9Jqk8MkKAej1vNlg
 0tcw==
X-Gm-Message-State: AOAM533DUbk4NFRV7zCNnwlqDJ/dd9jKV7V/VofRqeTDe4g4T4zRZwOG
 d2ISZooqsB+oGYp2SZWn+N2tNVoBVu0=
X-Google-Smtp-Source: ABdhPJxmSLrbsoq7tth+OF4d42wa08hDGOdgSV+JZhfOm5fLZFF7d1YYMr0zr3fZnare4A0FLaSKzQ==
X-Received: by 2002:a62:d5:0:b029:1b4:144c:f217 with SMTP id
 204-20020a6200d50000b02901b4144cf217mr2503535pfa.13.1610729544677; 
 Fri, 15 Jan 2021 08:52:24 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:52:24 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 37/39] powerpc/64s: move NMI soft-mask handling to C
Date: Sat, 16 Jan 2021 02:50:10 +1000
Message-Id: <20210115165012.1260253-38-npiggin@gmail.com>
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

Saving and restoring soft-mask state can now be done in C using the
interrupt handler wrapper functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 26 ++++++++++++
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 2 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 879a0b2705d6..5f4e304a98d9 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -95,6 +95,10 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 
 struct interrupt_nmi_state {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+#endif
 	u8 ftrace_enabled;
 #endif
 };
@@ -102,6 +106,21 @@ struct interrupt_nmi_state {
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
@@ -125,6 +144,13 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
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
index 94b89ea123f3..2fca2bad6b02 100644
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
@@ -2818,17 +2777,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
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
 
@@ -2836,14 +2784,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
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


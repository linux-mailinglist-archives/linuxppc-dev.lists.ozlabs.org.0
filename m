Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B82C6FBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:09:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvzK0QbyzDrSr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:09:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cZZZSa+j; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMp1HhpzDsPb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:58 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id w4so6594881pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MoHEdWT/5r4IEmXHnEbBhIw2fC3448bwrowA9zN0RfE=;
 b=cZZZSa+jd2cL2bQqMDb4RDPtkI3hb4KxosWMauxPukYe4yydDrT518JwBIjZOFgWXU
 DqZ+VMCVnxjC1uoIWv0RRCyv1H1CMwppPaMhgyrI3zBHOruw6JGM77VYVtQvDbvXD8Ps
 rmyg2E9ivSDUQB5xqu3MbEarX2njE3UUnmj4RK7ont5Ilx02GXMvXLE5d5WinQ5Owi8t
 E34Yf26n9bDTES7CyHI5D49s+f5IbhXxLByoWM5tr7aVcAfnjdmHz5OlhcsVKF1eqfSX
 3MvNLjEa7jYEF+6cXfrCKEagHut62dQvazrcakFkgRotVXsTZBBCbHDAF2hyjk6UMcQu
 SSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MoHEdWT/5r4IEmXHnEbBhIw2fC3448bwrowA9zN0RfE=;
 b=t7bAoJTcIj7xgBWQhUabh7P+/aDfjNuU0ZI7n7JCrTY7ki7haGtsPJR88rzqObBthw
 0fkZ06VJxP+wyDScA1XhzryT94Ue9X4gyWFE/dFEqA74sJkMMd87ILgkhFuUc4wsfq3H
 maY82sEfUBJ0OspHkcMEIaD0sQPIDVLlsRsh8LdgotgO922A5SAiFnRrMjGlCpkEKDHV
 34vGO75zw7rekrVs+7Rb95Mz6u34Xkls4AfFILeTUh5UX1adaHmo6KJieg79EOTHz+Pi
 apkJDmbHruOK1Zr9WhVyZw2uNLwqyfxG9qYYknP3hhqFQ1/xh2cH3AZwyEWUeijLuD4c
 fXxQ==
X-Gm-Message-State: AOAM532jKaotXM79lj44NMKyjpOCADErJvXZf+ayIxKhAcQFzJAyWsO9
 L6zXSUSYdRhA5zswslYBwpoSZ7BopOE=
X-Google-Smtp-Source: ABdhPJxQnCmANOdtUfY/lheTca37NQbu3BbVOHZ81jvpZ/Z9G0hdC7XPJhXP0YrOzTfopbfcaiCebg==
X-Received: by 2002:a62:7596:0:b029:197:de7a:b7a7 with SMTP id
 q144-20020a6275960000b0290197de7ab7a7mr11752137pfc.74.1606574515302; 
 Sat, 28 Nov 2020 06:41:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/19] powerpc/64: entry cpu time accounting in C
Date: Sun, 29 Nov 2020 00:41:10 +1000
Message-Id: <20201128144114.944000-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/ppc_asm.h   | 24 ------------------------
 arch/powerpc/kernel/exceptions-64e.S |  1 -
 arch/powerpc/kernel/exceptions-64s.S |  5 -----
 4 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index c31fa26b3f60..26aa897d251b 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -4,6 +4,7 @@
 
 #include <linux/context_tracking.h>
 #include <linux/hardirq.h>
+#include <asm/cputime.h>
 #include <asm/ftrace.h>
 
 struct interrupt_state {
@@ -25,6 +26,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
+
+		account_cpu_user_entry();
+		account_stolen_time();
 	} else {
 		/*
 		 * CT_WARN_ON comes here via program_check_exception,
@@ -38,6 +42,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #ifdef CONFIG_PPC_BOOK3E_64
 	state->ctx_state = exception_enter();
 #endif
+
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) && user_mode(regs))
+		account_cpu_user_entry();
 }
 
 /*
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 511786f0e40d..c1199f6c75a3 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -25,7 +25,6 @@
 #ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 #define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)
 #define ACCOUNT_CPU_USER_EXIT(ptr, ra, rb)
-#define ACCOUNT_STOLEN_TIME
 #else
 #define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)				\
 	MFTB(ra);			/* get timebase */		\
@@ -44,29 +43,6 @@
 	PPC_LL	ra, ACCOUNT_SYSTEM_TIME(ptr);				\
 	add	ra,ra,rb;		/* add on to system time */	\
 	PPC_STL	ra, ACCOUNT_SYSTEM_TIME(ptr)
-
-#ifdef CONFIG_PPC_SPLPAR
-#define ACCOUNT_STOLEN_TIME						\
-BEGIN_FW_FTR_SECTION;							\
-	beq	33f;							\
-	/* from user - see if there are any DTL entries to process */	\
-	ld	r10,PACALPPACAPTR(r13);	/* get ptr to VPA */		\
-	ld	r11,PACA_DTL_RIDX(r13);	/* get log read index */	\
-	addi	r10,r10,LPPACA_DTLIDX;					\
-	LDX_BE	r10,0,r10;		/* get log write index */	\
-	cmpd	cr1,r11,r10;						\
-	beq+	cr1,33f;						\
-	bl	accumulate_stolen_time;				\
-	ld	r12,_MSR(r1);						\
-	andi.	r10,r12,MSR_PR;		/* Restore cr0 (coming from user) */ \
-33:									\
-END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
-
-#else  /* CONFIG_PPC_SPLPAR */
-#define ACCOUNT_STOLEN_TIME
-
-#endif /* CONFIG_PPC_SPLPAR */
-
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index dc728bb1c89a..e6b5a362fc91 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -398,7 +398,6 @@ exc_##n##_common:							    \
 	std	r10,_NIP(r1);		/* save SRR0 to stackframe */	    \
 	std	r11,_MSR(r1);		/* save SRR1 to stackframe */	    \
 	beq	2f;			/* if from kernel mode */	    \
-	ACCOUNT_CPU_USER_ENTRY(r13,r10,r11);/* accounting (uses cr0+eq) */  \
 2:	ld	r3,excf+EX_R10(r13);	/* get back r10 */		    \
 	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
 	mfspr	r5,scratch;		/* get back r13 */		    \
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 647b7743bc9c..2b447dd15d4c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -577,7 +577,6 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
 	beq	101f			/* if from kernel mode		*/
-	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
 BEGIN_FTR_SECTION
 	ld	r9,IAREA+EX_PPR(r13)	/* Read PPR from paca		*/
 	std	r9,_PPR(r1)
@@ -645,10 +644,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r11,exception_marker@toc(r2)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
-
-	.if ISTACK
-	ACCOUNT_STOLEN_TIME
-	.endif
 .endm
 
 /*
-- 
2.23.0


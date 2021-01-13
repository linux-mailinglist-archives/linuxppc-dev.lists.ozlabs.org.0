Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3512F45DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:13:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0Z15PPhzDrdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g1KyYUhd; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgk6xKkzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:33:06 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id i5so966985pgo.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Vg1/Fcdugp//hDDh7FdNlSdsa43X+a2/Kou+6Evcdk=;
 b=g1KyYUhdHv9b/Xn9QEr0odhHNpFhh4s8hZeVuZzmO7gzjZoeH9kjiDa9KKG2HhIRdY
 5Dtzc8Qy6jrrJZ2MtzNjntiG3lJnO+tLSi9OsDzbi/yLJJpBi2wTqBeVZb7QlHjgIkeK
 rULvU3Y6ftw/opG2ZjFn6lFZykXhR6jiMMObond69C66/arCijiFqsn+1wzK2oOZ0mXl
 E2nqNNFU9s8zol0vuLtr35JyZfVJNJjmRmolxERtg89DR978CUrXl+oGFVvq0rsKESLI
 IhGZ6qXFivCsIvWlU045PqopH2H9ClbUwQdzO0sAddO2lJxsoo+bUQaFwFvIQdlE3Ouu
 G6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Vg1/Fcdugp//hDDh7FdNlSdsa43X+a2/Kou+6Evcdk=;
 b=TdSZaULUZ59shayM9//hDr4uK1ofc1H98CQjaHBbnRqvK6X9oSU70ql5E0da7gq6u8
 JDtoElezzu+j5MVLOChs6qywGF7xZK+2857X4mpX6wq9orNw0XyNk67MazKRAu5ziMCr
 i3WO1J8jhaUufUuEtxZTZ+8vxaFan6DtP/aou9N87sNsDu+cyRRRp+sDFlrblsX44sOw
 zqwhB/Bld9eu4RQbd9y7h1GTnCuchkQilcX6OD0u8UM6U2GYFTRtTyJfmaCeMhKrb1JN
 xP9NGCUrMmHet8gECbO+tjx9nSb9WBw7nKm4h9fOTV97aJOkvhMu4W28SyEc5Dropkea
 Iwxg==
X-Gm-Message-State: AOAM533t2DXtmoOlxTPIODECI6dOxVqvBed4m2+iC0IM0+5qzFVpJ8PA
 uCEWsSar6WdlEZwZvkcTuEb+RI7kays=
X-Google-Smtp-Source: ABdhPJyf4oIr9CFBix1pSnaWx0g62W7SiteZtaS00ql2Zi2WwbCV//Uf4AN8RRXUIZA13YPp731dyA==
X-Received: by 2002:a63:e101:: with SMTP id z1mr928254pgh.190.1610523183734;
 Tue, 12 Jan 2021 23:33:03 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:33:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 17/21] powerpc/64: entry cpu time accounting in C
Date: Wed, 13 Jan 2021 17:32:11 +1000
Message-Id: <20210113073215.516986-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
index 6eba7c489753..e278dffe7657 100644
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
index cc1bca571332..3dceb64fc9af 100644
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
index 52421042a020..87b3e74ded41 100644
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
index df4ee073386b..68505e35bcf7 100644
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


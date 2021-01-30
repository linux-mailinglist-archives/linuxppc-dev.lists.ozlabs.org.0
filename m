Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4B3095FC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:43:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScQH2ZnYzDrfR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NcrRn2xi; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZN23jy0zDrVB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:14 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id y10so2840027plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4GYSFYy3ZxB1LF9hQURkHzDzzUpZrxxunGUTb0Dybw=;
 b=NcrRn2xiHlZ8Z3H5s+zsCGCKTlcm+Qhs5g4H85C4+wsUCChmBdNiNIWmz5lTfNdgzU
 NfZQ8eQKEMi5cyn4FoRuSk8TmKS269h1bkL7pOcrNul8JTALtckCZdxf1uGlfURvBjOM
 EHlyeDTYBPgQAEDZyOcG4xFRTtgGgwDN8P+BDD2A6kBF8gHMMA4N33/XGUI+WUaeLQr1
 w+uebLK/yd0PZD5PxW2Xg3mTOIel/W9af7K55ioOyTDeOFFFEVyXPm/mCaVN6sT0LGci
 L9kFMha7rrAMte6pwsadxRwYZirXXEChWw/u/4VV/euGPSypX9dAbw+wVcCpCnMMDCG0
 RbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z4GYSFYy3ZxB1LF9hQURkHzDzzUpZrxxunGUTb0Dybw=;
 b=BpBGD8aRl24vXD2rZ6WG6Fthlp8/7qHI4nFdbNvJgFv+av+fogCEjQ/Ns8zH2CC8Ah
 q4dFQW6abb+MtXAvMm+14eNcdI8yhsotG+sG4mzbjK+7fvTd44WZ7vmfQ1TOyUtGwf8A
 Ue9iRmUoT1YhvitE8bYm3zaa4QlHnzDXCBrq8h8Xryjy52rS94PCztp7FmuJmvJvm+iq
 TYHr8KdeA0AILiW4Nvhrml9FFxf+v41ib5/VaPE/YJYVxirLOXXOU3ZbUcMmvkkOyLMl
 dM7mLxayiywmzT5qPvQXW1rF9Xw8ngpJUFgqIkR5lg52QgKq/Whw7+hD7ZDR+2Y26Xaw
 ddKQ==
X-Gm-Message-State: AOAM533e9ebIH+4fcoPzMOXLvKRx9j51P14oo0ryl1xrk1DlR+bFM7Mf
 odlvzUnhaSHOsySoSUw9Rf4ArlSMlMI=
X-Google-Smtp-Source: ABdhPJxSGikoicSzIhK7DeSSIffWJ8baV5cU0Yk1hI07WqF830ueLBvJMM+zBmW9bUj78RvjmgERsw==
X-Received: by 2002:a17:902:fe08:b029:de:36a1:9f12 with SMTP id
 g8-20020a170902fe08b02900de36a19f12mr9807195plj.30.1612012271594; 
 Sat, 30 Jan 2021 05:11:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 38/42] powerpc/64: entry cpu time accounting in C
Date: Sat, 30 Jan 2021 23:08:48 +1000
Message-Id: <20210130130852.2952424-39-npiggin@gmail.com>
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

There is no need for this to be in asm, use the new interrupt entry wrapper.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  6 ++++++
 arch/powerpc/include/asm/ppc_asm.h   | 24 ------------------------
 arch/powerpc/kernel/exceptions-64e.S |  1 -
 arch/powerpc/kernel/exceptions-64s.S |  5 -----
 4 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index e96d215f518a..ca8e08b18a16 100644
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
@@ -37,6 +41,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 
 #ifdef CONFIG_PPC_BOOK3E_64
 	state->ctx_state = exception_enter();
+	if (user_mode(regs))
+		account_cpu_user_entry();
 #endif
 }
 
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
index 003999c7836c..e8eb9992a270 100644
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
index 39630b3f78b0..94b89ea123f3 100644
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


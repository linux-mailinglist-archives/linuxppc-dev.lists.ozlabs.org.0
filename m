Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E9C25E99F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:09:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkMyS6hsjzDqfF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 04:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LtW+ZXjG; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNm0tRqzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:44:07 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w186so5960444pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Maxc3HQ2zKgrD5Kbi8a8dUbz9ZEcSORO0sCsLvE5GUo=;
 b=LtW+ZXjGNzoH7dqKS/01RXwwedKGVZp0EFXJyvJiqfrbAJh/lnAxzuRdcoHmA9VEpL
 +oU74L7Neei79BNnR6VSE6V1dbptm+5Qphry9LlgeMv+3CId1b36hLXUOnEyED/omHy0
 V76SXbALgW5GWPdivIBChDSsm1YRvVAsVnkcbMt520kSCAKDF6U2xOeZDU8S8advKCDo
 lUe/TSaTQjce8ZFJrrn0DIcqNuiOiPqpxUIAW6/LNm0rthswZ5dc/jVp0BWIMWf+fEnQ
 3d5DXtGoupYcyyuappu2aZe87WCxO9zDVBAvZQ9eBHFByAUH3sLrVT6ZuPAuuTbb1n5J
 5Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Maxc3HQ2zKgrD5Kbi8a8dUbz9ZEcSORO0sCsLvE5GUo=;
 b=mfIljPr31OL0/mDouoCKktpScMEsh2FfNtAJZLRyLpgn/KQHwaxylvNpRQaOc+1ora
 NQigRwGZJt0VXKFEIifth6mMy2dAr+NCamRlSOE+TfJP0QzChbrcynla1oZ9Wb+93bXc
 HKsBRrmCnUBCOMn17NVMpECV90JSP7ZGOeTO5bCCTb0IIIYYamNTAemLLjM5yUd7i+9v
 jPT7k3QASA4eDqTsrfnriiEj5J/dWEau4XyRReUhyOJu5WmJk1aectnN1EOkiH4dQzh5
 hWHCCzfkQEtvEYWcJMakmiz+mVFiZCpWJqV5+nKHpoaW9TMSNlxS8Z3cvOkqDUMCjGVx
 w/hw==
X-Gm-Message-State: AOAM530P8umZ9SLNhiYRw2bqSFW/6SkoZduNqbKrQKy0VKd95jQH9mxW
 NzM6ftvFMlmEy9fE/ayVp2A=
X-Google-Smtp-Source: ABdhPJyE08FcVL07gcZvJfk2HAeN6Xd1AvdXSKradhy3IOHsqlURZSYL5yuufpD0p6DrU3GhoCXVMA==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr10286949pgg.123.1599327845547; 
 Sat, 05 Sep 2020 10:44:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:44:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 08/12] powerpc/64: entry cpu time accounting in C
Date: Sun,  6 Sep 2020 03:43:31 +1000
Message-Id: <20200905174335.3161229-9-npiggin@gmail.com>
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
 arch/powerpc/include/asm/interrupt.h |  4 ++++
 arch/powerpc/include/asm/ppc_asm.h   | 24 ------------------------
 arch/powerpc/kernel/exceptions-64e.S |  1 -
 arch/powerpc/kernel/exceptions-64s.S |  5 -----
 4 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 511b3304722b..83fe1d64cf23 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -4,6 +4,7 @@
 
 #include <linux/context_tracking.h>
 #include <linux/hardirq.h>
+#include <asm/cputime.h>
 #include <asm/ftrace.h>
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -16,6 +17,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
 		user_exit_irqoff();
+
+		account_cpu_user_entry();
+		account_stolen_time();
 	} else {
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 	}
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index b4cc6608131c..a363c9220ce3 100644
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
index 5988d61783b5..7a9db1a30e82 100644
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
index b36247ad1f64..121a55c87c02 100644
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


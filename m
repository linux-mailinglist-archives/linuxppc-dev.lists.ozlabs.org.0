Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3B2E876F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 14:16:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MqW5f77zDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 00:16:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PZmwCeKj; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7Lhy70G5zDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:26:10 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id z12so7147092pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kvmYJftH5cZTZ8nIj8KJCNRdHKsOtD9t58PDCh76PRA=;
 b=PZmwCeKjL7n/HyexvXWWx9d6Z+uKCsP7kybgYOPrA+YwpOI/N4sDePRvVCH2F1f/kD
 HK/RUhWssvtPsyV3XkeGIcrSQBsBz8T1xqBC0+oUUA5xNXWSLV0U0Ip3KOgzb5W8ZxeC
 oivOBKtzR9kxSUoxelH+bqhAEzrcuuQF+09CnJWHa53/iOhZW80YZm4Wm8FOi9gPGGtJ
 nxhGVo5rXud1Ce19qFFa5/PlGeTf2/x13xMTDS17hUmx43EnxyPyjc1mOGgimUgzeuon
 pe4nbBuJr1EC4gdN/sca62WYfYJ/tC41fQ5neOlDzPKd8jIQsevNXPzfcrVKJh9Acl1z
 lmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kvmYJftH5cZTZ8nIj8KJCNRdHKsOtD9t58PDCh76PRA=;
 b=uPaRxNAySyOdGj/N9Irg5EXmHSD8mtm9etEq2pBRgen1DrJp9Jyx2FLEDeWwyqsih1
 PwYNzHkARs7le2ggsTiK9il8bnGVap53eb8m+kWdeqMW/vI8GvFJSWtVib5iUHAmEBkj
 FsbvGrroTmJUDplveTssRUxed1Ag9J7D0s0Z3iwz9cVjKMuRRp2/s4vefh2+uTvtZgIL
 N8hVRP1eezkiyDjfEQ1YHNKu7Jtk4M1aYXNPFPRfa5/2MTUenwGUNuVKRLTbiYwm1Qyu
 7OMK73LJ2mYOhSfmQFKoZ3eAr7Nn14ifAkHuJpzPBT2uWmFHsYSQ84HI7GP96tBItwdk
 JlKQ==
X-Gm-Message-State: AOAM530wpusXDQJo+hDPArrt0UreQWj2a+Glp0hjWKtjIjrybn+OeKpG
 3YNRfpfeR2mO/zLwR4oOViym8WO40DI=
X-Google-Smtp-Source: ABdhPJyBxZIqUWrl37EmU1aZNFAVSN6WYHnmffgMIwdLI+GuOGPQfwTksA9a0KU4TuRsqlBbLvrevw==
X-Received: by 2002:a17:90b:a4a:: with SMTP id
 gw10mr21343350pjb.29.1609590368878; 
 Sat, 02 Jan 2021 04:26:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:26:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 17/21] powerpc/64: entry cpu time accounting in C
Date: Sat,  2 Jan 2021 22:25:04 +1000
Message-Id: <20210102122508.1950592-18-npiggin@gmail.com>
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
index 398194711713..e6e61c6f7298 100644
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


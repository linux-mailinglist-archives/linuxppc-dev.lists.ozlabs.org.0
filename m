Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E633D063
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:09:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYM26t65zDqdx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bre6oDSZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZD1LGmzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:12 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id a186so7558913pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9RFRLenajmpQnbPM8EMYF2tEMdujrVNvJljZRvgjsA=;
 b=bre6oDSZY50opAeXeBW24mThh31/vVpgOl2/wSm++HOQdM049EccBEmQY9gJKtCHOs
 Km+zuT+DOvqOH2d7/AbFBZ5ZWRIe6VFhBrwTNMUsUS1/0UqzkqsjRjccf80v08tQC+r2
 JQD3rLmh6bE87QqfA2BnLsvUiXwVdtfoEEOi5/Jgf3WfzOaJyzwy9fWXXMMDojG1L21l
 BqFC2v54OBFI7DpRr0R7BMyYdFJaxidHllI0KznuCk19nXeOPRy88LFuYBBrGNt7Wkxo
 UtI+IlFj8owYZafRlORa3sTmlaavVfXkK6R7azwG/bK0u0TaRRBpcxuef0bef/9S4prG
 YthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9RFRLenajmpQnbPM8EMYF2tEMdujrVNvJljZRvgjsA=;
 b=W4BHNgQ9VUXaQOjYtDvMcLkN8YqINyZDhf1mPWTvBwCKeFMY8iGgY6Evh/LJD53Jmi
 U9X4oFkwFy5LRh6rT0HSlwZKxWflH2+FkqVktiLckfSXVXBrk8Ddi+hXMehfALoYe5Gr
 P4jB/OevwBv/Wc08ZIj8wXuy+TfOhc3agGAJbQzmY97b1TRwNxjZHInxbVU/LukoHc1h
 B8C2g0Syp7HnoWkc1GVZ59Pq3bpt7MkvXKBsyCalFMQh3bPAOYGebhsgSmAQVJq5ADfk
 63nnCkgyTMh1xMVBPBw6Fmdoi0efkmaRqokgc6C2eiTYmjk2jPCyOocyJYArgrQms3Y0
 Mg1Q==
X-Gm-Message-State: APjAAAWbKw/natB0QsV5mfLfmkKQMj3uIxNUpsl2rHVG19v8/D2iWvPf
 tq45qmLU1s1cObNtu8gLumk6Kc5T
X-Google-Smtp-Source: APXvYqx4rGYJ2Cz4A6PcIH4k2Yn1T4MOyaqaV6jcX0TP+D/yqYfqDyRvC8pgUXBBvxEBOntDHW7V0w==
X-Received: by 2002:a65:64d5:: with SMTP id t21mr21055976pgv.310.1560263646747; 
 Tue, 11 Jun 2019 07:34:06 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/28] powerpc/64s/exception: Move EXCEPTION_COMMON handler
 and return branches into callers
Date: Wed, 12 Jun 2019 00:30:23 +1000
Message-Id: <20190611143040.7834-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

The aim is to reduce the amount of indirection it takes to get through
the exception handler macros, particularly where it provides little
code sharing.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 26 ++++++++++++------------
 arch/powerpc/kernel/exceptions-64s.S     | 21 +++++++++++--------
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index f19c2391cc36..cc65e87cff2f 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -658,31 +658,28 @@ BEGIN_FTR_SECTION				\
 	beql	ppc64_runlatch_on_trampoline;	\
 END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
 
-#define EXCEPTION_COMMON(area, trap, label, hdlr, ret, additions) \
+#define EXCEPTION_COMMON(area, trap, label, additions)		\
 	EXCEPTION_PROLOG_COMMON(trap, area);			\
 	/* Volatile regs are potentially clobbered here */	\
-	additions;						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
-	bl	hdlr;						\
-	b	ret
+	additions
 
 /*
  * Exception where stack is already set in r1, r1 is saved in r10, and it
  * continues rather than returns.
  */
-#define EXCEPTION_COMMON_NORET_STACK(area, trap, label, hdlr, additions) \
+#define EXCEPTION_COMMON_NORET_STACK(area, trap, label, additions) \
 	EXCEPTION_PROLOG_COMMON_1();				\
 	kuap_save_amr_and_lock r9, r10, cr1;			\
 	EXCEPTION_PROLOG_COMMON_2(area);			\
 	EXCEPTION_PROLOG_COMMON_3(trap);			\
 	/* Volatile regs are potentially clobbered here */	\
-	additions;						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
-	bl	hdlr
+	additions
 
 #define STD_EXCEPTION_COMMON(trap, label, hdlr)			\
-	EXCEPTION_COMMON(PACA_EXGEN, trap, label, hdlr,		\
-		ret_from_except, ADD_NVGPRS;ADD_RECONCILE)
+	EXCEPTION_COMMON(PACA_EXGEN, trap, label, ADD_NVGPRS;ADD_RECONCILE); \
+	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
+	bl	hdlr;						\
+	b	ret_from_except
 
 /*
  * Like STD_EXCEPTION_COMMON, but for exceptions that can occur
@@ -690,8 +687,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_CTRL)
  * (finish nap and runlatch)
  */
 #define STD_EXCEPTION_COMMON_ASYNC(trap, label, hdlr)		\
-	EXCEPTION_COMMON(PACA_EXGEN, trap, label, hdlr,		\
-		ret_from_except_lite, FINISH_NAP;ADD_RECONCILE;RUNLATCH_ON)
+	EXCEPTION_COMMON(PACA_EXGEN, trap, label,		\
+		FINISH_NAP;ADD_RECONCILE;RUNLATCH_ON);		\
+	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
+	bl	hdlr;						\
+	b	ret_from_except_lite
 
 /*
  * When the idle code in power4_idle puts the CPU into NAP mode,
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 88f892167a64..63b161c23e9e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -195,9 +195,10 @@ EXC_COMMON_BEGIN(system_reset_common)
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_NORET_STACK(PACA_EXNMI, 0x100,
-			system_reset, system_reset_exception,
-			ADD_NVGPRS;ADD_RECONCILE_NMI)
+	EXCEPTION_COMMON_NORET_STACK(PACA_EXNMI, 0x100, system_reset,
+					ADD_NVGPRS;ADD_RECONCILE_NMI)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	system_reset_exception
 
 	/* This (and MCE) can be simplified with mtmsrd L=1 */
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
@@ -1171,8 +1172,11 @@ hmi_exception_after_realmode:
 	b	tramp_real_hmi_exception
 
 EXC_COMMON_BEGIN(hmi_exception_common)
-EXCEPTION_COMMON(PACA_EXGEN, 0xe60, hmi_exception_common, handle_hmi_exception,
-        ret_from_except, FINISH_NAP;ADD_NVGPRS;ADD_RECONCILE;RUNLATCH_ON)
+EXCEPTION_COMMON(PACA_EXGEN, 0xe60, hmi_exception_common,
+			FINISH_NAP;ADD_NVGPRS;ADD_RECONCILE;RUNLATCH_ON)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	handle_hmi_exception
+	b	ret_from_except
 
 EXC_REAL_OOL_MASKABLE_HV(h_doorbell, 0xe80, 0x20, IRQS_DISABLED)
 EXC_VIRT_OOL_MASKABLE_HV(h_doorbell, 0x4e80, 0x20, 0xe80, IRQS_DISABLED)
@@ -1467,9 +1471,10 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	EXCEPTION_COMMON_NORET_STACK(PACA_EXGEN, 0x900,
-			system_reset, soft_nmi_interrupt,
-			ADD_NVGPRS;ADD_RECONCILE)
+	EXCEPTION_COMMON_NORET_STACK(PACA_EXGEN, 0x900, system_reset,
+					ADD_NVGPRS;ADD_RECONCILE)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	soft_nmi_interrupt
 	b	ret_from_except
 
 #else /* CONFIG_PPC_WATCHDOG */
-- 
2.20.1


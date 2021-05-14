Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D14380300
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 06:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhG725195z30Cc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 14:40:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dWeGVJ2Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dWeGVJ2Z; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhG6W5zkTz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 14:40:18 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id c13so10387507pfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 21:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54nqq7bWtTZ2Y5ii/11Dt+2leHYMnXYmRNWPQ+CdT9I=;
 b=dWeGVJ2ZUWd+KeM8V0m8eb/Qr7Jokd8uqkvJ37hOCtMx4hnRurWXdmi3ZV15C9ksyw
 umFmh8sBDr1BYB3apQqFf6kHRTk9/Q0S2MyCuR8+IqmyHsLBM5uxyiYRA0YdrRGwJaOH
 0hwyRDZLFeYqwqC8qjCELGSmS1NIi41L2bkcrG890Cj48W+ePXftH6kymInGgGRc2ybm
 AVCo0wpzDWw2JyP5uo42nwuPfwDUZCgASwf/PXZ/mG1b0j6/RtZT3KNzVaqotQvWF9nT
 dpuAwtGOIdNQuYKE9MnUf7smkTBF8WGsbLkqdEGLGaA0iP+5iBpVra6yUwmXVHIVK6DV
 sCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=54nqq7bWtTZ2Y5ii/11Dt+2leHYMnXYmRNWPQ+CdT9I=;
 b=th26oLfl7ay2YbBrqWLkCoA144IZu0Bmdj78QlKLCh0lmn2zLPH6cU4CZuAOY3GliH
 vdrTrX/JEXmUaGerlwgQL8JtXR9K6ZhoipkC7HcAbT7w5x2+F798FXg09awigOWOCSdn
 upps2v7VkiNaE5NQ0p1HWACBo0GNpg/t/sp9v1A47MOfmgkbPIAanoaxd3GPJx7R4SCy
 6ZOfBvUeE9clM2eTk49aCJJr9wDw4xU+0iwCor3H+OzZOJ7Rv5LFUOptgm16P9cX9v0G
 oJOWMDlYhBmqWeAhnPRDUYrB/6ichsPx2tAY5f6Cxk8lcTsTb6NJFbzaF+FSpVnH7z9N
 22AA==
X-Gm-Message-State: AOAM532aiHMYYgYI0KqXSLR3+HvE5SYu5LtouoKsiNduXvR59ve+OTmD
 iDHC6UkTFYZENKiQDSC9Xlga8lWOm0Y=
X-Google-Smtp-Source: ABdhPJyJZulr7OtlWjw/du+g9rZ+O7gO+SqWHVjRUXWzZ8rrI/gSiNvw/x5iyAA+6S5U2PNcx6IjRA==
X-Received: by 2002:a05:6a00:2163:b029:216:deaa:e386 with SMTP id
 r3-20020a056a002163b0290216deaae386mr43798744pff.72.1620967216148; 
 Thu, 13 May 2021 21:40:16 -0700 (PDT)
Received: from bobo.ibm.com (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id a7sm3046281pfo.211.2021.05.13.21.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:40:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64e/interrupt: fix nvgprs being clobbered
Date: Fri, 14 May 2021 14:40:08 +1000
Message-Id: <20210514044008.1955783-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some interrupt handlers have an "extra" that saves 1 or 2 registers
(r14, r15) in the paca save area and makes them available to use by the
handler.

The change to always save nvgprs in exception handlers lead to some
interrupt handlers saving those scratch r14 / r15 registers into the
interrupt frame's GPR saves, which get restored on interrupt exit.

Fix this by always reloading those scratch registers from paca before the
EXCEPTION_COMMON that saves nvgprs.

Fixes: 4228b2c3d20e ("powerpc/64e/interrupt: always save nvgprs on interrupt")
Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 38 ++++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 7c3654b0d0f4..f1ae710274bc 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -340,6 +340,12 @@ ret_from_mc_except:
 	andi.	r10,r10,IRQS_DISABLED;	/* yes -> go out of line */ \
 	bne	masked_interrupt_book3e_##n
 
+/*
+ * Additional regs must be re-loaded from paca before EXCEPTION_COMMON* is
+ * called, because that does SAVE_NVGPRS which must see the original register
+ * values, otherwise the scratch values might be restored when exiting the
+ * interrupt.
+ */
 #define PROLOG_ADDITION_2REGS_GEN(n)					    \
 	std	r14,PACA_EXGEN+EX_R14(r13);				    \
 	std	r15,PACA_EXGEN+EX_R15(r13)
@@ -535,6 +541,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x300)
 	b	storage_fault_common
 
@@ -544,6 +554,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	li	r15,0
 	mr	r14,r10
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x400)
 	b	storage_fault_common
 
@@ -557,6 +571,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x600)
 	b	alignment_more	/* no room, go out of line */
 
@@ -565,10 +583,10 @@ __end_interrupts:
 	NORMAL_EXCEPTION_PROLOG(0x700, BOOKE_INTERRUPT_PROGRAM,
 				PROLOG_ADDITION_1REG)
 	mfspr	r14,SPRN_ESR
-	EXCEPTION_COMMON(0x700)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
+	EXCEPTION_COMMON(0x700)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -725,11 +743,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	 * normal exception
 	 */
 	mfspr	r14,SPRN_DBSR
-	EXCEPTION_COMMON_CRIT(0xd00)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
+	EXCEPTION_COMMON_CRIT(0xd00)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -796,11 +814,11 @@ kernel_dbg_exc:
 	 * normal exception
 	 */
 	mfspr	r14,SPRN_DBSR
-	EXCEPTION_COMMON_DBG(0xd08)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
+	EXCEPTION_COMMON_DBG(0xd08)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -931,11 +949,7 @@ masked_interrupt_book3e_0x2c0:
  * original values stashed away in the PACA
  */
 storage_fault_common:
-	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r14,PACA_EXGEN+EX_R14(r13)
-	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
 	b	interrupt_return
 
@@ -944,11 +958,7 @@ storage_fault_common:
  * continues here.
  */
 alignment_more:
-	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r14,PACA_EXGEN+EX_R14(r13)
-	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
-- 
2.23.0


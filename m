Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE5A81F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:15:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NjTL5ZDGzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cnPUXsRP"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj324VDczDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:30 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d10so6571836pgo.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+s15OQUaPYrpo2piMduDPIfEV2A80OKvMTr2eLtwuU=;
 b=cnPUXsRPFyZxkcububXazBA1CFUspxF2VmOpTzrHCtAr3E55EM488PUbHhkFKRgVaE
 SDCreoZoxo2a22uNODv/se3f1y/9iJdxnFetLcY0tRvYdOFM8Y5roRmRAACu6h8JkZZU
 ziEwz6dnnrMgMN4/9ffsaMPDl3XBVsxVX45yeeUC5ObgzstHm16LgeHBLw7llJXwaLD3
 cCA+jmODHJYDYw55Sa5GpSo36MmJ+AqQIG2tbThFvEu93oij3pNfbmGy6Hp8kyAkYEeL
 F2a75J/WWyTmyCyS4WLiIpCV20w+R0hSvGIfd7gCDPr8sCSdh1ZT7mGE41tkuG5KOwc3
 VbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+s15OQUaPYrpo2piMduDPIfEV2A80OKvMTr2eLtwuU=;
 b=P1nnisYs9yw51aOKrR0V2JF4MyetFwkd3DeASHpIn9T5Cc1N55P54MU8v6rKTc7KKo
 pSF3Wlcq3zGZtzLpGh729RTL9ng7kBkpUY737CpJ+8JA8mYWjedYaXV2UWJn/k3phrqi
 IF+rlK7Oia3oPOeZm6GTCSZORDgLxX4viIIrTnDfuLzygXvQeBp91ptbnpsg35p+rNQc
 L5ZeDTf65QoVJjFAEn/SIYHIwwPVp3xaily1+qniWUjDSW7xSZ1lkiAunQ4PQijkUjQu
 oDbYtLg0+Q1zrF6mYA3R3F0MmtI9E+1VSoGtVoLaJ9QAXFTUUVGe+o7FIFTxulG+Xp1V
 Qz/Q==
X-Gm-Message-State: APjAAAXDNBb+qAaR5QHRN/iMG0rw7JVYEMW9XA19ZV/rnw2b1fr95faT
 XUBO9E6ag87e3QUdwBO8eBO8LkKM
X-Google-Smtp-Source: APXvYqz2oOcyiBGkaD2VodDiauNyChzaT4mH7huMaxTMnA470UQe1vhkJbWQJZN8DPbWDGWqfJD5MQ==
X-Received: by 2002:a62:1603:: with SMTP id 3mr9446187pfw.0.1567598185700;
 Wed, 04 Sep 2019 04:56:25 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/20] powerpc/64s/exception: Remove old INT_COMMON macro
Date: Wed,  4 Sep 2019 21:55:22 +1000
Message-Id: <20190904115535.18559-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 51 +++++++++++++---------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ba2dcd91aaaf..f318869607db 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -591,8 +591,8 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
  * If stack=0, then the stack is already set in r1, and r1 is saved in r10.
  * PPR save and CPU accounting is not done for the !stack case (XXX why not?)
  */
-.macro INT_COMMON vec, area, stack, kaup, reconcile, dar, dsisr
-	.if \stack
+.macro GEN_COMMON name
+	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
 	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
@@ -609,54 +609,54 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
 
-	.if \stack
-	.if \kaup
+	.if ISTACK
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
 	.endif
 	beq	101f			/* if from kernel mode		*/
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
-	SAVE_PPR(\area, r9)
+	SAVE_PPR(IAREA, r9)
 101:
 	.else
-	.if \kaup
+	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1
 	.endif
 	.endif
 
 	/* Save original regs values from save area to stack frame. */
-	ld	r9,\area+EX_R9(r13)	/* move r9, r10 to stackframe	*/
-	ld	r10,\area+EX_R10(r13)
+	ld	r9,IAREA+EX_R9(r13)	/* move r9, r10 to stackframe	*/
+	ld	r10,IAREA+EX_R10(r13)
 	std	r9,GPR9(r1)
 	std	r10,GPR10(r1)
-	ld	r9,\area+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
-	ld	r10,\area+EX_R12(r13)
-	ld	r11,\area+EX_R13(r13)
+	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
+	ld	r10,IAREA+EX_R12(r13)
+	ld	r11,IAREA+EX_R13(r13)
 	std	r9,GPR11(r1)
 	std	r10,GPR12(r1)
 	std	r11,GPR13(r1)
-	.if \dar
-	.if \dar == 2
+	.if IDAR
+	.if IDAR == 2
 	ld	r10,_NIP(r1)
 	.else
-	ld	r10,\area+EX_DAR(r13)
+	ld	r10,IAREA+EX_DAR(r13)
 	.endif
 	std	r10,_DAR(r1)
 	.endif
-	.if \dsisr
-	.if \dsisr == 2
+	.if IDSISR
+	.if IDSISR == 2
 	ld	r10,_MSR(r1)
 	lis	r11,DSISR_SRR1_MATCH_64S@h
 	and	r10,r10,r11
 	.else
-	lwz	r10,\area+EX_DSISR(r13)
+	lwz	r10,IAREA+EX_DSISR(r13)
 	.endif
 	std	r10,_DSISR(r1)
 	.endif
 BEGIN_FTR_SECTION_NESTED(66)
-	ld	r10,\area+EX_CFAR(r13)
+	ld	r10,IAREA+EX_CFAR(r13)
 	std	r10,ORIG_GPR3(r1)
 END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
-	GET_CTR(r10, \area)
+	GET_CTR(r10, IAREA)
 	std	r10,_CTR(r1)
 	std	r2,GPR2(r1)		/* save r2 in stackframe	*/
 	SAVE_4GPRS(3, r1)		/* save r3 - r6 in stackframe   */
@@ -668,26 +668,22 @@ END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 66)
 	mfspr	r11,SPRN_XER		/* save XER in stackframe	*/
 	std	r10,SOFTE(r1)
 	std	r11,_XER(r1)
-	li	r9,(\vec)+1
+	li	r9,(IVEC)+1
 	std	r9,_TRAP(r1)		/* set trap number		*/
 	li	r10,0
 	ld	r11,exception_marker@toc(r2)
 	std	r10,RESULT(r1)		/* clear regs->result		*/
 	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
 
-	.if \stack
+	.if ISTACK
 	ACCOUNT_STOLEN_TIME
 	.endif
 
-	.if \reconcile
+	.if IRECONCILE
 	RECONCILE_IRQ_STATE(r10, r11)
 	.endif
 .endm
 
-.macro GEN_COMMON name
-	INT_COMMON IVEC, IAREA, ISTACK, IKUAP, IRECONCILE, IDAR, IDSISR
-.endm
-
 /*
  * Restore all registers including H/SRR0/1 saved in a stack frame of a
  * standard exception.
@@ -2400,7 +2396,8 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
-	INT_COMMON 0x900, PACA_EXGEN, 0, 1, 1, 0, 0
+	__ISTACK(decrementer)=0
+	GEN_COMMON decrementer
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-- 
2.22.0


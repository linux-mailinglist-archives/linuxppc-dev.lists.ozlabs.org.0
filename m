Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E051B2D9A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:43:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBwn6czkzF63S
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkj6TlTa"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbj0Jv3zF5r5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:49 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m9so14940855pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WazmI77PqSdHqEhfA3hARSGKN2eeeJPw3yuM6xNjhCk=;
 b=gkj6TlTaOClTopTu4HrKPFS3t6TPcqLnnHP8oJ65XLchDTL5T9aiLn89aeW1Uej4aT
 oGY7VH9UnItzkHp3Y6ne/gxTH+6Gn4fHVUWJEzuD8r8a5ORNTDfY6HWPPTc/TY+hG5MP
 VQRTZqSDzgKEyzNqHVV3ZoSzmLZAsGGDn7cRYPnoKcw5Quu/F0+VWKPVuNwtq33xGY2k
 7O97+Z5X+PBV6pTTCRxzOnsm1lP78M4B/eNC9mKhFMZv8XrRYWlSh/aAkCkVG0YJgESe
 gqzfAx9nkOQoFzXPVs+ChAkD542kib78YfkTKm9s5pDu5R6ueH/1OWSkYOmvKLrCqZcc
 nGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WazmI77PqSdHqEhfA3hARSGKN2eeeJPw3yuM6xNjhCk=;
 b=gWngyue3PQe2dbWatRygKF3KCsEyrF0Ekmq3P+0uDFnyJSnb3z595mUZRCMM6q3u1p
 mLMO4EACGg1YfWAZCSqp3YWm1/HV1NMdAFx7+npMVg+K8iJZjBt2dTr+hPQ//rKo8aHV
 26FRiv3C7liUcTa9083mV/DJXYvEERls0UR0SdQoXcCbia+DOLvyfkSAzR63lKu/7Zr8
 DzH9qVROCHivbzSKkdAyBzUDhFhiOL7MwDxDVMuOjAtpjyL+ognEP5pnVUNWzPncxCf4
 DlEUnmzz4BjkYCojGh+TQc4coBIttXCZqixCw81gzpEcOrEjqxSNZkMXBA2sNKbiEup4
 LZMA==
X-Gm-Message-State: APjAAAV8SRZKxKYglDH9rkLu1rpVwz5pPx5sf7b7KJtXi4Rm7AiPLN5O
 Wwa7EjfgHwgmboy3YveFozjPZy9u
X-Google-Smtp-Source: APXvYqxfhPnDfTMq/3IJRCx+XCxuTDotXnHL13Nckn7Mjbx7ukLR+HSYmdn68y8oIJQMG/9/wWfx+g==
X-Received: by 2002:a17:902:36a:: with SMTP id
 97mr57296499pld.61.1568510926722; 
 Sat, 14 Sep 2019 18:28:46 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 07/27] powerpc/64s/exception: Remove old INT_COMMON macro
Date: Sun, 15 Sep 2019 11:27:53 +1000
Message-Id: <20190915012813.29317-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 245003AB7F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RTK57byz3djx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:55:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O6c53VXX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O6c53VXX; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPY2GB3z3c1S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:45 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso4101025pjp.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=O6c53VXXZXfKhnTg/IxYkgS5jK6CWbqJ45JvtPDD0HrtjGBavqIT6Df2qX4W425VZD
 eLP/NvtmT2+Wh5njK7nkFOrj76PGOwJije3+ng01E3Mn3sTI7wqOmzMrT8sJqIRcPpm0
 T6r0dCCdCQWz7W2iOWw6eH65AaneTwckCkf4nHVsQIDracGPprwmRS5YT0j+iHy9ZT68
 7AzsdxnxZhetHklMpka6mdQyHXftFi37rVdmGGrI57vKHHpk69eM5ADaxqBPvImS7aI1
 fjLIp55aT/DXvNitDft0u9zEMcqKWFEt364t2PRiVKKDez+sHoDaDKiyWKuz/ckVTABq
 SOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=Wo9dH0dDw5kJ2WjfyddMba/LzH0rnxfo7WZk7WL8JKc/6+WmbEU2B0D9Ega3D0rpGe
 IyhDoLWCQnMxpX0Epwf4JYh/U6RaDTv9osYQ/qxLyLvDgHe4LxzWsALYCPyXHMJMIF5M
 qbkJFIWUvfo1zBizI7+1uI6QsQ0D3b1njgrBJB7tGuH9R42AOg1bCP74a6C7Ieg2V78m
 MJiM4wwQgIXKY9ZZ3Us+nmKAw7CSsW6wEjamASpvzDU9psV8ZDn5ruTbyPtesZvmJIHw
 MVKEB7p+vyCRvP2tHFk8rR9oNfUwNiQLolPkg6CzULY24pRYAin4dn64XlP4u66IJrf7
 bz1Q==
X-Gm-Message-State: AOAM532jE/XkOiME48fP29zPSwq6ZUx4Eplj5Wq2xkPxKF/syLcDJQPU
 WjZPnUHDoIVEXl1+UkM/5e1qMXoWhgo=
X-Google-Smtp-Source: ABdhPJyCjsdgnfn+1R+djiVi6YIze/BRT1X3aKyWKDy9YIwdDFRM8yDgxWwFXmI4HWgQ0h+ZNj9jew==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id
 fa21mr6336212pjb.4.1623945102017; 
 Thu, 17 Jun 2021 08:51:42 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/17] powerpc/64s: save one more register in the masked
 interrupt handler
Date: Fri, 18 Jun 2021 01:51:07 +1000
Message-Id: <20210617155116.2167984-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

This frees up one more register (and takes advantage of that to
clean things up a little bit).

This register will be used in the following patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 34 ++++++++++++++++------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b6e1c46c97d0..0ba8c2387aac 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2758,7 +2758,6 @@ INT_DEFINE_END(soft_nmi)
  * and run it entirely with interrupts hard disabled.
  */
 EXC_COMMON_BEGIN(soft_nmi_common)
-	mfspr	r11,SPRN_SRR0
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
@@ -2793,19 +2792,24 @@ masked_Hinterrupt:
 	.else
 masked_interrupt:
 	.endif
-	lbz	r11,PACAIRQHAPPENED(r13)
-	or	r11,r11,r10
-	stb	r11,PACAIRQHAPPENED(r13)
+	stw	r9,PACA_EXGEN+EX_CCR(r13)
+	lbz	r9,PACAIRQHAPPENED(r13)
+	or	r9,r9,r10
+	stb	r9,PACAIRQHAPPENED(r13)
+
+	.if ! \hsrr
 	cmpwi	r10,PACA_IRQ_DEC
 	bne	1f
-	lis	r10,0x7fff
-	ori	r10,r10,0xffff
-	mtspr	SPRN_DEC,r10
+	LOAD_REG_IMMEDIATE(r9, 0x7fffffff)
+	mtspr	SPRN_DEC,r9
 #ifdef CONFIG_PPC_WATCHDOG
+	lwz	r9,PACA_EXGEN+EX_CCR(r13)
 	b	soft_nmi_common
 #else
 	b	2f
 #endif
+	.endif
+
 1:	andi.	r10,r10,PACA_IRQ_MUST_HARD_MASK
 	beq	2f
 	xori	r12,r12,MSR_EE	/* clear MSR_EE */
@@ -2814,17 +2818,19 @@ masked_interrupt:
 	.else
 	mtspr	SPRN_SRR1,r12
 	.endif
-	ori	r11,r11,PACA_IRQ_HARD_DIS
-	stb	r11,PACAIRQHAPPENED(r13)
+	ori	r9,r9,PACA_IRQ_HARD_DIS
+	stb	r9,PACAIRQHAPPENED(r13)
 2:	/* done */
-	li	r10,0
+	li	r9,0
 	.if \hsrr
-	stb	r10,PACAHSRR_VALID(r13)
+	stb	r9,PACAHSRR_VALID(r13)
 	.else
-	stb	r10,PACASRR_VALID(r13)
+	stb	r9,PACASRR_VALID(r13)
 	.endif
-	ld	r10,PACA_EXGEN+EX_CTR(r13)
-	mtctr	r10
+
+	ld	r9,PACA_EXGEN+EX_CTR(r13)
+	mtctr	r9
+	lwz	r9,PACA_EXGEN+EX_CCR(r13)
 	mtcrf	0x80,r9
 	std	r1,PACAR1(r13)
 	ld	r9,PACA_EXGEN+EX_R9(r13)
-- 
2.23.0


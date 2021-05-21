Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C952B38C5FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlH05ttHz3c60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:48:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=joV9mSn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=joV9mSn/; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlC64cQqz3bnS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:50 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id b7so6675522plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=joV9mSn/6GzJeYoZ8YdaNxa5ex0wthkKNb19LFDaqduRJ2ux22Cq17HV8OK03TTOqw
 7aPw/xmfObcz0Gws3RuvhiMm7EYrwFqHbr0M5A0l703IlHPVbQAtkJ1dCs/4RLMEWVi3
 i6NEDwpPu6GM1s/xuyvdl2UxcD65sIzCY0X4qH4D6IHT3I2xejbrIk9VTaqg96zH+G3Z
 +ApsfvRXtfU7ZJLyX27OPTvM//ds/PHMYAVotRm9dPZmxjlraNKexcp2wKuQsXK8DYs4
 yG5CZLnSzekAPdAH3Ik9z0xp8sz1SFNn4C7FFB6v7MB2Umh0z5k7/3yRvQrC7gGGPaY7
 mZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=L1yxM1RCdG8wcxiddQTHRWVCu+CxMC06vHiQjGBe3NPuSvey6ZrlMcMgClFzcR8Rwa
 yGq5FecXw4RxF2gIs5J837Vl26m1CskdPajKk/BfK0c2k9MaE8qzGH/zJws6NGehpFSy
 d91KWwgUh2CJf8QCJy1sYSOB9unPiGBG/axgMiffk2aYxXjmK/LiYtg43Y59bY3w06EP
 TBAptJaOJFjuHcaaTxJS+BkR/xqC9XZsM2eB83zZlRFiSZmFklShCYaod4Wa8sMccx9r
 rd8dDfr/kB+XCrBz+8auwzpDYdS6uh39ErSJ+5Y4mmyIN200zw0yx5JlPhVDcuRPMviA
 mI+A==
X-Gm-Message-State: AOAM5314rNUl5ALE0cEiaaPU1HDt43zZhjgfZATMVQ3eVHVvnBrizo2o
 A0IN+loGxecw2Tn9nObl3WaHJ3cvcZ8=
X-Google-Smtp-Source: ABdhPJxADxhgEBMMwAtnryZathg+5yjvNnMyF5mPDGJAahm0gz9o70iuYUDky+9c/gbFIvfaYrySUw==
X-Received: by 2002:a17:90a:7442:: with SMTP id
 o2mr10647081pjk.44.1621597488184; 
 Fri, 21 May 2021 04:44:48 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/11] powerpc/64s: save one more register in the masked
 interrupt handler
Date: Fri, 21 May 2021 21:44:18 +1000
Message-Id: <20210521114422.3179350-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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


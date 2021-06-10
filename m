Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025C23A2C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G14Cc3Fh2z3dHN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:13:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rjWcXR9B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rjWcXR9B; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1481064nz308N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:52 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso3789546pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=rjWcXR9BhHKFSUQDm/ywC69XNJZVch1KebOVvRlEqXjsJU+ZtKULOFu/kwXMhJPhYd
 O0MS+D68p0k+MvzvRlo2MIr/mE1tMVNvuIXs5UtQalJexwxVNV2hVDmWq2JLiSXEMG+D
 0wB9lcGCAFJOmfzBXeGjMmkurSwEug/Ie/RpsyRzUY3k0RPmNaxhJteSerseYGlvm1BD
 /Xvmk0OtX8hO4NkWwHOyg5Q5bmt3+kew51HYNicjcDtM/sMyk31pvj60fMhZOuhM1P9h
 2lmtz+RdbfDtFXXsjpIRsM13UMyriiw8nlKKa4fWmnJsuONW11pxgZLR334HKRNClQSl
 3lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hhd+fuGqJUuQW2nqlOscXLPZPLQdJPLVzy4+rL5BTdM=;
 b=LbVQFYMdMu2Sklnr4EjM6PEfjJ+lcsLDLRfhU132obh3JNP1p5xy+Fkz+m5oIa9vYM
 0l1QjBehPH3rAExDKgP2d46v8QoppdS6X/Qf4fzqU0QFwNxswHbw8mqRp164RjVs8x2f
 dDGANVPa2RvbBvEfeee44L5FyF5XyqOdUr71O2imgVl42lqliF5iOet7KnqbHOqQ5BTC
 xQooj66LnI0q0HGQgNE6RIawZFkOW9nXZ88ZxDrM4hiYdFP8LRcsUxotQyYJ8ZFKiD7s
 lZT185CM+c4zP5euaXm3OLXyljqt3IyBJKtAOLdZLIv1qwzJ5fEYJb15x+4VWZg+ATeJ
 R0ag==
X-Gm-Message-State: AOAM532HenR/LMk1SGLPTRdRGjfJppq3md2J/E4fHPYqgqkPfOKfrY8n
 F4DA4p/tY9CEVkF0w5NJUDDS3aiaTvI=
X-Google-Smtp-Source: ABdhPJySCSt8m+ZmzxGSR1Ifdzud4k5bpLGwro36aBlnCiJusU2MzMapEtwGGKvd70Kk/TBGndFlTg==
X-Received: by 2002:a17:90a:708:: with SMTP id
 l8mr3339944pjl.103.1623330589945; 
 Thu, 10 Jun 2021 06:09:49 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/11] powerpc/64s: save one more register in the masked
 interrupt handler
Date: Thu, 10 Jun 2021 23:09:17 +1000
Message-Id: <20210610130921.706938-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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


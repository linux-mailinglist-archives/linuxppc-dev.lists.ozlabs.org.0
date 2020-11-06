Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4302A9934
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:13:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQRY6cS6zDrS5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:13:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C9mGMY40; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7t3jt5zDrJY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:54 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id z24so1265128pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fM1DX17U4W8FXAdXQbfs5bIjyHknpGjVkjMQscRtnWQ=;
 b=C9mGMY40BP96AZGxMUclNbA1023u3vRvjH53+0ke89Od8IUPh19ygU7n52Y/saRtmx
 lDtHfndMtqTNwV26GGF0HBl3AHCQx4zGIFp2FgBMg+KWhhW4MEMSNxlhhcewIAmgGZzv
 zc8nHUApMIRfbf7TqSDSyU0Qw+/o8lNQFcJPMcDsSyDk/FUa/zvEi2u7WkRloPLH69QL
 0uMfBdH3UR3AoRWRSe0Yc6eXiQH4VWMEnPP11ifMHXrmPK185hw4zNvvHFTDVh3xTO0z
 LNA3mpSn3PpsI/KQzr/V+wYceQZOH8Ura3iHZm9tD345qPgHgsG8ohSYb1F4Mfw3BEt6
 HY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fM1DX17U4W8FXAdXQbfs5bIjyHknpGjVkjMQscRtnWQ=;
 b=smldRUblvz55Fwd0iR9TThXJ24+HVb1WIT3VR+NQgKdHciSwkZprW+PIyQpiY8oE4c
 hMDomr4ixFlo246DbjCM943Fiu3EoKLHpTr7LttjHw9wDLXoAX0opZ3Od9r8MIK3Quth
 M7IKAZ586QY+4ImBNTDGgzXjCi7dqbyWYTzzRzQ08S+Ed6w82PvG0UAy1X0BdQ2kqgKd
 RBzELwu7hSUlOaRmB8pNizjng4EMfdYPkeWyd1uOUf4uDDcFsp3oxRxgrcB5svdtIPeH
 af40n1LTNv7vWU/EgD4bG4F8/noKrvMao2LeYcl72BVQ2eD7sHTsg4FjWM8TjTL372sS
 p1kw==
X-Gm-Message-State: AOAM5329iUWvEpoO9TnOY3Y1+bdfI3bXnneHgA27w7OZlzsF23/m2hPw
 W9o6BIBoaotBMRX3UPsZqUCczNv6qlI=
X-Google-Smtp-Source: ABdhPJzvbib3evpIFVmUvVQ8Z5SIGDyw4LjVd8DVcMl59pyDdYL1zoctu5Sswuh9T8LlXcMWg9uX1A==
X-Received: by 2002:a17:90a:1b67:: with SMTP id
 q94mr268817pjq.28.1604678391753; 
 Fri, 06 Nov 2020 07:59:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/9] powerpc/64s: save one more register in the masked
 interrupt handler
Date: Sat,  7 Nov 2020 01:59:26 +1000
Message-Id: <20201106155929.2246055-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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
index b370a5f334fc..a01f69e774b5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2745,7 +2745,6 @@ INT_DEFINE_END(soft_nmi)
  * and run it entirely with interrupts hard disabled.
  */
 EXC_COMMON_BEGIN(soft_nmi_common)
-	mfspr	r11,SPRN_SRR0
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
@@ -2780,19 +2779,24 @@ masked_Hinterrupt:
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
@@ -2801,17 +2805,19 @@ masked_interrupt:
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


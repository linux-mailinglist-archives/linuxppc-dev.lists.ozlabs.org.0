Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA5633C90C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:07:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrBh3f29z3c95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:07:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mnKh49fZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mnKh49fZ; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr72719kz30C3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:30 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d21so1417269pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z3Eb5uqyrUrGECLIB1VPvzSrsQZo9KK0mt4Ra2znz00=;
 b=mnKh49fZx6wiFNPYibdPpobZGg8wgy2RaF0Y6FY3wB2XjAAxN+2Ivv45SD3rhVO8vS
 y3vrIwBdMvuLGJd3GDDbBUfMp9zFVCTEFIDZ2CHXrgrSpBUEkWb7rhwtG/ovSE7klGhZ
 98rNgO20O7XgTx69J1OgC/xDB0Hv3d0a15I0gmVxGrx46+K88hj9T3Ziwt+t2ip+eqtB
 khGbmOBTQqxo1OXxXOZ0qmNsbalyDm1c56qlOBBehrHFCyNblVwQc3L8SecmbVozrWSQ
 gvRo1PW18NpZ/RCWZbqkze7XrL42z+bctvb8oJTKRoT8C7vCjGSc9+rw2hVEvZziwcpS
 bIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z3Eb5uqyrUrGECLIB1VPvzSrsQZo9KK0mt4Ra2znz00=;
 b=UJmyEzEi9Bb7U8q8fKzXLaEe/RiZJSV/3OZ55khKgrjMOP3GEWeeIGPGLcqcNFwCIa
 OeOatkgN0OnEKHiDArHpguy9d5c5wnSGJ3C2WhobMgveFoKTc5M0w4FG6PbGnSb8K5wW
 l4wrpNGowQzXF7nH84St8bkNljnEWxPc6ph/k0+cy/LpCINGdoWM7W7lVK8Yz1stqJ+U
 qpnWnrjxUCI722fiADN0dqyJashgdfechMFFuTfGjnuHNi3meHiO66ofL7HuNHx8AjaY
 OfFaaxeecS5xMzuPNjfkqwxEohbmKB+xgCGJ/Mc2M7NN+swrdME1UD05BgOb+KfTj7nY
 0JmA==
X-Gm-Message-State: AOAM53243sU97fkrcjlgjB1aUOz+3O1Qj/PgXK3AyWo7gYgZkbD11UbX
 kOj6ydTD/QATdQYKL03uDS3ul6i0jAQ=
X-Google-Smtp-Source: ABdhPJw/BEyteiV0YK1JRcKmr109s6b0/vvuJgIY93iPS1/htitD3BZRtAoK4bBQdrmI/J5aXu3S8w==
X-Received: by 2002:a05:6a00:2302:b029:203:889c:26ff with SMTP id
 h2-20020a056a002302b0290203889c26ffmr12753442pfh.14.1615845868208; 
 Mon, 15 Mar 2021 15:04:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/14] powerpc/64s: save one more register in the masked
 interrupt handler
Date: Tue, 16 Mar 2021 08:03:54 +1000
Message-Id: <20210315220402.260594-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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
index 0c7af27d6dc1..a5a0b17f77bf 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2797,7 +2797,6 @@ INT_DEFINE_END(soft_nmi)
  * and run it entirely with interrupts hard disabled.
  */
 EXC_COMMON_BEGIN(soft_nmi_common)
-	mfspr	r11,SPRN_SRR0
 	mr	r10,r1
 	ld	r1,PACAEMERGSP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
@@ -2832,19 +2831,24 @@ masked_Hinterrupt:
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
@@ -2853,17 +2857,19 @@ masked_interrupt:
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


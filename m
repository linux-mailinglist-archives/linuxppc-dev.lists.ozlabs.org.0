Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB41BEEE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 06:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CMGz5KtpzDrB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 14:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pkVcwzwH; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CMCY6VgVzDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 14:02:17 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y25so2254985pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/RM8l0krhqnM5ryq+OfPq/DX0uqT8SGaEP7lRRaqCg=;
 b=pkVcwzwHG0pQLGNUswD9t/ilHM3Y6datURKgW9uXVskds66tS1aPry3ShXjL5N9nM6
 OGhLmpj1S1npjmaDxLAyyS+nF/rATdljcvSDlqf4t7OpBD8kpbEpS8kl7Bp5SDqxHrvO
 2QL/4dTUJq290vQjTaTdc2AbWLDE3HEMANNswaztCT25c5LnJWnMCppaMbo105SW0fPu
 aNmlxEAuA3VNhzxea1dCpYaaRkC/idMzoUd2KQMxDgkU0jvwxSgGdzlqZHH117hz/kfK
 e1ew++RSFUwIGq0h3VB/sV87umTLFLDFptqb7d66qFDpV3q/f2HAYTZNeT1baAcuxkS5
 WnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/RM8l0krhqnM5ryq+OfPq/DX0uqT8SGaEP7lRRaqCg=;
 b=emvYxMDbkdIJXL/Dh/LbW2482fwm2RZzkuuF/zlqKMixIjorrPiw/04yR1G4zwKOld
 mJEcRVcQPkpXJoUuzcoRbH3bHhm9fJLV9wSN7lt5Vf7y4ubImvmFL4dgkBqTKK+qJw1z
 DxSI4htfi7bImrbgcxpLOscQxIKhtFn9RyTsURMEtxItjAb1tJVoJRS1pJq89coyouPX
 haICGFyUlCeeyxSzyL6pPMBMun0ymq3Yuq9t9zXz6ccFZeqsPN6Lr6aZy8n46bnaMrpY
 LPVOXloLJHQMJCzoCyeM9Y8Sy7zzdae8+ReLCNshLUP4UvCN6OKmTwNxEaCcSAhgWpY1
 BwQw==
X-Gm-Message-State: AGi0PuZwTg0iyGnEwj/umDLfijhFD4aPF8lXUqFDf+JPywAGuC5BFnrX
 QBcnPgQ9KBjCJls2O703p7rKXLpq
X-Google-Smtp-Source: APiQypIyy7Lvh0pGGtnU9GqoFZzVBt4XkCdb9OCwSqrJ3IosuGV9kr6jYH5zlrmNHzmyQTlKQQEAhA==
X-Received: by 2002:aa7:97a6:: with SMTP id d6mr1560725pfq.92.1588219334530;
 Wed, 29 Apr 2020 21:02:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id b9sm2251890pfp.12.2020.04.29.21.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 21:02:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/2] powerpc/64s/exception: treat NIA below
 __end_interrupts as soft-masked
Date: Thu, 30 Apr 2020 14:02:01 +1000
Message-Id: <20200430040202.1735506-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430040202.1735506-1-npiggin@gmail.com>
References: <20200430040202.1735506-1-npiggin@gmail.com>
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

The scv instruction causes an interrupt which can enter the kernel with
MSR[EE]=1, thus allowing interrupts to hit at any time. These must not
be taken as normal interrupts, because they come from MSR[PR]=0 context,
and yet the kernel stack is not yet set up and r13 is not set to the
PACA).

Treat this as a soft-masked interrupt regardless of the soft masked
state. This does not affect behaviour yet, because currently all
interrupts are taken with MSR[EE]=0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ef4a90212664..8dfebf6c6a1e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -508,8 +508,24 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 .macro __GEN_COMMON_BODY name
 	.if IMASK
+		.if ! ISTACK
+		.error "No support for masked interrupt to use custom stack"
+		.endif
+
+		/* If coming from user, skip soft-mask tests. */
+		andi.	r10,r12,MSR_PR
+		bne	2f
+
+		/* Kernel code running below __end_interrupts is implicitly
+		 * soft-masked */
+		LOAD_HANDLER(r10, __end_interrupts)
+		cmpd	r11,r10
+		li	r10,IMASK
+		blt-	1f
+
+		/* Test the soft mask state against our interrupt's bit */
 		lbz	r10,PACAIRQSOFTMASK(r13)
-		andi.	r10,r10,IMASK
+1:		andi.	r10,r10,IMASK
 		/* Associate vector numbers with bits in paca->irq_happened */
 		.if IVEC == 0x500 || IVEC == 0xea0
 		li	r10,PACA_IRQ_EE
@@ -540,7 +556,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
-	mr	r10,r1			/* Save r1			*/
+2:	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
 	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
@@ -2811,7 +2827,8 @@ masked_interrupt:
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
-	/* returns to kernel where r13 must be set up, so don't restore it */
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	/* May return to masked low address where r13 is not set up */
 	.if \hsrr
 	HRFI_TO_KERNEL
 	.else
@@ -2970,6 +2987,10 @@ EXC_COMMON_BEGIN(ppc64_runlatch_on_trampoline)
 
 USE_FIXED_SECTION(virt_trampolines)
 	/*
+	 * All code below __end_interrupts is treated as soft-masked. If
+	 * any code runs here with MSR[EE]=1, it must then cope with pending
+	 * soft interrupt being raised (i.e., by ensuring it is replayed).
+	 *
 	 * The __end_interrupts marker must be past the out-of-line (OOL)
 	 * handlers, so that they are copied to real address 0x100 when running
 	 * a relocatable kernel. This ensures they can be reached from the short
-- 
2.23.0


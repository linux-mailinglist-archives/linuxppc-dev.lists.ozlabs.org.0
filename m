Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39C639AA1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpQy65bHz3045
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HFAtO57g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HFAtO57g;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpN50TkBz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:49:56 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id b4so8045845pfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoKCthCuAlQWDf+96rPecf2c/VIZC4zvI+cTdHbp8wI=;
        b=HFAtO57g1yyO5q3Njuunv3HKEuEcK+5HHMwNNW4dtnIocO+7rTYx//cn/QHGwR1OeN
         O9P+XeLXKfMFiGnizj7qrD1GRyFFAdw+QH3XQ81Xxt7JwuylBJ7EORZucE959m/tpJak
         UT6uqQ9n5i3af3kPOYM7Zxm37xc4G3MrVTOqhduohL6Fr8/FO2RTUC+fSLXhCchD7aOT
         z38QyPUW9aV/je1QGLCEsvkpvsbd43LmRwmr2Wc7DbxUTPUscEF5cvLuUYTKwToFXwIT
         5oDROpFR+BwUpf5WRbK1L4AkdQvBwhp9k2ue79pdWid79RhXdFDga2ZUpYSNR9iZO+GM
         zf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoKCthCuAlQWDf+96rPecf2c/VIZC4zvI+cTdHbp8wI=;
        b=0gidw2SDCPwBBNfp8pwNOHfwnBmj1jdGkjnLw8KmAZRDit+/IAmH8DjGHOWTBikGC7
         o0VfARpscUKg+EPwCfB512t5tTtbh5q3ogWqZGzCOE6AkQvK9vQXpN0P6FF+ReWUHlxD
         MeRABqzz1fjqyV8qUPtLy7WkohYl3dkcsGCvvO9D4VmEMeknXwdikqwJM2iGQDmfbZan
         nM96qwlCsOzlkAb4ZZ9Ced99vGy5u638KQTll8bNbwh3pHbr4CDbyQWQv2ymRJOAyDp9
         hcOxybVPoOVyRbuetKzO+z/5e9Yt/M3D2Ai/Q5jUONMirNISyaSsH6s6vJCGOt1aydnM
         5/Ug==
X-Gm-Message-State: ANoB5pkZ+017FuOMJBmXc2hKpcQ5vXiqN/s51ma68KDpws1rt96sHAKh
	Q7qsU/E52gFXxcakw+1UxkGVqzuw+Wo7OQ==
X-Google-Smtp-Source: AA0mqf4kFLWDDGRuS6yoHrbaxANGy8o30i2ar1SWyA+mYXywY+AdaKmXw5M4WzfY5phEgiIIwQp3PQ==
X-Received: by 2002:aa7:980c:0:b0:574:80b6:5706 with SMTP id e12-20020aa7980c000000b0057480b65706mr17446059pfl.30.1669553394182;
        Sun, 27 Nov 2022 04:49:54 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:49:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/17] powerpc/64: Remove asm interrupt tracing call helpers
Date: Sun, 27 Nov 2022 22:49:27 +1000
Message-Id: <20221127124942.1665522-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are now unused. Remove.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/irqflags.h | 58 -----------------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/powerpc/include/asm/irqflags.h b/arch/powerpc/include/asm/irqflags.h
index 1a6c1ce17735..47d46712928a 100644
--- a/arch/powerpc/include/asm/irqflags.h
+++ b/arch/powerpc/include/asm/irqflags.h
@@ -11,64 +11,6 @@
  */
 #include <asm/hw_irq.h>
 
-#else
-#ifdef CONFIG_TRACE_IRQFLAGS
-#ifdef CONFIG_IRQSOFF_TRACER
-/*
- * Since the ftrace irqsoff latency trace checks CALLER_ADDR1,
- * which is the stack frame here, we need to force a stack frame
- * in case we came from user space.
- */
-#define TRACE_WITH_FRAME_BUFFER(func)		\
-	mflr	r0;				\
-	stdu	r1, -STACK_FRAME_OVERHEAD(r1);	\
-	std	r0, 16(r1);			\
-	stdu	r1, -STACK_FRAME_OVERHEAD(r1);	\
-	bl func;				\
-	ld	r1, 0(r1);			\
-	ld	r1, 0(r1);
-#else
-#define TRACE_WITH_FRAME_BUFFER(func)		\
-	bl func;
-#endif
-
-/*
- * These are calls to C code, so the caller must be prepared for volatiles to
- * be clobbered.
- */
-#define TRACE_ENABLE_INTS	TRACE_WITH_FRAME_BUFFER(trace_hardirqs_on)
-#define TRACE_DISABLE_INTS	TRACE_WITH_FRAME_BUFFER(trace_hardirqs_off)
-
-/*
- * This is used by assembly code to soft-disable interrupts first and
- * reconcile irq state.
- *
- * NB: This may call C code, so the caller must be prepared for volatiles to
- * be clobbered.
- */
-#define RECONCILE_IRQ_STATE(__rA, __rB)		\
-	lbz	__rA,PACAIRQSOFTMASK(r13);	\
-	lbz	__rB,PACAIRQHAPPENED(r13);	\
-	andi.	__rA,__rA,IRQS_DISABLED;	\
-	li	__rA,IRQS_DISABLED;		\
-	ori	__rB,__rB,PACA_IRQ_HARD_DIS;	\
-	stb	__rB,PACAIRQHAPPENED(r13);	\
-	bne	44f;				\
-	stb	__rA,PACAIRQSOFTMASK(r13);	\
-	TRACE_DISABLE_INTS;			\
-44:
-
-#else
-#define TRACE_ENABLE_INTS
-#define TRACE_DISABLE_INTS
-
-#define RECONCILE_IRQ_STATE(__rA, __rB)		\
-	lbz	__rA,PACAIRQHAPPENED(r13);	\
-	li	__rB,IRQS_DISABLED;		\
-	ori	__rA,__rA,PACA_IRQ_HARD_DIS;	\
-	stb	__rB,PACAIRQSOFTMASK(r13);	\
-	stb	__rA,PACAIRQHAPPENED(r13)
-#endif
 #endif
 
 #endif
-- 
2.37.2


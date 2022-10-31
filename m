Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBD661300B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:58:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Wd2T31z3c5G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:58:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kh2ALktk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kh2ALktk;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rj5rmZz2ygC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:54:57 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id u6so9831696plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4qsQrq5rLAyOKoqyMBI7j+EQIEJyy2rq71ZHlZCkCE=;
        b=Kh2ALktkOn7TLpTIP+5TH8z3UD6eUobY+C44E4bZewj3TQmZkFQ8caCbDEE3wct6OQ
         Of48RddG2Ukus6xYYaPzWZQaFqM3iZBCzbhXkbZUT7wmeH1LJhpOWVHhe9ThS7i2dJvf
         tgz0xMueP8pf/IpbKnu3yWsEKHevc8cGgT1ZrgObyTUUfOqNnZDyO1aKhrKoCz/oj0Tf
         M/tqP8f6pWLRMGWA8XDWzT2osnWI12AKAc9Jd3dyrB/prx/oFIe3vQ3zfnrAh53zZTJJ
         f/BQUSBxPhgcHzZcD0frwmrkCdbSNWWXf22/sqZaJX1zt6F8RRbIuk8GE5vEhSgjBDRw
         9Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4qsQrq5rLAyOKoqyMBI7j+EQIEJyy2rq71ZHlZCkCE=;
        b=SZxcanfr6aWbkpsLEoRMosKHef7o+dGRsSzoWYDRGpJXSn9QUOXhC136hcGC+EVOzD
         WR334ZsfhuEAfGxwOp48L1kA+qg7VVDTGeYeOvFv6U37Z/1/wIraNPcw3EBQcNonkJsN
         PyLLR1u0GY/MEtMBH3HUMSzS08dZM2o3RUZ61ZTbXXBKjscV1Gu0liLA8ueMgYklyVAa
         Gtg/SXTDpDjnwSMTAHC7eRqtkKYKyy1sPg7iODj5/NxMr5QOgWs6+Wjt0SVCTdK0tB5F
         ngQBziBQ2HabfZsB9tDHEVPWXRcO9rZkaOCegUyT1AJZTvOOd4VzJP2BWrL4mkPlhIHJ
         qDdg==
X-Gm-Message-State: ACrzQf283NYq5bt0RusKjHHnX4mpDFw/K0wsjOI4/aGJlO/vlkxOguu4
	Plu/9seDJDH6BBhr50EnmXCJhzQXbfo=
X-Google-Smtp-Source: AMsMyM7nZ6rEfjzFPfkraGwOwMNgfgwPiC3IBvrPr/9jYG0+Hj2F0QEjM3hiv3DknuOqj4eQ7qoutg==
X-Received: by 2002:a17:90b:4a42:b0:213:383f:cd21 with SMTP id lb2-20020a17090b4a4200b00213383fcd21mr29875672pjb.23.1667195695114;
        Sun, 30 Oct 2022 22:54:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/19] powerpc/64: Remove asm interrupt tracing call helpers
Date: Mon, 31 Oct 2022 15:54:24 +1000
Message-Id: <20221031055440.3594315-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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

These are unused. Remove.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/irqflags.h | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/arch/powerpc/include/asm/irqflags.h b/arch/powerpc/include/asm/irqflags.h
index 1a6c1ce17735..81e0a5025be8 100644
--- a/arch/powerpc/include/asm/irqflags.h
+++ b/arch/powerpc/include/asm/irqflags.h
@@ -13,32 +13,6 @@
 
 #else
 #ifdef CONFIG_TRACE_IRQFLAGS
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
 /*
  * This is used by assembly code to soft-disable interrupts first and
  * reconcile irq state.
@@ -59,9 +33,6 @@
 44:
 
 #else
-#define TRACE_ENABLE_INTS
-#define TRACE_DISABLE_INTS
-
 #define RECONCILE_IRQ_STATE(__rA, __rB)		\
 	lbz	__rA,PACAIRQHAPPENED(r13);	\
 	li	__rB,IRQS_DISABLED;		\
-- 
2.37.2


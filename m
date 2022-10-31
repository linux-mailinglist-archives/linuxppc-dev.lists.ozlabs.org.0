Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504B61300D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:59:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Xf37H7z3dvq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:59:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ay/sgLvL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ay/sgLvL;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rm1DNMz3c4j
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:54:59 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id o7so6311819pjj.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR5Yozz92a5Y8w9YjV2F9saSl48mThA6quHCsQXz8dg=;
        b=ay/sgLvLT7hyysrQsrG28eCmLXH29nRHiXJUN6/oDTtZMu+FKez5slsun/tey6WWz1
         UmZn6TqmMgWwJ89+UbWLW1G4XazzWPRpFwOAE+dKVQVXUaTaF3LMdFguQzwvMj5oiwfH
         Lx2kE2MkNLRpunVnZTxE6qNXp2yItBBKrIRVTW6+//LlKzoQZWV1tYm5eRwJcLulLTsK
         jZnjNWp3bLqAnTosVLT/51G35Ftm2tfNs+htO8yeNQM8FM1/oPfnQEEJb6BHF63NzUrs
         xdMUcbJnVpwlV4jiUZ2UUtQT5goxUctgLpwW/M8Fb1YlssoAmsXEBlpfARNyjOivDtZq
         xRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR5Yozz92a5Y8w9YjV2F9saSl48mThA6quHCsQXz8dg=;
        b=2AnZtndECwOvs/VwpnxV72Ovk7LuSh6jDf4DcGaZVrFkV58gBkURPO1RplyKV2TGhs
         2oeYAG5ED8Cm5GuPk7Y3N1dETIK3BTnQYnJyTueflBA0VwRfoxXB1nzwq6KLM/unNHT9
         l6aAynx2T8ek8R17m8kXoj7Kk9V4e27IcDYYLz5E2VOw0tCwwBfQpeMzOLaasP6DqSyl
         q9GbkeHOhUuGZntkjJrhmxbrpMZbVA8FfnRTX95SDJNm6rBnOYETm+bYlGD5oZiLboTb
         oipWf7t8OXaFyyIdNbTMO19URSvDhVaWo9q/labYfB4vqIDJfWueh2IunMO/RWUnDfj0
         L3ig==
X-Gm-Message-State: ACrzQf2lyTSHyKX+eym/ZGET3KnMLxZ38JOSQGLQNO46K1tqvSQ2wXkh
	HZ49l0yfo98XOalGPOHaRDzFqaai2kI=
X-Google-Smtp-Source: AMsMyM4PjmpFp5WmjZZQWVtB0hgwyS+cRj8cLMGewLcY4kTStHGKOo1Vs4GWfgz5KwjuYfRhT2Y71g==
X-Received: by 2002:a17:90b:1c10:b0:213:1bb8:feb with SMTP id oc16-20020a17090b1c1000b002131bb80febmr29878909pjb.214.1667195697418;
        Sun, 30 Oct 2022 22:54:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 04/19] powerpc/pseries: hvcall stack frame overhead
Date: Mon, 31 Oct 2022 15:54:25 +1000
Message-Id: <20221031055440.3594315-5-npiggin@gmail.com>
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

This call may use the min size stack frame. The scratch space used is
in the caller's parameter area frame, not this function's frame.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 38 +++++++++++++------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 762eb15d3bd4..783c16ad648b 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -27,7 +27,9 @@ hcall_tracepoint_refcount:
 
 /*
  * precall must preserve all registers.  use unused STK_PARAM()
- * areas to save snapshots and opcode.
+ * areas to save snapshots and opcode. STK_PARAM() in the caller's
+ * frame will be available even on ELFv2 because these are all
+ * variadic functions.
  */
 #define HCALL_INST_PRECALL(FIRST_REG)				\
 	mflr	r0;						\
@@ -41,29 +43,29 @@ hcall_tracepoint_refcount:
 	std	r10,STK_PARAM(R10)(r1);				\
 	std	r0,16(r1);					\
 	addi	r4,r1,STK_PARAM(FIRST_REG);			\
-	stdu	r1,-STACK_FRAME_OVERHEAD(r1);			\
+	stdu	r1,-STACK_FRAME_MIN_SIZE(r1);			\
 	bl	__trace_hcall_entry;				\
-	ld	r3,STACK_FRAME_OVERHEAD+STK_PARAM(R3)(r1);	\
-	ld	r4,STACK_FRAME_OVERHEAD+STK_PARAM(R4)(r1);	\
-	ld	r5,STACK_FRAME_OVERHEAD+STK_PARAM(R5)(r1);	\
-	ld	r6,STACK_FRAME_OVERHEAD+STK_PARAM(R6)(r1);	\
-	ld	r7,STACK_FRAME_OVERHEAD+STK_PARAM(R7)(r1);	\
-	ld	r8,STACK_FRAME_OVERHEAD+STK_PARAM(R8)(r1);	\
-	ld	r9,STACK_FRAME_OVERHEAD+STK_PARAM(R9)(r1);	\
-	ld	r10,STACK_FRAME_OVERHEAD+STK_PARAM(R10)(r1)
+	ld	r3,STACK_FRAME_MIN_SIZE+STK_PARAM(R3)(r1);	\
+	ld	r4,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1);	\
+	ld	r5,STACK_FRAME_MIN_SIZE+STK_PARAM(R5)(r1);	\
+	ld	r6,STACK_FRAME_MIN_SIZE+STK_PARAM(R6)(r1);	\
+	ld	r7,STACK_FRAME_MIN_SIZE+STK_PARAM(R7)(r1);	\
+	ld	r8,STACK_FRAME_MIN_SIZE+STK_PARAM(R8)(r1);	\
+	ld	r9,STACK_FRAME_MIN_SIZE+STK_PARAM(R9)(r1);	\
+	ld	r10,STACK_FRAME_MIN_SIZE+STK_PARAM(R10)(r1)
 
 /*
  * postcall is performed immediately before function return which
  * allows liberal use of volatile registers.
  */
 #define __HCALL_INST_POSTCALL					\
-	ld	r0,STACK_FRAME_OVERHEAD+STK_PARAM(R3)(r1);	\
-	std	r3,STACK_FRAME_OVERHEAD+STK_PARAM(R3)(r1);	\
+	ld	r0,STACK_FRAME_MIN_SIZE+STK_PARAM(R3)(r1);	\
+	std	r3,STACK_FRAME_MIN_SIZE+STK_PARAM(R3)(r1);	\
 	mr	r4,r3;						\
 	mr	r3,r0;						\
 	bl	__trace_hcall_exit;				\
-	ld	r0,STACK_FRAME_OVERHEAD+16(r1);			\
-	addi	r1,r1,STACK_FRAME_OVERHEAD;			\
+	ld	r0,STACK_FRAME_MIN_SIZE+16(r1);			\
+	addi	r1,r1,STACK_FRAME_MIN_SIZE;			\
 	ld	r3,STK_PARAM(R3)(r1);				\
 	mtlr	r0
 
@@ -303,14 +305,14 @@ plpar_hcall9_trace:
 	mr	r7,r8
 	mr	r8,r9
 	mr	r9,r10
-	ld	r10,STACK_FRAME_OVERHEAD+STK_PARAM(R11)(r1)
-	ld	r11,STACK_FRAME_OVERHEAD+STK_PARAM(R12)(r1)
-	ld	r12,STACK_FRAME_OVERHEAD+STK_PARAM(R13)(r1)
+	ld	r10,STACK_FRAME_MIN_SIZE+STK_PARAM(R11)(r1)
+	ld	r11,STACK_FRAME_MIN_SIZE+STK_PARAM(R12)(r1)
+	ld	r12,STACK_FRAME_MIN_SIZE+STK_PARAM(R13)(r1)
 
 	HVSC
 
 	mr	r0,r12
-	ld	r12,STACK_FRAME_OVERHEAD+STK_PARAM(R4)(r1)
+	ld	r12,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1)
 	std	r4,0(r12)
 	std	r5,8(r12)
 	std	r6,16(r12)
-- 
2.37.2


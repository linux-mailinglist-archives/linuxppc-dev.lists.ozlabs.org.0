Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24C639AAB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpV74Nq9z3f99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:55:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G0sF76GX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G0sF76GX;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNC5Kyjz3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:03 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id q12so3964317pfn.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR5Yozz92a5Y8w9YjV2F9saSl48mThA6quHCsQXz8dg=;
        b=G0sF76GXQpM89hfVXeNtnHvTzBYO8Ini7qFFXzD//TJu0guUCT928YZy+yLzs/9f3T
         Hqmi4cF0RLDnLBR7OdihR2KdT5oOqCCGKjns9aijTpDj0on6OMpm2fl3D98kaQvggRzZ
         JfMFeAYynimDHDpQrZoiJ19ugc2LsT/8nFDLJ9eLnGYQhRqTFIw+6+9BVzR3KNqOIaXB
         KtoPai8gJxXwi9wcxEBkFdZIjQ+I8rw0+kHc4p5RcvY9aumbU7+Xo7GAQOxKAgFOBJJB
         n2UCkXrMrMD64GYiqURFO0mMbXWzxgaWHiRj0zbT1RBOSWaKAD6yCuXpUs3zz62L3WBD
         FN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR5Yozz92a5Y8w9YjV2F9saSl48mThA6quHCsQXz8dg=;
        b=tyDGNkaWVi7syuvnlM+ly7qefDvJV3IIj0rVEAYvwxniQsMmmQTqkDkQ+lt7szZqGu
         QauCWKSRYI/4gBeC49n6HvUjKFnpEslXUcZqqzvVZ6bwPe8rcv0tFu61qriddjWs00W7
         zGFhHtQrhbRNHoM2cLw4vDp2sA0Sz881umPGdLUbJUVaDGBCPBQEIUIa1vIcGFgQYzJW
         tHDXVlxb3O2wsBCz76AiSpOdydfK4F53QBeu9yz+dnYEkR8o3PsTZX8Z/kIkZmBxA888
         LmqVNsDssSE9H4skNGkQgqylB3wPsVV3a0u8K+iAtVrWVeJytMymQ38AW5BlVwOxnXxK
         3DGg==
X-Gm-Message-State: ANoB5pkRcwtDpQhraHQ+VxRbgns0u2GXeqdzQMGTpdlIcwFoTGqP5BCK
	BoF3rbY1kY5TUgrXsCais4JAmuBiIRy9wQ==
X-Google-Smtp-Source: AA0mqf5JmAq1MCgmP9QJicbEa3AYh6s/VL2rEl8WPhiUOIBltuyhqsK1ksD3+2hhlqD30FuN1Vn83Q==
X-Received: by 2002:a63:a65:0:b0:477:ab31:fea6 with SMTP id z37-20020a630a65000000b00477ab31fea6mr20979771pgk.273.1669553401229;
        Sun, 27 Nov 2022 04:50:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/17] powerpc/pseries: hvcall stack frame overhead
Date: Sun, 27 Nov 2022 22:49:30 +1000
Message-Id: <20221127124942.1665522-6-npiggin@gmail.com>
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24D639AAF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpWJ0yGpz3f5V
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:56:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbgBF+qo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbgBF+qo;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNG0Cb6z3cJM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:05 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id w129so8054972pfb.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHp3hy+SZ8QxtsEE1Ce1yrNmMiJ6x/y961psh4PHpI4=;
        b=TbgBF+qovRlIHY8U9x9bEq7H89PmIJcpSrMUfh9+QIn+oyhVpeWS588VRHLokHxLoz
         dMkU61DjRaCfAbGmikCbwLuiNEd+TeJUEoAe0K0OTuaQwPSyAutJVNa8x6tZrViWs/Yv
         QEYEwLhXp0Mxi4Eby+jqA0c+FOTs6nLUPLwI88XB4Pb1kCRWTW1raQPvOeXmenmYRy1d
         E8MZJbmS/GYcpWPZy5vTTdph9R+B5zEUqRMUxQXCG8ey+Co4Ne7P3948clRq5wJhhdwi
         p6vxt3ligrO7wBH+0P8Y6CWObRjiNw4UQhg/CRcHApfvWxdP0RKV3HZZleJO2oL0bbMZ
         7OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHp3hy+SZ8QxtsEE1Ce1yrNmMiJ6x/y961psh4PHpI4=;
        b=ZgdkAH13oivWx8xRFjhaH/O89+yjBmrRorMG5wJIxW2gDaXCz8RZiCQMg8inDyYpY6
         qV+yqR0cQHUP+hPjDDh1sPM3f3NOhbQt7sAKQPyDfASEch6O9xItMFOttJq1bdzuJHJ7
         BqmHIK6E7Vg+kG+7B/P5JncneFapzplxvlRvjjamnKh8nX579lIGj9eqy4WM2PRXMSHF
         pH7X4oc3aZiyih8KrOojiTMrZpZlwoBvkQP2b2HB77dQ6wguUYpYZR8StQmsI5u3J3k9
         IqwJx0Zrl6J8/tD4eibLAKv9Ml6qlPMuKoePS9v0nthpaqX94rAxFOhK8oC/OGfnjI4x
         GPNg==
X-Gm-Message-State: ANoB5pk0H+gJ+UZWbB1wkI9IS6WIuZy/311sxYh77hxN4L4uTXVOBX96
	9WyWwHegmiOy11vRWpDwNMpor6LgkyhIRQ==
X-Google-Smtp-Source: AA0mqf53FvAtFiKksW3/PPqCKyYXJ+ym0+bSoydt6xG3mwE2EplJbYJNSgP71qZ0E4UkyLZvrJBNkQ==
X-Received: by 2002:a62:6205:0:b0:56c:14a5:2245 with SMTP id w5-20020a626205000000b0056c14a52245mr27127311pfb.12.1669553403831;
        Sun, 27 Nov 2022 04:50:03 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/17] powerpc: simplify ppc_save_regs
Date: Sun, 27 Nov 2022 22:49:31 +1000
Message-Id: <20221127124942.1665522-7-npiggin@gmail.com>
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

Adjust the pt_regs pointer so the interrupt frame offsets can be used
to save registers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/ppc_save_regs.S | 57 ++++++++---------------------
 1 file changed, 15 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index 2d4d21bb46a9..6e86f3bf4673 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -21,60 +21,33 @@
  * different ABIs, though).
  */
 _GLOBAL(ppc_save_regs)
-	PPC_STL	r0,0*SZL(r3)
+	/* This allows stack frame accessor macros and offsets to be used */
+	subi	r3,r3,STACK_FRAME_OVERHEAD
+	PPC_STL	r0,GPR0(r3)
 #ifdef CONFIG_PPC32
-	stmw	r2, 2*SZL(r3)
+	stmw	r2,GPR2(r3)
 #else
-	PPC_STL	r2,2*SZL(r3)
-	PPC_STL	r3,3*SZL(r3)
-	PPC_STL	r4,4*SZL(r3)
-	PPC_STL	r5,5*SZL(r3)
-	PPC_STL	r6,6*SZL(r3)
-	PPC_STL	r7,7*SZL(r3)
-	PPC_STL	r8,8*SZL(r3)
-	PPC_STL	r9,9*SZL(r3)
-	PPC_STL	r10,10*SZL(r3)
-	PPC_STL	r11,11*SZL(r3)
-	PPC_STL	r12,12*SZL(r3)
-	PPC_STL	r13,13*SZL(r3)
-	PPC_STL	r14,14*SZL(r3)
-	PPC_STL	r15,15*SZL(r3)
-	PPC_STL	r16,16*SZL(r3)
-	PPC_STL	r17,17*SZL(r3)
-	PPC_STL	r18,18*SZL(r3)
-	PPC_STL	r19,19*SZL(r3)
-	PPC_STL	r20,20*SZL(r3)
-	PPC_STL	r21,21*SZL(r3)
-	PPC_STL	r22,22*SZL(r3)
-	PPC_STL	r23,23*SZL(r3)
-	PPC_STL	r24,24*SZL(r3)
-	PPC_STL	r25,25*SZL(r3)
-	PPC_STL	r26,26*SZL(r3)
-	PPC_STL	r27,27*SZL(r3)
-	PPC_STL	r28,28*SZL(r3)
-	PPC_STL	r29,29*SZL(r3)
-	PPC_STL	r30,30*SZL(r3)
-	PPC_STL	r31,31*SZL(r3)
+	SAVE_GPRS(2, 31, r3)
 	lbz	r0,PACAIRQSOFTMASK(r13)
-	PPC_STL	r0,SOFTE-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,SOFTE(r3)
 #endif
 	/* go up one stack frame for SP */
 	PPC_LL	r4,0(r1)
-	PPC_STL	r4,1*SZL(r3)
+	PPC_STL	r4,GPR1(r3)
 	/* get caller's LR */
 	PPC_LL	r0,LRSAVE(r4)
-	PPC_STL	r0,_LINK-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_LINK(r3)
 	mflr	r0
-	PPC_STL	r0,_NIP-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_NIP(r3)
 	mfmsr	r0
-	PPC_STL	r0,_MSR-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_MSR(r3)
 	mfctr	r0
-	PPC_STL	r0,_CTR-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_CTR(r3)
 	mfxer	r0
-	PPC_STL	r0,_XER-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_XER(r3)
 	mfcr	r0
-	PPC_STL	r0,_CCR-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_CCR(r3)
 	li	r0,0
-	PPC_STL	r0,_TRAP-STACK_FRAME_OVERHEAD(r3)
-	PPC_STL	r0,ORIG_GPR3-STACK_FRAME_OVERHEAD(r3)
+	PPC_STL	r0,_TRAP(r3)
+	PPC_STL	r0,ORIG_GPR3(r3)
 	blr
-- 
2.37.2


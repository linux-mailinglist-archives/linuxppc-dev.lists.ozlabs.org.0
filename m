Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C8613014
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:01:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Zq0Mcnz3cHg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:01:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2YGUDjB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2YGUDjB;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rr5ZgWz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:04 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id m2so9504708pjr.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAqooRl5J387UvAlg1gsML2N/Ct4baaDVJBC+6yF5jI=;
        b=I2YGUDjBNvRKWKeTAP2j4NdxphzxUFLT2ZKe4O+3h4jRscIusjmkdhM7ANc2Kz9m4H
         /q8SQVz2odz2fGKYWrcAtCm6OSVzN3HVsXL38wC1G+7jSCURPbxLfYR8DPrL78A/R33h
         JbztPrrkiWLB9U5A9clkkCXItB8WDKLFihtV/qe3lHSfrgzyVyIuxV+4DFfGCau5huKl
         RsW+yE0qbKNVIaLSbtImbMFT46xLVc/NiUMVBCavqTOnHp9r3Bfk2zoPDeubLi+iaQ/i
         Pd6m7ycGVcYqqJkNayoGQroJIBfCgSZmJe9gcYIKvOB6aRQOzTiPTfToR3UzOcNluHbf
         iOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAqooRl5J387UvAlg1gsML2N/Ct4baaDVJBC+6yF5jI=;
        b=QhkjZdx+W73GsCbpQwSEHOM/O665UDBy4qH0hE6F1XsC5BQKk/t74ANxoodZSabzfI
         /RwNBZ6H83j1IMIy/oKn+Ku5FFQ1S5QKOK/7B06ooJUQv+/9tPc9OREaqpndMF8iUyvI
         FGg0ML/SLXiHtMPjQR0NZJ2z1EdG56qLqnHGEvxCiw+sQJ06Ug3tJtanJUNpBggod6gm
         QB6fTUYmjH+OzDgd70X23iSO9ZD5DeeJYl9Ul03blpJYyp3R5PRkVUZn1aGqiTrPHlhA
         AZzm+iQvqF8jHgqajIIjazNtis5ZZXmAXTsM2r/1WiD9Al9rWMnHqKvH45Mwl7tQbzIZ
         IMuw==
X-Gm-Message-State: ACrzQf2UhBcEN6l6mIeRhJ6dc4Cn1+EdmIxJhaMhNPQVvCBlhkJOz5Fq
	V4hySbpsw71/JFJXip9hGRlEkKZjrQI=
X-Google-Smtp-Source: AMsMyM75ajTw/oMGL4WXPddarJ4E8kmkjMbKmuUgt0YINPHjr9Ov5z7z88tzxjzOdVuuCKwPTedDNA==
X-Received: by 2002:a17:903:18c:b0:186:994c:51b8 with SMTP id z12-20020a170903018c00b00186994c51b8mr12721327plg.44.1667195702122;
        Sun, 30 Oct 2022 22:55:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 06/19] powerpc: simplify ppc_save_regs
Date: Mon, 31 Oct 2022 15:54:27 +1000
Message-Id: <20221031055440.3594315-7-npiggin@gmail.com>
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

Adjust the pt_regs pointer so the interrupt frame offsets can be used
directly to save registers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/ppc_save_regs.S | 58 +++++++----------------------
 1 file changed, 14 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kernel/ppc_save_regs.S b/arch/powerpc/kernel/ppc_save_regs.S
index 2d4d21bb46a9..2908a5c2cd2f 100644
--- a/arch/powerpc/kernel/ppc_save_regs.S
+++ b/arch/powerpc/kernel/ppc_save_regs.S
@@ -21,60 +21,30 @@
  * different ABIs, though).
  */
 _GLOBAL(ppc_save_regs)
-	PPC_STL	r0,0*SZL(r3)
-#ifdef CONFIG_PPC32
-	stmw	r2, 2*SZL(r3)
-#else
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
+	/* This allows stack frame accessor macros and offsets to be used */
+	subi	r3,r3,STACK_FRAME_OVERHEAD
+	SAVE_GPRS(0, 31, r3)
+#ifdef CONFIG_PPC64
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


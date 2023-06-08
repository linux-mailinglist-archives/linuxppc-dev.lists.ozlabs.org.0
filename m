Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95612727995
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGyc2gLrz3fL1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:07:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=swgYATDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=swgYATDF;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGnX6gWnz3f0r
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:59:12 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-653436fcc1bso134813b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211150; x=1688803150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDS1ZqNe46iVTWhss4bYT0AM3F6nP4Ljt86rnC65yFU=;
        b=swgYATDFtVxRXbCrZ6sfBsvPr7JsC9QKv/gPSKaGFHJup7RwzVfOgUa24YMr348IN2
         hEg6tizvdu6j8ouoYGCxpaQUBXYx2ra5k6jFAt+BO8PO2dGnNzG6aeiKP+3R+3KUHYvC
         VxYeMsvddYrsgGk5ViBmm2nni5mJbXQ9tFjFc9q1NcVbpTeIB3py4VcomWGdpGJINgha
         FR5M0H2B0EFnUSFCeDP6+uh8evcp9d+mNEkMBsSNpv1zycWlNlK/lXWh5Q4u5jvtDcKc
         +sqp6oDVTzFBfke9sSjb200B8qkEw+TeweyRp7k93CWINYSDp88Mpkqara2Phbu0t2IU
         hPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211150; x=1688803150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mDS1ZqNe46iVTWhss4bYT0AM3F6nP4Ljt86rnC65yFU=;
        b=BL49JJxChdXbDd2rgYkyi5Gyq/MK8oMJymZsEIYpCd0p1LVeZwe+GFhApOzrmsKA8H
         IEey+/5dQTK4anxpIw/tmdOuFMOU3dRkDjJgfOC6laKc5xmsimKITcstjN+t0gVoQld5
         e+Db7Wa0vMDTjqBj1jeLQxMHjv4BeUknZW65qgHMmHH2zrrXfJp0yOGPgBCiSfLhbL7T
         zX/zXbM19NxjqHCJ1QoY+mAJrZPPU5sBnFI5h6CyPJMAkBZdpW7aTpMmalkLN1yxb8us
         6ZvIDfS9nJdz4Xm9C9NahifbUm8CdXixiry+3ZlxzR6PRG4XBovhz1r8oUgoTsx4aNt+
         uIvg==
X-Gm-Message-State: AC+VfDyuqYzjvsMGS0RNExhkChhjoLA07AkvZGCfRqeldruJDaqggv+0
	2ZmpHPTF2JzMYQXb5aBdA6TFQc3slhg=
X-Google-Smtp-Source: ACHHUZ7bdMgOGbWdGi6/8pyWj3tH1+xk3V4UrVjhD/lMxg9d6oYh4A38PoSHkdANOG86yLgGuiLQBA==
X-Received: by 2002:a05:6a20:3944:b0:104:4c7d:25f8 with SMTP id r4-20020a056a20394400b001044c7d25f8mr3440432pzg.3.1686211150512;
        Thu, 08 Jun 2023 00:59:10 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:59:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 09/12] powerpc: Add support for more interrupts including HV interrupts
Date: Thu,  8 Jun 2023 17:58:23 +1000
Message-Id: <20230608075826.86217-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Interrupt vectors were not being populated for all architected
interrupt types, which could lead to crashes rather than a message for
unhandled interrupts.

0x20 sized vectors require some reworking of the code to fit. This
also adds support for HV / HSRR type interrupts which will be used in
a later change.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v3:
- Build fix [Joel]

 lib/powerpc/asm/ppc_asm.h |  3 ++
 powerpc/cstart64.S        | 79 ++++++++++++++++++++++++++++++++-------
 2 files changed, 68 insertions(+), 14 deletions(-)

diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index 6299ff53..46b4be00 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -35,6 +35,9 @@
 
 #endif /* __BYTE_ORDER__ */
 
+#define SPR_HSRR0	0x13A
+#define SPR_HSRR1	0x13B
+
 /* Machine State Register definitions: */
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
 #define MSR_SF_BIT	63			/* 64-bit mode */
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 34e39341..b7514100 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -184,14 +184,6 @@ call_handler:
 	mfcr	r0
 	std	r0,_CCR(r1)
 
-	/* nip and msr */
-
-	mfsrr0	r0
-	std	r0, _NIP(r1)
-
-	mfsrr1	r0
-	std	r0, _MSR(r1)
-
 	/* restore TOC pointer */
 
 	LOAD_REG_IMMEDIATE(r31, SPAPR_KERNEL_LOAD_ADDR)
@@ -238,6 +230,7 @@ call_handler:
 
 .section .text.ex
 
+/* [H]VECTOR must not be more than 8 instructions to fit in 0x20 vectors */
 .macro VECTOR vec
 	. = \vec
 
@@ -246,19 +239,28 @@ call_handler:
 	subi	r1,r1, INT_FRAME_SIZE
 
 	/* save r0 and ctr to call generic handler */
-
 	SAVE_GPR(0,r1)
 
-	mfctr	r0
-	std	r0,_CTR(r1)
+	li	r0,\vec
+	std	r0,_TRAP(r1)
 
-	ld	r0, P_HANDLER(0)
-	mtctr	r0
+	b	handler_trampoline
+.endm
+
+.macro HVECTOR vec
+	. = \vec
+
+	mtsprg1	r1	/* save r1 */
+	mfsprg0	r1	/* get exception stack address */
+	subi	r1,r1, INT_FRAME_SIZE
+
+	/* save r0 and ctr to call generic handler */
+	SAVE_GPR(0,r1)
 
 	li	r0,\vec
 	std	r0,_TRAP(r1)
 
-	bctr
+	b	handler_htrampoline
 .endm
 
 	. = 0x100
@@ -268,12 +270,61 @@ __start_interrupts:
 VECTOR(0x100)
 VECTOR(0x200)
 VECTOR(0x300)
+VECTOR(0x380)
 VECTOR(0x400)
+VECTOR(0x480)
 VECTOR(0x500)
 VECTOR(0x600)
 VECTOR(0x700)
 VECTOR(0x800)
 VECTOR(0x900)
+HVECTOR(0x980)
+VECTOR(0xa00)
+VECTOR(0xc00)
+VECTOR(0xd00)
+HVECTOR(0xe00)
+HVECTOR(0xe20)
+HVECTOR(0xe40)
+HVECTOR(0xe60)
+HVECTOR(0xe80)
+HVECTOR(0xea0)
+VECTOR(0xf00)
+VECTOR(0xf20)
+VECTOR(0xf40)
+VECTOR(0xf60)
+HVECTOR(0xf80)
+
+handler_trampoline:
+	mfctr	r0
+	std	r0,_CTR(r1)
+
+	ld	r0, P_HANDLER(0)
+	mtctr	r0
+
+	/* nip and msr */
+	mfsrr0	r0
+	std	r0, _NIP(r1)
+
+	mfsrr1	r0
+	std	r0, _MSR(r1)
+
+	bctr
+
+handler_htrampoline:
+	mfctr	r0
+	std	r0,_CTR(r1)
+
+	ld	r0, P_HANDLER(0)
+	mtctr	r0
+
+	/* nip and msr */
+	mfspr	r0, SPR_HSRR0
+	std	r0, _NIP(r1)
+
+	mfspr	r0, SPR_HSRR1
+	std	r0, _MSR(r1)
+
+	bctr
 
 	.align 7
 	.globl __end_interrupts
-- 
2.40.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F668159A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:56:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mtK/kvz+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsngD6KCvz3dVZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:56:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mtK/kvz+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnPf1jCjz3cXb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:44:22 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d3838ef1bbso10360155ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734259; x=1703339059; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrFiRWzr2/CWyKvsrLbnp0THJBKoGOpcOL5XEiuuKMg=;
        b=mtK/kvz+7l6NqE7v6+4msX9prR6iI4IS6Lj4u4EAKMpn9ihyi9R4IC+KdE2yTW4DOX
         BEBV2PSxlwGv0IHMNnrokldupQGGfDpCI4vsdJg4Xw2F3WWo6tYbCnSUSuQadTZLQXF1
         pRUx3ls6fwjycDTGq+qddepeS2rSg+Olu7NzTah+GkJmZGXGl3/mWDqBIKrWg2ZZz413
         KJEPw7Fud0mU4aClFy3hIrNG/vGMddSBiGLi00s3ij2aYMFVidWGcuSGBCV5YKl8IhGk
         P77eRvfk1hK5XgSjvQVhL1IkUbAE7VX1NIYelIqr/jCuhkhk+oL1fS7Lnuh2vjY/cGcM
         CgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734259; x=1703339059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrFiRWzr2/CWyKvsrLbnp0THJBKoGOpcOL5XEiuuKMg=;
        b=E2rWWCHWgBayBdf3UtCuXVgac0pjnePRZ56DhfwJ1tzk7Z2EuPTQnYL//7pMMKRFgD
         T3zl5FW+N3B36dNo4qYnTSPLYOKaaSuB5L4TqrkWhe42t3eYmuNuHUJA//mLbbvqBQ9W
         v+EQCQC3HtSyP9pH7ucrF8G90ezOZh7qvKyl0T764ZXZIul8GzXGbNuTLVhw6z2fzODv
         8lryH6FTbbHEiEETjp2kaq5KNw5pL4VI9+NtD4h8z7LPJGeO0B9iTc0oaxHHaOFlWnrp
         ON+aP8LoMmQZ6MGgrhwFYsihfxhGmBgjlqx3cvZY/yLtSMAwPtGY2WqBvdpjknrYO8yT
         lVEQ==
X-Gm-Message-State: AOJu0YzdsgeUKszX2pfh312qz5MHFaD4taMSRQuOHyvnGsO4fXzUmgdh
	xPRB3K1hRKrq1myG6Lz0zJM=
X-Google-Smtp-Source: AGHT+IEUphZixwmMJqUyoYGpZGqVVIMHdGhX3EvY6ReMIxVXWqpGW5j1M00J54p6roVW6KWrXEc8XQ==
X-Received: by 2002:a17:902:ea12:b0:1d3:3881:c50f with SMTP id s18-20020a170902ea1200b001d33881c50fmr9861383plg.45.1702734259378;
        Sat, 16 Dec 2023 05:44:19 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:44:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 15/29] powerpc: Add support for more interrupts including HV interrupts
Date: Sat, 16 Dec 2023 23:42:42 +1000
Message-ID: <20231216134257.1743345-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
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
2.42.0


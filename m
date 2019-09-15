Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C9B2DD3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:23:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCpR1Ng3zF6Jn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r2Cmj+hY"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBck3sv6zF2FK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:42 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m29so994743pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U61y2CWFAv/+DR5OVcD9pRsRrwKxGb43cNdpummBGvM=;
 b=r2Cmj+hYNlOpJ8vWDXTY0Emr4FjDZnYEGvqYbumUEEI+P6QNxReQo6w5Su/sXpJD5T
 GpPZ0IC4fdDg8BS6cLZ+3PS+Bvqs3745Sy4CALM7il2WG9UzgpNpyJB1MtxbvHVSGuRL
 nJnfAprMXy3jIRn3ebNh/XA4p2Tre/LDGvu5yspwh8cID6r79iXZ+s6zf9lRuoxqcKTS
 ZhA3CrgjBLjRfRC0dC7qK2NNVkRKz7urObPT22H5AMghsyRtHLFzPrHrQMiSAS9RhWk6
 /yZHfOMa2XRSCuvpaGDzYtQNFxsMN0ACpQzwkuD7gqvaugpvO0uSbAhKIewk7tQMOMQN
 E/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U61y2CWFAv/+DR5OVcD9pRsRrwKxGb43cNdpummBGvM=;
 b=G1kwxnXoBKxj+qPtqsnhUFdseHisyHf+69+ZiR8UMrCCCvrlfk06g4X4TMNQ2KxiQ1
 6HAr+XmP2292W2DfHT9R5Cn3RBIE2ChDUFOUQUEgejULN/wj5Bw9IIL1b0KaurjQuWs/
 +Gwutc5MnALUXr7J+LUdfaf/pOdUpINsCsQ87F+jgr9CM93IMTjiMXbHcc3xYt3A90FA
 NsxJAQ3umDlPr4JPmH1DgdyztWQoYDIDtw4dqgYPAP0hmGqA8Yqvy8QK0f9YI4MYuAIs
 CQmFfC8GeDkpwi1LS1M+ylfFX63zgMcu7zVbgtR8NrBiXoa+UHgYcrH/+dC1pDT3JLPK
 OhdA==
X-Gm-Message-State: APjAAAW+sJtdqBxM5yZcJTRuBNg/z8a6CCbexeO+T6d7acRd5wlfso0D
 Lm6UQPnJRdpTfoMnuMXEbcTNDARM
X-Google-Smtp-Source: APXvYqzhKqqU8Dtl08ifzzsrvEd855Xr11G9kNNWnQDsCQMoqXdgt5goUkrV0j86PIpWyglvwuDpbQ==
X-Received: by 2002:a63:5549:: with SMTP id f9mr18055489pgm.346.1568510979170; 
 Sat, 14 Sep 2019 18:29:39 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 26/27] powerpc/64s/exception: treat NIA below
 __end_interrupts as soft-masked
Date: Sun, 15 Sep 2019 11:28:12 +1000
Message-Id: <20190915012813.29317-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S | 34 +++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1bccc869ebd3..07e00f690730 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -492,10 +492,33 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 	.endif /* IVIRT */
 .endm
 
+#define LOAD_IMM(reg, expr)			\
+	lis	reg,(expr)@highest;		\
+	ori	reg,reg,(expr)@higher;		\
+	rldicr	reg,reg,32,31;			\
+	oris	reg,reg,(expr)@__AS_ATHIGH;	\
+	ori	reg,reg,(expr)@l
+
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
@@ -526,7 +549,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 
 	.if ISTACK
 	andi.	r10,r12,MSR_PR		/* See if coming from user	*/
-	mr	r10,r1			/* Save r1			*/
+2:	mr	r10,r1			/* Save r1			*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc frame on kernel stack	*/
 	beq-	100f
 	ld	r1,PACAKSAVE(r13)	/* kernel stack to use		*/
@@ -2771,7 +2794,8 @@ masked_interrupt:
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
-	/* returns to kernel where r13 must be set up, so don't restore it */
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	/* May return to masked low address where r13 is not set up */
 	.if \hsrr
 	HRFI_TO_KERNEL
 	.else
@@ -2930,6 +2954,10 @@ EXC_COMMON_BEGIN(ppc64_runlatch_on_trampoline)
 
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


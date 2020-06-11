Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DC1F6366
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 10:15:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jGrl3YvkzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 18:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NO1lPPu9; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jGmm0dQKzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 18:12:23 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id r7so5170403wro.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 01:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzbzYQlqTcjq/Z54VA5i0Fc++eCI+FzbgD9c7ww6d1Y=;
 b=NO1lPPu9si97eriO3CEk6BJvVIzLod+4jP8SwlnQ/+S1AvLzgMA/M39Y/MdRwgXzMx
 EN66CvT6OgdHmVHndUmEffKpvKiOGrYngmZybRYdaZijNxeKXNEs1htbYZdc5ZVofpV9
 yJBD+sgpvnRfFo4+B7ldbG3mmyPLItf8kxueFFUGggID365ETPXLKlRESRJfpvT6AzLP
 Gs7/FRIKlaxG5eQOYqqIrKFDK6UR4He2PjfxuVgvc/3CAHtCxnEks5bWadjoGqFUYqiH
 ejJJvp91B3YKSAkSNVR/OD5cF82+e8jHyMmrDzcFJku10pR20Ya74ZPQovLF5WRrDAEE
 Esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzbzYQlqTcjq/Z54VA5i0Fc++eCI+FzbgD9c7ww6d1Y=;
 b=XKpWNRkY+qhAxl2yr9DsIQkbwZZhX/XOp7D26u7cxCSnsKXORHwQuNR9KCDWcx2Rgj
 b8ed7ZyKOOoPxWA++3QYnUdJaUbLrmlFJLBmPzx21IoxOT3wX4HnsPNR9Xv0+BziqsOb
 3zTBqNwGif2LOHRwv1/eaQG5/NxuSoPhGsgPs5zv1IjjOR//WXqq6SEs+5B0GMRVl2cN
 X08GF7mzOxziI5d936DbVtu2lY7Pe6ZwgB+Xp6ac3BTd5Vwp/0lpAWfczTzLtk/8iOed
 scjqFHlEn/6epLB8YLAOlobQ17LrWSy1HRLYSWXK9Z/k0daNbgiLoigQlh1L+vsathmL
 XzCw==
X-Gm-Message-State: AOAM532sIfdDOv/kVgEg5a39O7hrSbF6TbElIp8QLTCCMkenNWQ58bF1
 BQfKsDByMhnQtSsM0dobju+PLg29
X-Google-Smtp-Source: ABdhPJzgTo5usegOpe/iVSOA7fm0pSEeo2rTUxOf7vOJjB1ErBF9OdbQWSt16LmfBhq9t1XurwBUTg==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr8738316wrv.392.1591863140736; 
 Thu, 11 Jun 2020 01:12:20 -0700 (PDT)
Received: from bobo.ibm.com (193-116-110-116.tpgi.com.au. [193.116.110.116])
 by smtp.gmail.com with ESMTPSA id w17sm3604826wra.71.2020.06.11.01.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:12:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/exception: treat NIA below __end_interrupts
 as soft-masked
Date: Thu, 11 Jun 2020 18:12:02 +1000
Message-Id: <20200611081203.995112-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200611081203.995112-1-npiggin@gmail.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
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
Cc: libc-dev@lists.llvm.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
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
index e70ebb5c318c..388e34665b4a 100644
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
+		cmpld	r11,r10
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
@@ -2838,7 +2854,8 @@ masked_interrupt:
 	ld	r10,PACA_EXGEN+EX_R10(r13)
 	ld	r11,PACA_EXGEN+EX_R11(r13)
 	ld	r12,PACA_EXGEN+EX_R12(r13)
-	/* returns to kernel where r13 must be set up, so don't restore it */
+	ld	r13,PACA_EXGEN+EX_R13(r13)
+	/* May return to masked low address where r13 is not set up */
 	.if \hsrr
 	HRFI_TO_KERNEL
 	.else
@@ -2997,6 +3014,10 @@ EXC_COMMON_BEGIN(ppc64_runlatch_on_trampoline)
 
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


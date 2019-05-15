Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFD1F48F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:38:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453vH335q0zDqZj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 22:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453sCM6Z1yzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:05:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="IgbwhnGW"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 453sCM2GXsz8v76
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:05:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 453sCM1bbbz9sPK; Wed, 15 May 2019 21:05:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="IgbwhnGW"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 453sCL3rYPz9sPG
 for <linuxppc-dev@ozlabs.org>; Wed, 15 May 2019 21:05:02 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 079D320644;
 Wed, 15 May 2019 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557918300;
 bh=MVSi9+4aGNxazG7TY3wX6HPB6MKEvtgGe40WlH0s/pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgbwhnGWaMe7VsP50DBri/zH/dVh949gRAxImRAOgN56ao9eXkwdUUndLXmML732P
 9VecjeRrf5qA3Z0DrPVl/YdylSIYS80adr+CjaWdP5L2V9rQEK44OvCTr5ZPgKhONs
 JQNFyftPh4kHnkWBGZ8Zl09wXAkyt7aXfErxiRks=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4.4 082/266] powerpc/fsl: Flush the branch predictor at each
 kernel entry (32 bit)
Date: Wed, 15 May 2019 12:53:09 +0200
Message-Id: <20190515090725.217167197@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515090722.696531131@linuxfoundation.org>
References: <20190515090722.696531131@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 May 2019 22:29:35 +1000
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
Cc: Diana Craciun <diana.craciun@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Diana Craciun <diana.craciun@nxp.com>

commit 7fef436295bf6c05effe682c8797dfcb0deb112a upstream.

In order to protect against speculation attacks on
indirect branches, the branch predictor is flushed at
kernel entry to protect for the following situations:
- userspace process attacking another userspace process
- userspace process attacking the kernel
Basically when the privillege level change (i.e.the kernel
is entered), the branch predictor state is flushed.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/head_booke.h     |    6 ++++++
 arch/powerpc/kernel/head_fsl_booke.S |   15 +++++++++++++++
 2 files changed, 21 insertions(+)

--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -42,6 +42,9 @@
 	andi.	r11, r11, MSR_PR;	/* check whether user or kernel    */\
 	mr	r11, r1;						     \
 	beq	1f;							     \
+START_BTB_FLUSH_SECTION					\
+	BTB_FLUSH(r11)						\
+END_BTB_FLUSH_SECTION					\
 	/* if from user, start at top of this thread's kernel stack */       \
 	lwz	r11, THREAD_INFO-THREAD(r10);				     \
 	ALLOC_STACK_FRAME(r11, THREAD_SIZE);				     \
@@ -127,6 +130,9 @@
 	stw	r9,_CCR(r8);		/* save CR on stack		   */\
 	mfspr	r11,exc_level_srr1;	/* check whether user or kernel    */\
 	DO_KVM	BOOKE_INTERRUPT_##intno exc_level_srr1;		             \
+START_BTB_FLUSH_SECTION								\
+	BTB_FLUSH(r10)									\
+END_BTB_FLUSH_SECTION								\
 	andi.	r11,r11,MSR_PR;						     \
 	mfspr	r11,SPRN_SPRG_THREAD;	/* if from user, start at top of   */\
 	lwz	r11,THREAD_INFO-THREAD(r11); /* this thread's kernel stack */\
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -451,6 +451,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	mfcr	r13
 	stw	r13, THREAD_NORMSAVE(3)(r10)
 	DO_KVM	BOOKE_INTERRUPT_DTLB_MISS SPRN_SRR1
+START_BTB_FLUSH_SECTION
+	mfspr r11, SPRN_SRR1
+	andi. r10,r11,MSR_PR
+	beq 1f
+	BTB_FLUSH(r10)
+1:
+END_BTB_FLUSH_SECTION
 	mfspr	r10, SPRN_DEAR		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
@@ -545,6 +552,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	mfcr	r13
 	stw	r13, THREAD_NORMSAVE(3)(r10)
 	DO_KVM	BOOKE_INTERRUPT_ITLB_MISS SPRN_SRR1
+START_BTB_FLUSH_SECTION
+	mfspr r11, SPRN_SRR1
+	andi. r10,r11,MSR_PR
+	beq 1f
+	BTB_FLUSH(r10)
+1:
+END_BTB_FLUSH_SECTION
+
 	mfspr	r10, SPRN_SRR0		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CAA1CA251
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:38:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHdh6VY7zDqKK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:38:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VQta13SK; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHXt0gchzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:21 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x77so312133pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9XtfIIDLyr36lLxdLlS6sf1Jyk0k7vqgXSkE7+7UBY=;
 b=VQta13SKK7rWUhbUG1suwogO5QD+/cG1527HTcjkv9xWJfwqdUBg2E2Op2+f80zAr9
 w78YjyfpcawLfsyHNcAsGrxJgK/Nvf5MZl7/62VMbq5gU7MHZ/ziBfRn937lwugZWIBW
 BNDS3MMLHG8DJDhF3T7nNxT4t9AKdql0MlLgUMlrtcAains9O1XW8CYAOy91/nPsq6Jo
 IFuxzV4n3hLWac7baBidveuwygn6PKOOLEicAE8Jyhp39WBB4qYxQ7zqjtP0TnNqpNmH
 bGnQAOkNsWCzr2rdLI3/89kqPm+ZO1Yyjjp6j2AhjrnW8CyJq3O7DcLR9fB7bxCrW9EE
 2UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9XtfIIDLyr36lLxdLlS6sf1Jyk0k7vqgXSkE7+7UBY=;
 b=gocyClAOB6pxGiij1qomCl0nhTx/QpDnhjjRgtj78/feI23vNSS30YEi+2VkrxfyOp
 iB+4821mycp8Yuh1lpH61RAYjHGbh3J7T/U4zzdMF7Cjc15S+b0BmPcoVg1Xv9OhEI00
 YeLYIYjYhtSF5ljUHicSq9GL0vpvRyYxStpxmTRGTA0NQxDQ2+ZlH0bCUHNbMhFb1DTo
 M/Ys/3W6iYLe8JZMkCvRjaWH3t4JQCPGAu+QQRLeurwJPCV2DVlFDuS0E3D6a4ZEMRwO
 oTN6J7D1sYyP/MYqXZrFeNWpNZQ/ru278Co6g4pGxC72zPxgHolYwnMkwPK7WJAqnMfS
 yPPA==
X-Gm-Message-State: AGi0PuZqLRvKz6D4RZemYDyk5HZc5b+DunwdesxDgvRwX1LxoEDEOBaU
 5Db4487s+gg5UvLAOKzQY2l1034b
X-Google-Smtp-Source: APiQypJLsWIlNUfeqDwCax30KNErMNb0ih23eqcY0Z2OcIr3MEq2siqRMrRAYu60+N+t/l76yRKz8A==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr584138pgh.6.1588912459092;
 Thu, 07 May 2020 21:34:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/16] powerpc/64s/exception: Fix machine check no-loss
 idle wakeup
Date: Fri,  8 May 2020 14:33:53 +1000
Message-Id: <20200508043408.886394-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The architecture allows for machine check exceptions to cause idle
wakeups which resume at the 0x200 address which has to return via
the idle wakeup code, but the early machine check handler is run
first.

The case of a no state-loss sleep is broken because the early
handler uses non-volatile register r1 , which is needed for the wakeup
protocol, but it is not restored.

Fix this by loading r1 from the MCE exception frame before returning
to the idle wakeup code. Also update the comment which has become
stale since the idle rewrite in C.

Fixes: 10d91611f426d ("powerpc/64s: Reimplement book3s idle code in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

This crash was found and fix confirmed with a machine check injection
test in qemu powernv model (which is not upstream in qemu yet).
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 728ccb0f560c..bbf3109c5cba 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1224,17 +1224,19 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	bl	machine_check_queue_event
 
 	/*
-	 * We have not used any non-volatile GPRs here, and as a rule
-	 * most exception code including machine check does not.
-	 * Therefore PACA_NAPSTATELOST does not need to be set. Idle
-	 * wakeup will restore volatile registers.
+	 * GPR-loss wakeups are relatively straightforward, because the
+	 * idle sleep code has saved all non-volatile registers on its
+	 * own stack, and r1 in PACAR1.
 	 *
-	 * Load the original SRR1 into r3 for pnv_powersave_wakeup_mce.
+	 * For no-loss wakeups the r1 and lr registers used by the
+	 * early machine check handler have to be restored first. r2 is
+	 * the kernel TOC, so no need to restore it.
 	 *
 	 * Then decrement MCE nesting after finishing with the stack.
 	 */
 	ld	r3,_MSR(r1)
 	ld	r4,_LINK(r1)
+	ld	r1,GPR1(r1)
 
 	lhz	r11,PACA_IN_MCE(r13)
 	subi	r11,r11,1
@@ -1243,7 +1245,7 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	mtlr	r4
 	rlwinm	r10,r3,47-31,30,31
 	cmpwi	cr1,r10,2
-	bltlr	cr1	/* no state loss, return to idle caller */
+	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
 	b	idle_return_gpr_loss
 #endif
 
-- 
2.23.0


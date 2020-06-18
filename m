Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05531FE944
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 05:14:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nRqR620CzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 13:14:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VUh3jU1a; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPHX3XCVzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:19:52 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B73A21D80;
 Thu, 18 Jun 2020 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443189;
 bh=d8hWKR8nu0SzVC4KJO15bRIP1AlgJ0tDnm9EpB/vIhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VUh3jU1aFOfflb6/F/rJPr2BP7DTxO9T91QTtgzoG3UMJlwqKDGQopNXck/zTr0ag
 BBhjrMFfWxJTvyRWeCR9hlSRq2qRkZFuXPeJacAigyvB4zkdJQf5/s5kd7qA3cLx9F
 8Q1ILlWnZbUzepy8q5UN/5peA1pYzW8Khw4/PfQY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 150/266] powerpc/64s/exception: Fix machine check
 no-loss idle wakeup
Date: Wed, 17 Jun 2020 21:14:35 -0400
Message-Id: <20200618011631.604574-150-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 8a5054d8cbbe03c68dcb0957c291c942132e4101 ]

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

This crash was found and fix confirmed with a machine check injection
test in qemu powernv model (which is not upstream in qemu yet).

Fixes: 10d91611f426d ("powerpc/64s: Reimplement book3s idle code in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200508043408.886394-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d0018dd17e0a..70ac8a6ba0c1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1090,17 +1090,19 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
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
@@ -1109,7 +1111,7 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	mtlr	r4
 	rlwinm	r10,r3,47-31,30,31
 	cmpwi	cr1,r10,2
-	bltlr	cr1	/* no state loss, return to idle caller */
+	bltlr	cr1	/* no state loss, return to idle caller with r3=SRR1 */
 	b	idle_return_gpr_loss
 #endif
 
-- 
2.25.1


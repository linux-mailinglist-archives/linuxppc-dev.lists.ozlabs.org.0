Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C06925B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:47:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2lw4X3qz3fB0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:47:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ewnLlSmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ewnLlSmD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dw2ykdz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F8F861E92;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10319C433D2;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=5cvHn8UKfrP9MTtWM7vqYeWeSfq+8/+asQ1IeAi7rdU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ewnLlSmD7qSinpp7t04vY53To01orvmSmUcgIz+ZWNMaBSSpl9ggD6DffmcgASNCL
	 azn7rtp5UUJ7oAGm/HS8Ap3RNMeeYLhSpKC4AN+inJOPAc/L2xQ4sIMRTaoLH/9as9
	 SCtn3Ca+7yCs6UBAOvdkkw/lh91zS2c714GR+/bJV76VcLIjxN2inbU3ExWZgLMKdh
	 wvDjGNhiwlKTBK+OqwHyERNCfcOnmZAeg0rvcc5RT/WzzijRSW++SjAUvLw8UDAz0O
	 DQl/Rr+MzQ/C0jvrbjuLR3JrC3od1fF2iFoKNfqoQPfHqeWZg9JLzppwS2Z0sLYBAW
	 6hCGIwsTKt1Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2466C64EC7;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:55 -0600
Subject: [PATCH v3 07/20] powerpc/pseries: drop RTAS-based timebase
 synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-7-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=1232;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=tFcGWQ1AkW6nsQJJK1c3LerD+9XTZywFqC0rfZVIXdk=;
 b=073kWWTozS7BkWAgIlJfebvtMnw02sIqmZeNfn5fYkl5mJdlvRZzf6NQnMl6rc2qvYWEdaxI1
 WZssuATaRnyC06PtvxQpyWoP1dDArR8Ppcq7cS5YDcnSRQsKMZcA/Do
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The pseries platform has been LPAR-only for several generations, and
the PAPR spec:

* Guarantees that timebase synchronization is performed by
  the platform ("The timebase registers are synchronized by the
  platform before CPUs are given to the OS" - 7.3.8 SMP Support).

* Completely omits the RTAS freeze-time-base and thaw-time-base RTAS
  functions, which are CHRP artifacts.

This code is effectively unused on currently supported models, so drop
it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index fd2174edfa1d..2bcfee86ff87 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -278,11 +278,5 @@ void __init smp_init_pseries(void)
 		cpumask_clear_cpu(boot_cpuid, of_spin_mask);
 	}
 
-	/* Non-lpar has additional take/give timebase */
-	if (rtas_token("freeze-time-base") != RTAS_UNKNOWN_SERVICE) {
-		smp_ops->give_timebase = rtas_give_timebase;
-		smp_ops->take_timebase = rtas_take_timebase;
-	}
-
 	pr_debug(" <- smp_init_pSeries()\n");
 }

-- 
2.39.1


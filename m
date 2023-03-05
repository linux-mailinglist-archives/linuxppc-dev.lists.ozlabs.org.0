Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D70F6AB0D6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 15:06:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3RG0Lf5z3fYS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 01:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FkIRLN64;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FkIRLN64;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV38d3GSCz3f3v
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:53:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D5F9B80ACE;
	Sun,  5 Mar 2023 13:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79096C433EF;
	Sun,  5 Mar 2023 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024428;
	bh=ZjpqbBZPb4gO4ILImJWvBuJUXCoGUifSuqGlkqqc4Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FkIRLN64v+TaH86kp9xMxZyAnp/oGQRRKuR0MKrpAkgN45p5cUAo5IpJRcN3KSdNM
	 TN/FJrQriECG3k1sXJNw+eRZx6qY83UNqBm9tyqoQdg2/3Xl2Y4oB50wIZhEso5pk8
	 CMnVf63kYCb+ieDlkgy/KOR7NydcMXxvwZBkuDaEOwUjPvFOXkfXcW1RFStlObmUER
	 EbAX4YNwa0SO25ObGPVOZn7nJ9NZi4ZZEQcCr85UzTVtvqNjAqhJ0nd1DKCcvwSEi+
	 87ouyrbxue3sYY9C0KBbb6B93cs9v90duzHBFW/UeKV5UH0jXoDtK7hEAkI8JqbF60
	 6XoOsMbdWUMqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/15] powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
Date: Sun,  5 Mar 2023 08:53:02 -0500
Message-Id: <20230305135306.1793564-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135306.1793564-1-sashal@kernel.org>
References: <20230305135306.1793564-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, alexandre.belloni@bootlin.com, Julia.Lawall@inria.fr, Rohan McLure <rmclure@linux.ibm.com>, ganeshgr@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rohan McLure <rmclure@linux.ibm.com>

[ Upstream commit 2a7ce82dc46c591c9244057d89a6591c9639b9b9 ]

In order for KCSAN to increase its likelihood of observing a data race,
it sets a watchpoint on memory accesses and stalls, allowing for
detection of conflicting accesses by other kernel threads or interrupts.

Stalls are implemented by injecting a call to udelay in instrumented code.
To prevent recursive instrumentation, exclude udelay from being instrumented.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20230206021801.105268-3-rmclure@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f157552d79b38..285159e65a3ba 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -374,7 +374,7 @@ void vtime_flush(struct task_struct *tsk)
 #define calc_cputime_factors()
 #endif
 
-void __delay(unsigned long loops)
+void __no_kcsan __delay(unsigned long loops)
 {
 	unsigned long start;
 
@@ -395,7 +395,7 @@ void __delay(unsigned long loops)
 }
 EXPORT_SYMBOL(__delay);
 
-void udelay(unsigned long usecs)
+void __no_kcsan udelay(unsigned long usecs)
 {
 	__delay(tb_ticks_per_usec * usecs);
 }
-- 
2.39.2


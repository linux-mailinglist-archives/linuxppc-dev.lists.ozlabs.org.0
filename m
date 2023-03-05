Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA16AB0B8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 14:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3Gz60Nmz3cMR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 00:59:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EPdxsN/t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EPdxsN/t;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV37b05nSz3ccv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:52:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AA808B80A36;
	Sun,  5 Mar 2023 13:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682E9C433EF;
	Sun,  5 Mar 2023 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024375;
	bh=6DXEWvDLO0oazULhqYHOTTVDENA5Kb6QTRTb6/Zllwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPdxsN/tHsh1HJCZseIRpxoLp7yQfD44+Pj6TnOUrNRrsaf7I9yp7LdXqswikAsIY
	 y87+tdI69fDMbaQzzwq118zJtJC2ic86GdM4esJNgpsX7DhybW0g2WC4WkUX7WgooI
	 Yzt3CaDAXMYc/dPVAWQH0fPrkzgEnmWO8eSrwxegRjGToM0M9O+eqSJvxyOg1hoYlM
	 VKrMDekbKogUqFcHIqrOeR+Oz6NvzTMpfSz2F8TOT0E2mDeUiHiLPgOlIfEZJHG6/Q
	 Q7GSDls4dStz8ZgQ4ickHCiMb8K5OnFBuDQaTSauEMZKwpWJp6OQ2bJoEe2ZjxMoPz
	 uF18Uowv9EpKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 12/16] powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
Date: Sun,  5 Mar 2023 08:52:03 -0500
Message-Id: <20230305135207.1793266-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135207.1793266-1-sashal@kernel.org>
References: <20230305135207.1793266-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, alexandre.belloni@bootlin.com, Rohan McLure <rmclure@linux.ibm.com>, ganeshgr@linux.ibm.com, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, heying24@huawei.com
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
index e26eb6618ae5d..9d8665910350c 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -356,7 +356,7 @@ void vtime_flush(struct task_struct *tsk)
 }
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
-void __delay(unsigned long loops)
+void __no_kcsan __delay(unsigned long loops)
 {
 	unsigned long start;
 
@@ -377,7 +377,7 @@ void __delay(unsigned long loops)
 }
 EXPORT_SYMBOL(__delay);
 
-void udelay(unsigned long usecs)
+void __no_kcsan udelay(unsigned long usecs)
 {
 	__delay(tb_ticks_per_usec * usecs);
 }
-- 
2.39.2


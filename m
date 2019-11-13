Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC92FA6ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 03:58:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CTpR4chVzF3nc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 13:58:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="vxZt4NVK"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSRf3skWzF64p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 12:57:34 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C87342245A;
 Wed, 13 Nov 2019 01:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610252;
 bh=tumwbkLJx4WESNM/WDRtCUOjFtxKWYFdxn2zjnFdH44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vxZt4NVKuErWdh7zySaN28NlQpASci/OqPBOVN+Hv2PxMKjvjVz8U+xDHwVHWXdi8
 YNMMrF3i5NMONdb21mdAFAwPPWBgNDu08KhdIKKIkIBf1lLEIYY7xhfGPVZ7WUCR8q
 7W7/Vv5HCRB5XqY0NJk5/ZoNaAP2w7dgZqfBTykA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 048/115] powerpc/time: Use
 clockevents_register_device(), fixing an issue with large decrementer
Date: Tue, 12 Nov 2019 20:55:15 -0500
Message-Id: <20191113015622.11592-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anton Blanchard <anton@ozlabs.org>

[ Upstream commit 8b78fdb045de60a4eb35460092bbd3cffa925353 ]

We currently cap the decrementer clockevent at 4 seconds, even on systems
with large decrementer support. Fix this by converting the code to use
clockevents_register_device() which calculates the upper bound based on
the max_delta passed in.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/time.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index fe6f3a2854557..870e75d304591 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -984,10 +984,10 @@ static void register_decrementer_clockevent(int cpu)
 	*dec = decrementer_clockevent;
 	dec->cpumask = cpumask_of(cpu);
 
+	clockevents_config_and_register(dec, ppc_tb_freq, 2, decrementer_max);
+
 	printk_once(KERN_DEBUG "clockevent: %s mult[%x] shift[%d] cpu[%d]\n",
 		    dec->name, dec->mult, dec->shift, cpu);
-
-	clockevents_register_device(dec);
 }
 
 static void enable_large_decrementer(void)
@@ -1035,18 +1035,7 @@ static void __init set_decrementer_max(void)
 
 static void __init init_decrementer_clockevent(void)
 {
-	int cpu = smp_processor_id();
-
-	clockevents_calc_mult_shift(&decrementer_clockevent, ppc_tb_freq, 4);
-
-	decrementer_clockevent.max_delta_ns =
-		clockevent_delta2ns(decrementer_max, &decrementer_clockevent);
-	decrementer_clockevent.max_delta_ticks = decrementer_max;
-	decrementer_clockevent.min_delta_ns =
-		clockevent_delta2ns(2, &decrementer_clockevent);
-	decrementer_clockevent.min_delta_ticks = 2;
-
-	register_decrementer_clockevent(cpu);
+	register_decrementer_clockevent(smp_processor_id());
 }
 
 void secondary_cpu_time_init(void)
-- 
2.20.1


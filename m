Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B055592387
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5N432BJVz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:22:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b03aAklM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b03aAklM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5N3V1zTfz2xG4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:22:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB4E0B80B78;
	Sun, 14 Aug 2022 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCC9C433D6;
	Sun, 14 Aug 2022 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494131;
	bh=8Vs1K216HeZwGcDjWgWfkjFQVdk3bJl/msDS7/SN7ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b03aAklMdoFr+SFZxs+qyQI51yIYRJG3kAGQdXa8GZnovTeE7QlDA3H3RiC2iVobz
	 eqibcifgqJ11ocmstc+zTK+1p65ip5E5ovcBg7cUe9tolSq5WijdHP3hfNE8RGzN/x
	 zUOOWsRWAu/c5lJ4wVZmTOaYbGvF/yxdiGiKZ0KXVf+KEC41D/QMjrSEXSD9fxGimp
	 +A3/wKjcWmO4PFA+f0mFXpva7eauiwVw1MRcGLgyBrLVusNia4zSAP/T/H3/Gx4yB9
	 3vlpvxCazHYinbunfuWoTsHkxHMGIc74oNrLpPBGahEAqVdvxVSj5YaeAlYV28Uq4x
	 OIe0m97NYzjew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 29/48] powerpc/watchdog: introduce a NMI watchdog's factor
Date: Sun, 14 Aug 2022 12:19:22 -0400
Message-Id: <20220814161943.2394452-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, pmladek@suse.com, Nicholas Piggin <npiggin@gmail.com>, Julia.Lawall@inria.fr, joel@jms.id.au, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Dufour <ldufour@linux.ibm.com>

[ Upstream commit f5e74e836097d1004077390717d4bd95d4a2c27a ]

Introduce a factor which would apply to the NMI watchdog timeout.

This factor is a percentage added to the watchdog_tresh value. The value is
set under the watchdog_mutex protection and lockup_detector_reconfigure()
is called to recompute wd_panic_timeout_tb.

Once the factor is set, it remains until it is set back to 0, which means
no impact.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220713154729.80789-4-ldufour@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/nmi.h |  2 ++
 arch/powerpc/kernel/watchdog.c | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index ea0e487f87b1..c3c7adef74de 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -5,8 +5,10 @@
 #ifdef CONFIG_PPC_WATCHDOG
 extern void arch_touch_nmi_watchdog(void);
 long soft_nmi_interrupt(struct pt_regs *regs);
+void watchdog_nmi_set_timeout_pct(u64 pct);
 #else
 static inline void arch_touch_nmi_watchdog(void) {}
+static inline void watchdog_nmi_set_timeout_pct(u64 pct) {}
 #endif
 
 #ifdef CONFIG_NMI_IPI
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 7d28b9553654..5d903e63f932 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -91,6 +91,10 @@ static cpumask_t wd_smp_cpus_pending;
 static cpumask_t wd_smp_cpus_stuck;
 static u64 wd_smp_last_reset_tb;
 
+#ifdef CONFIG_PPC_PSERIES
+static u64 wd_timeout_pct;
+#endif
+
 /*
  * Try to take the exclusive watchdog action / NMI IPI / printing lock.
  * wd_smp_lock must be held. If this fails, we should return and wait
@@ -527,7 +531,13 @@ static int stop_watchdog_on_cpu(unsigned int cpu)
 
 static void watchdog_calc_timeouts(void)
 {
-	wd_panic_timeout_tb = watchdog_thresh * ppc_tb_freq;
+	u64 threshold = watchdog_thresh;
+
+#ifdef CONFIG_PPC_PSERIES
+	threshold += (READ_ONCE(wd_timeout_pct) * threshold) / 100;
+#endif
+
+	wd_panic_timeout_tb = threshold * ppc_tb_freq;
 
 	/* Have the SMP detector trigger a bit later */
 	wd_smp_panic_timeout_tb = wd_panic_timeout_tb * 3 / 2;
@@ -570,3 +580,12 @@ int __init watchdog_nmi_probe(void)
 	}
 	return 0;
 }
+
+#ifdef CONFIG_PPC_PSERIES
+void watchdog_nmi_set_timeout_pct(u64 pct)
+{
+	pr_info("Set the NMI watchdog timeout factor to %llu%%\n", pct);
+	WRITE_ONCE(wd_timeout_pct, pct);
+	lockup_detector_reconfigure();
+}
+#endif
-- 
2.35.1


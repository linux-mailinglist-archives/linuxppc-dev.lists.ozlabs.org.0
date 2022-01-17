Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2310490E5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcz2F5zt9z3fPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CAhthKjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CAhthKjL; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcyqX2rNNz3cjk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:01:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD10E6119C;
 Mon, 17 Jan 2022 17:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFD2C36AE3;
 Mon, 17 Jan 2022 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438902;
 bh=tg8iEjvzYlmjjMbrWjc40apMLT5XKRdF0J/xCoow65U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CAhthKjLLz/+jmdQ9brgeMOVL6fj/Ol2T0yuDjm0Ryt1EbYH7cQyhpCCF0A4zDOEn
 I4GhPJd/rGC7npkEaa2/R7+Edt1d3Nb6VqrPM272//qfvOHf+qp3uSop4jWn28OBAc
 9bVfb4/i1wOyz7gxWbVI8WnG9+Ehypo7GbtPx8EKx9vJ7Xpom7mka5lv8ZY3yxNAlS
 PeBp2DboHwTwtQ0Wo4+CfN9MKUwidcrVlX/zQEkBBccWY5XQCUl+i0zfyazA2lMKSY
 haaVrPsHyKXHQkHQ5xHnh57WZCGDf8PsTzwT3p8SSW9UMaemlrY9jJSMRkM8zvOmsm
 12nfqhIWGn0Qg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/44] powerpc/watchdog: Fix missed watchdog
 reset due to memory ordering race
Date: Mon, 17 Jan 2022 12:00:49 -0500
Message-Id: <20220117170127.1471115-6-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, pmladek@suse.com,
 john.ogness@linutronix.de, Nicholas Piggin <npiggin@gmail.com>, clg@kaod.org,
 sudeep.holla@arm.com, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 5dad4ba68a2483fc80d70b9dc90bbe16e1f27263 ]

It is possible for all CPUs to miss the pending cpumask becoming clear,
and then nobody resetting it, which will cause the lockup detector to
stop working. It will eventually expire, but watchdog_smp_panic will
avoid doing anything if the pending mask is clear and it will never be
reset.

Order the cpumask clear vs the subsequent test to close this race.

Add an extra check for an empty pending mask when the watchdog fires and
finds its bit still clear, to try to catch any other possible races or
bugs here and keep the watchdog working. The extra test in
arch_touch_nmi_watchdog is required to prevent the new warning from
firing off.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Debugged-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211110025056.2084347-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/watchdog.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 3fa6d240bade2..ad94a2c6b7337 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -135,6 +135,10 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
 {
 	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
 	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	/*
+	 * See wd_smp_clear_cpu_pending()
+	 */
+	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		wd_smp_last_reset_tb = tb;
 		cpumask_andnot(&wd_smp_cpus_pending,
@@ -221,13 +225,44 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
 			wd_smp_unlock(&flags);
+		} else {
+			/*
+			 * The last CPU to clear pending should have reset the
+			 * watchdog so we generally should not find it empty
+			 * here if our CPU was clear. However it could happen
+			 * due to a rare race with another CPU taking the
+			 * last CPU out of the mask concurrently.
+			 *
+			 * We can't add a warning for it. But just in case
+			 * there is a problem with the watchdog that is causing
+			 * the mask to not be reset, try to kick it along here.
+			 */
+			if (unlikely(cpumask_empty(&wd_smp_cpus_pending)))
+				goto none_pending;
 		}
 		return;
 	}
+
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
+
+	/*
+	 * Order the store to clear pending with the load(s) to check all
+	 * words in the pending mask to check they are all empty. This orders
+	 * with the same barrier on another CPU. This prevents two CPUs
+	 * clearing the last 2 pending bits, but neither seeing the other's
+	 * store when checking if the mask is empty, and missing an empty
+	 * mask, which ends with a false positive.
+	 */
+	smp_mb();
 	if (cpumask_empty(&wd_smp_cpus_pending)) {
 		unsigned long flags;
 
+none_pending:
+		/*
+		 * Double check under lock because more than one CPU could see
+		 * a clear mask with the lockless check after clearing their
+		 * pending bits.
+		 */
 		wd_smp_lock(&flags);
 		if (cpumask_empty(&wd_smp_cpus_pending)) {
 			wd_smp_last_reset_tb = tb;
@@ -318,8 +353,12 @@ void arch_touch_nmi_watchdog(void)
 {
 	unsigned long ticks = tb_ticks_per_usec * wd_timer_period_ms * 1000;
 	int cpu = smp_processor_id();
-	u64 tb = get_tb();
+	u64 tb;
 
+	if (!cpumask_test_cpu(cpu, &watchdog_cpumask))
+		return;
+
+	tb = get_tb();
 	if (tb - per_cpu(wd_timer_tb, cpu) >= ticks) {
 		per_cpu(wd_timer_tb, cpu) = tb;
 		wd_smp_clear_cpu_pending(cpu, tb);
-- 
2.34.1


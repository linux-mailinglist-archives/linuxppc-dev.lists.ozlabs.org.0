Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0E6159EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 07:42:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ypQw2D2vzDqJ8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 15:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pW0l8Xyz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ypKh5PLpzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 15:38:00 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E6B92087F;
 Tue,  7 May 2019 05:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557207479;
 bh=6W6Mi8HUuZjYOIMAeuu7rV6HK6WPwU1LYU98bGf0QEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pW0l8XyzOPEmXsGUKpS7eFKiCILO9PuBReTTyJJUsi7DxrapYJ8YsKzcQ6iBllY9p
 /MwM/rTevi0gZhN4VxdR1TdSEn92e93iBiHmMZEutf9FIrNeHbxEuYBCk1uG1Jvjcs
 qwXiEvNugsMizYroc8J92Pn0XPndL15bwxH1952U=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 65/81] powerpc/smp: Fix NMI IPI xmon timeout
Date: Tue,  7 May 2019 01:35:36 -0400
Message-Id: <20190507053554.30848-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053554.30848-1-sashal@kernel.org>
References: <20190507053554.30848-1-sashal@kernel.org>
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
Cc: Sasha Levin <alexander.levin@microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 88b9a3d1425a436e95c41f09986fdae2daee437a ]

The xmon debugger IPI handler waits in the callback function while
xmon is still active. This means they don't complete the IPI, and the
initiator always times out waiting for them.

Things manage to work after the timeout because there is some fallback
logic to keep NMI IPI state sane in case of the timeout, but this is a
bit ugly.

This patch changes NMI IPI back to half-asynchronous (i.e., wait for
everyone to call in, do not wait for IPI function to complete), but
the complexity is avoided by going one step further and allowing new
IPIs to be issued before the IPI functions to all complete.

If synchronization against that is required, it is left up to the
caller, but current callers don't require that. In fact with the
timeout handling, callers must be able to cope with this already.

Fixes: 5b73151fff63 ("powerpc: NMI IPI make NMI IPIs fully sychronous")
Cc: stable@vger.kernel.org # v4.19+
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/powerpc/kernel/smp.c | 93 ++++++++++++---------------------------
 1 file changed, 29 insertions(+), 64 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 22abba5f4cf0..6dc43205382b 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -338,13 +338,12 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
  * NMI IPIs may not be recoverable, so should not be used as ongoing part of
  * a running system. They can be used for crash, debug, halt/reboot, etc.
  *
- * NMI IPIs are globally single threaded. No more than one in progress at
- * any time.
- *
  * The IPI call waits with interrupts disabled until all targets enter the
- * NMI handler, then the call returns.
+ * NMI handler, then returns. Subsequent IPIs can be issued before targets
+ * have returned from their handlers, so there is no guarantee about
+ * concurrency or re-entrancy.
  *
- * No new NMI can be initiated until targets exit the handler.
+ * A new NMI can be issued before all targets exit the handler.
  *
  * The IPI call may time out without all targets entering the NMI handler.
  * In that case, there is some logic to recover (and ignore subsequent
@@ -355,7 +354,7 @@ void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 
 static atomic_t __nmi_ipi_lock = ATOMIC_INIT(0);
 static struct cpumask nmi_ipi_pending_mask;
-static int nmi_ipi_busy_count = 0;
+static bool nmi_ipi_busy = false;
 static void (*nmi_ipi_function)(struct pt_regs *) = NULL;
 
 static void nmi_ipi_lock_start(unsigned long *flags)
@@ -394,7 +393,7 @@ static void nmi_ipi_unlock_end(unsigned long *flags)
  */
 int smp_handle_nmi_ipi(struct pt_regs *regs)
 {
-	void (*fn)(struct pt_regs *);
+	void (*fn)(struct pt_regs *) = NULL;
 	unsigned long flags;
 	int me = raw_smp_processor_id();
 	int ret = 0;
@@ -405,29 +404,17 @@ int smp_handle_nmi_ipi(struct pt_regs *regs)
 	 * because the caller may have timed out.
 	 */
 	nmi_ipi_lock_start(&flags);
-	if (!nmi_ipi_busy_count)
-		goto out;
-	if (!cpumask_test_cpu(me, &nmi_ipi_pending_mask))
-		goto out;
-
-	fn = nmi_ipi_function;
-	if (!fn)
-		goto out;
-
-	cpumask_clear_cpu(me, &nmi_ipi_pending_mask);
-	nmi_ipi_busy_count++;
-	nmi_ipi_unlock();
-
-	ret = 1;
-
-	fn(regs);
-
-	nmi_ipi_lock();
-	if (nmi_ipi_busy_count > 1) /* Can race with caller time-out */
-		nmi_ipi_busy_count--;
-out:
+	if (cpumask_test_cpu(me, &nmi_ipi_pending_mask)) {
+		cpumask_clear_cpu(me, &nmi_ipi_pending_mask);
+		fn = READ_ONCE(nmi_ipi_function);
+		WARN_ON_ONCE(!fn);
+		ret = 1;
+	}
 	nmi_ipi_unlock_end(&flags);
 
+	if (fn)
+		fn(regs);
+
 	return ret;
 }
 
@@ -453,7 +440,7 @@ static void do_smp_send_nmi_ipi(int cpu, bool safe)
  * - cpu is the target CPU (must not be this CPU), or NMI_IPI_ALL_OTHERS.
  * - fn is the target callback function.
  * - delay_us > 0 is the delay before giving up waiting for targets to
- *   complete executing the handler, == 0 specifies indefinite delay.
+ *   begin executing the handler, == 0 specifies indefinite delay.
  */
 int __smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us, bool safe)
 {
@@ -467,31 +454,33 @@ int __smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us, bool
 	if (unlikely(!smp_ops))
 		return 0;
 
-	/* Take the nmi_ipi_busy count/lock with interrupts hard disabled */
 	nmi_ipi_lock_start(&flags);
-	while (nmi_ipi_busy_count) {
+	while (nmi_ipi_busy) {
 		nmi_ipi_unlock_end(&flags);
-		spin_until_cond(nmi_ipi_busy_count == 0);
+		spin_until_cond(!nmi_ipi_busy);
 		nmi_ipi_lock_start(&flags);
 	}
-
+	nmi_ipi_busy = true;
 	nmi_ipi_function = fn;
 
+	WARN_ON_ONCE(!cpumask_empty(&nmi_ipi_pending_mask));
+
 	if (cpu < 0) {
 		/* ALL_OTHERS */
 		cpumask_copy(&nmi_ipi_pending_mask, cpu_online_mask);
 		cpumask_clear_cpu(me, &nmi_ipi_pending_mask);
 	} else {
-		/* cpumask starts clear */
 		cpumask_set_cpu(cpu, &nmi_ipi_pending_mask);
 	}
-	nmi_ipi_busy_count++;
+
 	nmi_ipi_unlock();
 
+	/* Interrupts remain hard disabled */
+
 	do_smp_send_nmi_ipi(cpu, safe);
 
 	nmi_ipi_lock();
-	/* nmi_ipi_busy_count is held here, so unlock/lock is okay */
+	/* nmi_ipi_busy is set here, so unlock/lock is okay */
 	while (!cpumask_empty(&nmi_ipi_pending_mask)) {
 		nmi_ipi_unlock();
 		udelay(1);
@@ -499,34 +488,19 @@ int __smp_send_nmi_ipi(int cpu, void (*fn)(struct pt_regs *), u64 delay_us, bool
 		if (delay_us) {
 			delay_us--;
 			if (!delay_us)
-				goto timeout;
+				break;
 		}
 	}
 
-	while (nmi_ipi_busy_count > 1) {
-		nmi_ipi_unlock();
-		udelay(1);
-		nmi_ipi_lock();
-		if (delay_us) {
-			delay_us--;
-			if (!delay_us)
-				goto timeout;
-		}
-	}
-
-timeout:
 	if (!cpumask_empty(&nmi_ipi_pending_mask)) {
 		/* Timeout waiting for CPUs to call smp_handle_nmi_ipi */
 		ret = 0;
 		cpumask_clear(&nmi_ipi_pending_mask);
 	}
-	if (nmi_ipi_busy_count > 1) {
-		/* Timeout waiting for CPUs to execute fn */
-		ret = 0;
-		nmi_ipi_busy_count = 1;
-	}
 
-	nmi_ipi_busy_count--;
+	nmi_ipi_function = NULL;
+	nmi_ipi_busy = false;
+
 	nmi_ipi_unlock_end(&flags);
 
 	return ret;
@@ -594,17 +568,8 @@ void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 static void nmi_stop_this_cpu(struct pt_regs *regs)
 {
 	/*
-	 * This is a special case because it never returns, so the NMI IPI
-	 * handling would never mark it as done, which makes any later
-	 * smp_send_nmi_ipi() call spin forever. Mark it done now.
-	 *
 	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
 	 */
-	nmi_ipi_lock();
-	if (nmi_ipi_busy_count > 1)
-		nmi_ipi_busy_count--;
-	nmi_ipi_unlock();
-
 	spin_begin();
 	while (1)
 		spin_cpu_relax();
-- 
2.20.1


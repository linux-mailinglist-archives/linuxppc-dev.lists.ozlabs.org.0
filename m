Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74D3B453D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 16:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBJfM3RNxz3bxK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 00:04:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kuHu+RC+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kuHu+RC+; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBJdx4VcWz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 00:04:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBJdr0fjkz9ssP; Sat, 26 Jun 2021 00:04:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624629856;
 bh=ry94s0mRvbGtQswb0HxCjNTUs5K9o0KJ588CpBKf7N8=;
 h=From:To:Cc:Subject:Date:From;
 b=kuHu+RC+vopnI3ZwtsSRcyjCDc0KB020JY1ajpwx9bnI501+CAKDNwlN+t/1EpD8R
 n7ocgXzWEh/cFgXUD3wGH5kQpKbN4wd+BF53d8PWnPDT1alBxhPB+X0I7j5Xb9pe1T
 j5W/JbQAm+/HmQWeOqNNtOYY9EwS9M/KM81GmDaRInVbMFvQm7lHwywtHnPrw56j2t
 yiw7pLkrRz6vAH6R2Lx+jnWCmgZYHirG7aUATj2G2S2o82GzBb9I6Kuq1ow7kRZtt3
 dSiRQnZlbd4OGkUvZyBDjIUMxmNgbeXFKHrro985ZdAU22Tq2gYu+pCZeneTPpYLZi
 zK8nA+0z90icg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/stacktrace: Fix spurious "stale" traces in
 raise_backtrace_ipi()
Date: Sat, 26 Jun 2021 00:04:08 +1000
Message-Id: <20210625140408.3351173-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In raise_backtrace_ipi() we iterate through the cpumask of CPUs, sending
each an IPI asking them to do a backtrace, but we don't wait for the
backtrace to happen.

We then iterate through the CPU mask again, and if any CPU hasn't done
the backtrace and cleared itself from the mask, we print a trace on its
behalf, noting that the trace may be "stale".

This works well enough when a CPU is not responding, because in that
case it doesn't receive the IPI and the sending CPU is left to print the
trace. But when all CPUs are responding we are left with a race between
the sending and receiving CPUs, if the sending CPU wins the race then it
will erroneously print a trace.

This leads to spurious "stale" traces from the sending CPU, which can
then be interleaved messily with the receiving CPU, note the CPU
numbers, eg:

  [ 1658.929157][    C7] rcu: Stack dump where RCU GP kthread last ran:
  [ 1658.929223][    C7] Sending NMI from CPU 7 to CPUs 1:
  [ 1658.929303][    C1] NMI backtrace for cpu 1
  [ 1658.929303][    C7] CPU 1 didn't respond to backtrace IPI, inspecting paca.
  [ 1658.929362][    C1] CPU: 1 PID: 325 Comm: kworker/1:1H Tainted: G        W   E     5.13.0-rc2+ #46
  [ 1658.929405][    C7] irq_soft_mask: 0x01 in_mce: 0 in_nmi: 0 current: 325 (kworker/1:1H)
  [ 1658.929465][    C1] Workqueue: events_highpri test_work_fn [test_lockup]
  [ 1658.929549][    C7] Back trace of paca->saved_r1 (0xc0000000057fb400) (possibly stale):
  [ 1658.929592][    C1] NIP:  c00000000002cf50 LR: c008000000820178 CTR: c00000000002cfa0

To fix it, change the logic so that the sending CPU waits 5s for the
receiving CPU to print its trace. If the receiving CPU prints its trace
successfully then the sending CPU just continues, avoiding any spurious
"stale" trace.

This has the added benefit of allowing all CPUs to print their traces in
order and avoids any interleaving of their output.

Fixes: 5cc05910f26e ("powerpc/64s: Wire up arch_trigger_cpumask_backtrace()")
Cc: stable@vger.kernel.org # v4.18+
Reported-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/stacktrace.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index 1961e6d5e33b..2b0d04a1b7d2 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -172,17 +172,31 @@ static void handle_backtrace_ipi(struct pt_regs *regs)
 
 static void raise_backtrace_ipi(cpumask_t *mask)
 {
+	struct paca_struct *p;
 	unsigned int cpu;
+	u64 delay_us;
 
 	for_each_cpu(cpu, mask) {
-		if (cpu == smp_processor_id())
+		if (cpu == smp_processor_id()) {
 			handle_backtrace_ipi(NULL);
-		else
-			smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC);
-	}
+			continue;
+		}
 
-	for_each_cpu(cpu, mask) {
-		struct paca_struct *p = paca_ptrs[cpu];
+		delay_us = 5 * USEC_PER_SEC;
+
+		if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, delay_us)) {
+			// Now wait up to 5s for the other CPU to do its backtrace
+			while (cpumask_test_cpu(cpu, mask) && delay_us) {
+				udelay(1);
+				delay_us--;
+			}
+
+			// Other CPU cleared itself from the mask
+			if (delay_us)
+				continue;
+		}
+
+		p = paca_ptrs[cpu];
 
 		cpumask_clear_cpu(cpu, mask);
 
-- 
2.25.1


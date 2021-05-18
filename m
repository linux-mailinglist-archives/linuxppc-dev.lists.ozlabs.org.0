Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0D6386EF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 03:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkdHG31YYz30L4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 11:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBRWvqae;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sBRWvqae; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkdG06ygdz300C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 11:10:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1510661396;
 Tue, 18 May 2021 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621300198;
 bh=QEy0KRw8VajZyTOxPvZTSchBWwsGca12LIzpS3tWvsE=;
 h=From:To:Cc:Subject:Date:From;
 b=sBRWvqaeR49oMgE31OMZ0kFI5FZM/zNqlmDgFijL2EwlSBAaoJHgjL9mdGzJ3Ixv2
 UJDXOXe/fGRD1FjkRFpDZ6PiCEWQ59/MZwwkjT39aHR3P/YibQjfRxvH5YGOMzcd2v
 kKw8VVb6qsnT3vo6b7nIOKYzD17Ompn16/Rjgy3+ybYNBBna0R4KMHrB7iGXZXvTvs
 ILIlsi5A3B319gy8VAUylBe4f5VvjNumIH+TQ8lqraQrMRWjZGWYriW5hcTCueefq6
 f1KWX7Dlwk+gPYWdX4zvlqvCNjlkCytolzxbVXqVsccqAKd0mZanFTykk71/ectUTv
 yNyFWAd8IZSTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/3] powerpc/pseries: Fix hcall tracing recursion
 in pv queued spinlocks
Date: Mon, 17 May 2021 21:09:54 -0400
Message-Id: <20210518010956.1485782-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Sasha Levin <sashal@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 2c8c89b95831f46a2fb31a8d0fef4601694023ce ]

The paravit queued spinlock slow path adds itself to the queue then
calls pv_wait to wait for the lock to become free. This is implemented
by calling H_CONFER to donate cycles.

When hcall tracing is enabled, this H_CONFER call can lead to a spin
lock being taken in the tracing code, which will result in the lock to
be taken again, which will also go to the slow path because it queues
behind itself and so won't ever make progress.

An example trace of a deadlock:

  __pv_queued_spin_lock_slowpath
  trace_clock_global
  ring_buffer_lock_reserve
  trace_event_buffer_lock_reserve
  trace_event_buffer_reserve
  trace_event_raw_event_hcall_exit
  __trace_hcall_exit
  plpar_hcall_norets_trace
  __pv_queued_spin_lock_slowpath
  trace_clock_global
  ring_buffer_lock_reserve
  trace_event_buffer_lock_reserve
  trace_event_buffer_reserve
  trace_event_raw_event_rcu_dyntick
  rcu_irq_exit
  irq_exit
  __do_irq
  call_do_irq
  do_IRQ
  hardware_interrupt_common_virt

Fix this by introducing plpar_hcall_norets_notrace(), and using that to
make SPLPAR virtual processor dispatching hcalls by the paravirt
spinlock code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210508101455.1578318-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/hvcall.h       |  3 +++
 arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
 arch/powerpc/platforms/pseries/lpar.c   |  3 +--
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index c1fbccb04390..3e8e19f5746c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -437,6 +437,9 @@
  */
 long plpar_hcall_norets(unsigned long opcode, ...);
 
+/* Variant which does not do hcall tracing */
+long plpar_hcall_norets_notrace(unsigned long opcode, ...);
+
 /**
  * plpar_hcall: - Make a pseries hypervisor call
  * @opcode: The hypervisor call to make.
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 9362c94fe3aa..588bfb9a0579 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -24,19 +24,35 @@ static inline u32 yield_count_of(int cpu)
 	return be32_to_cpu(yield_count);
 }
 
+/*
+ * Spinlock code confers and prods, so don't trace the hcalls because the
+ * tracing code takes spinlocks which can cause recursion deadlocks.
+ *
+ * These calls are made while the lock is not held: the lock slowpath yields if
+ * it can not acquire the lock, and unlock slow path might prod if a waiter has
+ * yielded). So this may not be a problem for simple spin locks because the
+ * tracing does not technically recurse on the lock, but we avoid it anyway.
+ *
+ * However the queued spin lock contended path is more strictly ordered: the
+ * H_CONFER hcall is made after the task has queued itself on the lock, so then
+ * recursing on that lock will cause the task to then queue up again behind the
+ * first instance (or worse: queued spinlocks use tricks that assume a context
+ * never waits on more than one spinlock, so such recursion may cause random
+ * corruption in the lock code).
+ */
 static inline void yield_to_preempted(int cpu, u32 yield_count)
 {
-	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
+	plpar_hcall_norets_notrace(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
 }
 
 static inline void prod_cpu(int cpu)
 {
-	plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
+	plpar_hcall_norets_notrace(H_PROD, get_hard_smp_processor_id(cpu));
 }
 
 static inline void yield_to_any(void)
 {
-	plpar_hcall_norets(H_CONFER, -1, 0);
+	plpar_hcall_norets_notrace(H_CONFER, -1, 0);
 }
 #else
 static inline bool is_shared_processor(void)
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 2136e42833af..8a2b8d64265b 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -102,6 +102,16 @@ END_FTR_SECTION(0, 1);						\
 #define HCALL_BRANCH(LABEL)
 #endif
 
+_GLOBAL_TOC(plpar_hcall_norets_notrace)
+	HMT_MEDIUM
+
+	mfcr	r0
+	stw	r0,8(r1)
+	HVSC				/* invoke the hypervisor */
+	lwz	r0,8(r1)
+	mtcrf	0xff,r0
+	blr				/* return r3 = status */
+
 _GLOBAL_TOC(plpar_hcall_norets)
 	HMT_MEDIUM
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 764170fdb0f7..1c3ac0f66336 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1827,8 +1827,7 @@ void hcall_tracepoint_unregfunc(void)
 
 /*
  * Since the tracing code might execute hcalls we need to guard against
- * recursion. One example of this are spinlocks calling H_YIELD on
- * shared processor partitions.
+ * recursion.
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
-- 
2.30.2


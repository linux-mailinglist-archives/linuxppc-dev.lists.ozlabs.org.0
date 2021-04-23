Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E7368B70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRK8N4bwtz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:12:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eviivYSc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eviivYSc; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRK7X5Zq1z2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 13:11:20 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id w10so34275475pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KaoZyFTF+LrzfQ+nL3DkO6LtVM3+vTXNRkulEb9nVQY=;
 b=eviivYScftE+nYEo2CIbzu+8GO5z9TZM58SG/hgnm6xzI0Pk1Jo07SqgDDlwNqmghp
 Ns44K+8Q0A4zfB6XtL9KDOsMnOYL/HkdMECsyXaCDUbctay2rJ7RogzWbIygiWvd5QDV
 sxAX6KkQ63FxdoX2I/4pcrM7vuIsAs2Om3N//Fi02vbLTtBvxe31tAZSP2CyVWvj4vcq
 G4XnwmrReiCRc1Crm5swPnDP9ypCUfr3WgituHS/nTFvi36pqFjUgzye9DmBn8K9BVin
 DuEhHATUZaDeQCMfFdSslQDtBoFrfXHxbeEEJV35eTGhKNqOm6BZlg6aBMEl9IdFCquR
 i5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KaoZyFTF+LrzfQ+nL3DkO6LtVM3+vTXNRkulEb9nVQY=;
 b=OOMDEAt2Bmgz5x0qvfeRolQPJQo0eCQ1tvCPLlargACRWhkUv/REJvx+QxUgwZG9ad
 Gus/Uv78szmptwp0COAGZrbUNzEO60dAOuth+O5VBcrv2YAjZEWV/21VH4ihlCBMuyjb
 tJyTriPU2nnibDMbqUjBtnWhzJ4u4gPpTYZVts4lwChI8cEIWcv2uLqhihPjVBncb7po
 SyqH/U8Fn0Wh/CNclMPWZWdNsysJorPVTTf+vWm7a6txaswZ5fGoUjXhauX4FEv0iT4Y
 RVFwX75k7v6G8JMNOdg3wvp6adKF+Wo6bZBl2Eed5R81p1coC3fShZdTcGEFaEiu7aY6
 xhGg==
X-Gm-Message-State: AOAM533b7mAIVSyRWMeRM1iWf8fIXC7OTC1heggrxMRtAKzNig/chy0k
 T1U+1gMYJPiUZ3lIUWr5XBPHXVGJri8=
X-Google-Smtp-Source: ABdhPJwMhyp1aMPbsqWlpEcjhFOlKoWsBYO3Z0d9amcJjgYb5SWrgrjpHCrB8aoP2aGcmEoJoifodw==
X-Received: by 2002:a65:618c:: with SMTP id c12mr1790744pgv.296.1619147476772; 
 Thu, 22 Apr 2021 20:11:16 -0700 (PDT)
Received: from bobo.ibm.com ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id k1sm3511962pgk.9.2021.04.22.20.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:11:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/pseries: Fix hcall tracing recursion in pv queued
 spinlocks
Date: Fri, 23 Apr 2021 13:11:05 +1000
Message-Id: <20210423031108.1046067-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210423031108.1046067-1-npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

Fixes: 20c0e8269e9d ("powerpc/pseries: Implement paravirt qspinlocks for SPLPAR")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h       |  3 +++
 arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
 arch/powerpc/platforms/pseries/lpar.c   |  4 ++--
 4 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ed6086d57b22..0c92b01a3c3c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -446,6 +446,9 @@
  */
 long plpar_hcall_norets(unsigned long opcode, ...);
 
+/* Variant which does not do hcall tracing */
+long plpar_hcall_norets_notrace(unsigned long opcode, ...);
+
 /**
  * plpar_hcall: - Make a pseries hypervisor call
  * @opcode: The hypervisor call to make.
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 5d1726bb28e7..3c13c2ec70a9 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -30,17 +30,33 @@ static inline u32 yield_count_of(int cpu)
 
 static inline void yield_to_preempted(int cpu, u32 yield_count)
 {
-	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
+	/*
+	 * Spinlock code yields and prods, so don't trace the hcalls because
+	 * tracing code takes spinlocks which could recurse.
+	 *
+	 * These calls are made while the lock is not held, the lock slowpath
+	 * yields if it can not acquire the lock, and unlock slow path might
+	 * prod if a waiter has yielded). So this did not seem to be a problem
+	 * for simple spin locks because technically it didn't recuse on the
+	 * lock. However the queued spin lock contended path is more strictly
+	 * ordered: the H_CONFER hcall is made after the task has queued itself
+	 * on the lock, so then recursing on the lock will queue up behind that
+	 * (or worse: queued spinlocks uses tricks that assume a context never
+	 * waits on more than one spinlock, so that may cause random
+	 * corruption).
+	 */
+	plpar_hcall_norets_notrace(H_CONFER,
+				   get_hard_smp_processor_id(cpu), yield_count);
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
index 3805519a6469..6011b7b80946 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1828,8 +1828,8 @@ void hcall_tracepoint_unregfunc(void)
 
 /*
  * Since the tracing code might execute hcalls we need to guard against
- * recursion. One example of this are spinlocks calling H_YIELD on
- * shared processor partitions.
+ * recursion. H_CONFER from spin locks must be treated separately though
+ * and use _notrace plpar_hcall variants, see yield_to_preempted().
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
-- 
2.23.0


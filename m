Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAE377129
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fcjr85mr1z308j
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:15:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dqbW/gOL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dqbW/gOL; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcjqf68qBz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:15:10 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id i5so4425702pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hucPwe2s/1AvqXvalzOuuUvYSLJDf/hU9ZAYxXDnt88=;
 b=dqbW/gOLlsbm3Ef1ZTGFZ+1K001McMCBCHbvE26TTj1ptPVunxT77SQHbsSmXjnZTj
 fTBusAzZM2vDzHDkJI1RZhtGt9ZCQpo8W+iGb/0hKdzRFS94/b86H0SuFbBTW44slsZR
 RK2so+RBF+VWDEfVYWxMAH7mzkrl4+DJwtDygtq4szwJuUDvZ2aOsPuhLh1mRD7QJxf0
 dE7aUuQ9tB9wMfBR73VyV/fGthLH9rTH3oEWYQVXGFgzqYyBX7bpGbr3Kg0mtysD3Z8q
 yihEAns7P3AKkzbd9opAATS/lfmZhuQ7mfq5gIR6AAgJ2JZo/kcTkBuL0PlDF1+oUpyT
 KlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hucPwe2s/1AvqXvalzOuuUvYSLJDf/hU9ZAYxXDnt88=;
 b=szR1cLKZMYU8/9RSoE4MsW9uLzqqCS7b3+AKsf8iQEJNgHYgi+QcTeWfs8pAuRZ6db
 3y635hwzP5asnjTxZxBcmgyImsyFaHHeA/52CaA9w9wu9d9NKuMInI8wXkY96v0ToZ1L
 wVhJq8EYx3tTfkhaJ2ksAxI5LVBeCYD2YMjTgNirDhEPi+V8HsDGlfuMe81X6MXAZd6u
 yXqxM9Y652vU2j2wbPPXg/PoUluVeBK4PqzLXvjmLIxhNaa79eBBtCeYTMzX2E9MULzj
 iyMjjMiNP/T8CLPUDc6ztBmvyo2agjCxCUIp2Qjw0NE0TDrdK+xI6tSA4FO2X4AyNqPF
 pGFg==
X-Gm-Message-State: AOAM5313x4jXTIs9LVTOfDYasDvAyN4w9Kwtizlkoix4AX21dfYOQH8h
 /2zj8p/mz1XpQ1G8cFjK/D93MS06qz8kAQ==
X-Google-Smtp-Source: ABdhPJyrHBJUW4352DTR6cvpdNLY4TBZk1W6ZnTo0wSHmVu9/ISwu3ANDhpYKg51WSHpdJVHPHecOw==
X-Received: by 2002:a65:4cc5:: with SMTP id n5mr14681632pgt.80.1620468908026; 
 Sat, 08 May 2021 03:15:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id
 c13sm6608465pfl.212.2021.05.08.03.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 03:15:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/pseries: Fix hcall tracing recursion in pv
 queued spinlocks
Date: Sat,  8 May 2021 20:14:52 +1000
Message-Id: <20210508101455.1578318-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210508101455.1578318-1-npiggin@gmail.com>
References: <20210508101455.1578318-1-npiggin@gmail.com>
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

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h       |  3 +++
 arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
 arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
 arch/powerpc/platforms/pseries/lpar.c   |  3 +--
 4 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 443050906018..e3b29eda8074 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -448,6 +448,9 @@
  */
 long plpar_hcall_norets(unsigned long opcode, ...);
 
+/* Variant which does not do hcall tracing */
+long plpar_hcall_norets_notrace(unsigned long opcode, ...);
+
 /**
  * plpar_hcall: - Make a pseries hypervisor call
  * @opcode: The hypervisor call to make.
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 5d1726bb28e7..bcb7b5f917be 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -28,19 +28,35 @@ static inline u32 yield_count_of(int cpu)
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
index 1f3152ad7213..b619568a4d04 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1830,8 +1830,7 @@ void hcall_tracepoint_unregfunc(void)
 
 /*
  * Since the tracing code might execute hcalls we need to guard against
- * recursion. One example of this are spinlocks calling H_YIELD on
- * shared processor partitions.
+ * recursion.
  */
 static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
 
-- 
2.23.0


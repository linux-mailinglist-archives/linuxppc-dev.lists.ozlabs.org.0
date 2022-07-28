Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF05838C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:32:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgmm5X8nz3dsL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:32:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TZW5zvqi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TZW5zvqi;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltglp57Xyz2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:34 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id b10so918399pjq.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JS/yI2smT5PGim2KPI7rIjLJ94jf2C1XvVLQXmuKHdE=;
        b=TZW5zvqim6juv5Fn6Q27CgpY8aMMMt0yKafWtM8yrcDjVEbiLE2rG5RMcng1ITynfQ
         vSII2XdE2rQarN3KjluroJW1jUmq9zqoVsKcp0utqN3+7dPIWNqeZSJ7ozJXYFtcO9Bm
         hplgWEuBr0np+taEtnlzeb+bg3djSE0xMtXOibSPSMr/c6ilsd2gPoEwlo1WTTTRTl9u
         nE7m7JA//HcXJmE9+w/rBmdlckt+TjOYVn2DLuWreZBiA6u0SikZmDSw1hZYbE5b+2OD
         4rKtJqinHLZ37tCWtO2vO7t7F3shMLkahlhNV9oo6PA8S/UTJZYGGJZB/Hbf/7uD+Smo
         AxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JS/yI2smT5PGim2KPI7rIjLJ94jf2C1XvVLQXmuKHdE=;
        b=BGmKuWBRIGlhsD/FpKUVuKJJvIs0z6F2ICRlyyIl/QeB9IMITc3vijHGmXA3bTAUhl
         qBpiOuopnBW3dU3EDSccuiyuI/hulYdgYlkIMDzC81voih4VXBYATLBm8K4KNWz0wuEZ
         B5nRGNjHbEF0LQY+wv9zwagG+V5miGc+F7N6cb6FKPez3J0RO7+xJt6PD8LZGNyJgLz3
         fed6ME1mEGHjUKIG0VHE2PZjAA5r89AwaDw9Ociip9z3sgpnGXsiiprFP2IHVediZu6P
         4FGZZsjKk9fiKd1I19jRvN6TntYMJLaj2iTrhtUGseNPxVtuOohMJSZqfODgMwCbVUq2
         g2yQ==
X-Gm-Message-State: AJIora+wcKKKUAfNxggGn4cweXXsREpNzRjoPNLvmLRscRtYZ8cMjnmU
	KxWyhp9DMZvNrcXMdlkbYyH4ZJMxrqI=
X-Google-Smtp-Source: AGRyM1uHqgm6jRlD9jlIJZyJ78UFlaQC4MerqMFhGeR7w4EzAcHJexi4KDl07rvVFjwRu10iX3EP2Q==
X-Received: by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with SMTP id p11-20020a170902ebcb00b00168e3ba4b5amr24651858plg.11.1658989891929;
        Wed, 27 Jul 2022 23:31:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock implementation
Date: Thu, 28 Jul 2022 16:31:03 +1000
Message-Id: <20220728063120.2867508-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728063120.2867508-1-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a powerpc specific implementation of queued spinlocks. This is the
build framework with a very simple (non-queued) spinlock implementation
to begin with. Later changes add queueing, and other features and
optimisations one-at-a-time. It is done this way to more easily see how
the queued spinlocks are built, and to make performance and correctness
bisects more useful.

Generic PV qspinlock code is causing latency / starvation regressions on
large systems that are resulting in hard lockups reported (mostly in
pathoogical cases).  The generic qspinlock code has a number of issues
important for powerpc hardware and hypervisors that aren't easily solved
without changing code that would impact other architectures. Follow
s390's lead and implement our own for now.

Issues for powerpc using generic qspinlocks:
- The previous lock value should not be loaded with simple loads, and
  need not be passed around from previous loads or cmpxchg results,
  because powerpc uses ll/sc-style atomics which can perform more
  complex operations that do not require this. powerpc implementations
  tend to prefer loads use larx for improved coherency performance.
- The queueing process should absolutely minimise the number of stores
  to the lock word to reduce exclusive coherency probes, important for
  large system scalability. The pending logic is counter productive
  here.
- Non-atomic unlock for paravirt locks is important (atomic instructions
  tend to still be more expensive than x86 CPUs).
- Yielding to the lock owner is important in the oversubscribed paravirt
  case, which requires storing the owner CPU in the lock word.
- More control of lock stealing for the paravirt case is important to
  keep latency down on large systems.
- The lock acquisition operation should always be made with a special
  variant of atomic instructions with the lock hint bit set, including
  (especially) in the queueing paths. This is more a matter of adding
  more arch lock helpers so not an insurmountable problem for generic
  code.

Since the RFC series, I tested this on a 16-socket 1920 thread POWER10
system with some microbenchmarks, and that showed up significant
problems with the previous series. High amount of spinning on the lock
up-front (lock stealing) for SPLPAR mode (paravirt) really hurts
scalability when the guest is not overcommitted. However on smaller
KVM systems with significant overcommit (e.g., 5-10%), this spinning
is very important to avoid performance tanking due to the queueing
problem. So rather than set STEAL_SPINS and HEAD_SPINS based on
SPLPAR at boot-time, I lowered them and do more to dynamically deal
with vCPU preemption. So behaviour of dedicated and shared LPAR mode
is now the same until there is vCPU preemption detected. This seems
to be leading to better results overall, but some worst-case latencies
are significantly up with the lockstorm test (latency is still better
than generic queued spinlocks, but not as good as it previously was or
as good as simple). Statistical fairness is still significantly better.

Thanks,
Nick

---
 arch/powerpc/Kconfig                       |  1 -
 arch/powerpc/include/asm/qspinlock.h       | 78 ++++++++++------------
 arch/powerpc/include/asm/qspinlock_types.h | 13 ++++
 arch/powerpc/include/asm/spinlock_types.h  |  2 +-
 arch/powerpc/lib/Makefile                  |  4 +-
 arch/powerpc/lib/qspinlock.c               | 18 +++++
 6 files changed, 69 insertions(+), 47 deletions(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa12e88c580..4838e6c96b20 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -154,7 +154,6 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
-	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 39c1c7f80579..cb2b4f91e976 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -2,66 +2,56 @@
 #ifndef _ASM_POWERPC_QSPINLOCK_H
 #define _ASM_POWERPC_QSPINLOCK_H
 
-#include <asm-generic/qspinlock_types.h>
-#include <asm/paravirt.h>
+#include <linux/atomic.h>
+#include <linux/compiler.h>
+#include <asm/qspinlock_types.h>
 
-#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
-
-void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-void __pv_queued_spin_unlock(struct qspinlock *lock);
-
-static __always_inline void queued_spin_lock(struct qspinlock *lock)
+static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
-	u32 val = 0;
+	return atomic_read(&lock->val);
+}
 
-	if (likely(arch_atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
-		return;
+static __always_inline int queued_spin_value_unlocked(struct qspinlock lock)
+{
+	return !atomic_read(&lock.val);
+}
 
-	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
-		queued_spin_lock_slowpath(lock, val);
-	else
-		__pv_queued_spin_lock_slowpath(lock, val);
+static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
+{
+	return 0;
 }
-#define queued_spin_lock queued_spin_lock
 
-static inline void queued_spin_unlock(struct qspinlock *lock)
+static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
-	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
-		smp_store_release(&lock->locked, 0);
-	else
-		__pv_queued_spin_unlock(lock);
+	if (atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0)
+		return 1;
+	return 0;
 }
-#define queued_spin_unlock queued_spin_unlock
 
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-#define SPIN_THRESHOLD (1<<15) /* not tuned */
+void queued_spin_lock_slowpath(struct qspinlock *lock);
 
-static __always_inline void pv_wait(u8 *ptr, u8 val)
+static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
-	if (*ptr != val)
-		return;
-	yield_to_any();
-	/*
-	 * We could pass in a CPU here if waiting in the queue and yield to
-	 * the previous CPU in the queue.
-	 */
+	if (!queued_spin_trylock(lock))
+		queued_spin_lock_slowpath(lock);
 }
 
-static __always_inline void pv_kick(int cpu)
+static inline void queued_spin_unlock(struct qspinlock *lock)
 {
-	prod_cpu(cpu);
+	atomic_set_release(&lock->val, 0);
 }
 
-#endif
+#define arch_spin_is_locked(l)		queued_spin_is_locked(l)
+#define arch_spin_is_contended(l)	queued_spin_is_contended(l)
+#define arch_spin_value_unlocked(l)	queued_spin_value_unlocked(l)
+#define arch_spin_lock(l)		queued_spin_lock(l)
+#define arch_spin_trylock(l)		queued_spin_trylock(l)
+#define arch_spin_unlock(l)		queued_spin_unlock(l)
 
-/*
- * Queued spinlocks rely heavily on smp_cond_load_relaxed() to busy-wait,
- * which was found to have performance problems if implemented with
- * the preferred spin_begin()/spin_end() SMT priority pattern. Use the
- * generic version instead.
- */
-
-#include <asm-generic/qspinlock.h>
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+void pv_spinlocks_init(void);
+#else
+static inline void pv_spinlocks_init(void) { }
+#endif
 
 #endif /* _ASM_POWERPC_QSPINLOCK_H */
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
new file mode 100644
index 000000000000..59606bc0c774
--- /dev/null
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_QSPINLOCK_TYPES_H
+#define _ASM_POWERPC_QSPINLOCK_TYPES_H
+
+#include <linux/types.h>
+
+typedef struct qspinlock {
+	atomic_t val;
+} arch_spinlock_t;
+
+#define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val = ATOMIC_INIT(0) }
+
+#endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
diff --git a/arch/powerpc/include/asm/spinlock_types.h b/arch/powerpc/include/asm/spinlock_types.h
index d5f8a74ed2e8..40b01446cf75 100644
--- a/arch/powerpc/include/asm/spinlock_types.h
+++ b/arch/powerpc/include/asm/spinlock_types.h
@@ -7,7 +7,7 @@
 #endif
 
 #ifdef CONFIG_PPC_QUEUED_SPINLOCKS
-#include <asm-generic/qspinlock_types.h>
+#include <asm/qspinlock_types.h>
 #include <asm-generic/qrwlock_types.h>
 #else
 #include <asm/simple_spinlock_types.h>
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 8560c912186d..b895cbf6a709 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -52,7 +52,9 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o copy_mc_64.o
 
-ifndef CONFIG_PPC_QUEUED_SPINLOCKS
+ifdef CONFIG_PPC_QUEUED_SPINLOCKS
+obj64-$(CONFIG_SMP)	+= qspinlock.o
+else
 obj64-$(CONFIG_SMP)	+= locks.o
 endif
 
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
new file mode 100644
index 000000000000..8dbce99a373c
--- /dev/null
+++ b/arch/powerpc/lib/qspinlock.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/export.h>
+#include <linux/processor.h>
+#include <asm/qspinlock.h>
+
+void queued_spin_lock_slowpath(struct qspinlock *lock)
+{
+	while (!queued_spin_trylock(lock))
+		cpu_relax();
+}
+EXPORT_SYMBOL(queued_spin_lock_slowpath);
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+void pv_spinlocks_init(void)
+{
+}
+#endif
+
-- 
2.35.1


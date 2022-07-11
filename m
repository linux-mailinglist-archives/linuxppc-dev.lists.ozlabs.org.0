Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B456D332
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh80r1Hlvz3bbQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:06:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OWg56A2F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OWg56A2F;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zP64DMz3bv2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:05 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id e16so3685383pfm.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7nFI4sp9mFY/FJDB0cZhkvVcIpsx+sF5+0w/jBHOM+4=;
        b=OWg56A2FHrOuDWlneASsVMJVtcsHCDHWUkbgzX4O5vDjcYpJJLRkucB2dn/PQ6Mhhb
         iKx1Q7eMq3h27EBFKHg94ivSiWurhTRLbKs6QdNbmtTfQCb9ZK6AfPCAz67sZ/mQs74c
         fz03TsIQq4aEHIDvfKdO/o7r10jdUyU0w3qDI6XYM0oS7znDV6CySsQET9udeqFICoXG
         dCVHQG5EItblRSwuVHn77HM9xCSClwV5muc+kGYSix1IBqmq93PAvSeEkzI9uDSP5n6V
         qKuTaCji43aft7I3Y81rR/r6YtF6g8k7fnc/gbKdZ7QofiAXmt7UIV15AFkWZoRSeA68
         68Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7nFI4sp9mFY/FJDB0cZhkvVcIpsx+sF5+0w/jBHOM+4=;
        b=vfiqwiiaaSUg1N+eiDJsBn2NM/fxoX7Bvsokh2RdSm8wgUKejIf8U/p7gJuwZdQ0B/
         4hD9F/mvrjLueYOt1j2zATqjADwkMYKBJKDudF+MkU7vGcZzdyU9w8ih93R0vZ2LlRPT
         /RRPI2bI3QhSIfekQI0xZ2QzyEQo2UVVwYQd6QH+5Xq9+QngU+MLFG/UgeM8Ghgg+SGs
         xJKR1YnToTrbKyXGvqNdOV0bVGpSFbZ3R56/iCMWcPyZngUDp5s3+y5g/Lmbflr2CXqa
         o5BI1qPJnBqtGObLDXkyxv/vvZ2oeMslUu8GV5wpdQPBQBjGiAaTNDpnrcwd1TsHunDm
         MgxQ==
X-Gm-Message-State: AJIora+o+CASGW/Lxsqsfph86bE6mpMUoYTnlYnIjwzeCKrQA0iUtDJK
	4M2rjv6DaPOMETUJuAVPsji1AWw8Xlc=
X-Google-Smtp-Source: AGRyM1tzVV3oSRYBVrOGt5GXaoazJ6m5nvIiTNnnCTDeRtYgcynOjblUmnPBaPKzREnCX01nHr/07Q==
X-Received: by 2002:a63:164d:0:b0:416:4bc:1c28 with SMTP id 13-20020a63164d000000b0041604bc1c28mr2281668pgw.302.1657508703206;
        Sun, 10 Jul 2022 20:05:03 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/14] powerpc/qspinlock: powerpc qspinlock implementation
Date: Mon, 11 Jul 2022 13:04:40 +1000
Message-Id: <20220711030453.150644-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711030453.150644-1-npiggin@gmail.com>
References: <20220711030453.150644-1-npiggin@gmail.com>
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

Testing a paravirt (KVM guest) system with 512 vCPUs and 488 hardware
threads on a 4-socket POWER10. The purpose of these tests is not to show
throughput advantage because they are not representative of a real
workload and quite spinlock bound, but rather to show some latency and
fairness examples in pathological cases for undersubscribed and
oversubscribed guest situations:

will-it-scale/open1_threads -t64
          min      max    total
simple   4897     6066   344628
vanilla  3821     4100   251680
patched  5974     6995   415986

will-it-scale/open1_threads -t512
          min      max    total
simple    109      477   205022
vanilla     2    14675   571786
patched   227      711   267419

lockstorm is a simple in-kernel test that just has threads hammering on
a lock and collecting statistics (wait: arrival->acquire time, starve:
number of times the lock was acquired while we waited, sequential:
number of times we got the lock in a row):

lockstorm cpus=0-63
            min     max    total  max wait  max starve  max sequential
simple   124831  155101  8993621    1866us       16714             500
vanilla   81768   90426  5524856    1167us        8134            1087
patched  134411  161234  9622482    1996us       19023             437

lockstorm lock stress test cpus=0-511
            min     max    total  max wait  max starve  max sequential
simple     1442    3127  1434772   60922us       65320             590
vanilla       6  202616  7090954  580014us     3829074          282107
patched    1801    6296  2292002   53165us      103015             430

dbench 64
        tput (MB/s)  max-lat (ms)
simple      6224.33         24.76
vanilla     6951.91          4.73
patched     8416.77         18.59

dbench 512
        tput (MB/s)  max-lat (ms)
simple      4015.59        503.19
vanilla     4339.17        461.06
patched     5396.53        677.11

- qspin-try.patch
- powerpc-qspl.patch
- qspl-owner-cpu.patch
- owner-cpu-cleanup.patch
- qspl-owner-spin-queueud.patch
- yield-prev-mcs.patch
- qspl-steal.patch
- qspl-clear-mustq.patch
- fixes.patch
- qspl-stealer-no-mustq.patch
- fixes2
- fixes3
- rewrite
- tuning.patch
- qspl-tuning.patch
- yield-clear-mustq.patch
- mcs-no-yield-owner.patch
- propagate-yield-cpu.patch
- pv-tune-spins.patch
- set-must-q-cleanup.patch
- cleanup-publish.patch
- fix
- cleanup.patch
- more-tunables.patch
- tuning-and-propagate.patch
- tail-mask-remove.patch
- debug-qspl.patch
- asm-fixes.patch
- fix-asm2.patch
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


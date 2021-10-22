Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30B43764C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 14:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbNHf4Tl9z3cTb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 23:01:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SAu9tSKC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SAu9tSKC; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbNGy2k9nz3c69
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 23:01:14 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEB6660C4C;
 Fri, 22 Oct 2021 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634904070;
 bh=qtLhW6yJc0m7cAPxwCcpju0k0Trvuqus6DX8RjrMrwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SAu9tSKCbqiJGF0fecRlvTkO/vclPKkUQHrLN615nSNbXoZjf33R7XvYXI5QsEkG+
 c2EPr9rRutH1pzDZpBdjqtFclTmCJY2KuDd9ND8HboYNcNPjWcQ1Xoxw1E0ccYFfpa
 Y+lpOpH2rdPgBzWPapFLNfYOReMJTfoQlRAJotreNpssaXo83NTLDnXaWHRHrK7UaS
 OjqCeDgCfW/uJHO9Q3z46GJbdNJcU0Ig2mNldTDelBss2UrmemrQdjUJ5oEri8e3fV
 pXex+MOYJcIpeh9QjfL9ehSGPNv+sT2If1HZwy4L6gFxVglwCpW7yBWAdP0UulQXQw
 hrZ3PBI60yxzg==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>
Subject: [PATCH] locking: remove spin_lock_flags() etc
Date: Fri, 22 Oct 2021 13:59:38 +0200
Message-Id: <20211022120058.1031690-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-ia64@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, linux-parisc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Stafford Horne <shorne@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
 Heiko Carstens <hca@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

parisc, ia64 and powerpc32 are the only remaining architectures that
provide custom arch_{spin,read,write}_lock_flags() functions, which are
meant to re-enable interrupts while waiting for a spinlock.

However, none of these can actually run into this codepath, because
it is only called on architectures without CONFIG_GENERIC_LOCKBREAK,
or when CONFIG_DEBUG_LOCK_ALLOC is set without CONFIG_LOCKDEP, and none
of those combinations are possible on the three architectures.

Going back in the git history, it appears that arch/mn10300 may have
been able to run into this code path, but there is a good chance that
it never worked. On the architectures that still exist, it was
already impossible to hit back in 2008 after the introduction of
CONFIG_GENERIC_LOCKBREAK, and possibly earlier.

As this is all dead code, just remove it and the helper functions built
around it. For arch/ia64, the inline asm could be cleaned up, but
it seems safer to leave it untouched.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/ia64/include/asm/spinlock.h           | 23 ++++++----------------
 arch/openrisc/include/asm/spinlock.h       |  3 ---
 arch/parisc/include/asm/spinlock.h         | 15 --------------
 arch/powerpc/include/asm/simple_spinlock.h | 21 --------------------
 arch/s390/include/asm/spinlock.h           |  8 --------
 include/linux/lockdep.h                    | 17 ----------------
 include/linux/rwlock.h                     | 15 --------------
 include/linux/rwlock_api_smp.h             |  6 ++----
 include/linux/spinlock.h                   | 13 ------------
 include/linux/spinlock_api_smp.h           |  9 ---------
 include/linux/spinlock_up.h                |  1 -
 kernel/locking/spinlock.c                  |  3 +--
 12 files changed, 9 insertions(+), 125 deletions(-)

diff --git a/arch/ia64/include/asm/spinlock.h b/arch/ia64/include/asm/spinlock.h
index 864775970c50..0e5c1ad3239c 100644
--- a/arch/ia64/include/asm/spinlock.h
+++ b/arch/ia64/include/asm/spinlock.h
@@ -124,18 +124,13 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 	__ticket_spin_unlock(lock);
 }
 
-static __always_inline void arch_spin_lock_flags(arch_spinlock_t *lock,
-						  unsigned long flags)
-{
-	arch_spin_lock(lock);
-}
-#define arch_spin_lock_flags	arch_spin_lock_flags
-
 #ifdef ASM_SUPPORTED
 
 static __always_inline void
-arch_read_lock_flags(arch_rwlock_t *lock, unsigned long flags)
+arch_read_lock(arch_rwlock_t *lock)
 {
+	unsigned long flags = 0;
+
 	__asm__ __volatile__ (
 		"tbit.nz p6, p0 = %1,%2\n"
 		"br.few 3f\n"
@@ -157,13 +152,8 @@ arch_read_lock_flags(arch_rwlock_t *lock, unsigned long flags)
 		: "p6", "p7", "r2", "memory");
 }
 
-#define arch_read_lock_flags arch_read_lock_flags
-#define arch_read_lock(lock) arch_read_lock_flags(lock, 0)
-
 #else /* !ASM_SUPPORTED */
 
-#define arch_read_lock_flags(rw, flags) arch_read_lock(rw)
-
 #define arch_read_lock(rw)								\
 do {											\
 	arch_rwlock_t *__read_lock_ptr = (rw);						\
@@ -186,8 +176,10 @@ do {								\
 #ifdef ASM_SUPPORTED
 
 static __always_inline void
-arch_write_lock_flags(arch_rwlock_t *lock, unsigned long flags)
+arch_write_lock(arch_rwlock_t *lock)
 {
+	unsigned long flags = 0;
+
 	__asm__ __volatile__ (
 		"tbit.nz p6, p0 = %1, %2\n"
 		"mov ar.ccv = r0\n"
@@ -210,9 +202,6 @@ arch_write_lock_flags(arch_rwlock_t *lock, unsigned long flags)
 		: "ar.ccv", "p6", "p7", "r2", "r29", "memory");
 }
 
-#define arch_write_lock_flags arch_write_lock_flags
-#define arch_write_lock(rw) arch_write_lock_flags(rw, 0)
-
 #define arch_write_trylock(rw)							\
 ({										\
 	register long result;							\
diff --git a/arch/openrisc/include/asm/spinlock.h b/arch/openrisc/include/asm/spinlock.h
index a8940bdfcb7e..264944a71535 100644
--- a/arch/openrisc/include/asm/spinlock.h
+++ b/arch/openrisc/include/asm/spinlock.h
@@ -19,9 +19,6 @@
 
 #include <asm/qrwlock.h>
 
-#define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
-#define arch_write_lock_flags(lock, flags) arch_write_lock(lock)
-
 #define arch_spin_relax(lock)	cpu_relax()
 #define arch_read_relax(lock)	cpu_relax()
 #define arch_write_relax(lock)	cpu_relax()
diff --git a/arch/parisc/include/asm/spinlock.h b/arch/parisc/include/asm/spinlock.h
index fa5ee8a45dbd..a6e5d66a7656 100644
--- a/arch/parisc/include/asm/spinlock.h
+++ b/arch/parisc/include/asm/spinlock.h
@@ -23,21 +23,6 @@ static inline void arch_spin_lock(arch_spinlock_t *x)
 			continue;
 }
 
-static inline void arch_spin_lock_flags(arch_spinlock_t *x,
-					unsigned long flags)
-{
-	volatile unsigned int *a;
-
-	a = __ldcw_align(x);
-	while (__ldcw(a) == 0)
-		while (*a == 0)
-			if (flags & PSW_SM_I) {
-				local_irq_enable();
-				local_irq_disable();
-			}
-}
-#define arch_spin_lock_flags arch_spin_lock_flags
-
 static inline void arch_spin_unlock(arch_spinlock_t *x)
 {
 	volatile unsigned int *a;
diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index 8985791a2ba5..7ae6aeef8464 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -123,27 +123,6 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 	}
 }
 
-static inline
-void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
-{
-	unsigned long flags_dis;
-
-	while (1) {
-		if (likely(__arch_spin_trylock(lock) == 0))
-			break;
-		local_save_flags(flags_dis);
-		local_irq_restore(flags);
-		do {
-			HMT_low();
-			if (is_shared_processor())
-				splpar_spin_yield(lock);
-		} while (unlikely(lock->slock != 0));
-		HMT_medium();
-		local_irq_restore(flags_dis);
-	}
-}
-#define arch_spin_lock_flags arch_spin_lock_flags
-
 static inline void arch_spin_unlock(arch_spinlock_t *lock)
 {
 	__asm__ __volatile__("# arch_spin_unlock\n\t"
diff --git a/arch/s390/include/asm/spinlock.h b/arch/s390/include/asm/spinlock.h
index ef59588a3042..888a2f1c9ee3 100644
--- a/arch/s390/include/asm/spinlock.h
+++ b/arch/s390/include/asm/spinlock.h
@@ -67,14 +67,6 @@ static inline void arch_spin_lock(arch_spinlock_t *lp)
 		arch_spin_lock_wait(lp);
 }
 
-static inline void arch_spin_lock_flags(arch_spinlock_t *lp,
-					unsigned long flags)
-{
-	if (!arch_spin_trylock_once(lp))
-		arch_spin_lock_wait(lp);
-}
-#define arch_spin_lock_flags	arch_spin_lock_flags
-
 static inline int arch_spin_trylock(arch_spinlock_t *lp)
 {
 	if (!arch_spin_trylock_once(lp))
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 9fe165beb0f9..467b94257105 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -481,23 +481,6 @@ do {								\
 
 #endif /* CONFIG_LOCK_STAT */
 
-#ifdef CONFIG_LOCKDEP
-
-/*
- * On lockdep we dont want the hand-coded irq-enable of
- * _raw_*_lock_flags() code, because lockdep assumes
- * that interrupts are not re-enabled during lock-acquire:
- */
-#define LOCK_CONTENDED_FLAGS(_lock, try, lock, lockfl, flags) \
-	LOCK_CONTENDED((_lock), (try), (lock))
-
-#else /* CONFIG_LOCKDEP */
-
-#define LOCK_CONTENDED_FLAGS(_lock, try, lock, lockfl, flags) \
-	lockfl((_lock), (flags))
-
-#endif /* CONFIG_LOCKDEP */
-
 #ifdef CONFIG_PROVE_LOCKING
 extern void print_irqtrace_events(struct task_struct *curr);
 #else
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 7ce9a51ae5c0..2c0ad417ce3c 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -30,31 +30,16 @@ do {								\
 
 #ifdef CONFIG_DEBUG_SPINLOCK
  extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
-#define do_raw_read_lock_flags(lock, flags) do_raw_read_lock(lock)
  extern int do_raw_read_trylock(rwlock_t *lock);
  extern void do_raw_read_unlock(rwlock_t *lock) __releases(lock);
  extern void do_raw_write_lock(rwlock_t *lock) __acquires(lock);
-#define do_raw_write_lock_flags(lock, flags) do_raw_write_lock(lock)
  extern int do_raw_write_trylock(rwlock_t *lock);
  extern void do_raw_write_unlock(rwlock_t *lock) __releases(lock);
 #else
-
-#ifndef arch_read_lock_flags
-# define arch_read_lock_flags(lock, flags)	arch_read_lock(lock)
-#endif
-
-#ifndef arch_write_lock_flags
-# define arch_write_lock_flags(lock, flags)	arch_write_lock(lock)
-#endif
-
 # define do_raw_read_lock(rwlock)	do {__acquire(lock); arch_read_lock(&(rwlock)->raw_lock); } while (0)
-# define do_raw_read_lock_flags(lock, flags) \
-		do {__acquire(lock); arch_read_lock_flags(&(lock)->raw_lock, *(flags)); } while (0)
 # define do_raw_read_trylock(rwlock)	arch_read_trylock(&(rwlock)->raw_lock)
 # define do_raw_read_unlock(rwlock)	do {arch_read_unlock(&(rwlock)->raw_lock); __release(lock); } while (0)
 # define do_raw_write_lock(rwlock)	do {__acquire(lock); arch_write_lock(&(rwlock)->raw_lock); } while (0)
-# define do_raw_write_lock_flags(lock, flags) \
-		do {__acquire(lock); arch_write_lock_flags(&(lock)->raw_lock, *(flags)); } while (0)
 # define do_raw_write_trylock(rwlock)	arch_write_trylock(&(rwlock)->raw_lock)
 # define do_raw_write_unlock(rwlock)	do {arch_write_unlock(&(rwlock)->raw_lock); __release(lock); } while (0)
 #endif
diff --git a/include/linux/rwlock_api_smp.h b/include/linux/rwlock_api_smp.h
index abfb53ab11be..f1db6f17c4fb 100644
--- a/include/linux/rwlock_api_smp.h
+++ b/include/linux/rwlock_api_smp.h
@@ -157,8 +157,7 @@ static inline unsigned long __raw_read_lock_irqsave(rwlock_t *lock)
 	local_irq_save(flags);
 	preempt_disable();
 	rwlock_acquire_read(&lock->dep_map, 0, 0, _RET_IP_);
-	LOCK_CONTENDED_FLAGS(lock, do_raw_read_trylock, do_raw_read_lock,
-			     do_raw_read_lock_flags, &flags);
+	LOCK_CONTENDED(lock, do_raw_read_trylock, do_raw_read_lock);
 	return flags;
 }
 
@@ -184,8 +183,7 @@ static inline unsigned long __raw_write_lock_irqsave(rwlock_t *lock)
 	local_irq_save(flags);
 	preempt_disable();
 	rwlock_acquire(&lock->dep_map, 0, 0, _RET_IP_);
-	LOCK_CONTENDED_FLAGS(lock, do_raw_write_trylock, do_raw_write_lock,
-			     do_raw_write_lock_flags, &flags);
+	LOCK_CONTENDED(lock, do_raw_write_trylock, do_raw_write_lock);
 	return flags;
 }
 
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index c04e99edfe92..40e467cdee2d 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -176,7 +176,6 @@ do {									\
 
 #ifdef CONFIG_DEBUG_SPINLOCK
  extern void do_raw_spin_lock(raw_spinlock_t *lock) __acquires(lock);
-#define do_raw_spin_lock_flags(lock, flags) do_raw_spin_lock(lock)
  extern int do_raw_spin_trylock(raw_spinlock_t *lock);
  extern void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock);
 #else
@@ -187,18 +186,6 @@ static inline void do_raw_spin_lock(raw_spinlock_t *lock) __acquires(lock)
 	mmiowb_spin_lock();
 }
 
-#ifndef arch_spin_lock_flags
-#define arch_spin_lock_flags(lock, flags)	arch_spin_lock(lock)
-#endif
-
-static inline void
-do_raw_spin_lock_flags(raw_spinlock_t *lock, unsigned long *flags) __acquires(lock)
-{
-	__acquire(lock);
-	arch_spin_lock_flags(&lock->raw_lock, *flags);
-	mmiowb_spin_lock();
-}
-
 static inline int do_raw_spin_trylock(raw_spinlock_t *lock)
 {
 	int ret = arch_spin_trylock(&(lock)->raw_lock);
diff --git a/include/linux/spinlock_api_smp.h b/include/linux/spinlock_api_smp.h
index 6b8e1a0b137b..51fa0dab68c4 100644
--- a/include/linux/spinlock_api_smp.h
+++ b/include/linux/spinlock_api_smp.h
@@ -108,16 +108,7 @@ static inline unsigned long __raw_spin_lock_irqsave(raw_spinlock_t *lock)
 	local_irq_save(flags);
 	preempt_disable();
 	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
-	/*
-	 * On lockdep we dont want the hand-coded irq-enable of
-	 * do_raw_spin_lock_flags() code, because lockdep assumes
-	 * that interrupts are not re-enabled during lock-acquire:
-	 */
-#ifdef CONFIG_LOCKDEP
 	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
-#else
-	do_raw_spin_lock_flags(lock, &flags);
-#endif
 	return flags;
 }
 
diff --git a/include/linux/spinlock_up.h b/include/linux/spinlock_up.h
index 0ac9112c1bbe..16521074b6f7 100644
--- a/include/linux/spinlock_up.h
+++ b/include/linux/spinlock_up.h
@@ -62,7 +62,6 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
 #define arch_spin_is_locked(lock)	((void)(lock), 0)
 /* for sched/core.c and kernel_lock.c: */
 # define arch_spin_lock(lock)		do { barrier(); (void)(lock); } while (0)
-# define arch_spin_lock_flags(lock, flags)	do { barrier(); (void)(lock); } while (0)
 # define arch_spin_unlock(lock)	do { barrier(); (void)(lock); } while (0)
 # define arch_spin_trylock(lock)	({ barrier(); (void)(lock); 1; })
 #endif /* DEBUG_SPINLOCK */
diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
index c5830cfa379a..b562f9289372 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -378,8 +378,7 @@ unsigned long __lockfunc _raw_spin_lock_irqsave_nested(raw_spinlock_t *lock,
 	local_irq_save(flags);
 	preempt_disable();
 	spin_acquire(&lock->dep_map, subclass, 0, _RET_IP_);
-	LOCK_CONTENDED_FLAGS(lock, do_raw_spin_trylock, do_raw_spin_lock,
-				do_raw_spin_lock_flags, &flags);
+	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 	return flags;
 }
 EXPORT_SYMBOL(_raw_spin_lock_irqsave_nested);
-- 
2.29.2


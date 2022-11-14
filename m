Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A92627499
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:34:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YL43B7cz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:34:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OhZIEbYW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OhZIEbYW;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YH46Sjtz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:00 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so9374651pjk.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/MkpvgiQvZUS48v8RArx2HbNh9Khi3667nn4hCQEgU=;
        b=OhZIEbYW+V0/w/O2kAJlYDSvrU+rZVMe6mh3M1FdZezJUTChiuWHh9iqDh0b9j0GzC
         fF2gV5UFi0szLRamMYljJ6icAZZf4qyetFEeFndF393f/kNElJ95C7dhY9NdjMnqIR2Q
         iHW0mbF1w8RkX8Kc4KJ4X+d9MbglzlSLxde7oCTIhaqwWLyDILOFX1fCvL4zdFFnZES8
         YaFEjVewBz3URxPQAlr8WcygX84WNW0WoJ7QxJGfkRzC16dViJ9I3Wkbps5O0fYb835c
         20vFUK3kqOpgcmYbU8QwlH+BTFsWBgQHNpRp4WQdJJlfTKmwWSiw6BcvvhSDoD5C3ED/
         vd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/MkpvgiQvZUS48v8RArx2HbNh9Khi3667nn4hCQEgU=;
        b=3EmM8jFStmasgiWF1oWGLA4vINBlXJlUXyQJX8qeZ7dX4kz1tlplkUT4cqk9c/emxm
         lzzrw/Xy+fC0VTqgjFaJEE18U8IOS7hNIGuXQE4VScfZwi/rNCJEtewfdTgDhiwn3FJq
         eoRNSQvdIML1kPGNTDyVBrie2dOsCEkrjmTM3HLZjvh44XDtqp3+Di74ENK1d2otQ+u0
         7JdMxXdLgqf6dHqt6bZkshdEF37thlv1ronOkquKqi+XzHyDYuQrZlWcayKMWrM6gd5Q
         t4wibWBOle8EDxWUwxTVH0Jkx/vHt706EWulhPU9C67o4vVZZLSAHj4lQ8X50OmPRtkt
         ZppA==
X-Gm-Message-State: ANoB5pkzVr9dGrd3Y6fUggLTZ4FAaonZW93ouNFj1Ki0HVBHAZZyzST6
	5AuAm8QuDjmJbDyXNOzAAPxRnot7pJo=
X-Google-Smtp-Source: AA0mqf42OVVUP5tJzt1Au72st2AjHPCfix/D0XqFQrLWJ2dtbnVCcntOk1QDNzY3ITspEDXk86N+mA==
X-Received: by 2002:a17:902:f609:b0:186:c958:6cd8 with SMTP id n9-20020a170902f60900b00186c9586cd8mr11669931plg.145.1668393117961;
        Sun, 13 Nov 2022 18:31:57 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:31:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/17] powerpc/qspinlock: powerpc qspinlock implementation
Date: Mon, 14 Nov 2022 12:31:21 +1000
Message-Id: <20221114023137.2679627-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114023137.2679627-1-npiggin@gmail.com>
References: <20221114023137.2679627-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a powerpc specific implementation of queued spinlocks. This is the
build framework with a very simple (non-queued) spinlock implementation
to begin with. Later changes add queueing, and other features and
optimisations one-at-a-time. It is done this way to more easily see how
the queued spinlocks are built, and to make performance and correctness
bisects more useful.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                       |  1 -
 arch/powerpc/include/asm/qspinlock.h       | 76 +++++++++-------------
 arch/powerpc/include/asm/qspinlock_types.h | 13 ++++
 arch/powerpc/include/asm/spinlock_types.h  |  2 +-
 arch/powerpc/lib/Makefile                  |  4 +-
 arch/powerpc/lib/qspinlock.c               | 17 +++++
 6 files changed, 66 insertions(+), 47 deletions(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_types.h
 create mode 100644 arch/powerpc/lib/qspinlock.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..1d5b4f280feb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -155,7 +155,6 @@ config PPC
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
-	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 39c1c7f80579..b1443aab2145 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -2,66 +2,54 @@
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
+	return atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0;
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
index 000000000000..1c669b5b4607
--- /dev/null
+++ b/arch/powerpc/lib/qspinlock.c
@@ -0,0 +1,17 @@
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
-- 
2.37.2


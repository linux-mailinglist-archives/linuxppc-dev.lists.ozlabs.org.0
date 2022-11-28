Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F7639FFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 04:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9Vy17Qzz3cK5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 14:12:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IP4FeF/2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IP4FeF/2;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL9V147Rvz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 14:11:21 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id f9so8771826pgf.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 19:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrZy9uporrgeW0ewdnCViKuFPAvuwXAfk/oz2HSEByQ=;
        b=IP4FeF/2FiviNI9A4cXQrPorFfm8lLQdZRLdWMyTqew7ac19Lv7lDKcV3wPwO3As0T
         AkNVUAG3mnlB2g918XxNwhTx7D/TCEHL8wVNiYPpLAbzzaXN2yr0jTd64gZpoOikxIRR
         n7FtRue+7eaYKnUHO3b0rXyuVgKfS0gR9YcKnBXIoXK2e09cdVVUbc7Aqs2dMg6S5+5C
         HnYWBQdyyGqqeRnl8cH+R3onaroUkxGgV/tNaxjN8WU0N04XK37tBCupKyQHlmXHefOe
         2l8PHoJ9fr48+P0qrBSWR3wrZFwTT2EnW2yMVoGIey4WKwbMCpeX+5ZLLa2bDAtv+W91
         E67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrZy9uporrgeW0ewdnCViKuFPAvuwXAfk/oz2HSEByQ=;
        b=t2tqtydafcXvIX6kxfc0R5r5h+hMzLsp+Jg9WBqgBI41DHycTNGArxKfE8jbIlYbW1
         CYaQylEC2nbYx0ekkS+u/tlYoWR3ZCa8lYoSRrLWC0eIozxCNPh7b11nBEM0/FXaBw3l
         USGzD8VFPxhQDpsv7JmmO8HXPXcsuYBtCMU5ilZcBBje9+E1bycBWSBAqj7jmcO+nhsG
         KrKRIr3fGtU+AV1Oh04Bi/zfpPdC2wGiGFIqqUulX5ZvA47eSRRMaPO9rAh4TcYFq33X
         36Alh6bLFEEDWzZGMs0uWrVGJGRt8ijMFgc+GaaIkTCzKDyQaigshEkhsZ6oJTyz6c0f
         lsBg==
X-Gm-Message-State: ANoB5pkPB4Nu7hzQokyRJMct/0rs13MWorK4htGmmoD4Tic46WD9rPat
	OqzFNs3GT+du65NWa0F8RxrVRHVblrE=
X-Google-Smtp-Source: AA0mqf57SjXj8GjKhmzzC1gqLT6xep1NAn5cNKcvwHBzoC1moBse8LuWCMsZdkgNxeIs/Cq9FMdOwA==
X-Received: by 2002:a63:570e:0:b0:477:a381:84d with SMTP id l14-20020a63570e000000b00477a381084dmr23714856pgb.207.1669605078470;
        Sun, 27 Nov 2022 19:11:18 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id nk2-20020a17090b194200b0020b7de675a4sm6551411pjb.41.2022.11.27.19.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 19:11:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 13:11:13 +1000
Message-Id: <CONLLQB6DCJU.2ZPOS7T6S5GRR@bobo>
Subject: [PATCH v3 real 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221126095932.1234527-1-npiggin@gmail.com>
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>
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
Missed the first patch sending the series :( Here is the real patch 1.

Thanks,
NIck

 arch/powerpc/Kconfig                          |  1 -
 arch/powerpc/include/asm/paravirt.h           |  3 +-
 arch/powerpc/include/asm/processor.h          |  1 +
 arch/powerpc/include/asm/qspinlock.h          | 87 +++++++------------
 arch/powerpc/include/asm/qspinlock_paravirt.h |  7 --
 arch/powerpc/include/asm/qspinlock_types.h    | 13 +++
 arch/powerpc/include/asm/spinlock.h           |  2 +-
 arch/powerpc/include/asm/spinlock_types.h     |  2 +-
 arch/powerpc/lib/Makefile                     |  4 +-
 arch/powerpc/lib/qspinlock.c                  | 17 ++++
 arch/powerpc/platforms/pseries/vas.c          |  1 +
 11 files changed, 67 insertions(+), 71 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
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
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm=
/paravirt.h
index f5ba1a3c41f8..119b44b8e81b 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -3,14 +3,13 @@
 #define _ASM_POWERPC_PARAVIRT_H
=20
 #include <linux/jump_label.h>
-#include <asm/smp.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 #include <asm/hvcall.h>
 #endif
=20
 #ifdef CONFIG_PPC_SPLPAR
-#include <linux/smp.h>
+#include <asm/smp.h>
 #include <asm/kvm_guest.h>
 #include <asm/cputhreads.h>
=20
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/as=
m/processor.h
index 631802999d59..640d9a35661c 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -39,6 +39,7 @@
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 #include <linux/thread_info.h>
+#include <asm/paravirt.h>
 #include <asm/ptrace.h>
 #include <asm/hw_breakpoint.h>
=20
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/as=
m/qspinlock.h
index b676c4fb90fd..b1443aab2145 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -2,83 +2,54 @@
 #ifndef _ASM_POWERPC_QSPINLOCK_H
 #define _ASM_POWERPC_QSPINLOCK_H
=20
-#include <asm-generic/qspinlock_types.h>
-#include <asm/paravirt.h>
+#include <linux/atomic.h>
+#include <linux/compiler.h>
+#include <asm/qspinlock_types.h>
=20
-#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
-
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-extern void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 v=
al);
-extern void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val=
);
-extern void __pv_queued_spin_unlock(struct qspinlock *lock);
-
-static __always_inline void queued_spin_lock_slowpath(struct qspinlock *lo=
ck, u32 val)
+static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
-	if (!is_shared_processor())
-		native_queued_spin_lock_slowpath(lock, val);
-	else
-		__pv_queued_spin_lock_slowpath(lock, val);
+	return atomic_read(&lock->val);
 }
=20
-#define queued_spin_unlock queued_spin_unlock
-static inline void queued_spin_unlock(struct qspinlock *lock)
+static __always_inline int queued_spin_value_unlocked(struct qspinlock loc=
k)
 {
-	if (!is_shared_processor())
-		smp_store_release(&lock->locked, 0);
-	else
-		__pv_queued_spin_unlock(lock);
+	return !atomic_read(&lock.val);
 }
=20
-#else
-extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-#endif
-
-static __always_inline void queued_spin_lock(struct qspinlock *lock)
+static __always_inline int queued_spin_is_contended(struct qspinlock *lock=
)
 {
-	u32 val =3D 0;
-
-	if (likely(arch_atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL))=
)
-		return;
-
-	queued_spin_lock_slowpath(lock, val);
+	return 0;
 }
-#define queued_spin_lock queued_spin_lock
=20
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-#define SPIN_THRESHOLD (1<<15) /* not tuned */
-
-static __always_inline void pv_wait(u8 *ptr, u8 val)
+static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
-	if (*ptr !=3D val)
-		return;
-	yield_to_any();
-	/*
-	 * We could pass in a CPU here if waiting in the queue and yield to
-	 * the previous CPU in the queue.
-	 */
+	return atomic_cmpxchg_acquire(&lock->val, 0, 1) =3D=3D 0;
 }
=20
-static __always_inline void pv_kick(int cpu)
+void queued_spin_lock_slowpath(struct qspinlock *lock);
+
+static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
-	prod_cpu(cpu);
+	if (!queued_spin_trylock(lock))
+		queued_spin_lock_slowpath(lock);
 }
=20
-extern void __pv_init_lock_hash(void);
-
-static inline void pv_spinlocks_init(void)
+static inline void queued_spin_unlock(struct qspinlock *lock)
 {
-	__pv_init_lock_hash();
+	atomic_set_release(&lock->val, 0);
 }
=20
-#endif
-
-/*
- * Queued spinlocks rely heavily on smp_cond_load_relaxed() to busy-wait,
- * which was found to have performance problems if implemented with
- * the preferred spin_begin()/spin_end() SMT priority pattern. Use the
- * generic version instead.
- */
+#define arch_spin_is_locked(l)		queued_spin_is_locked(l)
+#define arch_spin_is_contended(l)	queued_spin_is_contended(l)
+#define arch_spin_value_unlocked(l)	queued_spin_value_unlocked(l)
+#define arch_spin_lock(l)		queued_spin_lock(l)
+#define arch_spin_trylock(l)		queued_spin_trylock(l)
+#define arch_spin_unlock(l)		queued_spin_unlock(l)
=20
-#include <asm-generic/qspinlock.h>
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+void pv_spinlocks_init(void);
+#else
+static inline void pv_spinlocks_init(void) { }
+#endif
=20
 #endif /* _ASM_POWERPC_QSPINLOCK_H */
diff --git a/arch/powerpc/include/asm/qspinlock_paravirt.h b/arch/powerpc/i=
nclude/asm/qspinlock_paravirt.h
deleted file mode 100644
index 6b60e7736a47..000000000000
--- a/arch/powerpc/include/asm/qspinlock_paravirt.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_POWERPC_QSPINLOCK_PARAVIRT_H
-#define _ASM_POWERPC_QSPINLOCK_PARAVIRT_H
-
-EXPORT_SYMBOL(__pv_queued_spin_unlock);
-
-#endif /* _ASM_POWERPC_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/incl=
ude/asm/qspinlock_types.h
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
+#define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val =3D ATOMIC_INIT(0) }
+
+#endif /* _ASM_POWERPC_QSPINLOCK_TYPES_H */
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm=
/spinlock.h
index bd75872a6334..7dafca8e3f02 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -13,7 +13,7 @@
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
=20
-#ifndef CONFIG_PARAVIRT_SPINLOCKS
+#ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 static inline void pv_spinlocks_init(void) { }
 #endif
=20
diff --git a/arch/powerpc/include/asm/spinlock_types.h b/arch/powerpc/inclu=
de/asm/spinlock_types.h
index d5f8a74ed2e8..40b01446cf75 100644
--- a/arch/powerpc/include/asm/spinlock_types.h
+++ b/arch/powerpc/include/asm/spinlock_types.h
@@ -7,7 +7,7 @@
 #endif
=20
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
@@ -52,7 +52,9 @@ obj-$(CONFIG_PPC_BOOK3S_64) +=3D copyuser_power7.o copypa=
ge_power7.o \
 obj64-y	+=3D copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o copy_mc_64.o
=20
-ifndef CONFIG_PPC_QUEUED_SPINLOCKS
+ifdef CONFIG_PPC_QUEUED_SPINLOCKS
+obj64-$(CONFIG_SMP)	+=3D qspinlock.o
+else
 obj64-$(CONFIG_SMP)	+=3D locks.o
 endif
=20
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
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/=
pseries/vas.c
index 4ad6e510d405..3ca573f5a0f7 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -15,6 +15,7 @@
 #include <linux/irqdomain.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
+#include <asm/paravirt.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/firmware.h>
 #include <asm/vas.h>
--=20
2.37.2

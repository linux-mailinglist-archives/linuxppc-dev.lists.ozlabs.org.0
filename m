Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB6211DB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:04:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9c63ZDmzDqwL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 18:04:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DJiFhBbb; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9Gd1JdbzDqtd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:49:29 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id u8so11787212pje.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeOCtXH9aAkyUxIRivkqAv5uE037Fz8q0aJlvR0kawo=;
 b=DJiFhBbbRtmTxheRZKS84383nsu3Q8OP1Af/O9wXGzi5q1MAmFBhcAmI/HI5aC9coF
 MSVgJ2wNtaC+g9Kq2h5UA2Y3+8JbnOioWm0ygdaBJwP+noHQzoF4IrwAy2uBQKzI5vUc
 cneTpuWPsVTkMfFJeyVWthrhrPMN6ombSjXaha+lN66KA+DxJqc2y6r6qhOLHt83OjoY
 HJp8fpMEyoXykNiZhL8SxkUHzloDeLLT38lOybrVZrxKLr9rMYHU2N+z9/gZAZHcjqfq
 eatnrNbguKReMd6Rg2WHqlkvZhdzv4jADk/JB1Y7tqUy8HiHjtSYn5uux8NTSQ3KAADV
 CNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AeOCtXH9aAkyUxIRivkqAv5uE037Fz8q0aJlvR0kawo=;
 b=iXfhdTe/hNe6jfT9MA+TZK5LFxL68cdaAnae5fsXGqr/OY9LKPwjoEHvx2ttxmsUwo
 h5z88L5NnefCw8w9RkLzQx8PCySA9+e6iJEj7UlAveKXj5hyStea2smqpzvV8SRk+uTl
 WGBfJmv4enKcGZpSCVcJnkZv6epTTz51R5xIpO5XnCuQdmWs/pGjhSGskvfSCpBW1ZZX
 8Ww4icthc7LhXybWZrIHvhHp12qTBOzbKWUCQqf6rRc8wCfEK8GWDDxQSviFrYAgqxmU
 +D7smk7gLuwfD8HnPHL55Pevd/QAbEz4zL7+YG50fql9RQNMrLr5YyupypHCn4v+iFrP
 ukAQ==
X-Gm-Message-State: AOAM530+ylkDHeFsqyj/J7KoLCJ6PR6gt2KmpCc1BoR6iqEEqJ8EJ+bh
 xb7193UHV4uKF5Lr81pZi4I=
X-Google-Smtp-Source: ABdhPJysPnxkgshf8EJH717uNcY2uPYhM8eamXvqLvT6GNuILItj6fg+Tsmhs2OBwqsfoYoJf1FaUg==
X-Received: by 2002:a17:902:9a81:: with SMTP id
 w1mr24349902plp.50.1593676164606; 
 Thu, 02 Jul 2020 00:49:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 6/8] powerpc/pseries: implement paravirt qspinlocks for SPLPAR
Date: Thu,  2 Jul 2020 17:48:37 +1000
Message-Id: <20200702074839.1057733-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200702074839.1057733-1-npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/paravirt.h           | 23 ++++++++
 arch/powerpc/include/asm/qspinlock.h          | 55 +++++++++++++++++++
 arch/powerpc/include/asm/qspinlock_paravirt.h |  5 ++
 arch/powerpc/platforms/pseries/Kconfig        |  5 ++
 arch/powerpc/platforms/pseries/setup.c        |  6 +-
 include/asm-generic/qspinlock.h               |  2 +
 6 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 7a8546660a63..5fae9dfa6fe9 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -29,6 +29,16 @@ static inline void yield_to_preempted(int cpu, u32 yield_count)
 {
 	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_count);
 }
+
+static inline void prod_cpu(int cpu)
+{
+	plpar_hcall_norets(H_PROD, get_hard_smp_processor_id(cpu));
+}
+
+static inline void yield_to_any(void)
+{
+	plpar_hcall_norets(H_CONFER, -1, 0);
+}
 #else
 static inline bool is_shared_processor(void)
 {
@@ -45,6 +55,19 @@ static inline void yield_to_preempted(int cpu, u32 yield_count)
 {
 	___bad_yield_to_preempted(); /* This would be a bug */
 }
+
+extern void ___bad_yield_to_any(void);
+static inline void yield_to_any(void)
+{
+	___bad_yield_to_any(); /* This would be a bug */
+}
+
+extern void ___bad_prod_cpu(void);
+static inline void prod_cpu(int cpu)
+{
+	___bad_prod_cpu(); /* This would be a bug */
+}
+
 #endif
 
 #define vcpu_is_preempted vcpu_is_preempted
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index f84da77b6bb7..997a9a32df77 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -3,9 +3,36 @@
 #define _ASM_POWERPC_QSPINLOCK_H
 
 #include <asm-generic/qspinlock_types.h>
+#include <asm/paravirt.h>
 
 #define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
 
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+extern void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+extern void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+
+static __always_inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+{
+	if (!is_shared_processor())
+		native_queued_spin_lock_slowpath(lock, val);
+	else
+		__pv_queued_spin_lock_slowpath(lock, val);
+}
+#else
+extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+#endif
+
+static __always_inline void queued_spin_lock(struct qspinlock *lock)
+{
+	u32 val = 0;
+
+	if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL)))
+		return;
+
+	queued_spin_lock_slowpath(lock, val);
+}
+#define queued_spin_lock queued_spin_lock
+
 #define smp_mb__after_spinlock()   smp_mb()
 
 static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
@@ -15,6 +42,34 @@ static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 }
 #define queued_spin_is_locked queued_spin_is_locked
 
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#define SPIN_THRESHOLD (1<<15) /* not tuned */
+
+static __always_inline void pv_wait(u8 *ptr, u8 val)
+{
+	if (*ptr != val)
+		return;
+	yield_to_any();
+	/*
+	 * We could pass in a CPU here if waiting in the queue and yield to
+	 * the previous CPU in the queue.
+	 */
+}
+
+static __always_inline void pv_kick(int cpu)
+{
+	prod_cpu(cpu);
+}
+
+extern void __pv_init_lock_hash(void);
+
+static inline void pv_spinlocks_init(void)
+{
+	__pv_init_lock_hash();
+}
+
+#endif
+
 #include <asm-generic/qspinlock.h>
 
 #endif /* _ASM_POWERPC_QSPINLOCK_H */
diff --git a/arch/powerpc/include/asm/qspinlock_paravirt.h b/arch/powerpc/include/asm/qspinlock_paravirt.h
new file mode 100644
index 000000000000..6dbdb8a4f84f
--- /dev/null
+++ b/arch/powerpc/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ASM_QSPINLOCK_PARAVIRT_H
+#define __ASM_QSPINLOCK_PARAVIRT_H
+
+#endif /* __ASM_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 24c18362e5ea..756e727b383f 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -25,9 +25,14 @@ config PPC_PSERIES
 	select SWIOTLB
 	default y
 
+config PARAVIRT_SPINLOCKS
+	bool
+	default n
+
 config PPC_SPLPAR
 	depends on PPC_PSERIES
 	bool "Support for shared-processor logical partitions"
+	select PARAVIRT_SPINLOCKS if PPC_QUEUED_SPINLOCKS
 	help
 	  Enabling this option will make the kernel run more efficiently
 	  on logically-partitioned pSeries systems which use shared
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 2db8469e475f..747a203d9453 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -771,8 +771,12 @@ static void __init pSeries_setup_arch(void)
 	if (firmware_has_feature(FW_FEATURE_LPAR)) {
 		vpa_init(boot_cpuid);
 
-		if (lppaca_shared_proc(get_lppaca()))
+		if (lppaca_shared_proc(get_lppaca())) {
 			static_branch_enable(&shared_processor);
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+			pv_spinlocks_init();
+#endif
+		}
 
 		ppc_md.power_save = pseries_lpar_idle;
 		ppc_md.enable_pmcs = pseries_lpar_enable_pmcs;
diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index fb0a814d4395..38ca14e79a86 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -69,6 +69,7 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 
 extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
 
+#ifndef queued_spin_lock
 /**
  * queued_spin_lock - acquire a queued spinlock
  * @lock: Pointer to queued spinlock structure
@@ -82,6 +83,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 
 	queued_spin_lock_slowpath(lock, val);
 }
+#endif
 
 #ifndef queued_spin_unlock
 /**
-- 
2.23.0


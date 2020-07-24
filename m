Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6F22C675
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:30:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCqnf4zqGzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:30:14 +1000 (AEST)
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
 header.s=20161025 header.b=uIVnByAH; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqS170yCzDrQv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:14:57 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id k5so5199506pjg.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Z5tnkoy8D3Ixvbx4t7AGSPKBpu2EDlVVpHs+ZSeWN8=;
 b=uIVnByAHepd5/lrKx9pkme64Btx1ZsGlTW6EyjCkHtsD0f5zXMoq3fC8WQzH+tI5th
 RTfrs9MSvP7ZsZ9b7nr2LXJNGdOAFbqnxMGdXijjVbjLCvEQeXQlVrANqs2besHS7Ljj
 9YlAbJw+g7Wkn1AMVYDYizoZna8H6lvKMYC3e0mJF7x0B7VNYSK0fiuBDh4KGxKLmKgl
 VN7AxammFLMpmDGCaLX7Lf09gl+rpt/aOpdcIYGmfJtLkqnaj3RFQoYrcTr2wRHSNE5m
 ZeuIeCFRElYmR8LaP9+1za/wH6b5DWxtHlwnlxfQIbaEMT59eH8BVGqonzPo2Xln8EI1
 GCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Z5tnkoy8D3Ixvbx4t7AGSPKBpu2EDlVVpHs+ZSeWN8=;
 b=sNhB/aqnbijL8M9pCdV2Suorn677gK6E7TpFGP/kfqfTu/IteKXAFa7f/3EcRuRfbB
 Qe+mpcAjDnUyyziMaRh984t9GBQFb5IFpEeMxpe5d2VzwC8DjQy80+cCoP9burd1iwZi
 teeyw5SWMOW0+tFg9NA6A+lO2Sk6q4wv7yyf2ROzz0MHLu6hIsQOOQvZq8l+BmrEw2Td
 5+MNPS9X5yPlVfoqWwzOGiYb7tqt4D1t1LdEqw8CA1hknS2O2/AVWDUDWDDERXKM5PFq
 3H8D65K1d+ptNP2V/49t3iWhAdK3EvQxkqX4mIRh/pO8Q55fM/J5+WTtc9KyiZJv5uFJ
 GzxA==
X-Gm-Message-State: AOAM532bI8NeRaF52qrC4tVXax1pwZUaEQuv/S9kSSxAm0eA3dTcRvjf
 j62DMWif6AVFjBAia4Qc0yGR1O1T
X-Google-Smtp-Source: ABdhPJy8s0WlvzUfXEyHoYKDcaEDgL8O/zcMQeyrm0HgG3lq3ZjZ+S7R6eJyljhXdI8vGaWMzxf5LQ==
X-Received: by 2002:a17:90a:7184:: with SMTP id
 i4mr5365125pjk.75.1595596494141; 
 Fri, 24 Jul 2020 06:14:54 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id az16sm5871998pjb.7.2020.07.24.06.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 06:14:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/6] powerpc/64s: implement queued spinlocks and rwlocks
Date: Fri, 24 Jul 2020 23:14:20 +1000
Message-Id: <20200724131423.1362108-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
References: <20200724131423.1362108-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These have shown significantly improved performance and fairness when
spinlock contention is moderate to high on very large systems.

With this series including subsequent patches, on a 16 socket 1536 thread
POWER9, a stress test such as same-file open/close from all CPUs gets big
speedups, 11620op/s aggregate with simple spinlocks vs 384158op/s (33x
faster), where the difference in throughput between the fastest and slowest
thread goes from 7x to 1.4x.

Thanks to the fast path being identical in terms of atomics and barriers
(after a subsequent optimisation patch), single threaded performance is not
changed (no measurable difference).

On smaller systems, performance and fairness seems to be generally improved.
Using dbench on tmpfs as a test (that starts to run into kernel spinlock
contention), a 2-socket OpenPOWER POWER9 system was tested with bare metal
and KVM guest configurations. Results can be found here:

https://github.com/linuxppc/issues/issues/305#issuecomment-663487453

Observations are:

- Queued spinlocks are equal when contention is insignificant, as expected
  and as measured with microbenchmarks.

- When there is contention, on bare metal queued spinlocks have better
  throughput and max latency at all points.

- When virtualised, queued spinlocks are slightly worse approaching peak
  throughput, but significantly better throughput and max latency at all
  points beyond peak, until queued spinlock maximum latency rises when
  clients are 2x vCPUs.

The regressions haven't been analysed very well yet, there are a lot of
things that can be tuned, particularly the paravirtualised locking, but the
numbers already look like a good net win even on relatively small systems.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                      | 15 ++++++++++++++
 arch/powerpc/include/asm/Kbuild           |  1 +
 arch/powerpc/include/asm/qspinlock.h      | 25 +++++++++++++++++++++++
 arch/powerpc/include/asm/spinlock.h       |  5 +++++
 arch/powerpc/include/asm/spinlock_types.h |  5 +++++
 arch/powerpc/lib/Makefile                 |  3 +++
 include/asm-generic/qspinlock.h           |  2 ++
 7 files changed, 56 insertions(+)
 create mode 100644 arch/powerpc/include/asm/qspinlock.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..641946052d67 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -145,6 +145,8 @@ config PPC
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
+	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
@@ -490,6 +492,19 @@ config HOTPLUG_CPU
 
 	  Say N if you are unsure.
 
+config PPC_QUEUED_SPINLOCKS
+	bool "Queued spinlocks"
+	depends on SMP
+	help
+	  Say Y here to use to use queued spinlocks which give better
+	  scalability and fairness on large SMP and NUMA systems without
+	  harming single threaded performance.
+
+	  This option is currently experimental, the code is more complex
+	  and less tested so it defaults to "N" for the moment.
+
+	  If unsure, say "N".
+
 config ARCH_CPU_PROBE_RELEASE
 	def_bool y
 	depends on HOTPLUG_CPU
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index dadbcf3a0b1e..27c2268dfd6c 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -6,5 +6,6 @@ generated-y += syscall_table_spu.h
 generic-y += export.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
+generic-y += qrwlock.h
 generic-y += vtime.h
 generic-y += early_ioremap.h
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
new file mode 100644
index 000000000000..c49e33e24edd
--- /dev/null
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_QSPINLOCK_H
+#define _ASM_POWERPC_QSPINLOCK_H
+
+#include <asm-generic/qspinlock_types.h>
+
+#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
+
+#define smp_mb__after_spinlock()   smp_mb()
+
+static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
+{
+	/*
+	 * This barrier was added to simple spinlocks by commit 51d7d5205d338,
+	 * but it should now be possible to remove it, asm arm64 has done with
+	 * commit c6f5d02b6a0f.
+	 */
+	smp_mb();
+	return atomic_read(&lock->val);
+}
+#define queued_spin_is_locked queued_spin_is_locked
+
+#include <asm-generic/qspinlock.h>
+
+#endif /* _ASM_POWERPC_QSPINLOCK_H */
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 21357fe05fe0..434615f1d761 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -3,7 +3,12 @@
 #define __ASM_SPINLOCK_H
 #ifdef __KERNEL__
 
+#ifdef CONFIG_PPC_QUEUED_SPINLOCKS
+#include <asm/qspinlock.h>
+#include <asm/qrwlock.h>
+#else
 #include <asm/simple_spinlock.h>
+#endif
 
 #endif /* __KERNEL__ */
 #endif /* __ASM_SPINLOCK_H */
diff --git a/arch/powerpc/include/asm/spinlock_types.h b/arch/powerpc/include/asm/spinlock_types.h
index 3906f52dae65..c5d742f18021 100644
--- a/arch/powerpc/include/asm/spinlock_types.h
+++ b/arch/powerpc/include/asm/spinlock_types.h
@@ -6,6 +6,11 @@
 # error "please don't include this file directly"
 #endif
 
+#ifdef CONFIG_PPC_QUEUED_SPINLOCKS
+#include <asm-generic/qspinlock_types.h>
+#include <asm-generic/qrwlock_types.h>
+#else
 #include <asm/simple_spinlock_types.h>
+#endif
 
 #endif
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 5e994cda8e40..d66a645503eb 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -41,7 +41,10 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o memcpy_mcsafe_64.o
 
+ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 obj64-$(CONFIG_SMP)	+= locks.o
+endif
+
 obj64-$(CONFIG_ALTIVEC)	+= vmx-helper.o
 obj64-$(CONFIG_KPROBES_SANITY_TEST)	+= test_emulate_step.o \
 					   test_emulate_step_exec_instr.o
diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index fde943d180e0..fb0a814d4395 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -12,6 +12,7 @@
 
 #include <asm-generic/qspinlock_types.h>
 
+#ifndef queued_spin_is_locked
 /**
  * queued_spin_is_locked - is the spinlock locked?
  * @lock: Pointer to queued spinlock structure
@@ -25,6 +26,7 @@ static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 	 */
 	return atomic_read(&lock->val);
 }
+#endif
 
 /**
  * queued_spin_value_unlocked - is the spinlock structure unlocked?
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54346211DAF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:02:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9Y36HHMzDqL0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 18:01:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G6pnBvOV; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9GT4D9jzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:49:21 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b16so12159378pfi.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQD911N1OirjA6dQWnorGvys5+1kn+3MUQKX5XOw8zE=;
 b=G6pnBvOVHdWam68jActENnVnHw3vwiygfcyv1fzpJYKUMAKwJol+9WclROicfZfAj5
 U4hPsVPtNHrwTdu0U7lHNtsQu0EQYvVRBLH8YD/4lyGfy2Fe41+7LZHx7p0Rlz2FGJ5U
 dRhD29upezXn1llhh5uERPtFLxrZO6hi3qY6AhTwaIEP+UpWJ7u2n/NfIfUUkLAOK4Mw
 GFQivb1+EAh1uQdcN0hIdeoH5V7pvyzY9ue4NXkAIEbnojh6Y0aaAD7jkOyyxVfZWfIC
 t9ZgiwpSnfFi7B2mdHeABGM6Z5yLP3N+5tfPJ4XEUSH26lxUgAmAHHeRAWs7GpHEQdYy
 amrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQD911N1OirjA6dQWnorGvys5+1kn+3MUQKX5XOw8zE=;
 b=G3rlkLwzuo2MGwejngBDcn343lfXYHBUZDw9xcaEIIlrSMQzpYfHMkoMEmZUT6hG8i
 TwTR4OnzlDxT4+nadb7Mo3AIkjAWVNIHYbfbrhOSrgvWDs+YmoFx0Tw2swEJoxqZn6qN
 G9kibFq/NwhOhBI86+Q/uaNK5uYyhpjUMJec12zrwa7nWZ5MPw1GpCBqLRXxiHSCa08n
 Q20kohsYHbMDmKSb2JC4Oy+MeuM9F6gtS5+2vZ2ZSWO9dYWFlPxLfqLbD8wQ2wQ8Jefx
 SUp0+WlpDIaWi5/6sSJenw2y+JKrWx/v6R81ZtEFE+LD1LtRrkdrL+L0RL8uCs45fX4n
 bcPg==
X-Gm-Message-State: AOAM530X658ZMMMPlH8yGnfiNLgmPttYWzOY8NOJ8Rzm3oAWnlMUG7cb
 q5/JsAluYTOg6g7uxy/EagI=
X-Google-Smtp-Source: ABdhPJwk332+lHS3BBrZ6qIQL0gRTtBCD7Sux5ILRg4+f+M5YN36mn7IqydqIQj2tH8ktyacmzXeug==
X-Received: by 2002:a05:6a00:1346:: with SMTP id
 k6mr11368466pfu.116.1593676159569; 
 Thu, 02 Jul 2020 00:49:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
Date: Thu,  2 Jul 2020 17:48:36 +1000
Message-Id: <20200702074839.1057733-6-npiggin@gmail.com>
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

These have shown significantly improved performance and fairness when
spinlock contention is moderate to high on very large systems.

 [ Numbers hopefully forthcoming after more testing, but initial
   results look good ]

Thanks to the fast path, single threaded performance is not noticably
hurt.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                      | 13 +++++++++++++
 arch/powerpc/include/asm/Kbuild           |  2 ++
 arch/powerpc/include/asm/qspinlock.h      | 20 ++++++++++++++++++++
 arch/powerpc/include/asm/spinlock.h       |  5 +++++
 arch/powerpc/include/asm/spinlock_types.h |  5 +++++
 arch/powerpc/lib/Makefile                 |  3 +++
 include/asm-generic/qspinlock.h           |  2 ++
 7 files changed, 50 insertions(+)
 create mode 100644 arch/powerpc/include/asm/qspinlock.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..b17575109876 100644
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
@@ -490,6 +492,17 @@ config HOTPLUG_CPU
 
 	  Say N if you are unsure.
 
+config PPC_QUEUED_SPINLOCKS
+	bool "Queued spinlocks"
+	depends on SMP
+	default "y" if PPC_BOOK3S_64
+	help
+	  Say Y here to use to use queued spinlocks which are more complex
+	  but give better salability and fairness on large SMP and NUMA
+	  systems.
+
+	  If unsure, say "Y" if you have lots of cores, otherwise "N".
+
 config ARCH_CPU_PROBE_RELEASE
 	def_bool y
 	depends on HOTPLUG_CPU
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index dadbcf3a0b1e..1dd8b6adff5e 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -6,5 +6,7 @@ generated-y += syscall_table_spu.h
 generic-y += export.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
+generic-y += qrwlock.h
+generic-y += qspinlock.h
 generic-y += vtime.h
 generic-y += early_ioremap.h
diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
new file mode 100644
index 000000000000..f84da77b6bb7
--- /dev/null
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -0,0 +1,20 @@
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


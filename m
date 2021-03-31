Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE7350256
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9TM25TXWz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cW2e8TK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cW2e8TK/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TKn5PNYz3byd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:32:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 714AF60FF3;
 Wed, 31 Mar 2021 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201131;
 bh=1nsbIPHoYnp+y4hhU/ERIAox7V175+dXhzkr9rkZCgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cW2e8TK/MVdFBPif56BK0z+HaiRyKiplVLsKPXZhc9cKMUoNS8THGYKAIdPHTdLPI
 VqBImBnGowMYxlacVGWlXCBvo5toHf6RttaKq5Gf/nV1Qx1TYuEnnNoWs3wWvyd9Xt
 wCLPwjmQWHGAhfCL7RGY6EMyqnIs//JUSG6UQ4dQT9zbKIO6D0YYqqyc2+KeAiKq7y
 opQ4Tf9BJxIbW0LZ54ZcP5KKy8yCmY+XClnU+dvMp8exURVpqAUL3TkxZ0hN674Myl
 Gd/5gyC8+LdG6hmlXseJDVkvkjvzURTJBCe3fY+B5pcta+OW+EV5FfVNBCwzwYe9ex
 YjoHB5tQnrqDA==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH v6 3/9] riscv: locks: Introduce ticket-based spinlock
 implementation
Date: Wed, 31 Mar 2021 14:30:34 +0000
Message-Id: <1617201040-83905-4-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

This patch introduces a ticket lock implementation for riscv, along the
same lines as the implementation for arch/arm & arch/csky.

We still use qspinlock as default.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig                      |  7 ++-
 arch/riscv/include/asm/spinlock.h       | 84 +++++++++++++++++++++++++
 arch/riscv/include/asm/spinlock_types.h | 17 +++++
 3 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 67cc65ba1ea1..34d0276f01d5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,7 +34,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_USE_QUEUED_RWLOCKS
-	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS	if !RISCV_TICKET_LOCK
 	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
@@ -344,6 +344,11 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
 	def_bool y
 	depends on NUMA
 
+config RISCV_TICKET_LOCK
+	bool "Ticket-based spin-locking"
+	help
+	  Say Y here to use ticket-based spin-locking.
+
 config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index a557de67a425..90b7eaa950cf 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -7,7 +7,91 @@
 #ifndef _ASM_RISCV_SPINLOCK_H
 #define _ASM_RISCV_SPINLOCK_H
 
+#ifdef CONFIG_RISCV_TICKET_LOCK
+#ifdef CONFIG_32BIT
+#define __ASM_SLLIW "slli\t"
+#define __ASM_SRLIW "srli\t"
+#else
+#define __ASM_SLLIW "slliw\t"
+#define __ASM_SRLIW "srliw\t"
+#endif
+
+/*
+ * Ticket-based spin-locking.
+ */
+static inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	arch_spinlock_t lockval;
+	u32 tmp;
+
+	asm volatile (
+		"1:	lr.w	%0, %2		\n"
+		"	mv	%1, %0		\n"
+		"	addw	%0, %0, %3	\n"
+		"	sc.w	%0, %0, %2	\n"
+		"	bnez	%0, 1b		\n"
+		: "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
+		: "r" (1 << TICKET_NEXT)
+		: "memory");
+
+	smp_cond_load_acquire(&lock->tickets.owner,
+					VAL == lockval.tickets.next);
+}
+
+static inline int arch_spin_trylock(arch_spinlock_t *lock)
+{
+	u32 tmp, contended, res;
+
+	do {
+		asm volatile (
+		"	lr.w	%0, %3		\n"
+		__ASM_SRLIW    "%1, %0, %5	\n"
+		__ASM_SLLIW    "%2, %0, %5	\n"
+		"	or	%1, %2, %1	\n"
+		"	li	%2, 0		\n"
+		"	sub	%1, %1, %0	\n"
+		"	bnez	%1, 1f		\n"
+		"	addw	%0, %0, %4	\n"
+		"	sc.w	%2, %0, %3	\n"
+		"1:				\n"
+		: "=&r" (tmp), "=&r" (contended), "=&r" (res),
+		  "+A" (lock->lock)
+		: "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
+		: "memory");
+	} while (res);
+
+	if (!contended)
+		__atomic_acquire_fence();
+
+	return !contended;
+}
+
+static inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
+}
+
+static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	return lock.tickets.owner == lock.tickets.next;
+}
+
+static inline int arch_spin_is_locked(arch_spinlock_t *lock)
+{
+	return !arch_spin_value_unlocked(READ_ONCE(*lock));
+}
+
+static inline int arch_spin_is_contended(arch_spinlock_t *lock)
+{
+	struct __raw_tickets tickets = READ_ONCE(lock->tickets);
+
+	return (tickets.next - tickets.owner) > 1;
+}
+#define arch_spin_is_contended	arch_spin_is_contended
+#else /* CONFIG_RISCV_TICKET_LOCK */
 #include <asm/qspinlock.h>
+#endif /* CONFIG_RISCV_TICKET_LOCK */
+
 #include <asm/qrwlock.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_H */
diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
index d033a973f287..afbb19841d0f 100644
--- a/arch/riscv/include/asm/spinlock_types.h
+++ b/arch/riscv/include/asm/spinlock_types.h
@@ -10,7 +10,24 @@
 # error "please don't include this file directly"
 #endif
 
+#ifdef CONFIG_RISCV_TICKET_LOCK
+#define TICKET_NEXT	16
+
+typedef struct {
+	union {
+		u32 lock;
+		struct __raw_tickets {
+			/* little endian */
+			u16 owner;
+			u16 next;
+		} tickets;
+	};
+} arch_spinlock_t;
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
+#else
 #include <asm-generic/qspinlock_types.h>
+#endif
 #include <asm-generic/qrwlock_types.h>
 
 #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
-- 
2.17.1


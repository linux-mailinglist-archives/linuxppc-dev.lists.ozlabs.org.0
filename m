Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB495211DC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:08:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9hv5gRMzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 18:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pZqhzDJK; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9Gm5TSJzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:49:36 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bf7so1663125plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UHbhQFEdFPJ2RYno/xIf1h+jNRhusa+eWEK6fGK5jM=;
 b=pZqhzDJKFXLW28kF6+0/00P3hNnIiZSIjop2A3REoKDLEAcF4CwFSv6pffel8OHXVK
 Xa3JgTrUiSN6YIWcOq3o/bF37Nu2jl7qbzTdBIuatB3ChEhwVxwiWFU+jI++1se9tF6k
 1AmN2R6JrOAsAFYoQtIEDuXOeldeugtU5t6eo91iY90vvuH6caRhFJCjNJdsrGw7laqr
 6UR9WyhWbQseiUJ74YiMxfHgWln2OWAdZDi/G7+H56nSqIOCP0Ka4D82SCVutzUvgLdH
 8qg/bq3otY3SZWPbQTG1OFUJcv6zOGPqMhOcBG5M8qSDs9OtW+weAlyhMNvfzy9kCrX9
 Bq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UHbhQFEdFPJ2RYno/xIf1h+jNRhusa+eWEK6fGK5jM=;
 b=fgiaiROBCnewDXqeqh7vSYTees9z+O2pbRkBGEXa+y+c7RR8PMXVnOoH+VnworkEZL
 MKjneZUYjIyAKAbPALDslAJA7c0l/mpxnRex5qnAkNjql6Vc5wjUa7JeF7/GO/4XXUBO
 87t3W6CHUaS8qiXLGG/7p5rPEtwIySU1Ag6v3R+p/7vHfGZx34zgW2zjfwmy4eN9jfI/
 UcBEYVVrK/11l87B6WxFnZC/47bPOjZUIduYEeO+6EK+snhACNCp4i3hEkT8LbHf8x0c
 rIpC7CPAxTz1I2TbhauPmkdWLRpOPgsYEL5V+caF8A6aZ1E+lZWuvq9C/o273YPh3HQa
 /+NA==
X-Gm-Message-State: AOAM532xx2FAklD1twRyb4tjKqkcuhs4bz/RLt+HnuHIM1y7JZym+lNl
 t7LO2+mdLEx3hO2pTzu2q1k=
X-Google-Smtp-Source: ABdhPJzo+47v2QY6N1oj7RydZM/DMTPv9/tLJu+97Hhlqb5Qr+YK1gcQR2DRq1JqZJWOsTfT0Dp8Gw==
X-Received: by 2002:a17:90b:3809:: with SMTP id
 mq9mr31112781pjb.156.1593676174796; 
 Thu, 02 Jul 2020 00:49:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 8/8] powerpc/64s: remove paravirt from simple spinlocks (RFC
 only)
Date: Thu,  2 Jul 2020 17:48:39 +1000
Message-Id: <20200702074839.1057733-9-npiggin@gmail.com>
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

RFC until we settle on queued spinlocks for 64s and remove the
option to go back to simple locks. If other sub-archs want to keep
simple spinlocks, the code can be nicely simplified.
---
 arch/powerpc/include/asm/simple_spinlock.h | 61 +-------------------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c        |  6 --
 arch/powerpc/lib/Makefile                  |  4 --
 arch/powerpc/lib/locks.c                   | 65 ----------------------
 4 files changed, 2 insertions(+), 134 deletions(-)
 delete mode 100644 arch/powerpc/lib/locks.c

diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index e048c041c4a9..5f0980dea001 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -16,23 +16,10 @@
  * (the type definitions are in asm/simple_spinlock_types.h)
  */
 #include <linux/irqflags.h>
-#include <asm/paravirt.h>
-#ifdef CONFIG_PPC64
-#include <asm/paca.h>
-#endif
 #include <asm/synch.h>
 #include <asm/ppc-opcode.h>
 
-#ifdef CONFIG_PPC64
-/* use 0x800000yy when locked, where yy == CPU number */
-#ifdef __BIG_ENDIAN__
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
-#else
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->paca_index))
-#endif
-#else
 #define LOCK_TOKEN	1
-#endif
 
 static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 {
@@ -74,43 +61,14 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 	return __arch_spin_trylock(lock) == 0;
 }
 
-/*
- * On a system with shared processors (that is, where a physical
- * processor is multiplexed between several virtual processors),
- * there is no point spinning on a lock if the holder of the lock
- * isn't currently scheduled on a physical processor.  Instead
- * we detect this situation and ask the hypervisor to give the
- * rest of our timeslice to the lock holder.
- *
- * So that we can tell which virtual processor is holding a lock,
- * we put 0x80000000 | smp_processor_id() in the lock when it is
- * held.  Conveniently, we have a word in the paca that holds this
- * value.
- */
-
-#if defined(CONFIG_PPC_SPLPAR)
-/* We only yield to the hypervisor if we are in shared processor mode */
-void splpar_spin_yield(arch_spinlock_t *lock);
-void splpar_rw_yield(arch_rwlock_t *lock);
-#else /* SPLPAR */
-static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
-static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
-#endif
-
 static inline void spin_yield(arch_spinlock_t *lock)
 {
-	if (is_shared_processor())
-		splpar_spin_yield(lock);
-	else
-		barrier();
+	barrier();
 }
 
 static inline void rw_yield(arch_rwlock_t *lock)
 {
-	if (is_shared_processor())
-		splpar_rw_yield(lock);
-	else
-		barrier();
+	barrier();
 }
 
 static inline void arch_spin_lock(arch_spinlock_t *lock)
@@ -120,8 +78,6 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 			break;
 		do {
 			HMT_low();
-			if (is_shared_processor())
-				splpar_spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
 	}
@@ -139,8 +95,6 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
 		local_irq_restore(flags);
 		do {
 			HMT_low();
-			if (is_shared_processor())
-				splpar_spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
 		local_irq_restore(flags_dis);
@@ -166,13 +120,7 @@ static inline void arch_spin_unlock(arch_spinlock_t *lock)
  * read-locks.
  */
 
-#ifdef CONFIG_PPC64
-#define __DO_SIGN_EXTEND	"extsw	%0,%0\n"
-#define WRLOCK_TOKEN		LOCK_TOKEN	/* it's negative */
-#else
-#define __DO_SIGN_EXTEND
 #define WRLOCK_TOKEN		(-1)
-#endif
 
 /*
  * This returns the old value in the lock + 1,
@@ -184,7 +132,6 @@ static inline long __arch_read_trylock(arch_rwlock_t *rw)
 
 	__asm__ __volatile__(
 "1:	" PPC_LWARX(%0,0,%1,1) "\n"
-	__DO_SIGN_EXTEND
 "	addic.		%0,%0,1\n\
 	ble-		2f\n"
 "	stwcx.		%0,0,%1\n\
@@ -227,8 +174,6 @@ static inline void arch_read_lock(arch_rwlock_t *rw)
 			break;
 		do {
 			HMT_low();
-			if (is_shared_processor())
-				splpar_rw_yield(rw);
 		} while (unlikely(rw->lock < 0));
 		HMT_medium();
 	}
@@ -241,8 +186,6 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
 			break;
 		do {
 			HMT_low();
-			if (is_shared_processor())
-				splpar_rw_yield(rw);
 		} while (unlikely(rw->lock != 0));
 		HMT_medium();
 	}
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 88da2764c1bb..909025083161 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -410,12 +410,6 @@ long kvmppc_h_enter(struct kvm_vcpu *vcpu, unsigned long flags,
 				 &vcpu->arch.regs.gpr[4]);
 }
 
-#ifdef __BIG_ENDIAN__
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->lock_token))
-#else
-#define LOCK_TOKEN	(*(u32 *)(&get_paca()->paca_index))
-#endif
-
 static inline int is_mmio_hpte(unsigned long v, unsigned long r)
 {
 	return ((v & HPTE_V_ABSENT) &&
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index d66a645503eb..158e71abc14c 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -41,10 +41,6 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o memcpy_mcsafe_64.o
 
-ifndef CONFIG_PPC_QUEUED_SPINLOCKS
-obj64-$(CONFIG_SMP)	+= locks.o
-endif
-
 obj64-$(CONFIG_ALTIVEC)	+= vmx-helper.o
 obj64-$(CONFIG_KPROBES_SANITY_TEST)	+= test_emulate_step.o \
 					   test_emulate_step_exec_instr.o
diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
deleted file mode 100644
index e35fd1a16992..000000000000
--- a/arch/powerpc/lib/locks.c
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Spin and read/write lock operations.
- *
- * Copyright (C) 2001-2004 Paul Mackerras <paulus@au.ibm.com>, IBM
- * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
- * Copyright (C) 2002 Dave Engebretsen <engebret@us.ibm.com>, IBM
- *   Rework to support virtual processors
- */
-
-#include <linux/kernel.h>
-#include <linux/spinlock.h>
-#include <linux/export.h>
-#include <linux/smp.h>
-
-/* waiting for a spinlock... */
-#if defined(CONFIG_PPC_SPLPAR)
-#include <asm/hvcall.h>
-#include <asm/smp.h>
-
-void splpar_spin_yield(arch_spinlock_t *lock)
-{
-	unsigned int lock_value, holder_cpu, yield_count;
-
-	lock_value = lock->slock;
-	if (lock_value == 0)
-		return;
-	holder_cpu = lock_value & 0xffff;
-	BUG_ON(holder_cpu >= NR_CPUS);
-
-	yield_count = yield_count_of(holder_cpu);
-	if ((yield_count & 1) == 0)
-		return;		/* virtual cpu is currently running */
-	smp_rmb();
-	if (lock->slock != lock_value)
-		return;		/* something has changed */
-	yield_to_preempted(holder_cpu, yield_count);
-}
-EXPORT_SYMBOL_GPL(splpar_spin_yield);
-
-/*
- * Waiting for a read lock or a write lock on a rwlock...
- * This turns out to be the same for read and write locks, since
- * we only know the holder if it is write-locked.
- */
-void splpar_rw_yield(arch_rwlock_t *rw)
-{
-	int lock_value;
-	unsigned int holder_cpu, yield_count;
-
-	lock_value = rw->lock;
-	if (lock_value >= 0)
-		return;		/* no write lock at present */
-	holder_cpu = lock_value & 0xffff;
-	BUG_ON(holder_cpu >= NR_CPUS);
-
-	yield_count = yield_count_of(holder_cpu);
-	if ((yield_count & 1) == 0)
-		return;		/* virtual cpu is currently running */
-	smp_rmb();
-	if (rw->lock != lock_value)
-		return;		/* something has changed */
-	yield_to_preempted(holder_cpu, yield_count);
-}
-#endif
-- 
2.23.0


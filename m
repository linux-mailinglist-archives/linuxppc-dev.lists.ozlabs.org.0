Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7E331CB6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 03:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvdjD5vNZz3dPT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:01:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvdh90Rd3z30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 13:00:09 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1F3AAC8C;
 Tue,  9 Mar 2021 02:00:06 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: npiggin@gmail.com
Subject: [PATCH 2/3] powerpc/spinlock: Unserialize spin_is_locked
Date: Mon,  8 Mar 2021 17:59:49 -0800
Message-Id: <20210309015950.27688-3-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309015950.27688-1-dave@stgolabs.net>
References: <20210309015950.27688-1-dave@stgolabs.net>
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
Cc: parri.andrea@gmail.com, dave@stgolabs.net, Davidlohr Bueso <dbueso@suse.de>,
 peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 longman@redhat.com, pabeni@redhat.com, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

c6f5d02b6a0f (locking/spinlocks/arm64: Remove smp_mb() from
arch_spin_is_locked()) made it pretty official that the call
semantics do not imply any sort of barriers, and any user that
gets creative must explicitly do any serialization.

This creativity, however, is nowadays pretty limited:

1. spin_unlock_wait() has been removed from the kernel in favor
of a lock/unlock combo. Furthermore, queued spinlocks have now
for a number of years no longer relied on _Q_LOCKED_VAL for the
call, but any non-zero value to indicate a locked state. There
were cases where the delayed locked store could lead to breaking
mutual exclusion with crossed locking; such as with sysv ipc and
netfilter being the most extreme.

2. The auditing Andrea did in verified that remaining spin_is_locked()
no longer rely on such semantics. Most callers just use it to assert
a lock is taken, in a debug nature. The only user that gets cute is
NOLOCK qdisc, as of:

   96009c7d500e (sched: replace __QDISC_STATE_RUNNING bit with a spin lock)

... which ironically went in the next day after c6f5d02b6a0f. This
change replaces test_bit() with spin_is_locked() to know whether
to take the busylock heuristic to reduce contention on the main
qdisc lock. So any races against spin_is_locked() for archs that
use LL/SC for spin_lock() will be benign and not break any mutual
exclusion; furthermore, both the seqlock and busylock have the same
scope.

Cc: parri.andrea@gmail.com
Cc: pabeni@redhat.com
Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/powerpc/include/asm/qspinlock.h       | 12 ------------
 arch/powerpc/include/asm/simple_spinlock.h |  3 +--
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 3ce1a0bee4fe..b052b0624816 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -44,18 +44,6 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 }
 #define queued_spin_lock queued_spin_lock
 
-static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
-{
-	/*
-	 * This barrier was added to simple spinlocks by commit 51d7d5205d338,
-	 * but it should now be possible to remove it, asm arm64 has done with
-	 * commit c6f5d02b6a0f.
-	 */
-	smp_mb();
-	return atomic_read(&lock->val);
-}
-#define queued_spin_is_locked queued_spin_is_locked
-
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 #define SPIN_THRESHOLD (1<<15) /* not tuned */
 
diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index 3e87258f73b1..1b935396522a 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -38,8 +38,7 @@ static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
 
 static inline int arch_spin_is_locked(arch_spinlock_t *lock)
 {
-	smp_mb();
-	return !arch_spin_value_unlocked(*lock);
+	return !arch_spin_value_unlocked(READ_ONCE(*lock));
 }
 
 /*
-- 
2.26.2


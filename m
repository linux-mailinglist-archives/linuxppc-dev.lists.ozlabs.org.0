Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB6227E79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 13:12:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9wt402zlzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 21:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FqYmz9UB; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9wp32JC4zDq72
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:08:58 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id z2so20828515wrp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XunMdMvkWzPxzceSO8589OZZNxbcZ0jXERe3FDXc4Go=;
 b=FqYmz9UBE4PDn0hc2i03AxdNbgdQuWC26CHX+LTmpFPMyc3D5Tdwionxj0V9wAv1rX
 5R1AZXE6ZKQqXTLvZE9IUPRBZDoLgY1Is9uxLpNFrqG6R8tVYU0s+m9hm6WfNPpZF0BI
 dp3WqItm2fG6M+4OcZjfj2YSlRy0vbZlt418Pt2xXWP5O8D85Gc4xtIQPlRvlCu0o7nB
 v7b5+223qylm20s3dIAnXRQ7ZuLzJgZU0zGf8k3rVd13tB0HUxwPPSd6CpLqkBOjwI/L
 6IkkN4GJGEdPfpBjb4gnmkC4tHt3tPOlup3nvOf2M/0yA1pX0lRqrPCd6mt8s4ZARSdu
 KZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XunMdMvkWzPxzceSO8589OZZNxbcZ0jXERe3FDXc4Go=;
 b=oUNl1CVh1KcTYZBaRwzuGHrTyzz+Y1Wtc3uC0wgs6LtO3GWzPKpUNhRv8a/z0nuf25
 Ku1NFUTf7hCCSXfjWGY5uXj5mhgtm15iXa+NdvuHvwEgoNXhKSun0DtTiQPIVrKh0Ytt
 1A4V0mLJr8FDHtwdA3Q9ALWDog63k7+30rhiXv6+BOz37ezAo8IG8EI5FgCCO3TO3ZAx
 /PHPI4iWgiDj/A3lx7OLM4xHt0qNrN9AsSiiDCjzrcpvej0V7tcGKuH2O2gJ3c1ulG/T
 KeBPnMZu1XDOqGZR3PJOsfercd6HXZx2Lt3S/tsFxEp89LEMoMMw9z/eAeybHr5cwVZD
 o4ww==
X-Gm-Message-State: AOAM5304EwWb6xRUne//KhoUgkIbGiA7Cq95J3R+9nqPurcHN4Qy2n2A
 GIutsw5tH43zpgBY4d4VkFo=
X-Google-Smtp-Source: ABdhPJxb6Obroh8Tbl1JjXl1VQrrbHCwwmkBeiHvK1odJZa3Wx4Vfqy2xFxD9h9aE7o5NRR8+xd/Fw==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr25848278wrq.184.1595329734966; 
 Tue, 21 Jul 2020 04:08:54 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id k131sm3138401wmb.36.2020.07.21.04.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 04:08:54 -0700 (PDT)
Date: Tue, 21 Jul 2020 21:08:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
In-Reply-To: <20200708084106.GE597537@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1595327263.lk78cqolxm.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of July 8, 2020 6:41 pm:
> On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
>> Yes, powerpc could certainly get more performance out of the slow
>> paths, and then there are a few parameters to tune.
>=20

Sorry for the delay, got bogged down and distracted by other things :(

> Can you clarify? The slow path is already in use on ARM64 which is weak,
> so I doubt there's superfluous serialization present. And Will spend a
> fair amount of time on making that thing guarantee forward progressm, so
> there just isn't too much room to play.

Sure, the way the pending not-queued slowpath (which I guess is the
medium-path) is implemented is just poorly structured for LL/SC. It
has one more atomic than necessary (queued_fetch_set_pending_acquire),
and a lot of branches in suboptimal order.

Attached patch (completely untested just compiled and looked at asm
so far) is a way we can fix this on powerpc I think. It's actually
very little generic code change which is good, duplicated medium-path
logic unfortunately but that's no worse than something like x86
really.

>> We don't have a good alternate patching for function calls yet, but
>> that would be something to do for native vs pv.
>=20
> Going by your jump_label implementation, support for static_call should
> be fairly straight forward too, no?
>=20
>   https://lkml.kernel.org/r/20200624153024.794671356@infradead.org

Nice, yeah it should be. I've wanted this for ages!

powerpc is kind of annoying to implement that with limited call range,
Hmm, not sure if we'd need a new linker feature to support it. We'd
provide call site patch space for indirect branches for those out of
range of direct call, so that should work fine. The trick would be=20
patching in the TOC lookup for the function... should be doable somehow.

Thanks,
Nick

---

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/as=
m/qspinlock.h
index b752d34517b3..26d8766a1106 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -31,16 +31,57 @@ static inline void queued_spin_unlock(struct qspinlock =
*lock)
=20
 #else
 extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+extern void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
 #endif
=20
 static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
-	u32 val =3D 0;
-
-	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
+	atomic_t *a =3D &lock->val;
+	u32 val;
+
+again:
+	asm volatile(
+"1:\t"	PPC_LWARX(%0,0,%1,1) "	# queued_spin_lock			\n"
+	: "=3D&r" (val)
+	: "r" (&a->counter)
+	: "memory");
+
+	if (likely(val =3D=3D 0)) {
+		asm_volatile_goto(
+	"	stwcx.	%0,0,%1							\n"
+	"	bne-	%l[again]						\n"
+	"\t"	PPC_ACQUIRE_BARRIER "						\n"
+		:
+		: "r"(_Q_LOCKED_VAL), "r" (&a->counter)
+		: "cr0", "memory"
+		: again );
 		return;
-
-	queued_spin_lock_slowpath(lock, val);
+	}
+
+	if (likely(val =3D=3D _Q_LOCKED_VAL)) {
+		asm_volatile_goto(
+	"	stwcx.	%0,0,%1							\n"
+	"	bne-	%l[again]						\n"
+		:
+		: "r"(_Q_LOCKED_VAL | _Q_PENDING_VAL), "r" (&a->counter)
+		: "cr0", "memory"
+		: again );
+
+		atomic_cond_read_acquire(a, !(VAL & _Q_LOCKED_MASK));
+//		clear_pending_set_locked(lock);
+		WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
+//		lockevent_inc(lock_pending);
+		return;
+	}
+
+	if (val =3D=3D _Q_PENDING_VAL) {
+		int cnt =3D _Q_PENDING_LOOPS;
+		val =3D atomic_cond_read_relaxed(a,
+					       (VAL !=3D _Q_PENDING_VAL) || !cnt--);
+		if (!(val & ~_Q_LOCKED_MASK))
+			goto again;
+        }
+	queued_spin_lock_slowpath_queue(lock);
 }
 #define queued_spin_lock queued_spin_lock
=20
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index b9515fcc9b29..ebcc6f5d99d5 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -287,10 +287,14 @@ static __always_inline u32  __pv_wait_head_or_lock(st=
ruct qspinlock *lock,
=20
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
+#define queued_spin_lock_slowpath_queue	native_queued_spin_lock_slowpath_q=
ueue
 #endif
=20
 #endif /* _GEN_PV_LOCK_SLOWPATH */
=20
+void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
+static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock);
+
 /**
  * queued_spin_lock_slowpath - acquire the queued spinlock
  * @lock: Pointer to queued spinlock structure
@@ -314,12 +318,6 @@ static __always_inline u32  __pv_wait_head_or_lock(str=
uct qspinlock *lock,
  */
 void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
 {
-	struct mcs_spinlock *prev, *next, *node;
-	u32 old, tail;
-	int idx;
-
-	BUILD_BUG_ON(CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS));
-
 	if (pv_enabled())
 		goto pv_queue;
=20
@@ -397,6 +395,26 @@ void queued_spin_lock_slowpath(struct qspinlock *lock,=
 u32 val)
 queue:
 	lockevent_inc(lock_slowpath);
 pv_queue:
+	__queued_spin_lock_slowpath_queue(lock);
+}
+EXPORT_SYMBOL(queued_spin_lock_slowpath);
+
+void queued_spin_lock_slowpath_queue(struct qspinlock *lock)
+{
+	lockevent_inc(lock_slowpath);
+	__queued_spin_lock_slowpath_queue(lock);
+}
+EXPORT_SYMBOL(queued_spin_lock_slowpath_queue);
+
+static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock)
+{
+	struct mcs_spinlock *prev, *next, *node;
+	u32 old, tail;
+	u32 val;
+	int idx;
+
+	BUILD_BUG_ON(CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS));
+
 	node =3D this_cpu_ptr(&qnodes[0].mcs);
 	idx =3D node->count++;
 	tail =3D encode_tail(smp_processor_id(), idx);
@@ -559,7 +577,6 @@ void queued_spin_lock_slowpath(struct qspinlock *lock, =
u32 val)
 	 */
 	__this_cpu_dec(qnodes[0].mcs.count);
 }
-EXPORT_SYMBOL(queued_spin_lock_slowpath);
=20
 /*
  * Generate the paravirt code for queued_spin_unlock_slowpath().

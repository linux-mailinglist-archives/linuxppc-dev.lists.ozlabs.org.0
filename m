Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA16284C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:14:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vWd0DzVz3f56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:14:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wu+hoYCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wu+hoYCT;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vSq3YDbz3cKq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:11:39 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id b185so11410465pfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 08:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZoC8j/PDFEvbBag+O0cH2CpPqg5IP+JIm/6F1DBzfo=;
        b=Wu+hoYCT48OktT5yGr4oHazRXw9QkrOgEII0Eg8/aVYCtJMCHxSFQbI6rBZqfP7Pnq
         Q0Y1rzlhLr+6rvKevnoDxD741vtu3jwGm9IZUOLlPbUyNSMc5wd7pxUi8ID6yE/h4NDE
         /AMc+hj58WQV/eyW+Vp/3R0zXk0l7KaJCdjR+kvDT4jWvkip4k49kFoCgLacm0U2260P
         n3rZUFy5mKOm6UF0Yqn3nrQ9RmouTj6YVR4Q1wyFRicxfhLcjZcou6YYYacW0ASYngcE
         lAeTu7HsH9B8Xsj46wrKlDehnHTslzobMXMZvR9iKiE14ofbzn+3KIrd3i011sUtduL9
         8NYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZoC8j/PDFEvbBag+O0cH2CpPqg5IP+JIm/6F1DBzfo=;
        b=epYj8FytV0FengnjCsGbIm3d3E2C0mEwZjsrFHeJXnwulLWUzrgvPg3cp3Sk0timIZ
         Cy132+Usad41g3uBjIGMePY44MWpAeTGdyWU48weJgSMM8evkjE7PuftIXsu/LjSryRK
         YUqzeuGqfAK6dpd0zKWFQxWbz/lP51YUpnLXXDUaLA6PjeQE1xsdnjfpsZpfgQEcLmu1
         LGF7U5H1ChX5FzvAOjvv+d28ATVZa0/VaqemnvoB1qdAbsmZmo0JH2KiD0YStXEtF1Hs
         CSong9gmwHuCLozp0Z5WOggad8GXy4KovjzW+6d27IqCcHnsHMqKXyuraNSThlyvEG5E
         YI5A==
X-Gm-Message-State: ANoB5plDWiPG6VfussiWSq2V0RqGBvCJLqJ7aRwqyoF4WDNG1yeQ/ygS
	h6j856khnUpzvKPGb4k2pYhqba4L0PRNLw==
X-Google-Smtp-Source: AA0mqf77Dhnqpf3IlgMJkfKHpwalMNU4yyJdMX+CdFzH34xCgKJGl5FcvpXZbQaVa+zY3dj4QqpYew==
X-Received: by 2002:a05:6a00:3022:b0:560:e4d1:8df5 with SMTP id ay34-20020a056a00302200b00560e4d18df5mr14753405pfb.39.1668442296803;
        Mon, 14 Nov 2022 08:11:36 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-22-7.tpgi.com.au. [27.32.22.7])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b00186e2b3e12fsm7635883pld.261.2022.11.14.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:11:35 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/4] powerpc/qspinlock: Avoid cmpxchg style patterns in queue head locking
Date: Tue, 15 Nov 2022 02:11:17 +1000
Message-Id: <20221114161119.2883620-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114161119.2883620-1-npiggin@gmail.com>
References: <20221114161119.2883620-1-npiggin@gmail.com>
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

Locking by the MCS queue head must clear the tail CPU if there are
no more queue entries left, and it has to deal with concurrent lock
stealing. Implementing these with cmpxchg style updates leaves the
possibility for unnecessary failure when the lock word changes.

Implement this instead within one larx/stcx. critical section that
tests the value and takes the appropriate action: bail out if
it was locked, otherwise lock and clear the tail if we are the tail,
else lock and leave the tail.

With this primitive, there is no longer a significant reason to keep
the large !maybe_stealers special case, so remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 92 ++++++++++++------------------------
 1 file changed, 29 insertions(+), 63 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index ff718f27cbc9..79793b3209ea 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -104,62 +104,36 @@ static inline int get_owner_cpu(u32 val)
 	return (val & _Q_OWNER_CPU_MASK) >> _Q_OWNER_CPU_OFFSET;
 }
 
-/* Take the lock by setting the lock bit, no other CPUs will touch it. */
-static __always_inline void set_locked(struct qspinlock *lock)
+static __always_inline u32 trylock_clear_my_tail(struct qspinlock *lock, u32 mytail)
 {
-	u32 new = queued_spin_encode_locked_val();
+	u32 newval = queued_spin_encode_locked_val();
 	u32 prev, tmp;
 
 	asm volatile(
-"1:	lwarx	%0,0,%2,%4	# set_locked				\n"
-"	or	%1,%0,%3						\n"
-"	stwcx.	%1,0,%2							\n"
+"1:	lwarx	%0,0,%2,%7	# trylock_clear_my_tail			\n"
+	/* This test is necessary if there could be stealers */
+"	andi.	%1,%0,%5						\n"
+"	bne	3f							\n"
+	/* Test whether the lock tail == mytail */
+"	and	%1,%0,%6						\n"
+"	cmpw	0,%1,%3							\n"
+	/* Merge the new locked value */
+"	or	%1,%1,%4						\n"
+"	bne	2f							\n"
+	/* If the lock tail matched, then clear it, otherwise leave it. */
+"	andc	%1,%1,%6						\n"
+"2:	stwcx.	%1,0,%2							\n"
 "	bne-	1b							\n"
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
+"3:									\n"
 	: "=&r" (prev), "=&r" (tmp)
-	: "r" (&lock->val), "r" (new),
+	: "r" (&lock->val), "r"(mytail), "r" (newval),
+	  "i" (_Q_LOCKED_VAL),
+	  "r" (_Q_TAIL_CPU_MASK),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
-	BUG_ON(prev & _Q_LOCKED_VAL);
-}
-
-static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u32 new)
-{
-	u32 prev;
-
-	BUG_ON(old & _Q_LOCKED_VAL);
-
-	asm volatile(
-"1:	lwarx	%0,0,%1,%4	# __trylock_cmpxchg			\n"
-"	cmpw	0,%0,%2							\n"
-"	bne-	2f							\n"
-"	stwcx.	%3,0,%1							\n"
-"	bne-	1b							\n"
-"\t"	PPC_ACQUIRE_BARRIER "						\n"
-"2:									\n"
-	: "=&r" (prev)
-	: "r" (&lock->val), "r"(old), "r" (new),
-	  "i" (IS_ENABLED(CONFIG_PPC64))
-	: "cr0", "memory");
-
-	return likely(prev == old);
-}
-
-/* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
-static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 val)
-{
-	u32 newval = queued_spin_encode_locked_val();
-
-	return __trylock_cmpxchg(lock, val, newval);
-}
-
-/* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
-static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
-{
-	u32 newval = queued_spin_encode_locked_val() | (val & _Q_TAIL_CPU_MASK);
-
-	return __trylock_cmpxchg(lock, val, newval);
+	return prev;
 }
 
 /*
@@ -620,14 +594,11 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
-		if ((val & _Q_TAIL_CPU_MASK) == tail) {
-			if (trylock_clear_tail_cpu(lock, val))
-				goto release;
-			/* Another waiter must have enqueued. */
-		}
+		old = trylock_clear_my_tail(lock, tail);
+		BUG_ON(old & _Q_LOCKED_VAL);
+		if ((old & _Q_TAIL_CPU_MASK) == tail)
+			goto release;
 
-		/* We must be the owner, just set the lock bit and acquire */
-		set_locked(lock);
 	} else {
 		int set_yield_cpu = -1;
 		int iters = 0;
@@ -682,18 +653,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
-		if ((val & _Q_TAIL_CPU_MASK) == tail) {
-			if (trylock_clear_tail_cpu(lock, val))
-				goto release;
-			/* Another waiter must have enqueued, or lock stolen. */
-		} else {
-			if (trylock_with_tail_cpu(lock, val))
-				goto unlock_next;
-		}
-		goto again;
+		old = trylock_clear_my_tail(lock, tail);
+		if (unlikely(old & _Q_LOCKED_VAL))
+			goto again;
+		if ((old & _Q_TAIL_CPU_MASK) == tail)
+			goto release;
 	}
 
-unlock_next:
 	/* contended path; must wait for next != NULL (MCS protocol) */
 	next = READ_ONCE(node->next);
 	if (!next) {
-- 
2.37.2


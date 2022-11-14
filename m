Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722A6284C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 17:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9vXd705Nz3f4q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 03:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QjH6cidG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QjH6cidG;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9vSt3r8Hz3cHm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 03:11:42 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id c2so10447994plz.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 08:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNdYY8itr/zxiwuI2RKozXsUxE2hCXY6c7m7M08B9gs=;
        b=QjH6cidGuZnPVECFv4B1tE28r/0NNTOiDzRwfh9E+OM10G/5x6r7UxVasZdNzxGBLf
         MND7mfxhxWYHB5K0vT5tC+VY8CP9LVXwpwFjjWHl1CYjPZEpGwaC0dckKHzaAUCQgdE3
         U9r+u2nDDsY+Ml6B69jfN28SrlZCQSn7A9E4OWrjqCUUEg0IugTBj4hpnShGYextwr35
         uPFWyuVb1eiINuOI2bGJv1DX4Xl6vm+cFzwYvLTH8abHlbmfbngqqKgbkGKh0bmG5x1R
         0ujhQvYYJp3XCPpeAvHwzzlDN3JiX0CHW2SceWIAaY2g4KfVLBo9EP8BQPWuZplulOhp
         QLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNdYY8itr/zxiwuI2RKozXsUxE2hCXY6c7m7M08B9gs=;
        b=i532LOY90N19fn6cUFiUEI/j59VHIrUtaY5OPAFbOXjgKt9h/jYcf43h6VkbmbZIP6
         0aFP+BLqnD7m6Q7KV9JO5WxITnZl9Bz43BbPcjeTYrQPa3KO9y7VSt9JprRzXeEC+hCw
         5YVvnhjNE0rUzLzK0TYJ5Ma5xnyimwEVBGysi47jJkWYuCnc75nGq5N9FKGKyp2YtKyZ
         1ezGeglwPdYbQOcXT2KHbwlfic8zVO4ug+BTPVCbyV8smxFO3WyW/HdIlGE95I/hAryg
         0T2lgR989ucnDHCroaBlg0Fu8bYc+CtEnqsxDtmvcLs8TVdURtCilbg3cxxMAb477ygS
         dJmg==
X-Gm-Message-State: ANoB5pmQcCmCDDXfRXOsHYTr5nbz1/JsUu6VOvZDid8DZTgHvVgjyzss
	JRaY2VlKWiSExYCqclWEMeCIVrIck9JE4Q==
X-Google-Smtp-Source: AA0mqf6JI2FOgrBCHfUFqHUrBl3yfkANrzn+Z7tCxYwvns+GN2+KLPx0KBEhuAuZYWbIM/De2OKIJw==
X-Received: by 2002:a17:902:e890:b0:186:a22a:177e with SMTP id w16-20020a170902e89000b00186a22a177emr14149002plg.163.1668442299892;
        Mon, 14 Nov 2022 08:11:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-22-7.tpgi.com.au. [27.32.22.7])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b00186e2b3e12fsm7635883pld.261.2022.11.14.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 08:11:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/4] powerpc/qspinlock: Remove !maybe_waiters special case queue head locking
Date: Tue, 15 Nov 2022 02:11:18 +1000
Message-Id: <20221114161119.2883620-4-npiggin@gmail.com>
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

With the update primitive that clears the tail if it matches, and is
tolerant of other queueing activity on the lock, there is no longer a
significant reason to keep the large !maybe_stealers special case, so
remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 124 +++++++++++++++--------------------
 1 file changed, 53 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 79793b3209ea..457e748b0078 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -523,7 +523,11 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	struct qnode *next, *node;
 	u32 val, old, tail;
 	bool seen_preempted = false;
+	bool sleepy = false;
+	bool mustq = false;
 	int idx;
+	int set_yield_cpu = -1;
+	int iters = 0;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
@@ -577,90 +581,68 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		smp_rmb(); /* acquire barrier for the mcs lock */
 	}
 
-	if (!maybe_stealers) {
-		int set_yield_cpu = -1;
-
-		/* We're at the head of the waitqueue, wait for the lock. */
-		spin_begin();
-		for (;;) {
-			val = READ_ONCE(lock->val);
-			if (!(val & _Q_LOCKED_VAL))
-				break;
-
-			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			if (yield_head_to_locked_owner(lock, val, paravirt))
-				seen_preempted = true;
-		}
-		spin_end();
-
-		/* If we're the last queued, must clean up the tail. */
-		old = trylock_clear_my_tail(lock, tail);
-		BUG_ON(old & _Q_LOCKED_VAL);
-		if ((old & _Q_TAIL_CPU_MASK) == tail)
-			goto release;
-
-	} else {
-		int set_yield_cpu = -1;
-		int iters = 0;
-		bool sleepy = false;
-		bool mustq = false;
+	/* We're at the head of the waitqueue, wait for the lock. */
+again:
+	spin_begin();
+	for (;;) {
 		bool preempted;
 
-again:
-		/* We're at the head of the waitqueue, wait for the lock. */
-		spin_begin();
-		for (;;) {
-			val = READ_ONCE(lock->val);
-			if (!(val & _Q_LOCKED_VAL))
-				break;
-
-			if (paravirt && pv_sleepy_lock) {
-				if (!sleepy) {
-					if (val & _Q_SLEEPY_VAL) {
-						seen_sleepy_lock();
-						sleepy = true;
-					} else if (recently_sleepy()) {
-						sleepy = true;
-					}
-				}
-				if (pv_sleepy_lock_sticky && seen_preempted &&
-						!(val & _Q_SLEEPY_VAL)) {
-					if (try_set_sleepy(lock, val))
-						val |= _Q_SLEEPY_VAL;
+		val = READ_ONCE(lock->val);
+		if (!(val & _Q_LOCKED_VAL))
+			break;
+
+		if (paravirt && pv_sleepy_lock && maybe_stealers) {
+			if (!sleepy) {
+				if (val & _Q_SLEEPY_VAL) {
+					seen_sleepy_lock();
+					sleepy = true;
+				} else if (recently_sleepy()) {
+					sleepy = true;
 				}
 			}
+			if (pv_sleepy_lock_sticky && seen_preempted &&
+					!(val & _Q_SLEEPY_VAL)) {
+				if (try_set_sleepy(lock, val))
+					val |= _Q_SLEEPY_VAL;
+			}
+		}
 
-			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
-			preempted = yield_head_to_locked_owner(lock, val, paravirt);
-			if (preempted)
-				seen_preempted = true;
+		propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
+		preempted = yield_head_to_locked_owner(lock, val, paravirt);
+		if (!maybe_stealers)
+			continue;
+
+		if (preempted)
+			seen_preempted = true;
 
-			if (paravirt && preempted) {
-				sleepy = true;
+		if (paravirt && preempted) {
+			sleepy = true;
 
-				if (!pv_spin_on_preempted_owner)
-					iters++;
-			} else {
+			if (!pv_spin_on_preempted_owner)
 				iters++;
-			}
+		} else {
+			iters++;
+		}
 
-			if (!mustq && iters >= get_head_spins(paravirt, sleepy)) {
-				mustq = true;
-				set_mustq(lock);
-				val |= _Q_MUST_Q_VAL;
-			}
+		if (!mustq && iters >= get_head_spins(paravirt, sleepy)) {
+			mustq = true;
+			set_mustq(lock);
+			val |= _Q_MUST_Q_VAL;
 		}
-		spin_end();
+	}
+	spin_end();
 
-		/* If we're the last queued, must clean up the tail. */
-		old = trylock_clear_my_tail(lock, tail);
-		if (unlikely(old & _Q_LOCKED_VAL))
-			goto again;
-		if ((old & _Q_TAIL_CPU_MASK) == tail)
-			goto release;
+	/* If we're the last queued, must clean up the tail. */
+	old = trylock_clear_my_tail(lock, tail);
+	if (unlikely(old & _Q_LOCKED_VAL)) {
+		BUG_ON(!maybe_stealers);
+		goto again; /* Can only be true if maybe_stealers. */
 	}
 
-	/* contended path; must wait for next != NULL (MCS protocol) */
+	if ((old & _Q_TAIL_CPU_MASK) == tail)
+		goto release; /* We were the tail, no next. */
+
+	/* There is a next, must wait for node->next != NULL (MCS protocol) */
 	next = READ_ONCE(node->next);
 	if (!next) {
 		spin_begin();
-- 
2.37.2


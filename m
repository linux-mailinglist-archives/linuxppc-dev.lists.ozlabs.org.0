Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 868557CA869
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:47:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YMBRFNrF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H2130lMz3vlc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YMBRFNrF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Gyh2hJ6z3ck9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:44:28 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so1918189b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460265; x=1698065065; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B101eYTsYrUl4oIUxvtFA1Uy7uNQ2+OB4reEXGoeJM=;
        b=YMBRFNrFJWlfBwB1iuOFFQ1tcE8qSJc24Y9ZrzzvdWpzQMuLSlGlx7FjrsP8stHpFD
         iwjjos5hf3OFGzdcOY+x30lSKzTW8AwlH5JuN/zePqEL1Gy9rKcaPomVRB8RQcB8AAm+
         5S2H/QtigowC2Fh+bZXw5yEE9STL0hPtonnCmML6WNXMg38ki4HV3+OE0QVNOcZme+Qs
         a9UaiMZc6DNjWDg2HzBB+LB8kT082mGLvDU4nYaFzGi8jqFhko93oQxaaZkIGmmv/AHG
         d2RsC4KDV4D7KFYA8jdd1S21+NiH6VKBrzDqgoPNZ8MTLHDwvl1RZmyr9Snz1em1pIbf
         Wl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460265; x=1698065065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0B101eYTsYrUl4oIUxvtFA1Uy7uNQ2+OB4reEXGoeJM=;
        b=JnZYxh1mga9sC2Tp0MqGmXcgCvh1zMw1zj3U81NN9MfYPo5h3JqFOm6nVbrD+IKmk0
         Co3jCH6APt5wSII5/tUxleUgwMLcRhYLjyHxTpcyXD42XXaiqqCi2aS/rzOM1V+uNKxY
         nzy9ktUHv01b3ApjHoHyfxZnuI3Ao0U+0/MjWYcK9Fow2Jaws5wvIuqOVTdgsm6Y2qu/
         cxVLABU+5RE5OWkd9MuccwprInnGrXU/5CzIkE/H3liOU3kEr0NXDZNr+j6gh0QLQrg1
         CzPTXyZ9Hol4iCjpiApQoQyeP/u9swL6C9zJ8BW6ULslnYMlnTQ7qIy4bPgekRaK0w/Y
         RTaQ==
X-Gm-Message-State: AOJu0YwNqhfDPIG7CtZv0YDJZ+nkuUD3KGZ+gePHt/fE7N74ax9+GZuE
	fPJ8ON4dHXHVqzM/l0NYS9ZXFBPT4nU=
X-Google-Smtp-Source: AGHT+IFR980nu2DFOp1oTGwPHNBPnDZK7N9EQy9TifMYkOvbxNEsiBGI/ry0YUCZnLSeiVos896qzQ==
X-Received: by 2002:a05:6a00:1745:b0:6be:367a:2a71 with SMTP id j5-20020a056a00174500b006be367a2a71mr1467449pfc.16.1697460265547;
        Mon, 16 Oct 2023 05:44:25 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:44:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/qspinlock: don't propagate the not-sleepy state
Date: Mon, 16 Oct 2023 22:43:03 +1000
Message-ID: <20231016124305.139923-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To simplify things, don't propagate the not-sleepy condition back down
the queue. Instead, have the waiters clear their own node->sleepy when
finding the lock owner is not preempted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 0932d24a6b07..6bb627e90a32 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -350,7 +350,7 @@ static __always_inline bool yield_head_to_locked_owner(struct qspinlock *lock, u
 	return __yield_to_locked_owner(lock, val, paravirt, mustq);
 }
 
-static __always_inline void propagate_sleepy(struct qnode *node, u32 val, bool *set_sleepy, bool paravirt)
+static __always_inline void propagate_sleepy(struct qnode *node, u32 val, bool paravirt)
 {
 	struct qnode *next;
 	int owner;
@@ -359,18 +359,17 @@ static __always_inline void propagate_sleepy(struct qnode *node, u32 val, bool *
 		return;
 	if (!pv_yield_propagate_owner)
 		return;
-	if (*set_sleepy)
-		return;
 
 	next = READ_ONCE(node->next);
 	if (!next)
 		return;
 
+	if (next->sleepy)
+		return;
+
 	owner = get_owner_cpu(val);
-	if (vcpu_is_preempted(owner)) {
+	if (vcpu_is_preempted(owner))
 		next->sleepy = 1;
-		*set_sleepy = true;
-	}
 }
 
 /* Called inside spin_begin() */
@@ -385,12 +384,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	if (!pv_yield_propagate_owner)
 		goto yield_prev;
 
-	if (!READ_ONCE(node->sleepy)) {
-		/* Propagate back sleepy==false */
-		if (node->next && node->next->sleepy)
-			node->next->sleepy = 0;
-		goto yield_prev;
-	} else {
+	if (node->sleepy) {
 		u32 val = READ_ONCE(lock->val);
 
 		if (val & _Q_LOCKED_VAL) {
@@ -410,6 +404,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 			if (preempted)
 				return preempted;
 		}
+		node->sleepy = false;
 	}
 
 yield_prev:
@@ -533,7 +528,6 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	bool sleepy = false;
 	bool mustq = false;
 	int idx;
-	bool set_sleepy = false;
 	int iters = 0;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
@@ -591,10 +585,6 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		spec_barrier();
 		spin_end();
 
-		/* Clear out stale propagated sleepy */
-		if (paravirt && pv_yield_propagate_owner && node->sleepy)
-			node->sleepy = 0;
-
 		smp_rmb(); /* acquire barrier for the mcs lock */
 
 		/*
@@ -636,7 +626,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			}
 		}
 
-		propagate_sleepy(node, val, &set_sleepy, paravirt);
+		propagate_sleepy(node, val, paravirt);
 		preempted = yield_head_to_locked_owner(lock, val, paravirt);
 		if (!maybe_stealers)
 			continue;
-- 
2.42.0


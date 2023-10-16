Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162A7CA84C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:45:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lot0eneY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H066BVSz3vZB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:45:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lot0eneY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Gyb0zdqz3dDg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:44:22 +1100 (AEDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57ba5f05395so2760013eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460259; x=1698065059; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOg8GvzntlYfAxH5Ok/9uHc4ELZsVCGk5wGPn/0WVBo=;
        b=Lot0eneYmZF8ZUGglYfe/xNcqKn8XQe7TDqe8+sPMMcHIl+UQ+mLlu9J1kUsFlZJVX
         ZxZSByXbIfuj3dNBejTJ464KHAW6abhLDmdco8ngN4r9pV9oRS8WFmNciaz+ta8XsRPK
         Wrpm2eG0z11KhvRudRMDIclWA6dupa2RDt32QzmBBfl6cZfEgHOcwYWi97oS9m7sYx4c
         exOcGrSOSNGurftuD+fccq0s5tlngu0xuOvMgFAwCuCvDm5zEiE2K0Ft7mqnpjde9VQg
         TKvjxydwhfvTvA3zclg6hg8t/gXWG1yQ7M+FXQZ1x8ekGS/k7sWzZMK6aCseSxDv/SXd
         JEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460259; x=1698065059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOg8GvzntlYfAxH5Ok/9uHc4ELZsVCGk5wGPn/0WVBo=;
        b=rsts6sNFk3258h0jTxPipf3QKj6B12hWpm/sldtB7BXUM1e+96WVGUcHObdD+X/On6
         BBysBV4bJ4w8gRBooGMlEu8zVCANYyKF3uuQPDWDcHVY5wUnp+54p5yEwOM8V4HiYG/l
         /y7NYGQJQYicaO9j3WnR6TDzhWCtYhDnRwsihz7i9glFtQfYzzCo4r0ZehN8XiOB4la8
         rKg44v5VPLojrJCNkTMegV7KhfBpx9NsaBcpBImTqFeB18l+gnMXuGywyaHjr+P/ODdO
         1Eam622uBxdC6XDP4Zisw2ZMUr+pQzLXsAxIWIoLVB319h9rcAhndqseIG/1N5yUs3Pr
         TLGg==
X-Gm-Message-State: AOJu0YxCrBdhAQezxr+nPrVL8ywp9kUB9AdGjAKpmaMQ097fZXD9VLCG
	v1NTB+XG/9QiR/nyfcME513yMfdvHvc=
X-Google-Smtp-Source: AGHT+IHrB8rNshNZHt1Er0FXkXepehBglxF1+oi/OH9JdEvAUp9j748KmwPB9DoxvSP38Y/d4A2GlQ==
X-Received: by 2002:a05:6358:7296:b0:164:953b:35a9 with SMTP id w22-20020a056358729600b00164953b35a9mr21927028rwf.23.1697460259352;
        Mon, 16 Oct 2023 05:44:19 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:44:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/qspinlock: stop queued waiters trying to set lock sleepy
Date: Mon, 16 Oct 2023 22:43:01 +1000
Message-ID: <20231016124305.139923-3-npiggin@gmail.com>
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

If a queued waiter notices the lock owner or the previous waiter has
been preempted, it attempts to mark the lock sleepy, but it does this
as a try-set operation using the original lock value it got when
queueing, which will become stale as the queue progresses, and the
try-set will fail. Drop this and just set the sleepy seen clock.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 6dd2f46bd3ef..75608ced14c2 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -247,22 +247,18 @@ static __always_inline void seen_sleepy_lock(void)
 		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
 }
 
-static __always_inline void seen_sleepy_node(struct qspinlock *lock, u32 val)
+static __always_inline void seen_sleepy_node(void)
 {
 	if (pv_sleepy_lock) {
 		if (pv_sleepy_lock_interval_ns)
 			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
-		if (val & _Q_LOCKED_VAL) {
-			if (!(val & _Q_SLEEPY_VAL))
-				try_set_sleepy(lock, val);
-		}
+		/* Don't set sleepy because we likely have a stale val */
 	}
 }
 
-static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
+static struct qnode *get_tail_qnode(struct qspinlock *lock, int prev_cpu)
 {
-	int cpu = decode_tail_cpu(val);
-	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
+	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, prev_cpu);
 	int idx;
 
 	/*
@@ -381,9 +377,8 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
 }
 
 /* Called inside spin_begin() */
-static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
+static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
 {
-	int prev_cpu = decode_tail_cpu(val);
 	u32 yield_count;
 	int yield_cpu;
 	bool preempted = false;
@@ -412,7 +407,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	spin_end();
 
 	preempted = true;
-	seen_sleepy_node(lock, val);
+	seen_sleepy_node();
 
 	smp_rmb();
 
@@ -436,7 +431,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	spin_end();
 
 	preempted = true;
-	seen_sleepy_node(lock, val);
+	seen_sleepy_node();
 
 	smp_rmb(); /* See __yield_to_locked_owner comment */
 
@@ -587,7 +582,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 	 * head of the waitqueue.
 	 */
 	if (old & _Q_TAIL_CPU_MASK) {
-		struct qnode *prev = get_tail_qnode(lock, old);
+		int prev_cpu = decode_tail_cpu(old);
+		struct qnode *prev = get_tail_qnode(lock, prev_cpu);
 
 		/* Link @node into the waitqueue. */
 		WRITE_ONCE(prev->next, node);
@@ -597,7 +593,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		while (!READ_ONCE(node->locked)) {
 			spec_barrier();
 
-			if (yield_to_prev(lock, node, old, paravirt))
+			if (yield_to_prev(lock, node, prev_cpu, paravirt))
 				seen_preempted = true;
 		}
 		spec_barrier();
-- 
2.42.0


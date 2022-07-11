Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EA56D342
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh89y1kH2z3ffZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RH+f7myL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RH+f7myL;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zx5jk3z3cLZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:33 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 23so3628455pgc.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=keeY9AKTFr1mGjJUi/T0jROWikDzUuoWADIBOKMQN+8=;
        b=RH+f7myLkUmcTfCHwvyS8MlE4kkBI8E4cRVQYcfbAmSkEFUwFxjzPdPgAXsJ4NOTtn
         lt2rv9/00CLbSjJ4bOjAWAUJYDKFdKe19MTNXwl59nLnYtjvt4l/dXclmYkZLTQgE5Ps
         od8aZTH2L8CF+o9Y9rtmTwg+Lpd8iYNmQ/5zfVHTHZ87V0gh2Nj8i9SSMCLBaeH1wKWg
         1LtTHN8oF2c8PfWK2K3rkOHp8SEbtlhvjTgWr601SpeKZs+9pPYVHIDtezcJksCeZxEu
         MyEXhh+Mt//4gXjJx6NcjMa8Nu/SG+ne5JDxPOKGnPL7xs+Os0lQTYj0R6FdKMvm7vdT
         kliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=keeY9AKTFr1mGjJUi/T0jROWikDzUuoWADIBOKMQN+8=;
        b=KaIH7HKs1e3vu7i76kG1y6qpkjP6R4YtU3zlNxrEDF6pwp437qCRwdBb/AY9Z0tJnD
         iM2fO8siDkwxUpqv9g9ZpLh8vEjECfLLm3OR6nWNn3JHac5Zs1c87iguLDowmao8JidW
         TDbrYZlmvCA2qxVsTvB9McSANtjG2khlIWEPJg78NKhAzvsxfLa5SczaCeU+WQdnvN+N
         zfgc0nioTdI8gYm8VMogSbaS5StiFlh0JLctg5RKUIMrVebpJrF03CAz7BqiNLcVmeML
         OdzdCyxfvxeHEMJog8r3biggEIOJSlKPK+/x3lR4mEjomrZBzYInwh8HHMuc4/nrZn4z
         JG/w==
X-Gm-Message-State: AJIora98hTaDoriqJtwvCTn2e1FvBLPAPbhX4qBgFaNCpc2OFbqyXm0d
	N5iLPp8iSqQTAxHG5XCgJnqZdmcWpO4=
X-Google-Smtp-Source: AGRyM1tZ/aBrm3V6j7hMvE5/SaNqfCOx+mvEGPXgc1H0GYkPW4eDJxKj5bElcNxUzSKe7te+NTVBQQ==
X-Received: by 2002:a63:1921:0:b0:412:407f:f012 with SMTP id z33-20020a631921000000b00412407ff012mr13642964pgl.125.1657508731227;
        Sun, 10 Jul 2022 20:05:31 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 14/14] powerpc/qspinlock: use spin_begin/end API
Date: Mon, 11 Jul 2022 13:04:53 +1000
Message-Id: <20220711030453.150644-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711030453.150644-1-npiggin@gmail.com>
References: <20220711030453.150644-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the spin_begin/spin_cpu_relax/spin_end APIs in qspinlock, which helps
to prevent threads issuing a lot of expensive priority nops which may not
have much effect due to immediately executing low then medium priority.
---
 arch/powerpc/lib/qspinlock.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index d67b923e4f98..486423d566d3 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -243,7 +243,7 @@ static void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravi
 		return;
 	}
 relax:
-	cpu_relax();
+	spin_cpu_relax();
 }
 
 static void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
@@ -331,7 +331,7 @@ static void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_c
 	}
 
 relax:
-	cpu_relax();
+	spin_cpu_relax();
 }
 
 
@@ -340,6 +340,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 	int iters;
 
 	/* Attempt to steal the lock */
+	spin_begin();
 	for (iters = 0; iters < STEAL_SPINS; iters++) {
 		u32 val = READ_ONCE(lock->val);
 
@@ -354,6 +355,7 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
 		if (trylock_with_tail_cpu(lock, val))
 			return true;
 	}
+	spin_end();
 
 	return false;
 }
@@ -404,8 +406,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		WRITE_ONCE(prev->next, node);
 
 		/* Wait for mcs node lock to be released */
+		spin_begin();
 		while (!node->locked)
 			yield_to_prev(lock, node, prev_cpu, paravirt);
+		spin_end();
 
 		/* Clear out stale propagated yield_cpu */
 		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
@@ -418,10 +422,12 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		int set_yield_cpu = -1;
 
 		/* We're at the head of the waitqueue, wait for the lock. */
+		spin_begin();
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
 			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
 			yield_head_to_locked_owner(lock, val, paravirt, false);
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -436,6 +442,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 		int set_yield_cpu = -1;
 		int iters = 0;
 again:
+		spin_begin();
 		/* We're at the head of the waitqueue, wait for the lock. */
 		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
 			if (iters++ == HEAD_SPINS) {
@@ -446,6 +453,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 			yield_head_to_locked_owner(lock, val, paravirt,
 				pv_yield_allow_steal && (iters > HEAD_SPINS));
 		}
+		spin_end();
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -461,8 +469,13 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
 
 unlock_next:
 	/* contended path; must wait for next != NULL (MCS protocol) */
-	while (!(next = READ_ONCE(node->next)))
-		cpu_relax();
+	next = READ_ONCE(node->next);
+	if (!next) {
+		spin_begin();
+		while (!(next = READ_ONCE(node->next)))
+			cpu_relax();
+		spin_end();
+	}
 
 	/*
 	 * Unlock the next mcs waiter node. Release barrier is not required
-- 
2.35.1


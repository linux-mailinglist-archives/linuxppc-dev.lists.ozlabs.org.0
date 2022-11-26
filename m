Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E8639521
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6mT1wMFz3f6j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bh6wj40p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bh6wj40p;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fT6m4fz3f3y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:01 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id l7so3642328pfl.7
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd0A7OkqGIzoqzCdYe074g3Et8SnDelsWSBmhpohXvA=;
        b=bh6wj40pXcrxr4xCbveQvXNvz20RbohMK4mOrfHTE5XzJ4UIxfWRt1Ei4ySGfNH/QB
         oVFOadYu5t6tKLThUlsefqvm/cWm1+MtHX0ap+zi+xDOYauVfiH3Lwf0xWEU9LOS2CXt
         z+roiUDR4LK2lwuRr5gFEamZw0y8PQN0xGD3iBNoEjJ7p23nuHIVwZf2Gp27hXUld19R
         UMxDX7WtK2hj5E08bRCnIIzkVNs04cGBxVOYCuul70KH7hTiyKu9XHL5v6eXRYnLVSq1
         ezrP/MGSKoWRwJcycS0yPkThMsmftrZZm+idOQZgPHNTi7WInzJtFw9QmkZHWoK8wGvE
         1IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd0A7OkqGIzoqzCdYe074g3Et8SnDelsWSBmhpohXvA=;
        b=l3+Yufb6yXUrNY54fAnpU3BbDZPMFeSgL+2yJiao13aNRKPdW9bCcqVuPTKxYUT/Bf
         yCTOO0Rl3uhRLNLGOt2160kJEXeIqK9PvbDk0pzpdnKg47qA2lkn8LWEDYXVQnLPZL5r
         bY2DYyW6Mvx+1RBS3YPz500ggeajqoCQES+D+Iy1tvrKRwgOoNMZkTaWXGdOKgsvXh4F
         Xwh2AheukSKVhAxz28SZOkE5rA7UJukTmSqRmNiQbvN+r87VhIuQto90Lupel3Gn2RUA
         SwJsyr/6JMmrGaM+uWAAxth2f7+bJ2YnGo6UmYbyu+GaKLfA35JTUoIATsTa8lPrPpfY
         bHbQ==
X-Gm-Message-State: ANoB5pl724etH/gVvAK5mj6WW98iEWj/V2yz3kJBdWkNLTpBvRLFNW6d
	/FgX8qArf3KbJhtB63PVb+WKTvk7ttRPcQ==
X-Google-Smtp-Source: AA0mqf6Lb/m26DGHZWpadiQsmeuj0NbzXAGE8BQSdsS83mil8jtT5jGtOpEHq65l2OfgoI863WBT0Q==
X-Received: by 2002:a63:4d61:0:b0:477:b1a8:531e with SMTP id n33-20020a634d61000000b00477b1a8531emr17186071pgl.158.1669456799211;
        Sat, 26 Nov 2022 01:59:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/17] powerpc/qspinlock: theft prevention to control latency
Date: Sat, 26 Nov 2022 19:59:20 +1000
Message-Id: <20221126095932.1234527-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221126095932.1234527-1-npiggin@gmail.com>
References: <20221126095932.1234527-1-npiggin@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Give the queue head the ability to stop stealers. After a number of
spins without sucessfully acquiring the lock, the queue head sets
this, which halts stealing and will assure it is the next owner.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock_types.h |  8 +++-
 arch/powerpc/lib/qspinlock.c               | 53 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index b9a5a52fa670..1911a8a16237 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -29,7 +29,8 @@ typedef struct qspinlock {
  * Bitfields in the lock word:
  *
  *     0: locked bit
- *  1-16: unused bits
+ *  1-15: unused bits
+ *    16: must queue bit
  * 17-31: tail cpu (+1)
  */
 #define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
@@ -39,6 +40,11 @@ typedef struct qspinlock {
 #define _Q_LOCKED_BITS		1
 #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
 
+/* 0x00010000 */
+#define _Q_MUST_Q_OFFSET	16
+#define _Q_MUST_Q_BITS		1
+#define _Q_MUST_Q_VAL		(1U << _Q_MUST_Q_OFFSET)
+
 /* 0xfffe0000 */
 #define _Q_TAIL_CPU_OFFSET	17
 #define _Q_TAIL_CPU_BITS	15
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 6d67bc38b122..979b17ac7bd1 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -22,6 +22,7 @@ struct qnodes {
 /* Tuning parameters */
 static int steal_spins __read_mostly = (1<<5);
 static bool maybe_stealers __read_mostly = true;
+static int head_spins __read_mostly = (1<<8);
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -30,6 +31,11 @@ static __always_inline int get_steal_spins(void)
 	return steal_spins;
 }
 
+static __always_inline int get_head_spins(void)
+{
+	return head_spins;
+}
+
 static inline u32 encode_tail_cpu(int cpu)
 {
 	return (cpu + 1) << _Q_TAIL_CPU_OFFSET;
@@ -104,6 +110,22 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 	return prev;
 }
 
+static __always_inline u32 set_mustq(struct qspinlock *lock)
+{
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# set_mustq				\n"
+"	or	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (_Q_MUST_Q_VAL)
+	: "cr0", "memory");
+
+	return prev;
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = decode_tail_cpu(val);
@@ -139,6 +161,9 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 	do {
 		u32 val = READ_ONCE(lock->val);
 
+		if (val & _Q_MUST_Q_VAL)
+			break;
+
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
 			if (__queued_spin_trylock_steal(lock))
 				return true;
@@ -157,7 +182,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 	struct qnodes *qnodesp;
 	struct qnode *next, *node;
 	u32 val, old, tail;
+	bool mustq = false;
 	int idx;
+	int iters = 0;
 
 	BUILD_BUG_ON(CONFIG_NR_CPUS >= (1U << _Q_TAIL_CPU_BITS));
 
@@ -209,6 +236,15 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 			break;
 
 		cpu_relax();
+		if (!maybe_stealers)
+			continue;
+		iters++;
+
+		if (!mustq && iters >= get_head_spins()) {
+			mustq = true;
+			set_mustq(lock);
+			val |= _Q_MUST_Q_VAL;
+		}
 	}
 
 	/* If we're the last queued, must clean up the tail. */
@@ -293,9 +329,26 @@ static int steal_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
 
+static int head_spins_set(void *data, u64 val)
+{
+	head_spins = val;
+
+	return 0;
+}
+
+static int head_spins_get(void *data, u64 *val)
+{
+	*val = head_spins;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_head_spins, head_spins_get, head_spins_set, "%llu\n");
+
 static __init int spinlock_debugfs_init(void)
 {
 	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
+	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
 
 	return 0;
 }
-- 
2.37.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98A5838D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgrp2QzVz2xJS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VJHRaoCq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VJHRaoCq;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgm41lGNz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:47 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id bh13so792483pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7zVFI8gLBI7UKW9DMHSWelc5M2kD68LY8icoCoxoZ6w=;
        b=VJHRaoCq5spLHM6y4OwUoz5DeLLqY6vaeXP1lifjFbB00+Ynt8VMcpDZ7etZyZF+14
         /LdlfsYilDFr1DkKxrjyAqyMgxJ/QiU2+qUbg4DsQTyCs5IIhTlDMBQsfduEEyqaH28P
         AwL2nUchue9atST7BV+105d1xgVnCjSOmU0X7FCtDuAPMCP3O1t+gYARxzQrBB2vUM75
         nK4Gy3/CWEnOmjTupG0YiNQ1eupGXhRdLcJDIcDDGxOS1h5++vnbp+URyXIp2WWsizyy
         yOxv3IqElIi2mmPr6zCjrP9Bpo2EieluXUoBqcVdn5UODc18Eo/+6jldRBSlxFIQmMHI
         vVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7zVFI8gLBI7UKW9DMHSWelc5M2kD68LY8icoCoxoZ6w=;
        b=Ek9YSVNN3z1N7g5PxyPZ0lnHoVB1ab+QLjzMHqCOVfGhHQ4xqFpLgs/t8X6h0gOYbW
         /yGtL2wTgUhBVau7ZnLEzHUdYPRT9de7yBAgvED76OiHYx1havxrBHnrJgBduBoY1s+b
         yR2W0cBle4MlRkAwcGm/rm5Fr7NVKgE93Yc+Tbxi/ktivchNvzgfHg6A4M9fgVZHpu+v
         OVcEUV+c485yZdX6CYkTF8cAP5ZcpdXvksgerN8S/aWtuUsdO89Z37CA5KbcDk/9x8ee
         aLAfDfqlGTzgQWY7CfrqpGVLHTkZgPvR73A9oVLlDGwqnb7DGkq2T5hkzGZn6d1gjdx9
         3unw==
X-Gm-Message-State: AJIora++M7TicboeWWW8OK62gdDgeu+Vh/zE0RIgqKSGwzTi4lFW68M2
	SyxL7yRNjqgCgF5OK8a7MBzOke5e5oY=
X-Google-Smtp-Source: AGRyM1sauqeWVZdhryhi5weoBU6u3QOkbSB09PnqLQqGFouXCM0qvEelu9pZzWQ2i+J3qwMz2rOcEg==
X-Received: by 2002:a62:18cc:0:b0:52a:bb04:6cb2 with SMTP id 195-20020a6218cc000000b0052abb046cb2mr25543944pfy.4.1658989905503;
        Wed, 27 Jul 2022 23:31:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/17] powerpc/qspinlock: theft prevention to control latency
Date: Thu, 28 Jul 2022 16:31:09 +1000
Message-Id: <20220728063120.2867508-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220728063120.2867508-1-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
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

Give the queue head the ability to stop stealers. After a number of
spins without sucessfully acquiring the lock, the queue head employs
this, which will assure it is the next owner.
---
 arch/powerpc/include/asm/qspinlock_types.h | 10 +++-
 arch/powerpc/lib/qspinlock.c               | 56 +++++++++++++++++++++-
 2 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 210adf05b235..8b20f5e22bba 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -29,7 +29,8 @@ typedef struct qspinlock {
  * Bitfields in the lock word:
  *
  *     0: locked bit
- * 16-31: tail cpu (+1)
+ *    16: must queue bit
+ * 17-31: tail cpu (+1)
  */
 #define	_Q_SET_MASK(type)	(((1U << _Q_ ## type ## _BITS) - 1)\
 				      << _Q_ ## type ## _OFFSET)
@@ -38,7 +39,12 @@ typedef struct qspinlock {
 #define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
 #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
 
-#define _Q_TAIL_CPU_OFFSET	16
+#define _Q_MUST_Q_OFFSET	16
+#define _Q_MUST_Q_BITS		1
+#define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
+#define _Q_MUST_Q_VAL		(1U << _Q_MUST_Q_OFFSET)
+
+#define _Q_TAIL_CPU_OFFSET	17
 #define _Q_TAIL_CPU_BITS	(32 - _Q_TAIL_CPU_OFFSET)
 #define _Q_TAIL_CPU_MASK	_Q_SET_MASK(TAIL_CPU)
 
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 1625cce714b2..a906cc8f15fa 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -22,6 +22,7 @@ struct qnodes {
 /* Tuning parameters */
 static int STEAL_SPINS __read_mostly = (1<<5);
 static bool MAYBE_STEALERS __read_mostly = true;
+static int HEAD_SPINS __read_mostly = (1<<8);
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -30,6 +31,11 @@ static __always_inline int get_steal_spins(void)
 	return STEAL_SPINS;
 }
 
+static __always_inline int get_head_spins(void)
+{
+	return HEAD_SPINS;
+}
+
 static inline u32 encode_tail_cpu(void)
 {
 	return (smp_processor_id() + 1) << _Q_TAIL_CPU_OFFSET;
@@ -142,6 +148,23 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 	return prev;
 }
 
+static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
+{
+	u32 new = _Q_MUST_Q_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# lock_set_mustq			\n"
+"	or	%0,%0,%2						\n"
+"	stwcx.	%0,0,%1							\n"
+"	bne-	1b							\n"
+	: "=&r" (prev)
+	: "r" (&lock->val), "r" (new)
+	: "cr0", "memory");
+
+	return prev;
+}
+
 static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
@@ -165,6 +188,9 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 	for (;;) {
 		u32 val = READ_ONCE(lock->val);
 
+		if (val & _Q_MUST_Q_VAL)
+			break;
+
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
 			if (trylock_with_tail_cpu(lock, val))
 				return true;
@@ -246,11 +272,22 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		/* We must be the owner, just set the lock bit and acquire */
 		lock_set_locked(lock);
 	} else {
+		int iters = 0;
+		bool set_mustq = false;
+
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
-		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
 			cpu_relax();
 
+			iters++;
+			if (!set_mustq && iters >= get_head_spins()) {
+				set_mustq = true;
+				lock_set_mustq(lock);
+				val |= _Q_MUST_Q_VAL;
+			}
+		}
+
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
 			if (trylock_clear_tail_cpu(lock, val))
@@ -329,9 +366,26 @@ static int steal_spins_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_steal_spins, steal_spins_get, steal_spins_set, "%llu\n");
 
+static int head_spins_set(void *data, u64 val)
+{
+	HEAD_SPINS = val;
+
+	return 0;
+}
+
+static int head_spins_get(void *data, u64 *val)
+{
+	*val = HEAD_SPINS;
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
2.35.1


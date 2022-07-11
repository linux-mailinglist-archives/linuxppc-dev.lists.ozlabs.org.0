Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77D56D341
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:13:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh89G5V4bz3fcR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:13:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UqTq3xQA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UqTq3xQA;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zv5rNfz3cFL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:31 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id j12so3343883plj.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVkkB6BjjOTsJFW9Qxm3jwsKHsI36EMDreg19DDa4Nc=;
        b=UqTq3xQAnyRWKy8SEf2KA33BsY+MfbXH9fxyCFkBWbZwObQpDMj2tupi8LyeQkl5D+
         NZ4uYaD3S63twfAtrTAnOYCgEZf9ko3Oy9pGGwPs6mhRte9oinhkQA6g4Hzm8/AliFc2
         nRkgBtyVA7T1h7lWfU84MSeHSKFzbsx56KkdKytuqYdCv8zGZkRbQIDMjLBAlU4KfDdS
         CaEhw4ylp8gxoYAUmXEMjJnitq9QjAIL5yqLJKl8KzsJNSIEyPM715dLOJDJIfnuV+W8
         +OuhDzaW52qMHYDV0D6xBrygNu4o4Bnz0Se0hEan8JXTH8/0oxPek7FzXoPB6BkV9ju4
         tJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVkkB6BjjOTsJFW9Qxm3jwsKHsI36EMDreg19DDa4Nc=;
        b=isHYEyHYf4kiSnXyExb4KPMewVvVHedKXQNfnZdGxbkLRRKuwAKIvMGqDdH52fuGRL
         5jnK6jv9UjmcN3jXfAUrpLsBGaSA4n+2HxfIwXCxNPdrNqhofD5vF+GQ7Ik6clCtxMYI
         rufAzprndGGscghv0EGyQAQBjFNe78CfbBRF3SHOLNA32BYETx77rwMlXpjn55sxuSKz
         HHnoxpsjOZMlK0d/f9UVgt+O6asSWzK06sS+7m9Sgk96guelhXuZ9hkf+WZESNHEvCFr
         TDYDn3wvWnm8aQYXE9rr29/8FeazA2Q4IcupPjM09QAgXo1JSIMHamP6TveZOWGe64u5
         NqrQ==
X-Gm-Message-State: AJIora8/KsmV1APF/g/9g8a86qgPU7Nas8scMe26V1DYdpBtnCpups0P
	1d5mbL4fY8MchVC0xVRrwASDMgtW7qU=
X-Google-Smtp-Source: AGRyM1tj8cKhtgKxYhsTXcLzZKln3POQeD6Dnc5rvNPGYKXZwDPzExSeYvrXfDUb8oJ1tTpXLw00UA==
X-Received: by 2002:a17:902:b947:b0:16a:79b7:21f2 with SMTP id h7-20020a170902b94700b0016a79b721f2mr16370048pls.130.1657508729152;
        Sun, 10 Jul 2022 20:05:29 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 13/14] powerpc/qspinlock: trylock and initial lock attempt may steal
Date: Mon, 11 Jul 2022 13:04:52 +1000
Message-Id: <20220711030453.150644-14-npiggin@gmail.com>
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

This gives trylock slightly more strength, and it also gives most
of the benefit of passing 'val' back through the slowpath without
the complexity.
---
 arch/powerpc/include/asm/qspinlock.h | 39 +++++++++++++++++++++++++++-
 arch/powerpc/lib/qspinlock.c         |  9 +++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 44601b261e08..d3d2039237b2 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -5,6 +5,8 @@
 #include <linux/compiler.h>
 #include <asm/qspinlock_types.h>
 
+#define _Q_SPIN_TRY_LOCK_STEAL 1
+
 static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
 	return READ_ONCE(lock->val);
@@ -26,11 +28,12 @@ static __always_inline u32 queued_spin_get_locked_val(void)
 	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
 }
 
-static __always_inline int queued_spin_trylock(struct qspinlock *lock)
+static __always_inline int __queued_spin_trylock_nosteal(struct qspinlock *lock)
 {
 	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
+	/* Trylock succeeds only when unlocked and no queued nodes */
 	asm volatile(
 "1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
 "	cmpwi	0,%0,0							\n"
@@ -49,6 +52,40 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 	return 0;
 }
 
+static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
+{
+	u32 new = queued_spin_get_locked_val();
+	u32 prev, tmp;
+
+	/* Trylock may get ahead of queued nodes if it finds unlocked */
+	asm volatile(
+"1:	lwarx	%0,0,%2,%5	# queued_spin_trylock			\n"
+"	andc.	%1,%0,%4						\n"
+"	bne-	2f							\n"
+"	and	%1,%0,%4						\n"
+"	or	%1,%1,%3						\n"
+"	stwcx.	%1,0,%2							\n"
+"	bne-	1b							\n"
+"\t"	PPC_ACQUIRE_BARRIER "						\n"
+"2:									\n"
+	: "=&r" (prev), "=&r" (tmp)
+	: "r" (&lock->val), "r" (new), "r" (_Q_TAIL_CPU_MASK),
+	  "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
+	: "cr0", "memory");
+
+	if (likely(!(prev & ~_Q_TAIL_CPU_MASK)))
+		return 1;
+	return 0;
+}
+
+static __always_inline int queued_spin_trylock(struct qspinlock *lock)
+{
+	if (!_Q_SPIN_TRY_LOCK_STEAL)
+		return __queued_spin_trylock_nosteal(lock);
+	else
+		return __queued_spin_trylock_steal(lock);
+}
+
 void queued_spin_lock_slowpath(struct qspinlock *lock);
 
 static __always_inline void queued_spin_lock(struct qspinlock *lock)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index ce0563c56915..d67b923e4f98 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -24,7 +24,11 @@ struct qnodes {
 
 /* Tuning parameters */
 static int STEAL_SPINS __read_mostly = (1<<5);
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+static const bool MAYBE_STEALERS = true;
+#else
 static bool MAYBE_STEALERS __read_mostly = true;
+#endif
 static int HEAD_SPINS __read_mostly = (1<<13);
 
 static bool pv_yield_owner __read_mostly = true;
@@ -505,6 +509,10 @@ void pv_spinlocks_init(void)
 #include <linux/debugfs.h>
 static int steal_spins_set(void *data, u64 val)
 {
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+	/* MAYBE_STEAL remains true */
+	STEAL_SPINS = val;
+#else
 	static DEFINE_MUTEX(lock);
 
 	mutex_lock(&lock);
@@ -522,6 +530,7 @@ static int steal_spins_set(void *data, u64 val)
 		STEAL_SPINS = val;
 	}
 	mutex_unlock(&lock);
+#endif
 
 	return 0;
 }
-- 
2.35.1


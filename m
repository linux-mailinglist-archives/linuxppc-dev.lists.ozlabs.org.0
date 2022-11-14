Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7746274A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:45:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YZg0TwLz3fF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:45:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NX2SqJJD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NX2SqJJD;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHv2M78z3cGm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:43 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id v3so9126420pgh.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OV9ZfoAfAbhk+WQL7FfDGr/G3dfE6dz+V5jHibvfWI=;
        b=NX2SqJJD7xy/JntKpyZgm0LbLq1jhSFzNvqw/e70o/SFGydOTR8XTWfv0QlLNwrREd
         fNQXUbffEhCzLhUck8iUigZWU6fbQk51PWTKne4dKDIpmoP9jK6S06xbGxCYHRy2h+lv
         0pZWXcucbOPt7l961hvAtherIcyT0TTM9Ku5o4zPBrZWNiSOfVpJWXix5szBNvr4zYgp
         8IRCLTYK4UOBlyOCkFj6TcLb6Sj5qML18YMr1eXsBM23fUNCzf9ooo7IzacJTDHfbUia
         BabT/KSufRCAVp84CyNWg2+A2LTXM75q3ZPoxlKzMh0zG2FR+DIvCZVuIt+nOuY683Gx
         Kryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OV9ZfoAfAbhk+WQL7FfDGr/G3dfE6dz+V5jHibvfWI=;
        b=Be4Jy0RuWaVIxp5ZO26NKd+glCA+8OtCzC6bT5lP5KeVR3ZElhPH2BHjFgI/2891Rj
         AZb+xm3itwdQ9NZ/PTdWO4DH8vkhmgvo+0A2qQmYWKlBwz0jdgWASWj1TyJb3Wxyuxaa
         INbfFfP7siOrQ9pvBRg3sOQFw6roaPK8AZ7rngXUaG9GXq7QdgmApjuZ1Svol6FwlPxn
         q4VPzJ11J/5xeBvWBmND6jP4Q4TY3RCsItlDG7q7OeYqldlxFbkRjI2ChMzP/F/XiIfV
         iC26+mtmDFR1SLjA4yoOKwlp1DSZtV9lCSPi8GXfuNoM3l5/el8EQ0vX781PC6fgL+jz
         wwLA==
X-Gm-Message-State: ANoB5pkDb20OgaqK1cyK5WwVAGvY5MGxL4F2Nrh4OSt3DPIfLHYotrKa
	cwShIMmke/be4w2Suj6WiBbt5bgOVpM=
X-Google-Smtp-Source: AA0mqf60NBiitm4+zHDpOmUB8lmCrREWO10/++BmfRfjpNaZEgBJJfDvPqOvv9z3oo4JTMryrEVEbg==
X-Received: by 2002:a05:6a00:a16:b0:56a:fd45:d054 with SMTP id p22-20020a056a000a1600b0056afd45d054mr12365881pfh.3.1668393161277;
        Sun, 13 Nov 2022 18:32:41 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/17] powerpc/qspinlock: trylock and initial lock attempt may steal
Date: Mon, 14 Nov 2022 12:31:33 +1000
Message-Id: <20221114023137.2679627-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221114023137.2679627-1-npiggin@gmail.com>
References: <20221114023137.2679627-1-npiggin@gmail.com>
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

This gives trylock slightly more strength, and it also gives most
of the benefit of passing 'val' back through the slowpath without
the complexity.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h | 44 +++++++++++++++++++++++++++-
 arch/powerpc/lib/qspinlock.c         |  9 ++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 3eff2d875bb6..56638175e49b 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -5,6 +5,15 @@
 #include <linux/compiler.h>
 #include <asm/qspinlock_types.h>
 
+/*
+ * The trylock itself may steal. This makes trylocks slightly stronger, and
+ * might make spin locks slightly more efficient when stealing.
+ *
+ * This is compile-time, so if true then there may always be stealers, so the
+ * nosteal paths become unused.
+ */
+#define _Q_SPIN_TRY_LOCK_STEAL 1
+
 static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
 {
 	return READ_ONCE(lock->val);
@@ -26,11 +35,12 @@ static __always_inline u32 queued_spin_encode_locked_val(void)
 	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
 }
 
-static __always_inline int queued_spin_trylock(struct qspinlock *lock)
+static __always_inline int __queued_spin_trylock_nosteal(struct qspinlock *lock)
 {
 	u32 new = queued_spin_encode_locked_val();
 	u32 prev;
 
+	/* Trylock succeeds only when unlocked and no queued nodes */
 	asm volatile(
 "1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
 "	cmpwi	0,%0,0							\n"
@@ -47,6 +57,38 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 	return likely(prev == 0);
 }
 
+static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
+{
+	u32 new = queued_spin_encode_locked_val();
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
+	  "i" (IS_ENABLED(CONFIG_PPC64))
+	: "cr0", "memory");
+
+	return likely(!(prev & ~_Q_TAIL_CPU_MASK));
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
index 51123240da8e..830a90a66f5f 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -24,7 +24,11 @@ struct qnodes {
 
 /* Tuning parameters */
 static int steal_spins __read_mostly = (1<<5);
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+static const bool maybe_stealers = true;
+#else
 static bool maybe_stealers __read_mostly = true;
+#endif
 static int head_spins __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
@@ -527,6 +531,10 @@ void pv_spinlocks_init(void)
 #include <linux/debugfs.h>
 static int steal_spins_set(void *data, u64 val)
 {
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+	/* MAYBE_STEAL remains true */
+	steal_spins = val;
+#else
 	static DEFINE_MUTEX(lock);
 
 	/*
@@ -551,6 +559,7 @@ static int steal_spins_set(void *data, u64 val)
 		steal_spins = val;
 	}
 	mutex_unlock(&lock);
+#endif
 
 	return 0;
 }
-- 
2.37.2


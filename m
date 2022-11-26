Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4F639534
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6vj1QPJz3fQN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:11:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JSdo3Q5d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JSdo3Q5d;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6ft5XPqz3f4B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 21:00:22 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso2991732pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 02:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnxR/O3pw+8kaag+KXP+dy6QBdsBfrsxNbfBQkhzVHo=;
        b=JSdo3Q5dcUDEKKluOZOfbUzRszdTxE0SFRv2CvxlMaO5+nB7+iYVIUp3M4x+MMfoE3
         su9B80E5ikRpnS5a+Cnb6bX2V1x30ig948sOL75XuJQowox8DXXt0EyvOpDvmIo9kT+v
         AJMLDi2OV1I8RShEMyVYLMvMFFLuWlsopYyX76gznF2woMISJy2B+MUlirvh49w8Gy5T
         f3lrvqs5XyGg9GkWYYQyduAtX4QuXj5YtQi6AaDbaLLtWdeQGzAeAXfsar8U1o9F031M
         JhTSjSU9x3L61pcogTULGYa26SHbHFQng89AFN2WdkFFNC7bKOwiF4c/NsSYVuz9GAf/
         jKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnxR/O3pw+8kaag+KXP+dy6QBdsBfrsxNbfBQkhzVHo=;
        b=NsHII7IyyVGGJw6W7XdcO3wj1QRgsDxdLC9N8Tdef05Bkyh0+/pA0omssYS0CRD1VA
         +3kVqnvG2AtiGoWet3jsKaaGVaRD+gPREYvje15jWB529uNptCUT5zAtsBPrdAoNDRnE
         6PwaCpFaQp1e/zQqwxI0PCsrDhgJWQqg3KyjuOcVkz+TsojLv5XxmGynACLVxENSpxoP
         qzr+cpUYNls4UvDFvuFSHLq8BrpNLeQhjs9tp8aCba97ezduGRND2gHa6V4uJcdSxqOX
         3EdPc4e7s6a2rnCdnMlT233abRmJT9/NfcpcY1sDM9Pl66dYMgNAgEYSU7TzcJJjDumi
         iF3A==
X-Gm-Message-State: ANoB5pnZ0tcHyjqt1cL2E6i6CoMSyFtCTrfw9MCi3gJ9FUi/bcGqK3PG
	pTxVyuiAN+TH/y9vzQG5H3pwn3MwJ4Mg7w==
X-Google-Smtp-Source: AA0mqf6wRWi8jgu+GiYQF+bAlFFHy+v1yMxSX0VLgabDfvEHgpwwwrImISJe+4FlIbzpIz3Gd5p00Q==
X-Received: by 2002:a17:902:e94e:b0:188:f3b9:7156 with SMTP id b14-20020a170902e94e00b00188f3b97156mr22759523pll.76.1669456820126;
        Sat, 26 Nov 2022 02:00:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.02.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:00:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/17] powerpc/qspinlock: allow lock stealing in trylock and lock fastpath
Date: Sat, 26 Nov 2022 19:59:27 +1000
Message-Id: <20221126095932.1234527-13-npiggin@gmail.com>
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

This change allows trylock to steal the lock. It also allows the initial
lock attempt to steal the lock rather than bailing out and going to the
slow path.

This gives trylock more strength: without this a continually-contended
lock will never permit a trylock to succeed. With this change, the
trylock has a small but non-zero chance.

It also also gives the lock fastpath most of the benefit of passing the
reservation back through to the steal loop in the slow path without the
complexity.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h | 22 ++++++++++++++++++++--
 arch/powerpc/lib/qspinlock.c         |  9 +++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index be53702e56fc..c9fa83bba1d5 100644
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
@@ -26,13 +35,14 @@ static __always_inline u32 queued_spin_encode_locked_val(void)
 	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
 }
 
-static __always_inline int queued_spin_trylock(struct qspinlock *lock)
+static __always_inline int __queued_spin_trylock_nosteal(struct qspinlock *lock)
 {
 	u32 new = queued_spin_encode_locked_val();
 	u32 prev;
 
+	/* Trylock succeeds only when unlocked and no queued nodes */
 	asm volatile(
-"1:	lwarx	%0,0,%1,%3	# queued_spin_trylock			\n"
+"1:	lwarx	%0,0,%1,%3	# __queued_spin_trylock_nosteal		\n"
 "	cmpwi	0,%0,0							\n"
 "	bne-	2f							\n"
 "	stwcx.	%2,0,%1							\n"
@@ -71,6 +81,14 @@ static __always_inline int __queued_spin_trylock_steal(struct qspinlock *lock)
 	return likely(!(prev & ~_Q_TAIL_CPU_MASK));
 }
 
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
index 03329f4ed238..1cb47a6478a0 100644
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
@@ -483,6 +487,10 @@ void pv_spinlocks_init(void)
 #include <linux/debugfs.h>
 static int steal_spins_set(void *data, u64 val)
 {
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+	/* MAYBE_STEAL remains true */
+	steal_spins = val;
+#else
 	static DEFINE_MUTEX(lock);
 
 	/*
@@ -507,6 +515,7 @@ static int steal_spins_set(void *data, u64 val)
 		steal_spins = val;
 	}
 	mutex_unlock(&lock);
+#endif
 
 	return 0;
 }
-- 
2.37.2


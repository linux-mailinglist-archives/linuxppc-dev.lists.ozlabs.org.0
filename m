Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED05838E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgxp6Gmvz3dxv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwDocyA3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwDocyA3;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtgmN1jxpz3054
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:32:03 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id f11-20020a17090a4a8b00b001f2f7e32d03so4593031pjh.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qQCEf9pGBirwgM0hJNQnJPYL/qYbeKI0Yjx+OBkxNQI=;
        b=mwDocyA3v5EehVq9wDDJ1760Vmldpz+pBsTF2D6GEUkkBE5JwQ6B9fkurD7Ck2CG1w
         uYnQqpHDmGdWK7GfZdmoGneX73g9yojwFtqqiG3ginknCVSUP2lXnvKKrPJROM3g1jOc
         gXWxCg17ssLU6gqUjmpIXVWaxwA0LAr+SrYdyCz6+I+kMUXoEt6C4Zj5QKSvw2v0s0D3
         /t3IkdupQ5mSE1DwalSZO2x9h5v4E4wbmhK4Fqn138LDjrJjGqSRLpwiM8+JefGEPRi+
         Yr+FscSE3hQl8flwV90/DBmvIpWfIQMTfy2jIBchMnwvcy5u3BLcoTejV1DCDt+krZgv
         Q10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qQCEf9pGBirwgM0hJNQnJPYL/qYbeKI0Yjx+OBkxNQI=;
        b=Geve/MQGtN5tqThpGwvLA1fBqbgnpZpIKECU5RurpQb4URLiu9NEEqkhEDtYGBG5E2
         ptr8lLvw5H3rUVVV9xkolG150Kr37Rez+8CdBs7kjSkvbFtjT8abHqoh3smIE6tmarnW
         qAIdq8gpKxNJTKuAQGrpg6nmbZB/Eu7rnsEl8Pmowdl1P2daOdoi+kyk46jIPuIsy+X0
         u4oI8LTuZKaI7b3KiBED7VX9NZS42q2UemhH7L9L5C4RSHKmEseEJ11vesRGlYyocNim
         c3mic14XcpQYs1dJD7JTFSOiY9kGowoOWiV7qhAZY6VqP07hP3vhuf03PeUqSbHy9UPM
         6D8w==
X-Gm-Message-State: AJIora/M+zp0Ngm513nfCL0YrxiE/nKMFIyv7KA+kmn6cR8pUpgzc+l+
	TATr3ZZpRblU9/Et+FRrJUo4i+nXdZc=
X-Google-Smtp-Source: AGRyM1tfDDJyiM1bgQheohaVFpPWHVJHhnG7znfarj39w3xPJ+q+cnlCsG0+PqNMeoIpK8b71+mIIQ==
X-Received: by 2002:a17:90b:388b:b0:1f2:e246:6705 with SMTP id mu11-20020a17090b388b00b001f2e2466705mr8291552pjb.207.1658989921348;
        Wed, 27 Jul 2022 23:32:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:32:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/17] powerpc/qspinlock: trylock and initial lock attempt may steal
Date: Thu, 28 Jul 2022 16:31:16 +1000
Message-Id: <20220728063120.2867508-15-npiggin@gmail.com>
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
index 3b10e31bcf0a..277aef1fab0a 100644
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
 static int HEAD_SPINS __read_mostly = (1<<8);
 
 static bool pv_yield_owner __read_mostly = true;
@@ -522,6 +526,10 @@ void pv_spinlocks_init(void)
 #include <linux/debugfs.h>
 static int steal_spins_set(void *data, u64 val)
 {
+#if _Q_SPIN_TRY_LOCK_STEAL == 1
+	/* MAYBE_STEAL remains true */
+	STEAL_SPINS = val;
+#else
 	static DEFINE_MUTEX(lock);
 
 	mutex_lock(&lock);
@@ -539,6 +547,7 @@ static int steal_spins_set(void *data, u64 val)
 		STEAL_SPINS = val;
 	}
 	mutex_unlock(&lock);
+#endif
 
 	return 0;
 }
-- 
2.35.1


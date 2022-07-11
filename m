Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEDF56D338
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:09:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh850759lz3f34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gGogE3iH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gGogE3iH;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zf4RJ7z3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:18 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id f11so3356325plr.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OKjdm3ih4ly1bz9fxkTZSfyX0ow4MRNkgFKhqnzspLA=;
        b=gGogE3iH2dEQe+djIir7vkwwgbyKq4K8qhdrNLFXXnmFk0RyAZZxx0CISB3ZppamwJ
         D7RnEKhFa0EpDRUSkwOnxqBN4AQAz3ZdHosX9PN28Axa76b0xHuMkrsjOLPPFH6PuzUl
         4IJOBIieQCvg1wpsAKydqsaHCxhqHj7cc+/4QwUIxxoBIsd+8ivJNFVwDOu2XpKX1vw0
         i+215VrJITtW4hy8aC4GKjvFxz8fa4HYesDfWVt1krqz9TdkjPXayW5kZLtEgImc4OJi
         46b6yPlzY8GI8syvt+hrgyT6tvVdr8F8A4wyoeDgHieBi4B7vJ6+Y8LJlx0ZoosnH6iL
         FQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OKjdm3ih4ly1bz9fxkTZSfyX0ow4MRNkgFKhqnzspLA=;
        b=4h9N3QRsiEN35KiYZyEgzKl1TgHeERnKgDZUZxBbfnLR4zRydGOcDgQoXg8fthBGN2
         zBgXL+yNZAdRQy2OvrFisNCLEIIba62Iz5OsHepWIeGS+aW2jMw0E7hVquf5G6fxJj8d
         5mA3/BaoXtMYRpWGpykNToFr7Hm3/DThYBBJ9xLES9DuFEM4kXcLrCWYz6D3Ujm24w7p
         sLHWBiTBAkyxWA4ATeUPN/Pns13P1TqDwC6RbeoBUgzttBZ0oH5iDXKLBscSoJE8xkwD
         wNEdXp6mG7hJ7MlwMByu2aa/GrAU6ihDXvQKhBormOgWNhN2FgZaW6tPGYoD672T5GU8
         Amyw==
X-Gm-Message-State: AJIora9aRR3M9qcXWxAlOdofU3B364n1a9CNRY52nCHima9hRPQda2EA
	GVk0RK/9hUMj/6uNa1+Pjc7L5IAycyA=
X-Google-Smtp-Source: AGRyM1tJPZwr8kK8L54yx3FamXAKqOQjW+mmkyAm2Zq628MA+s9KYPjRtmdxKkEi4joo+MHy7AMEgg==
X-Received: by 2002:a17:90a:6741:b0:1ef:7f62:6cd1 with SMTP id c1-20020a17090a674100b001ef7f626cd1mr14841906pjm.89.1657508716073;
        Sun, 10 Jul 2022 20:05:16 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 07/14] powerpc/qspinlock: store owner CPU in lock word
Date: Mon, 11 Jul 2022 13:04:46 +1000
Message-Id: <20220711030453.150644-8-npiggin@gmail.com>
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

Store the owner CPU number in the lock word so it may be yielded to,
as powerpc's paravirtualised simple spinlocks do.
---
 arch/powerpc/include/asm/qspinlock.h       |  8 +++++++-
 arch/powerpc/include/asm/qspinlock_types.h | 10 ++++++++++
 arch/powerpc/lib/qspinlock.c               |  6 +++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 3ab354159e5e..44601b261e08 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -20,9 +20,15 @@ static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
 	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
 }
 
+static __always_inline u32 queued_spin_get_locked_val(void)
+{
+	/* XXX: make this use lock value in paca like simple spinlocks? */
+	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
+}
+
 static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
-	u32 new = _Q_LOCKED_VAL;
+	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
 	asm volatile(
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 8b20f5e22bba..35f9525381e6 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -29,6 +29,8 @@ typedef struct qspinlock {
  * Bitfields in the lock word:
  *
  *     0: locked bit
+ *  1-14: lock holder cpu
+ *    15: unused bit
  *    16: must queue bit
  * 17-31: tail cpu (+1)
  */
@@ -39,6 +41,14 @@ typedef struct qspinlock {
 #define _Q_LOCKED_MASK		_Q_SET_MASK(LOCKED)
 #define _Q_LOCKED_VAL		(1U << _Q_LOCKED_OFFSET)
 
+#define _Q_OWNER_CPU_OFFSET	1
+#define _Q_OWNER_CPU_BITS	14
+#define _Q_OWNER_CPU_MASK	_Q_SET_MASK(OWNER_CPU)
+
+#if CONFIG_NR_CPUS > (1U << _Q_OWNER_CPU_BITS)
+#error "qspinlock does not support such large CONFIG_NR_CPUS"
+#endif
+
 #define _Q_MUST_Q_OFFSET	16
 #define _Q_MUST_Q_BITS		1
 #define _Q_MUST_Q_MASK		_Q_SET_MASK(MUST_Q)
diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 662a744fa1ee..3c6554a02de7 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -40,7 +40,7 @@ static inline int get_tail_cpu(u32 val)
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void lock_set_locked(struct qspinlock *lock)
 {
-	u32 new = _Q_LOCKED_VAL;
+	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
 	asm volatile(
@@ -58,7 +58,7 @@ static __always_inline void lock_set_locked(struct qspinlock *lock)
 /* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
 static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
 {
-	u32 new = _Q_LOCKED_VAL;
+	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
 	BUG_ON(old & _Q_LOCKED_VAL);
@@ -106,7 +106,7 @@ static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u3
 /* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
 static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
 {
-	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
+	u32 newval = queued_spin_get_locked_val() | (val & _Q_TAIL_CPU_MASK);
 
 	if (__trylock_cmpxchg(lock, val, newval) == val)
 		return 1;
-- 
2.35.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA815838D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgsc4CWcz3fVt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ju0BOKIL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ju0BOKIL;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltgm650Ddz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:50 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id o12so1110173pfp.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyJ+jmz4IBH2O/bPxPGVICixepmmMr/IYZZMyeZagR0=;
        b=ju0BOKILItU/yTUlP+GjAZkYsPlkzJRhtKA1pWg5exAAZ4lsHTPFqZl8+B0c8bsCgb
         p+LisW5UUuTKzAQOn2rwQ2fBSwZeKUXx4hS3vRR1GfxJyQ+LZ0TpCKM8vOIPGamUzbto
         LAcZSkRzRzWHHnpKNsFkLRybb4QxbiFQdvSvlpWFP7wV1BnKHkiH4L9NfYAF2Fw13USM
         ZGyG/yIjrdBtWRU2Pul76WnnqWLafbopQzV6YJZQ8nuSFZ+sJTkORrqZRugrSEiW5R9k
         KhhvzA/3chZj1ZoNQ5qyALEKS3CzamRo/TXkqYFNntMcD5/jTGgOlfrirl15c0VCH1ZQ
         sgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyJ+jmz4IBH2O/bPxPGVICixepmmMr/IYZZMyeZagR0=;
        b=LIf6AxGQdjuPpVGBEHEnuUSpX5usYTYNkqVfEIm/WNWYrvmfChoEpskTbMi2cav/Jx
         OY3MForCWA4g7KO692p4gcWkfiWYjtabjJhb8XNrrRauiTSMnnc/W4x6Ks2YiOeyvlGl
         L/+cnBd5hEgdUCnikmUbHaEUAJrOBkVPk4O6yH87z3yV4NCrVkpYxVjytGF2xcDaqWpP
         ryCzP0WhAiI5CBXQ600LfnUyoevRPSlFlP7QWsG0QWLl+5NhHpaa3vJ/gISV1hvWT1Eb
         ZrmlmqrdoEjNZppMgV3H4y/Dam58gthA8bD7BSAAzce5r5PRaiep5u5ryw01C+QQi7Br
         eC2g==
X-Gm-Message-State: AJIora8rZQwYUDCochYAP3FNGbq0WqpeKDFJEComaP4dwKLzpAuOOmPD
	T/ai9iT7fCzSO+hdDBlNl/Cl8FtBclk=
X-Google-Smtp-Source: AGRyM1uGmrHUGCHfG31OO5qxJGOl62Kp9m68iPhMt6xuIIf7m2Qfo1/xTEtAZYshGLw1wMqGeyY6BQ==
X-Received: by 2002:aa7:8811:0:b0:52a:b0a4:a324 with SMTP id c17-20020aa78811000000b0052ab0a4a324mr26206409pfo.63.1658989907978;
        Wed, 27 Jul 2022 23:31:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/17] powerpc/qspinlock: store owner CPU in lock word
Date: Thu, 28 Jul 2022 16:31:10 +1000
Message-Id: <20220728063120.2867508-9-npiggin@gmail.com>
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
index a906cc8f15fa..aa26cfe21f18 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -50,7 +50,7 @@ static inline int get_tail_cpu(u32 val)
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void lock_set_locked(struct qspinlock *lock)
 {
-	u32 new = _Q_LOCKED_VAL;
+	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
 	asm volatile(
@@ -68,7 +68,7 @@ static __always_inline void lock_set_locked(struct qspinlock *lock)
 /* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
 static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 old)
 {
-	u32 new = _Q_LOCKED_VAL;
+	u32 new = queued_spin_get_locked_val();
 	u32 prev;
 
 	BUG_ON(old & _Q_LOCKED_VAL);
@@ -116,7 +116,7 @@ static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u3
 /* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
 static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
 {
-	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
+	u32 newval = queued_spin_get_locked_val() | (val & _Q_TAIL_CPU_MASK);
 
 	if (__trylock_cmpxchg(lock, val, newval) == val)
 		return 1;
-- 
2.35.1


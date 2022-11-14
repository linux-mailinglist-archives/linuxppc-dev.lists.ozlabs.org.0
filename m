Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 393076274A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:40:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YSS0m1vz3fC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bk4LnQgy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bk4LnQgy;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHV4N8tz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:22 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 62so777808pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEryIjBYLek/I0PLOcZSk5+tDg99RI4q8ip4G/1s8F0=;
        b=bk4LnQgympgfjzNiIk2rzGZuUOw4oaYbPI0OBjfN8rppwpfqz2j6ZOkUDiV2zQ2HF4
         NTLFKJNrQSCTmU0n+g/uyWV3igMdWh+31A86re8ZqCxMVet0kFeIrY7R3HkPMEj+JsFX
         PWqtrJULV53wp40znMgkzofkwD6QLIkz5f0cAXhOypbs74iujh2hvFm3zO1vj+oECVt4
         H23T+uTx/Od1dQ9S88mZ6OM3uzbtfvHPTvv8ncYEmI/f/ej5x6QoyprpeCeOnhZG1Pyu
         YtCpOfrPv/3qKEiBmDvoH5doV9goWH84xRQnh700Qv5GhEthM8CAF7C5R8QM3/IUne4L
         RWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEryIjBYLek/I0PLOcZSk5+tDg99RI4q8ip4G/1s8F0=;
        b=w+Q324oakZNIFkUtGbfHhcnOuZ+GoplJ6r2AJK62Mmw6I2xVbG0rZN84HThrs7it+q
         7akweuo7zEmNfIth1ZaCe4/TmGfXGjOXDLCgvMPjjmFq2OPlOfVdqgDuzA0C50zU35km
         RGi1b8miQYtChTZzrsNEHoFkWAW3jwl0Gqe+nNpj2v22XiQYKPWhOjxh99iTBFsI7oLj
         AEQ3bCq0zYEmQbJuHwRtb4ed2CUf9KBLv5sD/kIesq0X+YxwaZlJagB4J7/XMCeXgwzc
         ZBIplfIP4CsYzYW7d1GY1ogjaXfbLlJPqIKAwCSDWbYYOGaUOEP67lenhi62W/f80oiE
         yTIQ==
X-Gm-Message-State: ANoB5pmvK/gDDRCTr3VAU3AXutpOyKxOsaV2vQsNAI6VOd8/0HzOIdAM
	Q8MA+qGhFMQoR/5BaonFvZ3Jb+DkFNU=
X-Google-Smtp-Source: AA0mqf44sAXDihjUoLOA8vgVoQi2e8EgyiN37sVNJHg7/rPDYdzoEdTR3jj+U7YP7e0UIc3frClh1A==
X-Received: by 2002:a63:4842:0:b0:42f:e191:2d35 with SMTP id x2-20020a634842000000b0042fe1912d35mr10311260pgk.1.1668393139941;
        Sun, 13 Nov 2022 18:32:19 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/17] powerpc/qspinlock: store owner CPU in lock word
Date: Mon, 14 Nov 2022 12:31:27 +1000
Message-Id: <20221114023137.2679627-9-npiggin@gmail.com>
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

Store the owner CPU number in the lock word so it may be yielded to,
as powerpc's paravirtualised simple spinlocks do.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       |  9 ++++++++-
 arch/powerpc/include/asm/qspinlock_types.h | 10 ++++++++++
 arch/powerpc/lib/qspinlock.c               |  9 ++++++---
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 7d300e6883a8..3eff2d875bb6 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -20,8 +20,15 @@ static __always_inline int queued_spin_is_contended(struct qspinlock *lock)
 	return !!(READ_ONCE(lock->val) & _Q_TAIL_CPU_MASK);
 }
 
+static __always_inline u32 queued_spin_encode_locked_val(void)
+{
+	/* XXX: make this use lock value in paca like simple spinlocks? */
+	return _Q_LOCKED_VAL | (smp_processor_id() << _Q_OWNER_CPU_OFFSET);
+}
+
 static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 {
+	u32 new = queued_spin_encode_locked_val();
 	u32 prev;
 
 	asm volatile(
@@ -33,7 +40,7 @@ static __always_inline int queued_spin_trylock(struct qspinlock *lock)
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "2:									\n"
 	: "=&r" (prev)
-	: "r" (&lock->val), "r" (_Q_LOCKED_VAL),
+	: "r" (&lock->val), "r" (new),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
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
index 8f437b0768a5..b25a52251cb3 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -49,6 +49,7 @@ static inline int decode_tail_cpu(u32 val)
 /* Take the lock by setting the lock bit, no other CPUs will touch it. */
 static __always_inline void set_locked(struct qspinlock *lock)
 {
+	u32 new = queued_spin_encode_locked_val();
 	u32 prev, tmp;
 
 	asm volatile(
@@ -58,7 +59,7 @@ static __always_inline void set_locked(struct qspinlock *lock)
 "	bne-	1b							\n"
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 	: "=&r" (prev), "=&r" (tmp)
-	: "r" (&lock->val), "i" (_Q_LOCKED_VAL),
+	: "r" (&lock->val), "r" (new),
 	  "i" (IS_ENABLED(CONFIG_PPC64))
 	: "cr0", "memory");
 
@@ -90,13 +91,15 @@ static __always_inline u32 __trylock_cmpxchg(struct qspinlock *lock, u32 old, u3
 /* Take lock, clearing tail, cmpxchg with old (which must not be locked) */
 static __always_inline int trylock_clear_tail_cpu(struct qspinlock *lock, u32 val)
 {
-	return __trylock_cmpxchg(lock, val, _Q_LOCKED_VAL);
+	u32 newval = queued_spin_encode_locked_val();
+
+	return __trylock_cmpxchg(lock, val, newval);
 }
 
 /* Take lock, preserving tail, cmpxchg with val (which must not be locked) */
 static __always_inline int trylock_with_tail_cpu(struct qspinlock *lock, u32 val)
 {
-	u32 newval = _Q_LOCKED_VAL | (val & _Q_TAIL_CPU_MASK);
+	u32 newval = queued_spin_encode_locked_val() | (val & _Q_TAIL_CPU_MASK);
 
 	return __trylock_cmpxchg(lock, val, newval);
 }
-- 
2.37.2


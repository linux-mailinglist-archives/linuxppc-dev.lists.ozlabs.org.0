Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F462749F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:39:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YRH6JTNz3fDf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:39:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a3Ij+q0/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a3Ij+q0/;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHQ1sdPz3cKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:18 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id o13so9113659pgu.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbFEo/vIKJd/N5UVT8EuUjOzcfNkXiu0/v34zJsyHtA=;
        b=a3Ij+q0/p4tkRHn2a5DRqDpIX7r9OXQ9wTklpo0UPn8R5XYaBmGN9AZ3mlqVGWV/V6
         BUpoo8OZAu0ymo+vfs4Rvvfe+MpEkxHKIzuq3+v3cn8ArbjjJB4N0EU3H0lBbN/wFq7u
         J4Tx65/tcebHmkeM3VcokCG3F+qvm+CNkmGFYgw5w96dnCfejJ8RLkNEPyREdawhdB+i
         QQkyCVboK+EyS50KhntdGJkqbnnzZOzRwc05BmB5pKIE9lZsE7aTe7knvUbemYCUqjGp
         ZLfpS0Sh6qe2z4ugkG4TKRm5IB4ZcNUFwKZHu7yJaH1P9CJ3UMYuhW0Ba73HSj6+sgke
         g2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbFEo/vIKJd/N5UVT8EuUjOzcfNkXiu0/v34zJsyHtA=;
        b=H/avTLAWaMQDuRlo10cs7/bIm4Grm5l4s7sdDDR89maWeOFArHRtUkrWuXYhskSZrx
         /lMpjADWY/oOKRf8CL6EgOGEfrfAi/qT2ykpqZdI/GMx4qcugoySnYYDIxPcX1z8ILYu
         b1ghQwm/2ECcisQEgWBvvlvpIbfrPdP4dLE/SuyQ6SJONp9eMjU7FoEurfcA/6Nmotnq
         9OxR64QdH+5Vi6pm6a36WVMyFfvPFNaU5IMm68OdgyfyTY94g47gl5r2UuC3p7qpvHqa
         uFmt1lrBP/3OtQb/MT/jy2p/wr7YHVuI28wDuvBU6YDcmU6+MRmr32MtvVmcTvn3vQzr
         aisw==
X-Gm-Message-State: ANoB5pl3+xJBAv9TGo9Xidy6zXeWiputLNz0kHiptmtoVQk7SEWZXijX
	T5L1J5ojBD5IKqhETACQg1weMHvNx2U=
X-Google-Smtp-Source: AA0mqf5ScUcUMURaSBD3XABQ9gjy26EP0kZmsvzyu07exu0pPoK5kad9TB5QL0bE0Qwede8PimCv5Q==
X-Received: by 2002:a62:19cf:0:b0:565:af12:c329 with SMTP id 198-20020a6219cf000000b00565af12c329mr12020242pfz.48.1668393136095;
        Sun, 13 Nov 2022 18:32:16 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/17] powerpc/qspinlock: theft prevention to control latency
Date: Mon, 14 Nov 2022 12:31:26 +1000
Message-Id: <20221114023137.2679627-8-npiggin@gmail.com>
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

Give the queue head the ability to stop stealers. After a number of
spins without sucessfully acquiring the lock, the queue head employs
this, which will assure it is the next owner.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock_types.h | 10 ++++-
 arch/powerpc/lib/qspinlock.c               | 52 ++++++++++++++++++++++
 2 files changed, 60 insertions(+), 2 deletions(-)

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
index 872d4628a44d..8f437b0768a5 100644
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
@@ -120,6 +126,22 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
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
@@ -155,6 +177,9 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 	do {
 		u32 val = READ_ONCE(lock->val);
 
+		if (val & _Q_MUST_Q_VAL)
+			break;
+
 		if (unlikely(!(val & _Q_LOCKED_VAL))) {
 			if (trylock_with_tail_cpu(lock, val))
 				return true;
@@ -237,6 +262,9 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		/* We must be the owner, just set the lock bit and acquire */
 		set_locked(lock);
 	} else {
+		int iters = 0;
+		bool mustq = false;
+
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
 		for (;;) {
@@ -245,6 +273,13 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 				break;
 
 			cpu_relax();
+
+			iters++;
+			if (!mustq && iters >= get_head_spins()) {
+				mustq = true;
+				set_mustq(lock);
+				val |= _Q_MUST_Q_VAL;
+			}
 		}
 
 		/* If we're the last queued, must clean up the tail. */
@@ -332,9 +367,26 @@ static int steal_spins_get(void *data, u64 *val)
 
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC156D337
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh84K3dgGz3by9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FhJfYL91;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FhJfYL91;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zc4dKhz3c4k
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:16 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso3727184pjh.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0QWMyXxzMyRq6hI/XusD/3eoPZD0vCnM3p0Mn37XFoM=;
        b=FhJfYL91QF7b4j07ySQLqtjj1dPA+LBMfdj20MxmBNEsrxRlZ9YJtOwSUznFUgoavW
         nPzLy0Hy1TPpt3Feqiw0wqF9JJ1m17wFfYiFspD7F97Wl6wt7rQ+3lOVHV/1ZYhMeBj2
         oOSd8YZ6DwK4dzWZZdyYQsfzNDJBwxDfMQabGuO6HljiHNOOtTiVOEU3O27U1xFXrjGC
         CfefkPU2qrS6KP5VSV34SD1OWxQDQt5ed6VKPkxRBlO+gkbJUjCbz/jVprmcUro5m4sZ
         fjXww4YTe8LOVVjSImBXxCLbo15KMtmtDTNAqHstNFiqIEv6w4sxJxEqWK9oEpXD7gIm
         3b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0QWMyXxzMyRq6hI/XusD/3eoPZD0vCnM3p0Mn37XFoM=;
        b=m0xlla+1m0xD1LdkTSZXbOl/WD3hhxoCzCPHmuQfiOJuXUAVTG627RNziWNmj8PpZf
         +3vL8A0w01tfyRXdUXEMoSA/W57Y0BdKJ30UE361F0McbJ0czHObkoMagi79WImcOZAW
         417WRFBpsRDQcJWFxaISZxB20JLNkTX/a6IKxZ7UIqtyFkst9JQR+boHF+cW/B2DEBjK
         1RMbR5ilk78GIaTV3ZoVBB7nxjRHqmBVD1Qb9IRDfjJpAWetkT+96OTQBfvzzf2V09pf
         eMzEU/B8kg6OOv1ezo7ReehgWl5SEq6w0Ljy0Wv+Cqvd1FVSQCOk9JA2cCTpP06etEtd
         gy4g==
X-Gm-Message-State: AJIora+/cmQ6PZKD9Mc/U4a+O83cVZIF31a43ucayxjgGDg1FnCPM77x
	vfw87IJ7HVPKVa9TqN56/iQVdSc5CHM=
X-Google-Smtp-Source: AGRyM1udV095lkqg/qHzJ8lwlMt+v0nwhl7Ng3HYnucDXUj8bvk/3lSQIqD97X3N8KSXA8ca9aobdA==
X-Received: by 2002:a17:90b:4b41:b0:1ec:cb06:2fa3 with SMTP id mi1-20020a17090b4b4100b001eccb062fa3mr14851179pjb.55.1657508714009;
        Sun, 10 Jul 2022 20:05:14 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 06/14] powerpc/qspinlock: theft prevention to control latency
Date: Mon, 11 Jul 2022 13:04:45 +1000
Message-Id: <20220711030453.150644-7-npiggin@gmail.com>
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

Give the queue head the ability to stop stealers. After a number of
spins without sucessfully acquiring the lock, the queue head employs
this, which will assure it is the next owner.
---
 arch/powerpc/include/asm/qspinlock_types.h | 10 ++++-
 arch/powerpc/lib/qspinlock.c               | 45 +++++++++++++++++++++-
 2 files changed, 52 insertions(+), 3 deletions(-)

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
index cb87991602ff..662a744fa1ee 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -22,6 +22,7 @@ struct qnodes {
 /* Tuning parameters */
 static int STEAL_SPINS __read_mostly = (1<<5);
 static bool MAYBE_STEALERS __read_mostly = true;
+static int HEAD_SPINS __read_mostly = (1<<13);
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
 
@@ -137,6 +138,23 @@ static __always_inline u32 publish_tail_cpu(struct qspinlock *lock, u32 tail)
 	return prev;
 }
 
+static __always_inline u32 lock_set_mustq(struct qspinlock *lock)
+{
+	u32 new = _Q_MUST_Q_VAL;
+	u32 prev;
+
+	asm volatile(
+"1:	lwarx	%0,0,%1		# queued_spin_set_mustq			\n"
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
 static inline struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
 {
 	int cpu = get_tail_cpu(val);
@@ -160,6 +178,9 @@ static inline bool try_to_steal_lock(struct qspinlock *lock)
 	for (iters = 0; iters < STEAL_SPINS; iters++) {
 		u32 val = READ_ONCE(lock->val);
 
+		if (val & _Q_MUST_Q_VAL)
+			break;
+
 		if (val & _Q_LOCKED_VAL) {
 			cpu_relax();
 			continue;
@@ -236,10 +257,14 @@ static inline void queued_spin_lock_mcs_queue(struct qspinlock *lock)
 		/* We must be the owner, just set the lock bit and acquire */
 		lock_set_locked(lock);
 	} else {
+		int iters = 0;
 again:
 		/* We're at the head of the waitqueue, wait for the lock. */
-		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
+		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
+			if (iters++ == HEAD_SPINS)
+				lock_set_mustq(lock);
 			cpu_relax();
+		}
 
 		/* If we're the last queued, must clean up the tail. */
 		if ((val & _Q_TAIL_CPU_MASK) == tail) {
@@ -284,6 +309,7 @@ EXPORT_SYMBOL(queued_spin_lock_slowpath);
 void pv_spinlocks_init(void)
 {
 	STEAL_SPINS = (1<<15);
+	HEAD_SPINS = (1<<13);
 }
 #endif
 
@@ -320,9 +346,26 @@ static int steal_spins_get(void *data, u64 *val)
 
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


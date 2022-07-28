Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2675838CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ltgpt3964z3f8k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W4aX2hl7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W4aX2hl7;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltglx2C78z2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:40 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id o3so972574ple.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZcC2mDAll+4KfiH8LhisJmeCP80W0HEH3VgJ6JyROI=;
        b=W4aX2hl77WKwvaqW56LSO39iuhL0dVmPnKqQ0INS+6ZSzSM9bhLxgWjv+oZlQOoAl5
         6ZFSjyxLLmKXDGHJ3zc0Rhk5UdjADXEQoQa2p4W3sLlZDPLWL20/KYGWpDmm4TK56JgA
         voqBo183TCxinYP9pPyGZzwMVeWAPLCrf4lVtasqynuW+fcycuVoU4msVIUlC9S0kGPO
         LSHlgAS4iQTxwGvBSgAMDlm/4sVXqJz85jkDk33xywBdLr+SNwBTtc3k5w2/WO3VbKAN
         A109s4/QqUOg79dzePR27STCjAyD3PLg46x3PEykP/vSRxWwddaLPE7nkHsFbB97L+fd
         HMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZcC2mDAll+4KfiH8LhisJmeCP80W0HEH3VgJ6JyROI=;
        b=m3lqrJWzlnLfkE81MKOlAxFUyUZUgyxoO6pkqdhQBVR/Iu+6tSykapn6MtgDGXA2qh
         DmNoxiJu/b5rXeUSbz66fId0Qc82kyP19P5E5hy7z0PZSABcGAUqd2jV1f9A6m1/9P4t
         DKnpZGEA8f4SIAW4L4+290/lB3Jm1zu5PejCYPcDpe7mHiRh9KhRBJ5Mceqr7GbnoR/R
         IhRZWfb6d8+PKtWGKWFsVplW3GIPNDn6PRSsaEcP0odzlaytZAgyePDRwHHlnl1M41DG
         XlcxnmLfhXULtcBuh/eEg2Ic7j3NVdEENskZptYnTVPeZx6Xd572XinxGz3MMKoFlk94
         jKJA==
X-Gm-Message-State: AJIora+A2uXAugNXkST+7BnrHAbfDRHNmowJShUlBhWfnSyr819kh8Tm
	1T0m3BWKZrWOXpwnTsfooqffRqyc+Ag=
X-Google-Smtp-Source: AGRyM1srFKFa7lkF4ldVT5EeO1X0z3AEnlPu6Xi/5ed1Pf8W12mycDjpr+rpAAeEIt2chcnxn8MbaA==
X-Received: by 2002:a17:902:8647:b0:16c:e60e:570a with SMTP id y7-20020a170902864700b0016ce60e570amr24391658plt.77.1658989898711;
        Wed, 27 Jul 2022 23:31:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/17] powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
Date: Thu, 28 Jul 2022 16:31:06 +1000
Message-Id: <20220728063120.2867508-5-npiggin@gmail.com>
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

The first 16 bits of the lock are only modified by the owner, and other
modifications always use atomic operations on the entire 32 bits, so
unlocks can use plain stores on the 16 bits. This is the same kind of
optimisation done by core qspinlock code.
---
 arch/powerpc/include/asm/qspinlock.h       |  6 +-----
 arch/powerpc/include/asm/qspinlock_types.h | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index f06117aa60e1..79a1936fb68d 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -38,11 +38,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
-	for (;;) {
-		int val = atomic_read(&lock->val);
-		if (atomic_cmpxchg_release(&lock->val, val, val & ~_Q_LOCKED_VAL) == val)
-			return;
-	}
+	smp_store_release(&lock->locked, 0);
 }
 
 #define arch_spin_is_locked(l)		queued_spin_is_locked(l)
diff --git a/arch/powerpc/include/asm/qspinlock_types.h b/arch/powerpc/include/asm/qspinlock_types.h
index 9630e714c70d..3425dab42576 100644
--- a/arch/powerpc/include/asm/qspinlock_types.h
+++ b/arch/powerpc/include/asm/qspinlock_types.h
@@ -3,12 +3,27 @@
 #define _ASM_POWERPC_QSPINLOCK_TYPES_H
 
 #include <linux/types.h>
+#include <asm/byteorder.h>
 
 typedef struct qspinlock {
-	atomic_t val;
+	union {
+		atomic_t val;
+
+#ifdef __LITTLE_ENDIAN
+		struct {
+			u16	locked;
+			u8	reserved[2];
+		};
+#else
+		struct {
+			u8	reserved[2];
+			u16	locked;
+		};
+#endif
+	};
 } arch_spinlock_t;
 
-#define	__ARCH_SPIN_LOCK_UNLOCKED	{ .val = ATOMIC_INIT(0) }
+#define	__ARCH_SPIN_LOCK_UNLOCKED	{ { .val = ATOMIC_INIT(0) } }
 
 /*
  * Bitfields in the atomic value:
-- 
2.35.1


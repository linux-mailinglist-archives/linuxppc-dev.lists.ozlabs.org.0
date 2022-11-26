Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7D639519
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:02:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NK6jH6Xzvz3f9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 21:02:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TK0VIqDZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TK0VIqDZ;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NK6fK0DqMz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 20:59:52 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b21so5941557plc.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 01:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJtnT2coJLC0jAlY9AcD87HJTvPiETsizDtNvNfuOXI=;
        b=TK0VIqDZXB5ZwgAhKj1TtADQSKWUaolvtj3p3MOOBMZ4r+PCSP8dPMiepBrjh2Q3Vh
         Hk0ivV7y8lY7vQMTn45KXFtWVLe7aFgrqDwAbhUOFcswWyFdANhkK9Wyfr0Cf0u43EO6
         2s8V+A7MZXUynlBXLa3JPGL8cYS7XqAhChZpL/CXa7Hl1n4Pqkd6RF3gMd5a5OPFOKnA
         zy6bfkaYhFWB8nlF/9yDwfzPRrx91+345pviR6khtUkiNkc9rZHWGsNq+dn0E3OkaqsO
         UVhGBwvMS++i5F+/rF8m63HJlKjT6E7nwCin0EiZtpYjxeiizZnI0PKtiRCEWteTWE4E
         woYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJtnT2coJLC0jAlY9AcD87HJTvPiETsizDtNvNfuOXI=;
        b=8C+ePYO0/Zk/GD7Qp3Yc5G61g+WeXYNdCxk8lDnxwl1I6q/VNx+KmAkRUOHj/QKTm3
         Kp7LWD2kcsQA0CFkeU4YP1aZ+KgPABtJ5hJSGOCCcmbhE77umYQRfJNlyat6VgCSufnG
         jJwsjV1PwET5IUHF8obO1dOyogLns0UbbG5WFmEGCM82ESmR+UhvPPVWsIlc7x+nJLXy
         vcfOUqsmuTnl5jkWXPwXMAGEQB/hrhJ56zFnCjArugu9XwrORP0oKQaWKYfJ3kvHNtWj
         hQTu3fM9+MvMjO/1Q31IhQhz2l5LhGSUxMNiqNHtF4T7BKg4kMgaUf3xNBnADX4KNpeQ
         z0Hw==
X-Gm-Message-State: ANoB5plii00QpjOB65w7PuOu2mIuodZjN/evSNT1lL5/vzJrp4kanY1c
	5ovGP3pXac3CVloetAPJcGhV/a0Vkrg5kg==
X-Google-Smtp-Source: AA0mqf5c4me+rrmkaOt5X1+jcyyY2vczIb8j6agYdGLISVGRTOqpc/MDt4P3X2SzEf0ZBZxuEeKShQ==
X-Received: by 2002:a17:90a:ff14:b0:219:1927:27bc with SMTP id ce20-20020a17090aff1400b00219192727bcmr3436445pjb.229.1669456790368;
        Sat, 26 Nov 2022 01:59:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-174-181-90.tpgi.com.au. [110.174.181.90])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090a94c300b00213202d77d9sm4239243pjw.43.2022.11.26.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 01:59:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/17] powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
Date: Sat, 26 Nov 2022 19:59:17 +1000
Message-Id: <20221126095932.1234527-3-npiggin@gmail.com>
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

The first 16 bits of the lock are only modified by the owner, and other
modifications always use atomic operations on the entire 32 bits, so
unlocks can use plain stores on the 16 bits. This is the same kind of
optimisation done by core qspinlock code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/qspinlock.h       |  6 +-----
 arch/powerpc/include/asm/qspinlock_types.h | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index 300c7d2ebe2e..7bc254c55705 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -36,11 +36,7 @@ static __always_inline void queued_spin_lock(struct qspinlock *lock)
 
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
index 20a36dfb14e2..fe87181c59e5 100644
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
  * Bitfields in the lock word:
-- 
2.37.2


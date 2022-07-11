Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9355656D334
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8293m90z3f5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:07:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jzOB2NZM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jzOB2NZM;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh7zV0Wpqz3c5h
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:05:09 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id g4so3671724pgc.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZcC2mDAll+4KfiH8LhisJmeCP80W0HEH3VgJ6JyROI=;
        b=jzOB2NZMmvYJg6N1fAxTVsHBmE/TwoDzJ+AWvirEQRyiNJtMVQjl1YDejD+bDFw8Ry
         NWT89K9folFZFuJLVuetSEooD5wLUDMxwYF92QNEFTgLw3UP+Aka6XgYMnv4aOa6sGl/
         AbnzvdV7guOecjglk+vJkRbGpRuoYrKPuKqkrWQgBWAfviFWifIWbwvBtCPpuE0Dy8ha
         CppPud/RQP4107FW3mPN/Xdfd4aD6NKghEyMioV7snt5aK+l2lstZeSNxomwQv+TWl7A
         ETJmcRuSGvjnhBrBbnztHJktm7sGSo1M6aWSt4C1LX9fCH5pZwIDWioUHwGLne2opzA4
         jS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZcC2mDAll+4KfiH8LhisJmeCP80W0HEH3VgJ6JyROI=;
        b=Rr1dQfbiqVwD3AqG5K4lTN03ni6cmVZg7C/QXwPXclGKU5YirhclRCbtNrvW/ZBbsD
         /3ALk7tJxYx4++WdfpRQ6lKyMqs7cVzwW8HTW4drC5ANdwLUEyLLew6tAQbp+g+rdGli
         J3SlfiQkzJXgVd1/2UEZKBCL4pS1mLchoacEXoUppJv/aOIOX2BLSxla+D51vkIwCiWp
         W4KgHlAD442IDcg5skeU5/54i1VVdgZgHk18TAFpl0R6FBvZxkxaI/nbljuejKfuKiLc
         S0VwAskxrIlU9RV2P6dJojch74DL3O1c6XOk7uGJW/cjSer+mmpDBVIy49rk0eXcAqyO
         m8LQ==
X-Gm-Message-State: AJIora/3ZeD5JrKqeiNPCylZrxXOWZ0mxoxzwaj/lVlTGBXNt/Y7RC35
	5mfIf/JYp4uC3GSnbGn2b/XtWLw0G9M=
X-Google-Smtp-Source: AGRyM1uLY8WS1UHQKLhR/Glbj/w6aWggV9L8SRhnK1WpN+LUQa6/7TFDwlhapsAX5sdvD2aYkDiBcQ==
X-Received: by 2002:a65:6b8a:0:b0:3fc:4c06:8a8d with SMTP id d10-20020a656b8a000000b003fc4c068a8dmr13841063pgw.83.1657508707461;
        Sun, 10 Jul 2022 20:05:07 -0700 (PDT)
Received: from bobo.ibm.com ([203.220.77.143])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a5b0400b001ef8c81959dsm3562232pji.16.2022.07.10.20.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:05:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/14] powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
Date: Mon, 11 Jul 2022 13:04:42 +1000
Message-Id: <20220711030453.150644-4-npiggin@gmail.com>
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


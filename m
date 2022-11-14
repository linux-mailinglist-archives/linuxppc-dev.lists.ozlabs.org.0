Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA90662749C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:36:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YN54RGPz3f78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fv34fExh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fv34fExh;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YHD20WSz3cHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:32:07 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id h193so9102109pgc.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+uMYmD6JNF5IlbnvrwUfhRxoK/tQDZvS1D6p8gYOrI=;
        b=fv34fExhONbhqZjINv2kWqH1e1Xx7LRBv+lVfi3eLQ+RLDMWy4+vtcXG2Q70MfYfmi
         JsnGaM64QiW/T2VzB1ndgWpakyjKLzHsYIfUl8ncow973aj/QT/O7WaNARapp/39/6Qd
         nYb5k5T/JG+hpgkipgI6v5xq1Jlh+RBwib7xVzCgUpw4hUQnwhW2AzXp9U7KHrQgx1g1
         B0ZEJZGcxR/qnCXUYjNx76sCAn5KCZBI7E1JxpgCu1lN+maJZOwoc2fix7lsuiHWtAjA
         mTpotk9tm1wCWiBXYOqUwObTlP7jg4di4WflZF/jYE6rFmT6s2pLf2fTPO4hnl6jKKuk
         Tdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+uMYmD6JNF5IlbnvrwUfhRxoK/tQDZvS1D6p8gYOrI=;
        b=fP4ZpdkbQSBd23wT9EQgiZ+mB8iSzYloMEBhAGoL2YMdFgqY3KH8dIkkQ01BiBmrEA
         tDbDJotrO148/snKXf6qnPRb2yTjwRbQ71NsGAnv8Xbm5KtHYtayh1z8g1WR8lrnF7fJ
         PeHFecTAIBE8gn/B9/CR4ljfGuoCMU0yP1O6ujGT+06qarARwwX4sKHd6ct7cdRcREL6
         4Oc0GWcJVRj/KwSLGl2OdQbUdMRg/yG49eYv0hJHalkkjtul0CG1NbF3/C6WYHNHVfDM
         VSLYldjo/Tksfq5fBaUMDge5IeZOv09GrQuUJ2sWeDD6pFKC4CZfGAdN2Y7OejerSToA
         Y/Hg==
X-Gm-Message-State: ANoB5pnCu3Fd6LlRnpjIrQBqrK/v7QwjiE5MwHZyVD3n+mkGKHKn6Nvs
	+Pkom9k1SpKMXkj71cjVHGzhBQJyLOw=
X-Google-Smtp-Source: AA0mqf42CBsxzsI03lvPUUawAnBCyHIDJy3YprkmgNlN9XEarARMo7QxGrTDFscEgJ/iRzSerRrigQ==
X-Received: by 2002:a65:6b8a:0:b0:470:1187:4dae with SMTP id d10-20020a656b8a000000b0047011874daemr10247481pgw.239.1668393125483;
        Sun, 13 Nov 2022 18:32:05 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:32:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/17] powerpc/qspinlock: use a half-word store to unlock to avoid larx/stcx.
Date: Mon, 14 Nov 2022 12:31:23 +1000
Message-Id: <20221114023137.2679627-5-npiggin@gmail.com>
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
2.37.2


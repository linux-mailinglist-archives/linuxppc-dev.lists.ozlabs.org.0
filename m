Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000D5838CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 08:33:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtgnR11vYz3dxr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 16:32:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pzvXgDBk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pzvXgDBk;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ltglr61t9z2xJ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 16:31:36 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id h21-20020a17090aa89500b001f31a61b91dso1537658pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 23:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QBJGkMKvOadiaACsvYvH5oeRX/m+Hk4425hcs16ZqWY=;
        b=pzvXgDBkkPZ3IEODNDUah0aAXdu2lZVObWQpaY91Hx7pelzDSj2rGgdbLR2LLH601z
         Zfw0KPmwYtY5t19WwLwTUYMDrhYs25axEjyRJyAa2QBYF/JWqIz1LsorMegLKgfKeF0S
         vfJlzxkfB8am2GvVR0TexUW3S37hpDeRBqzc5CLXK0dLB4vOQ+NzQIIpESn3Yz33yNO+
         OEbdPEYyHoi3vjTxsEkwZu9/TuWRO1B8xmBY8AB3iQ7KQUZ452v4v+78XZjw+UPa1xjL
         IFh5+91RzVf0wTgBQh0cpFCy8srH+urQCT5Kigco16r3IJwsvcHCrcMf/seF4+xclEDZ
         XhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QBJGkMKvOadiaACsvYvH5oeRX/m+Hk4425hcs16ZqWY=;
        b=uNkWQgW5d7tCXAMpJ4eqrEG0TQLyT/2Bc/aAANBZORZVSSVnlCnIQ3FLhtZimKdSiu
         p8Brtbi+CKWuaarp2FBC3EnQiVvVar/eMfcnyxAJ3/ge9MmfT5un2edHCVpvV0oXqsRK
         7hvd5mpBgZ+kH1o5PEhsB1hdR3xRc/+QyniRg5muA6D3L3gS9Sv7FJc5k2NNqi3Qm78y
         lxRwiVfLBION6mtBnPoNu6NgjxX7WALpU93agPnT87peWLepVHF/1iJAXl7E2LuxV89o
         4oOVi/XqiMN3FdmcXn9GXqtm1s8KjCYRJJO8s/m5s3U09VG/TwoKz0EtWXXE2RrCvHNX
         IEuQ==
X-Gm-Message-State: AJIora+B5ZjnxUWqWwttDYDEXczmRoMLxBoGYEjq+Me0UJFz635a0MEw
	iLjYRds1Mv11rVuG+z+mApm13373r4w=
X-Google-Smtp-Source: AGRyM1sUIYggCmHUfMmyTatxT/RoNTH2aZ6AQL3vGy8gG+uyq6oUXAsr9/aTDylNcSN/4URFbIl2xw==
X-Received: by 2002:a17:903:245:b0:16b:9c49:6b1c with SMTP id j5-20020a170903024500b0016b9c496b1cmr24175783plh.153.1658989894228;
        Wed, 27 Jul 2022 23:31:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
        by smtp.gmail.com with ESMTPSA id s63-20020a635e42000000b003fadd680908sm189861pgb.83.2022.07.27.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 23:31:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1a/17] powerpc/qspinlock: Prepare qspinlock code
Date: Thu, 28 Jul 2022 16:31:04 +1000
Message-Id: <20220728063120.2867508-3-npiggin@gmail.com>
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

I have a bunch of parallel patches that clean up the generic queued
spinlock code, but the powerpc implementation does not use or depend
on any of that except patch collision. I've based the powerpc series
on top of that work, but it's annoying to post or carry around all
those patches as well. This shim patch takes the powerpc changes and
should be applied first. If powerpc series is to go ahead of the
generic series, then this patch would just be merged into patch 1
of this series. This patch won't compile or do anything useful alone.
---
 arch/powerpc/include/asm/qspinlock.h          | 45 ++++++-------------
 arch/powerpc/include/asm/qspinlock_paravirt.h |  7 ---
 arch/powerpc/include/asm/spinlock.h           |  2 +-
 3 files changed, 15 insertions(+), 39 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h

diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
index b676c4fb90fd..39c1c7f80579 100644
--- a/arch/powerpc/include/asm/qspinlock.h
+++ b/arch/powerpc/include/asm/qspinlock.h
@@ -7,42 +7,32 @@
 
 #define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
 
-#ifdef CONFIG_PARAVIRT_SPINLOCKS
-extern void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-extern void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-extern void __pv_queued_spin_unlock(struct qspinlock *lock);
+void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void __pv_queued_spin_unlock(struct qspinlock *lock);
 
-static __always_inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+static __always_inline void queued_spin_lock(struct qspinlock *lock)
 {
-	if (!is_shared_processor())
-		native_queued_spin_lock_slowpath(lock, val);
+	u32 val = 0;
+
+	if (likely(arch_atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
+		return;
+
+	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
+		queued_spin_lock_slowpath(lock, val);
 	else
 		__pv_queued_spin_lock_slowpath(lock, val);
 }
+#define queued_spin_lock queued_spin_lock
 
-#define queued_spin_unlock queued_spin_unlock
 static inline void queued_spin_unlock(struct qspinlock *lock)
 {
-	if (!is_shared_processor())
+	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
 		smp_store_release(&lock->locked, 0);
 	else
 		__pv_queued_spin_unlock(lock);
 }
-
-#else
-extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
-#endif
-
-static __always_inline void queued_spin_lock(struct qspinlock *lock)
-{
-	u32 val = 0;
-
-	if (likely(arch_atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
-		return;
-
-	queued_spin_lock_slowpath(lock, val);
-}
-#define queued_spin_lock queued_spin_lock
+#define queued_spin_unlock queued_spin_unlock
 
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 #define SPIN_THRESHOLD (1<<15) /* not tuned */
@@ -63,13 +53,6 @@ static __always_inline void pv_kick(int cpu)
 	prod_cpu(cpu);
 }
 
-extern void __pv_init_lock_hash(void);
-
-static inline void pv_spinlocks_init(void)
-{
-	__pv_init_lock_hash();
-}
-
 #endif
 
 /*
diff --git a/arch/powerpc/include/asm/qspinlock_paravirt.h b/arch/powerpc/include/asm/qspinlock_paravirt.h
deleted file mode 100644
index 6b60e7736a47..000000000000
--- a/arch/powerpc/include/asm/qspinlock_paravirt.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_POWERPC_QSPINLOCK_PARAVIRT_H
-#define _ASM_POWERPC_QSPINLOCK_PARAVIRT_H
-
-EXPORT_SYMBOL(__pv_queued_spin_unlock);
-
-#endif /* _ASM_POWERPC_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index bd75872a6334..7dafca8e3f02 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -13,7 +13,7 @@
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()	smp_mb()
 
-#ifndef CONFIG_PARAVIRT_SPINLOCKS
+#ifndef CONFIG_PPC_QUEUED_SPINLOCKS
 static inline void pv_spinlocks_init(void) { }
 #endif
 
-- 
2.35.1


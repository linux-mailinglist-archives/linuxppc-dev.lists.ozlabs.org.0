Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7112F627498
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 03:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9YK32lp2z3f4b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VjqAFgGd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VjqAFgGd;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9YH460L5z2y84
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 13:31:58 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so9356473pjl.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KBn+EwI1JQfjmL1fpysK5LG4QvYI20s42F4pqcXDWQ=;
        b=VjqAFgGdFXYc6CmXF9Xjy0RtfN/d3VpWPLKHPCN8wp2E4tPb/h9jjC5Hb4MagZkL/0
         TDytuZvOJ5OSVk60uvKRuU3ANelQz78vd9oQ77q++z1IbCkwhJ6Krp3uc+UVm3BJ6m2c
         fEt6SeAb61Ff3pm2jRxb00KjmgQ7D52CgBesin4LwyFxsWRZXEmWD784zv+zSiGP1Sfq
         UqzjrUYB3/vleEQDUuJYLuOXkNqxj4M8YOlik8CxpuD5iCnNAedv7VrumN130QFDfotB
         JHQGECZft+pZHTFdYRNIrdlerWJbjgCTUjrfWFx9LZ9/vqVS/3DWSh+mCgcmJudQXoC0
         6HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KBn+EwI1JQfjmL1fpysK5LG4QvYI20s42F4pqcXDWQ=;
        b=FvtyfsbT3Ehl6AjIihraFnFVzbF8TmULkcMIMZ4LcBbmLVlnrbsY6HnZnWu/RGqxbJ
         puhldbs0Is4uWm2iDKsvX2aAP8Z1GaWKMMGbt3WAcasuvjatB8lY5ZH1HXwDrcfTnkg/
         z8WD+OU3dsjeJ8//A1AxT29g/i7IWiGfnRMOh2Z9DFb9zOxJoHG2R7gA8L4nkmQzylhO
         a9cxlKch1G/Ydbjtyj5nKb9nDrCO0JAd/1KZBhJk2UdUAUsfhPGwvPh3yFOl2MxFf3k4
         BlzOMzbaUL/DTPPLTLnlTaOYi+rW8xohwKwlJhSgcRHt2m9m6iDwHORWkNkT3v3Meqw1
         odKg==
X-Gm-Message-State: ANoB5pk7J/hVcldxwY0MrAZHILTSwY0CXmYcVS4WRJbAuiL+bTHzbFu8
	O05w5Qfk/oeO0sJoRuObjgs6J+4KkiQ=
X-Google-Smtp-Source: AA0mqf4sPl5DaGQ0hKnw0oqsPYeAPxbcXYnyOZ752L2OHuE1KtqMEAbhIUwRNoSqrTsQWbBCuQOGiA==
X-Received: by 2002:a17:90b:46c2:b0:212:fbb8:bd02 with SMTP id jx2-20020a17090b46c200b00212fbb8bd02mr11750719pjb.29.1668393114433;
        Sun, 13 Nov 2022 18:31:54 -0800 (PST)
Received: from bobo.ibm.com (14-200-187-164.tpgi.com.au. [14.200.187.164])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902c1c600b00186616b8fbasm5973655plc.10.2022.11.13.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 18:31:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01a/17] powerpc/qspinlock: prepare powerpc qspinlock implementation
Date: Mon, 14 Nov 2022 12:31:20 +1000
Message-Id: <20221114023137.2679627-2-npiggin@gmail.com>
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

This is a merge placeholder with a conflicting series of patches to
generic qspinlocks. Not intended to be standalone, this should be
applied before patch 1.

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index bcf95ce0964f..813a8c3405ad 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -4,7 +4,6 @@ generated-y += syscall_table_64.h
 generated-y += syscall_table_spu.h
 generic-y += export.h
 generic-y += kvm_types.h
-generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
 generic-y += vtime.h
 generic-y += early_ioremap.h
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
 

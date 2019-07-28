Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014577F7F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 15:05:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xNNV5dpRzDqCY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 23:05:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xNGd182yzDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 23:00:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45xNGc1LKtz8swq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 23:00:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45xNGb6Z16z9sBt; Sun, 28 Jul 2019 23:00:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=131.153.2.44; helo=h3.fbrelay.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h3.fbrelay.privateemail.com (h3.fbrelay.privateemail.com
 [131.153.2.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45xNGb43Xpz9sBF
 for <linuxppc-dev@ozlabs.org>; Sun, 28 Jul 2019 23:00:39 +1000 (AEST)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 0777F8096A
 for <linuxppc-dev@ozlabs.org>; Sun, 28 Jul 2019 08:51:35 -0400 (EDT)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 4CF8460044;
 Sun, 28 Jul 2019 08:51:31 -0400 (EDT)
Received: from wrwlf0000.localdomain (unknown [10.20.151.218])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id D2AA460052;
 Sun, 28 Jul 2019 12:51:30 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
Date: Sun, 28 Jul 2019 07:54:36 -0500
Message-Id: <20190728125438.1550-2-cmr@informatik.wtf>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190728125438.1550-1-cmr@informatik.wtf>
References: <20190728125438.1550-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: "Christopher M. Riedl" <cmr@informatik.wtf>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Determining if a processor is in shared processor mode is not a constant
so don't hide it behind a #define.

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index a47f827bc5f1..8631b0b4e109 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 
 #if defined(CONFIG_PPC_SPLPAR)
 /* We only yield to the hypervisor if we are in shared processor mode */
-#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr))
 extern void __spin_yield(arch_spinlock_t *lock);
 extern void __rw_yield(arch_rwlock_t *lock);
 #else /* SPLPAR */
 #define __spin_yield(x)	barrier()
 #define __rw_yield(x)	barrier()
-#define SHARED_PROCESSOR	0
 #endif
 
+static inline bool is_shared_processor(void)
+{
+/* Only server processors have an lppaca struct */
+#ifdef CONFIG_PPC_BOOK3S
+	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
+		lppaca_shared_proc(local_paca->lppaca_ptr));
+#else
+	return false;
+#endif
+}
+
 static inline void arch_spin_lock(arch_spinlock_t *lock)
 {
 	while (1) {
@@ -117,7 +126,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 			break;
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
@@ -136,7 +145,7 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
 		local_irq_restore(flags);
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
@@ -226,7 +235,7 @@ static inline void arch_read_lock(arch_rwlock_t *rw)
 			break;
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__rw_yield(rw);
 		} while (unlikely(rw->lock < 0));
 		HMT_medium();
@@ -240,7 +249,7 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
 			break;
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__rw_yield(rw);
 		} while (unlikely(rw->lock != 0));
 		HMT_medium();
-- 
2.22.0


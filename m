Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFBE8AD0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 05:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466yV45Rr9zDqQf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 13:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466yPn4tgQzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 466yPm3ksdz8x3c
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 466yPm3ClCz9sP9; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 466yPl42Jmz9sND
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 13:10:02 +1000 (AEST)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 3AC6B81469
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:09:59 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 7320260055;
 Mon, 12 Aug 2019 23:09:53 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.206])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 2599F6004F;
 Tue, 13 Aug 2019 03:09:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
Date: Mon, 12 Aug 2019 22:13:12 -0500
Message-Id: <20190813031314.1828-2-cmr@informatik.wtf>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813031314.1828-1-cmr@informatik.wtf>
References: <20190813031314.1828-1-cmr@informatik.wtf>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Determining if a processor is in shared processor mode is not a constant
so don't hide it behind a #define.

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/spinlock.h | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index a47f827bc5f1..e9c60fbcc8fe 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -101,15 +101,27 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 
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
+/*
+ * LPPACA is only available on Pseries so guard anything LPPACA related to
+ * allow other platforms (which include this common header) to compile.
+ */
+#ifdef CONFIG_PPC_PSERIES
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
@@ -117,7 +129,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 			break;
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
@@ -136,7 +148,7 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
 		local_irq_restore(flags);
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
@@ -226,7 +238,7 @@ static inline void arch_read_lock(arch_rwlock_t *rw)
 			break;
 		do {
 			HMT_low();
-			if (SHARED_PROCESSOR)
+			if (is_shared_processor())
 				__rw_yield(rw);
 		} while (unlikely(rw->lock < 0));
 		HMT_medium();
@@ -240,7 +252,7 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
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


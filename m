Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 425608AD1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 05:17:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466yZP6RhrzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 13:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466yPn5cqfzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 466yPm4KMFz99gP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 466yPm3pxWz9sP6; Tue, 13 Aug 2019 13:10:04 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 466yPl4Ncgz9sP3
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 13:10:03 +1000 (AEST)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 3517E81468
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 23:09:59 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id D78D760059;
 Mon, 12 Aug 2019 23:09:53 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.206])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 8AA576004F;
 Tue, 13 Aug 2019 03:09:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 2/3] powerpc/spinlocks: Rename SPLPAR-only spinlocks
Date: Mon, 12 Aug 2019 22:13:13 -0500
Message-Id: <20190813031314.1828-3-cmr@informatik.wtf>
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

The __rw_yield and __spin_yield locks only pertain to SPLPAR mode.
Rename them to make this relationship obvious.

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/spinlock.h | 6 ++++--
 arch/powerpc/lib/locks.c            | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index e9c60fbcc8fe..0d04d468f660 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -101,8 +101,10 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 
 #if defined(CONFIG_PPC_SPLPAR)
 /* We only yield to the hypervisor if we are in shared processor mode */
-extern void __spin_yield(arch_spinlock_t *lock);
-extern void __rw_yield(arch_rwlock_t *lock);
+void splpar_spin_yield(arch_spinlock_t *lock);
+void splpar_rw_yield(arch_rwlock_t *lock);
+#define __spin_yield(x) splpar_spin_yield(x)
+#define __rw_yield(x) splpar_rw_yield(x)
 #else /* SPLPAR */
 #define __spin_yield(x)	barrier()
 #define __rw_yield(x)	barrier()
diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
index 6550b9e5ce5f..6440d5943c00 100644
--- a/arch/powerpc/lib/locks.c
+++ b/arch/powerpc/lib/locks.c
@@ -18,7 +18,7 @@
 #include <asm/hvcall.h>
 #include <asm/smp.h>
 
-void __spin_yield(arch_spinlock_t *lock)
+void splpar_spin_yield(arch_spinlock_t *lock)
 {
 	unsigned int lock_value, holder_cpu, yield_count;
 
@@ -36,14 +36,14 @@ void __spin_yield(arch_spinlock_t *lock)
 	plpar_hcall_norets(H_CONFER,
 		get_hard_smp_processor_id(holder_cpu), yield_count);
 }
-EXPORT_SYMBOL_GPL(__spin_yield);
+EXPORT_SYMBOL_GPL(splpar_spin_yield);
 
 /*
  * Waiting for a read lock or a write lock on a rwlock...
  * This turns out to be the same for read and write locks, since
  * we only know the holder if it is write-locked.
  */
-void __rw_yield(arch_rwlock_t *rw)
+void splpar_rw_yield(arch_rwlock_t *rw)
 {
 	int lock_value;
 	unsigned int holder_cpu, yield_count;
-- 
2.22.0


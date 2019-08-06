Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBA829DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 05:01:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462fY86vHKzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 13:01:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462fT95SNszDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 462fT94JJ1z8xBV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 462fT93mMwz9sDB; Tue,  6 Aug 2019 12:58:05 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 462fT84zRtz9sN4
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Aug 2019 12:58:03 +1000 (AEST)
Received: from MTA-10-4.privateemail.com (mta-10.privateemail.com
 [68.65.122.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 124EF8157F
 for <linuxppc-dev@ozlabs.org>; Mon,  5 Aug 2019 22:58:00 -0400 (EDT)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id A61C960045
 for <linuxppc-dev@ozlabs.org>; Mon,  5 Aug 2019 22:57:54 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.240])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id 6CE6B60033
 for <linuxppc-dev@ozlabs.org>; Tue,  6 Aug 2019 02:57:54 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 3/3] powerpc/spinlocks: Fix oops in shared-processor
 spinlocks
Date: Mon,  5 Aug 2019 22:01:12 -0500
Message-Id: <20190806030112.15232-4-cmr@informatik.wtf>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806030112.15232-1-cmr@informatik.wtf>
References: <20190806030112.15232-1-cmr@informatik.wtf>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Booting w/ ppc64le_defconfig + CONFIG_PREEMPT results in the attached
kernel trace due to calling shared-processor spinlocks while not running
in an SPLPAR. Previously, the out-of-line spinlocks implementations were
selected based on CONFIG_PPC_SPLPAR at compile time without a runtime
shared-processor LPAR check.

To fix, call the actual spinlock implementations from a set of common
functions, spin_yield() and rw_yield(), which check for shared-processor
LPAR during runtime and select the appropriate lock implementation.

[    0.430878] BUG: Kernel NULL pointer dereference at 0x00000100
[    0.431991] Faulting instruction address: 0xc000000000097f88
[    0.432934] Oops: Kernel access of bad area, sig: 7 [#1]
[    0.433448] LE PAGE_SIZE=64K MMU=Radix MMU=Hash PREEMPT SMP NR_CPUS=2048 NUMA PowerNV
[    0.434479] Modules linked in:
[    0.435055] CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.2.0-rc6-00491-g249155c20f9b #28
[    0.435730] NIP:  c000000000097f88 LR: c000000000c07a88 CTR: c00000000015ca10
[    0.436383] REGS: c0000000727079f0 TRAP: 0300   Not tainted  (5.2.0-rc6-00491-g249155c20f9b)
[    0.437004] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 84000424  XER: 20040000
[    0.437874] CFAR: c000000000c07a84 DAR: 0000000000000100 DSISR: 00080000 IRQMASK: 1
[    0.437874] GPR00: c000000000c07a88 c000000072707c80 c000000001546300 c00000007be38a80
[    0.437874] GPR04: c0000000726f0c00 0000000000000002 c00000007279c980 0000000000000100
[    0.437874] GPR08: c000000001581b78 0000000080000001 0000000000000008 c00000007279c9b0
[    0.437874] GPR12: 0000000000000000 c000000001730000 c000000000142558 0000000000000000
[    0.437874] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.437874] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.437874] GPR24: c00000007be38a80 c000000000c002f4 0000000000000000 0000000000000000
[    0.437874] GPR28: c000000072221a00 c0000000726c2600 c00000007be38a80 c00000007be38a80
[    0.443992] NIP [c000000000097f88] __spin_yield+0x48/0xa0
[    0.444523] LR [c000000000c07a88] __raw_spin_lock+0xb8/0xc0
[    0.445080] Call Trace:
[    0.445670] [c000000072707c80] [c000000072221a00] 0xc000000072221a00 (unreliable)
[    0.446425] [c000000072707cb0] [c000000000bffb0c] __schedule+0xbc/0x850
[    0.447078] [c000000072707d70] [c000000000c002f4] schedule+0x54/0x130
[    0.447694] [c000000072707da0] [c0000000001427dc] kthreadd+0x28c/0x2b0
[    0.448389] [c000000072707e20] [c00000000000c1cc] ret_from_kernel_thread+0x5c/0x70
[    0.449143] Instruction dump:
[    0.449821] 4d9e0020 552a043e 210a07ff 79080fe0 0b080000 3d020004 3908b878 794a1f24
[    0.450587] e8e80000 7ce7502a e8e70000 38e70100 <7ca03c2c> 70a70001 78a50020 4d820020
[    0.452808] ---[ end trace 474d6b2b8fc5cb7e ]---

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
Changes since v2:
 - Directly call splpar_*_yield() to avoid duplicate call to
   is_shared_processor() in some cases

 arch/powerpc/include/asm/spinlock.h | 36 ++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 0a8270183770..8935315c80ff 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -103,11 +103,9 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
 /* We only yield to the hypervisor if we are in shared processor mode */
 void splpar_spin_yield(arch_spinlock_t *lock);
 void splpar_rw_yield(arch_rwlock_t *lock);
-#define __spin_yield(x) splpar_spin_yield(x)
-#define __rw_yield(x) splpar_rw_yield(x)
 #else /* SPLPAR */
-#define __spin_yield(x)	barrier()
-#define __rw_yield(x)	barrier()
+static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
+static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
 #endif
 
 static inline bool is_shared_processor(void)
@@ -124,6 +122,22 @@ static inline bool is_shared_processor(void)
 #endif
 }
 
+static inline void spin_yield(arch_spinlock_t *lock)
+{
+	if (is_shared_processor())
+		splpar_spin_yield(lock);
+	else
+		barrier();
+}
+
+static inline void rw_yield(arch_rwlock_t *lock)
+{
+	if (is_shared_processor())
+		splpar_rw_yield(lock);
+	else
+		barrier();
+}
+
 static inline void arch_spin_lock(arch_spinlock_t *lock)
 {
 	while (1) {
@@ -132,7 +146,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
 		do {
 			HMT_low();
 			if (is_shared_processor())
-				__spin_yield(lock);
+				splpar_spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
 	}
@@ -151,7 +165,7 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
 		do {
 			HMT_low();
 			if (is_shared_processor())
-				__spin_yield(lock);
+				splpar_spin_yield(lock);
 		} while (unlikely(lock->slock != 0));
 		HMT_medium();
 		local_irq_restore(flags_dis);
@@ -241,7 +255,7 @@ static inline void arch_read_lock(arch_rwlock_t *rw)
 		do {
 			HMT_low();
 			if (is_shared_processor())
-				__rw_yield(rw);
+				splpar_rw_yield(rw);
 		} while (unlikely(rw->lock < 0));
 		HMT_medium();
 	}
@@ -255,7 +269,7 @@ static inline void arch_write_lock(arch_rwlock_t *rw)
 		do {
 			HMT_low();
 			if (is_shared_processor())
-				__rw_yield(rw);
+				splpar_rw_yield(rw);
 		} while (unlikely(rw->lock != 0));
 		HMT_medium();
 	}
@@ -295,9 +309,9 @@ static inline void arch_write_unlock(arch_rwlock_t *rw)
 	rw->lock = 0;
 }
 
-#define arch_spin_relax(lock)	__spin_yield(lock)
-#define arch_read_relax(lock)	__rw_yield(lock)
-#define arch_write_relax(lock)	__rw_yield(lock)
+#define arch_spin_relax(lock)	spin_yield(lock)
+#define arch_read_relax(lock)	rw_yield(lock)
+#define arch_write_relax(lock)	rw_yield(lock)
 
 /* See include/linux/spinlock.h */
 #define smp_mb__after_spinlock()   smp_mb()
-- 
2.22.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7F27BCF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 08:19:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0q3z4fTTzDqDx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 16:19:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pr809CYzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 16:09:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C0pr36F00z9v05d;
 Tue, 29 Sep 2020 08:09:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uc0stjfnRqHf; Tue, 29 Sep 2020 08:09:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C0pr355Fyz9v05Z;
 Tue, 29 Sep 2020 08:09:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4D188B79F;
 Tue, 29 Sep 2020 08:09:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 36HPGfgjjba6; Tue, 29 Sep 2020 08:09:24 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 514A28B76C;
 Tue, 29 Sep 2020 08:09:24 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2C2E965E8A; Tue, 29 Sep 2020 06:09:24 +0000 (UTC)
Message-Id: <4757e1ed21fe1968c761ae081d1f3d790a9673f8.1601359702.git.christophe.leroy@csgroup.eu>
In-Reply-To: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
References: <27951fa6c9a8f80724d1bc81a6117ac32343a55d.1601359702.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 7/7] powerpc: Remove __USE_RTC()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Sep 2020 06:09:24 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that PowerPC 601 is gone, __USE_RTC() is never true.

Remove it.

That also leads to removing get_rtc() and get_rtcl()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Also remove get_rtc() and get_rtcl()
---
 arch/powerpc/include/asm/time.h | 28 +-----------------
 arch/powerpc/kernel/time.c      | 52 +++++----------------------------
 2 files changed, 9 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index ce065589192a..caf68a4bc19e 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -38,9 +38,6 @@ struct div_result {
 	u64 result_low;
 };
 
-/* Accessor functions for the timebase (RTC on 601) registers. */
-#define __USE_RTC()	(0)
-
 #ifdef CONFIG_PPC64
 
 /* For compatibility, get_tbl() is defined as get_tb() on ppc64 */
@@ -59,25 +56,6 @@ static inline unsigned int get_tbu(void)
 }
 #endif /* !CONFIG_PPC64 */
 
-static inline unsigned int get_rtcl(void)
-{
-	unsigned int rtcl;
-
-	asm volatile("mfrtcl %0" : "=r" (rtcl));
-	return rtcl;
-}
-
-static inline u64 get_rtc(void)
-{
-	unsigned int hi, lo, hi2;
-
-	do {
-		asm volatile("mfrtcu %0; mfrtcl %1; mfrtcu %2"
-			     : "=r" (hi), "=r" (lo), "=r" (hi2));
-	} while (hi2 != hi);
-	return (u64)hi * 1000000000 + lo;
-}
-
 static inline u64 get_vtb(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -109,7 +87,7 @@ static inline u64 get_tb(void)
 
 static inline u64 get_tb_or_rtc(void)
 {
-	return __USE_RTC() ? get_rtc() : get_tb();
+	return get_tb();
 }
 
 static inline void set_tb(unsigned int upper, unsigned int lower)
@@ -153,10 +131,6 @@ static inline void set_dec(u64 val)
 
 static inline unsigned long tb_ticks_since(unsigned long tstamp)
 {
-	if (__USE_RTC()) {
-		int delta = get_rtcl() - (unsigned int) tstamp;
-		return delta < 0 ? delta + 1000000000 : delta;
-	}
 	return get_tbl() - tstamp;
 }
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f85539ebb513..13c820c15d37 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -75,15 +75,6 @@
 #include <linux/clockchips.h>
 #include <linux/timekeeper_internal.h>
 
-static u64 rtc_read(struct clocksource *);
-static struct clocksource clocksource_rtc = {
-	.name         = "rtc",
-	.rating       = 400,
-	.flags        = CLOCK_SOURCE_IS_CONTINUOUS,
-	.mask         = CLOCKSOURCE_MASK(64),
-	.read         = rtc_read,
-};
-
 static u64 timebase_read(struct clocksource *);
 static struct clocksource clocksource_timebase = {
 	.name         = "timebase",
@@ -447,19 +438,9 @@ void vtime_flush(struct task_struct *tsk)
 void __delay(unsigned long loops)
 {
 	unsigned long start;
-	int diff;
 
 	spin_begin();
-	if (__USE_RTC()) {
-		start = get_rtcl();
-		do {
-			/* the RTCL register wraps at 1000000000 */
-			diff = get_rtcl() - start;
-			if (diff < 0)
-				diff += 1000000000;
-			spin_cpu_relax();
-		} while (diff < loops);
-	} else if (tb_invalid) {
+	if (tb_invalid) {
 		/*
 		 * TB is in error state and isn't ticking anymore.
 		 * HMI handler was unable to recover from TB error.
@@ -696,8 +677,6 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
  */
 notrace unsigned long long sched_clock(void)
 {
-	if (__USE_RTC())
-		return get_rtc();
 	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
 }
 
@@ -847,11 +826,6 @@ void read_persistent_clock64(struct timespec64 *ts)
 }
 
 /* clocksource code */
-static notrace u64 rtc_read(struct clocksource *cs)
-{
-	return (u64)get_rtc();
-}
-
 static notrace u64 timebase_read(struct clocksource *cs)
 {
 	return (u64)get_tb();
@@ -948,12 +922,7 @@ void update_vsyscall_tz(void)
 
 static void __init clocksource_init(void)
 {
-	struct clocksource *clock;
-
-	if (__USE_RTC())
-		clock = &clocksource_rtc;
-	else
-		clock = &clocksource_timebase;
+	struct clocksource *clock = &clocksource_timebase;
 
 	if (clocksource_register_hz(clock, tb_ticks_per_sec)) {
 		printk(KERN_ERR "clocksource: %s is already registered\n",
@@ -1071,17 +1040,12 @@ void __init time_init(void)
 	u64 scale;
 	unsigned shift;
 
-	if (__USE_RTC()) {
-		/* 601 processor: dec counts down by 128 every 128ns */
-		ppc_tb_freq = 1000000000;
-	} else {
-		/* Normal PowerPC with timebase register */
-		ppc_md.calibrate_decr();
-		printk(KERN_DEBUG "time_init: decrementer frequency = %lu.%.6lu MHz\n",
-		       ppc_tb_freq / 1000000, ppc_tb_freq % 1000000);
-		printk(KERN_DEBUG "time_init: processor frequency   = %lu.%.6lu MHz\n",
-		       ppc_proc_freq / 1000000, ppc_proc_freq % 1000000);
-	}
+	/* Normal PowerPC with timebase register */
+	ppc_md.calibrate_decr();
+	printk(KERN_DEBUG "time_init: decrementer frequency = %lu.%.6lu MHz\n",
+	       ppc_tb_freq / 1000000, ppc_tb_freq % 1000000);
+	printk(KERN_DEBUG "time_init: processor frequency   = %lu.%.6lu MHz\n",
+	       ppc_proc_freq / 1000000, ppc_proc_freq % 1000000);
 
 	tb_ticks_per_jiffy = ppc_tb_freq / HZ;
 	tb_ticks_per_sec = ppc_tb_freq;
-- 
2.25.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F5331CB7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 03:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvdjb3Vgzz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvdhD52kyz3cJB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 13:00:12 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 51F12AC17;
 Tue,  9 Mar 2021 02:00:10 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: npiggin@gmail.com
Subject: [PATCH 3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
Date: Mon,  8 Mar 2021 17:59:50 -0800
Message-Id: <20210309015950.27688-4-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309015950.27688-1-dave@stgolabs.net>
References: <20210309015950.27688-1-dave@stgolabs.net>
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
Cc: dave@stgolabs.net, Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 paulus@samba.org, longman@redhat.com, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

49a7d46a06c3 (powerpc: Implement smp_cond_load_relaxed()) added
busy-waiting pausing with a preferred SMT priority pattern, lowering
the priority (reducing decode cycles) during the whole loop slowpath.

However, data shows that while this pattern works well with simple
spinlocks, queued spinlocks benefit more being kept in medium priority,
with a cpu_relax() instead, being a low+medium combo on powerpc.

Data is from three benchmarks on a Power9: 9008-22L 64 CPUs with
2 sockets and 8 threads per core.

1. locktorture.

This is data for the lowest and most artificial/pathological level,
with increasing thread counts pounding on the lock. Metrics are total
ops/minute. Despite some small hits in the 4-8 range, scenarios are
either neutral or favorable to this patch.

+=========+==========+==========+=======+
| # tasks | vanilla  | dirty    | %diff |
+=========+==========+==========+=======+
| 2       | 46718565 | 48751350 | 4.35  |
+---------+----------+----------+-------+
| 4       | 51740198 | 50369082 | -2.65 |
+---------+----------+----------+-------+
| 8       | 63756510 | 62568821 | -1.86 |
+---------+----------+----------+-------+
| 16      | 67824531 | 70966546 | 4.63  |
+---------+----------+----------+-------+
| 32      | 53843519 | 61155508 | 13.58 |
+---------+----------+----------+-------+
| 64      | 53005778 | 53104412 | 0.18  |
+---------+----------+----------+-------+
| 128     | 53331980 | 54606910 | 2.39  |
+=========+==========+==========+=======+

2. sockperf (tcp throughput)

Here a client will do one-way throughput tests to a localhost server, with
increasing message sizes, dealing with the sk_lock. This patch shows to put
the performance of the qspinlock back to par with that of the simple lock:

		     simple-spinlock           vanilla			dirty
Hmean     14        73.50 (   0.00%)       54.44 * -25.93%*       73.45 * -0.07%*
Hmean     100      654.47 (   0.00%)      385.61 * -41.08%*      771.43 * 17.87%*
Hmean     300     2719.39 (   0.00%)     2181.67 * -19.77%*     2666.50 * -1.94%*
Hmean     500     4400.59 (   0.00%)     3390.77 * -22.95%*     4322.14 * -1.78%*
Hmean     850     6726.21 (   0.00%)     5264.03 * -21.74%*     6863.12 * 2.04%*

3. dbench (tmpfs)

Configured to run with up to ncpusx8 clients, it shows both latency and
throughput metrics. For the latency, with the exception of the 64 case,
there is really nothing to go by:
				     vanilla                dirty
Amean     latency-1          1.67 (   0.00%)        1.67 *   0.09%*
Amean     latency-2          2.15 (   0.00%)        2.08 *   3.36%*
Amean     latency-4          2.50 (   0.00%)        2.56 *  -2.27%*
Amean     latency-8          2.49 (   0.00%)        2.48 *   0.31%*
Amean     latency-16         2.69 (   0.00%)        2.72 *  -1.37%*
Amean     latency-32         2.96 (   0.00%)        3.04 *  -2.60%*
Amean     latency-64         7.78 (   0.00%)        8.17 *  -5.07%*
Amean     latency-512      186.91 (   0.00%)      186.41 *   0.27%*

For the dbench4 Throughput (misleading but traditional) there's a small
but rather constant improvement:

			     vanilla                dirty
Hmean     1        849.13 (   0.00%)      851.51 *   0.28%*
Hmean     2       1664.03 (   0.00%)     1663.94 *  -0.01%*
Hmean     4       3073.70 (   0.00%)     3104.29 *   1.00%*
Hmean     8       5624.02 (   0.00%)     5694.16 *   1.25%*
Hmean     16      9169.49 (   0.00%)     9324.43 *   1.69%*
Hmean     32     11969.37 (   0.00%)    12127.09 *   1.32%*
Hmean     64     15021.12 (   0.00%)    15243.14 *   1.48%*
Hmean     512    14891.27 (   0.00%)    15162.11 *   1.82%*

Measuring the dbench4 Per-VFS Operation latency, shows some very minor
differences within the noise level, around the 0-1% ranges.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/powerpc/include/asm/barrier.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index aecfde829d5d..7ae29cfb06c0 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -80,22 +80,6 @@ do {									\
 	___p1;								\
 })
 
-#ifdef CONFIG_PPC64
-#define smp_cond_load_relaxed(ptr, cond_expr) ({		\
-	typeof(ptr) __PTR = (ptr);				\
-	__unqual_scalar_typeof(*ptr) VAL;			\
-	VAL = READ_ONCE(*__PTR);				\
-	if (unlikely(!(cond_expr))) {				\
-		spin_begin();					\
-		do {						\
-			VAL = READ_ONCE(*__PTR);		\
-		} while (!(cond_expr));				\
-		spin_end();					\
-	}							\
-	(typeof(*ptr))VAL;					\
-})
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_64
 #define NOSPEC_BARRIER_SLOT   nop
 #elif defined(CONFIG_PPC_FSL_BOOK3E)
-- 
2.26.2


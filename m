Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4B454098
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 07:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvC6c0bfZz2ynw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 17:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kG8ft3Xw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kG8ft3Xw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvC5n6pW5z2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 17:03:09 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5pU2F007777; 
 Wed, 17 Nov 2021 06:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=RXIE9MEFUBfpSHugxSUumc5SCNgTyCj4dbwy29HUcZE=;
 b=kG8ft3XwxDDMLZWH6nrH5zwgmfgy0hrg311S+BA1YXTad7JeUpWh5lXLsQDNLHPV4GLU
 VXKX+js5auQokRmWYYEBxjBZE/IFQZp9rMT1JhqMnG97ADbxXG/lhNZHiOtcLUm6v2dt
 pCR5lhmBaDrg2B7LNqm3NYmc1u+ND7qQCkRGJcN+ePvh6JqlPjgJf7Ekb30CESuGzaCA
 VnkhSG5f4+z+uvlw+TP78D81/Kkuw1Bey16PXV3zjP8RQRBrih9T8pHk+0kFs2MOz1iX
 ZrQMPjwkFY4LYxtDjiqHBx+lzLPiijYvXblxqN1KLsVSwOGUIhHvW2L/kri/MgIhjZC0 rA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccuy7g6aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:03 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5w1Ak012064;
 Wed, 17 Nov 2021 06:03:02 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3ca50bn0qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:03:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH630lf18153896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 06:03:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3AC46A05A;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9DDD6A051;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 06:03:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc/rtas: rtas_busy_delay() improvements
Date: Wed, 17 Nov 2021 00:02:58 -0600
Message-Id: <20211117060259.957178-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117060259.957178-1-nathanl@linux.ibm.com>
References: <20211117060259.957178-1-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 769Esbc_iwskjQXJVTROsNl5f8yKRvQq
X-Proofpoint-GUID: 769Esbc_iwskjQXJVTROsNl5f8yKRvQq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170029
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Generally RTAS cannot block, and in PAPR it is required to return control
to the OS within a few tens of microseconds. In order to support operations
which may take longer to complete, many RTAS primitives can return
intermediate -2 ("busy") or 990x ("extended delay") values, which indicate
that the OS should reattempt the same call with the same arguments at some
point in the future.

Current versions of PAPR are less than clear about this, but the intended
meanings of these values in more detail are:

RTAS_BUSY (-2): RTAS has suspended a potentially long-running operation in
order to meet its latency obligation and give the OS the opportunity to
perform other work. RTAS can resume making progress as soon as the OS
reattempts the call.

RTAS_EXTENDED_DELAY_{MIN...MAX} (9900-9905): RTAS must wait for an external
event to occur or for internal contention to resolve before it can complete
the requested operation. The value encodes a non-binding hint as to roughly
how long the OS should wait before calling again, but the OS is allowed to
reattempt the call sooner or even immediately.

Linux of course must take its own CPU scheduling obligations into account
when handling these statuses; e.g. a task which receives an RTAS_BUSY
status should check whether to reschedule before it attempts the RTAS call
again to avoid starving other tasks.

rtas_busy_delay() is a helper function that "consumes" a busy or extended
delay status. Common usage:

    int rc;

    do {
        rc = rtas_call(rtas_token("some-function"), ...);
    } while (rtas_busy_delay(rc));

    /* convert rc to Linux error value, etc */

If rc is a busy or extended delay status, the caller can rely on
rtas_busy_delay() to perform an appropriate sleep or reschedule and return
nonzero. Other statuses are handled normally by the caller.

The current implementation of rtas_busy_delay() both oversleeps and
overuses the CPU:

*  It performs msleep() for all 990x and even when no delay is
   suggested (-2), but this is understood to actually sleep for two jiffies
   minimum in practice (20ms with HZ=100). 9900 (1ms) and 9901 (10ms)
   appear to be the most common extended delay statuses, and the
   oversleeping measurably lengthens DLPAR operations, which perform
   many RTAS calls.

*  It does not sleep on 990x unless need_resched() is true, causing code
   like the loop above to needlessly retry, wasting CPU time.

Alter the logic to align better with the intended meanings:

*  When passed RTAS_BUSY, perform cond_resched() and return without
   sleeping. The caller should reattempt immediately

*  Always sleep when passed an extended delay status, using usleep_range()
   for precise shorter sleeps. Limit the sleep time to one second even
   though there are higher architected values.

Change rtas_busy_delay()'s return type to bool to better reflect its usage,
and add kernel-doc.

rtas_busy_delay_time() is unchanged, even though it "incorrectly" returns 1
for RTAS_BUSY. There are users of that API with open-coded delay loops in
sensitive contexts that will have to be taken on an individual basis.

Brief results for addition and removal of 5GB memory on a small P9 PowerVM
partition follow. Load was generated with stress-ng --cpu N. For add,
elapsed time is greatly reduced without significant change in the number of
RTAS calls or time spent on CPU. For remove, elapsed time is modestly
reduced, with significant reductions in RTAS calls and time spent on CPU.

With no competing workload (- before, + after):

  Performance counter stats for 'bash -c echo "memory add count 20" > /sys/kernel/dlpar' (10 runs):

-             1,935      probe:rtas_call           #    0.003 M/sec                    ( +-  0.22% )
-            609.99 msec task-clock                #    0.183 CPUs utilized            ( +-  0.19% )
+             1,956      probe:rtas_call           #    0.003 M/sec                    ( +-  0.17% )
+            618.56 msec task-clock                #    0.278 CPUs utilized            ( +-  0.11% )

-            3.3322 +- 0.0670 seconds time elapsed  ( +-  2.01% )
+            2.2222 +- 0.0416 seconds time elapsed  ( +-  1.87% )

  Performance counter stats for 'bash -c echo "memory remove count 20" > /sys/kernel/dlpar' (10 runs):

-             6,224      probe:rtas_call           #    0.008 M/sec                    ( +-  2.57% )
-            750.36 msec task-clock                #    0.190 CPUs utilized            ( +-  2.01% )
+               843      probe:rtas_call           #    0.003 M/sec                    ( +-  0.12% )
+            250.66 msec task-clock                #    0.068 CPUs utilized            ( +-  0.17% )

-            3.9394 +- 0.0890 seconds time elapsed  ( +-  2.26% )
+             3.678 +- 0.113 seconds time elapsed  ( +-  3.07% )

With all CPUs 100% busy (- before, + after):

  Performance counter stats for 'bash -c echo "memory add count 20" > /sys/kernel/dlpar' (10 runs):

-             2,979      probe:rtas_call           #    0.003 M/sec                    ( +-  0.12% )
-          1,096.62 msec task-clock                #    0.105 CPUs utilized            ( +-  0.10% )
+             2,981      probe:rtas_call           #    0.003 M/sec                    ( +-  0.22% )
+          1,095.26 msec task-clock                #    0.154 CPUs utilized            ( +-  0.21% )

-            10.476 +- 0.104 seconds time elapsed  ( +-  1.00% )
+            7.1124 +- 0.0865 seconds time elapsed  ( +-  1.22% )

  Performance counter stats for 'bash -c echo "memory remove count 20" > /sys/kernel/dlpar' (10 runs):

-             2,702      probe:rtas_call           #    0.004 M/sec                    ( +-  4.00% )
-            722.71 msec task-clock                #    0.067 CPUs utilized            ( +-  2.41% )
+             1,246      probe:rtas_call           #    0.003 M/sec                    ( +-  0.25% )
+            487.73 msec task-clock                #    0.049 CPUs utilized            ( +-  0.20% )

-            10.829 +- 0.163 seconds time elapsed  ( +-  1.51% )
+            9.9887 +- 0.0866 seconds time elapsed  ( +-  0.87% )

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---

Notes:
    This could be considered a sequel to:
    
    https://lore.kernel.org/linuxppc-dev/20210504030358.1715034-1-nathanl@linux.ibm.com/
    
    which tried to address both the suboptimal delay behavior as well as naming
    issues. The present change achieves the performance improvement and leaves
    the matter of naming for another time.
    
    I've incorporated Alexey's feedback from that series to avoid division when
    calculating the arguments to usleep_range().

 arch/powerpc/include/asm/rtas.h |  2 +-
 arch/powerpc/kernel/rtas.c      | 74 +++++++++++++++++++++++++++++----
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 9dc97d2f9d27..82e5b055fa2a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -264,7 +264,7 @@ extern void rtas_get_rtc_time(struct rtc_time *rtc_time);
 extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
 
 extern unsigned int rtas_busy_delay_time(int status);
-extern unsigned int rtas_busy_delay(int status);
+bool rtas_busy_delay(int status);
 
 extern int early_init_dt_scan_rtas(unsigned long node,
 		const char *uname, int depth, void *data);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ff80bbad22a5..d686834fe7f5 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -513,17 +513,77 @@ unsigned int rtas_busy_delay_time(int status)
 }
 EXPORT_SYMBOL(rtas_busy_delay_time);
 
-/* For an RTAS busy status code, perform the hinted delay. */
-unsigned int rtas_busy_delay(int status)
+/**
+ * rtas_busy_delay() - helper for RTAS busy and extended delay statuses
+ *
+ * @status: a value returned from rtas_call() or similar APIs which return
+ *          the status of a RTAS function call.
+ *
+ * Context: Process context. May sleep or schedule.
+ *
+ * Return:
+ * * true  - @status is RTAS_BUSY or an extended delay hint. The
+ *           caller may assume that the CPU has been yielded if necessary,
+ *           and that an appropriate delay for @status has elapsed.
+ *           Generally the caller should reattempt the RTAS call which
+ *           yielded @status.
+ *
+ * * false - @status is not @RTAS_BUSY nor an extended delay hint. The
+ *           caller is responsible for handling @status.
+ */
+bool rtas_busy_delay(int status)
 {
 	unsigned int ms;
+	bool ret;
 
-	might_sleep();
-	ms = rtas_busy_delay_time(status);
-	if (ms && need_resched())
-		msleep(ms);
+	switch (status) {
+	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
+		ret = true;
+		ms = rtas_busy_delay_time(status);
+		/*
+		 * The extended delay hint can be as high as 100 seconds.
+		 * Surely any function returning such a status is either
+		 * buggy or isn't going to be significantly slowed by us
+		 * polling at 1HZ. Clamp the sleep time to one second.
+		 */
+		ms = clamp(ms, 1U, 1000U);
+		/*
+		 * The delay hint is an order-of-magnitude suggestion, not
+		 * a minimum. It is fine, possibly even advantageous, for
+		 * us to pause for less time than hinted. For small values,
+		 * use usleep_range() to ensure we don't sleep much longer
+		 * than actually needed.
+		 *
+		 * See Documentation/timers/timers-howto.rst for
+		 * explanation of the threshold used here. In effect we use
+		 * usleep_range() for 9900 and 9901, msleep() for
+		 * 9902-9905.
+		 */
+		if (ms <= 20)
+			usleep_range(ms * 100, ms * 1000);
+		else
+			msleep(ms);
+		break;
+	case RTAS_BUSY:
+		ret = true;
+		/*
+		 * We should call again immediately if there's no other
+		 * work to do.
+		 */
+		cond_resched();
+		break;
+	default:
+		ret = false;
+		/*
+		 * Not a busy or extended delay status; the caller should
+		 * handle @status itself. Ensure we warn on misuses in
+		 * atomic context regardless.
+		 */
+		might_sleep();
+		break;
+	}
 
-	return ms;
+	return ret;
 }
 EXPORT_SYMBOL(rtas_busy_delay);
 
-- 
2.31.1


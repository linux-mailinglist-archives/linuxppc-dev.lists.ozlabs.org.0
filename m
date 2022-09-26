Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA25EB41A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbxbP6r43z3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:03:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U2cpBhDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U2cpBhDJ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbxZn15Wtz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:02:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QLuLia003768
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dMjdDA6T6sidnx8ZTuRQChfhjeiX4s2Qvt4wHtBqNUc=;
 b=U2cpBhDJeqs0H0PryKhWMb1tEMxrAGRG4Np2+matHj5mOpgLUcMUH9zzNkLZMbNlI/kr
 hKQCXbqQfeDUwE2MFx0ZKtD28MkvwjZXhqAhxIpRljpjtpsyY5NOmJ4F8Nl+DKkmEHlk
 9CySNAhCJitPBHaKlI//p8Q278NBTw2ALQNoemZohmXwK5HHGtGMg4ompf4YpUMQgDm5
 cAaPDWEYYoER2MlY/AG0KYvpi32ECjo5wmxU/wieP5t8cVB0ydgVYI7dyQCV3MPT72Au
 gj9d4ZKiBlmhCdhopP/R9mxeT5PI4avhZvu4VuPGMqNBuojXidgOKnk6jM77tHQwuoNV pA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jumefr4g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:53 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28QLr3LR030361
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01dal.us.ibm.com with ESMTP id 3jssha4tcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28QM2qGg8389184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24A8158058
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D1D458057
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:51 +0000 (GMT)
Received: from localhost (unknown [9.163.91.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:02:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/smp: poll cpu_callin_map more aggressively in __cpu_up()
Date: Mon, 26 Sep 2022 17:02:50 -0500
Message-Id: <20220926220250.157022-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eybD25AVU4S3ERlZO5y_LPSM1E9hzbrw
X-Proofpoint-GUID: eybD25AVU4S3ERlZO5y_LPSM1E9hzbrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0
 mlxlogscore=966 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260132
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At boot time, it is not necessary to delay between polls of
cpu_callin_map when waiting for a kicked CPU to come up. Remove the
delay intervals, but preserve the overall deadline (five seconds).

At run time, the first poll result is usually negative and we incur a
sleeping wait. If we spin on the callin word for a short time first,
we can reduce __cpu_up() from dozens of milliseconds to under 1ms in
the common case on a P9 LPAR:

$ ppc64_cpu --smt=off
$ bpftrace -e 'kprobe:__cpu_up {
                 @start[tid] = nsecs;
               }
               kretprobe:__cpu_up /@start[tid]/ {
                 @us = hist((nsecs - @start[tid]) / 1000);
                 delete(@start[tid]);
               }' -c 'ppc64_cpu --smt=on'

Before:

@us:
[16K, 32K)        85 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[32K, 64K)        13 |@@@@@@@                                             |

After:

@us:
[128, 256)        95 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)         3 |@                                                   |

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---

Notes:
    Changes since v2:
    * Use short optimistic spin for hotplug case and fall back to sleeping
      loop.
    * Preserve original deadline for hotplug case, which was effectively
      100 seconds as coded.
    * Improve benchmark by timing __cpu_up() duration directly.
    
    Changes since v1:
    * Do not poll indefinitely; restore the original 5sec timeout

 arch/powerpc/kernel/smp.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 169703fead57..b7ce46bbc6f1 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1257,7 +1257,12 @@ static void cpu_idle_thread_init(unsigned int cpu, struct task_struct *idle)
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 {
-	int rc, c;
+	const unsigned long boot_spin_ms = 5 * MSEC_PER_SEC;
+	const bool booting = system_state < SYSTEM_RUNNING;
+	const unsigned long hp_spin_ms = 1;
+	unsigned long deadline;
+	int rc;
+	const unsigned long spin_wait_ms = booting ? boot_spin_ms : hp_spin_ms;
 
 	/*
 	 * Don't allow secondary threads to come online if inhibited
@@ -1302,22 +1307,23 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 	}
 
 	/*
-	 * wait to see if the cpu made a callin (is actually up).
-	 * use this value that I found through experimentation.
-	 * -- Cort
+	 * At boot time, simply spin on the callin word until the
+	 * deadline passes.
+	 *
+	 * At run time, spin for an optimistic amount of time to avoid
+	 * sleeping in the common case.
 	 */
-	if (system_state < SYSTEM_RUNNING)
-		for (c = 50000; c && !cpu_callin_map[cpu]; c--)
-			udelay(100);
-#ifdef CONFIG_HOTPLUG_CPU
-	else
-		/*
-		 * CPUs can take much longer to come up in the
-		 * hotplug case.  Wait five seconds.
-		 */
-		for (c = 5000; c && !cpu_callin_map[cpu]; c--)
-			msleep(1);
-#endif
+	deadline = jiffies + msecs_to_jiffies(spin_wait_ms);
+	spin_until_cond(cpu_callin_map[cpu] || time_is_before_jiffies(deadline));
+
+	if (!cpu_callin_map[cpu] && system_state >= SYSTEM_RUNNING) {
+		const unsigned long sleep_interval_us = 10 * USEC_PER_MSEC;
+		const unsigned long sleep_wait_ms = 100 * MSEC_PER_SEC;
+
+		deadline = jiffies + msecs_to_jiffies(sleep_wait_ms);
+		while (!cpu_callin_map[cpu] && time_is_after_jiffies(deadline))
+			fsleep(sleep_interval_us);
+	}
 
 	if (!cpu_callin_map[cpu]) {
 		printk(KERN_ERR "Processor %u is stuck.\n", cpu);
-- 
2.37.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 920132D1D30
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:21:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqd876PSnzDqWc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:21:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sxeTJ80/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcV60zW5zDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:13 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LXCYm007449
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ORvdhLnqzSig2nbnaJSBfJ7qxY5kwAg9QvywLSmjVaw=;
 b=sxeTJ80/Nks9VVkA7EvQVmiD94nYYxHlP/2+sQKR70d07PCTEaNZFRXDQ4Vew+8DYqL3
 lkLdeVTu/sdHky0v1vXoeCsShGN1TrDwhpCFCNkUSuUBneideU+0howx7jDk6MMlZhyD
 2SCOfL3LjdScpJoyO5R140k57MWnVMfvPhJGco2k/dIZsAju0t2I6RntUJg4dFGISFlR
 EEJTK9gHaQppd0LIXvaD0uIJE5S7EXQCH9ErpV4YyKFwscQmVd7OGR0qHy3BYuUAIQib
 1Necy8LKEBoAWCN9ehqhWvRFLpI5ocETNcyHOgjTzKCllsuy7fU/CYfdwXaze3gIsmyO vw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359d5p7bke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:11 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7Lm4lU031539
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3581u9fq4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:10 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqAq624576466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:10 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0D7AC059;
 Mon,  7 Dec 2020 21:52:10 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC29DAC05B;
 Mon,  7 Dec 2020 21:52:09 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/28] powerpc/pseries/mobility: use stop_machine for
 join/suspend
Date: Mon,  7 Dec 2020 15:51:44 -0600
Message-Id: <20201207215200.1785968-13-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=1 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070140
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The partition suspend sequence as specified in the platform
architecture requires that all active processor threads call
H_JOIN, which:

- suspends the calling thread until it is the target of
  an H_PROD; or
- immediately returns H_CONTINUE, if the calling thread is the last to
  call H_JOIN. This thread is expected to call ibm,suspend-me to
  completely suspend the partition.

Upon returning from ibm,suspend-me the calling thread must wake all
others using H_PROD.

rtas_ibm_suspend_me_unsafe() uses on_each_cpu() to implement this
protocol, but because of its synchronizing nature this is susceptible
to deadlock versus users of stop_machine() or other callers of
on_each_cpu().

Not only is stop_machine() intended for use cases like this, it
handles error propagation and allows us to keep the data shared
between CPUs minimal: a single atomic counter which ensures exactly
one CPU will wake the others from their joined states.

Switch the migration code to use stop_machine() and a less complex
local implementation of the H_JOIN/ibm,suspend-me logic, which
carries additional benefits:

- more informative error reporting, appropriately ratelimited
- resets the lockup detector / watchdog on resume to prevent lockup
  warnings when the OS has been suspended for a time exceeding the
  threshold.

Fixes: 91dc182ca6e2 ("[PATCH] powerpc: special-case ibm,suspend-me RTAS call")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 132 ++++++++++++++++++++--
 1 file changed, 125 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 573ed48b43d8..5a3951626a96 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -12,9 +12,11 @@
 #include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/kobject.h>
+#include <linux/nmi.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/stat.h>
+#include <linux/stop_machine.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/delay.h>
@@ -405,6 +407,128 @@ static int wait_for_vasi_session_suspending(u64 handle)
 	return ret;
 }
 
+static void prod_single(unsigned int target_cpu)
+{
+	long hvrc;
+	int hwid;
+
+	hwid = get_hard_smp_processor_id(target_cpu);
+	hvrc = plpar_hcall_norets(H_PROD, hwid);
+	if (hvrc == H_SUCCESS)
+		return;
+	pr_err_ratelimited("H_PROD of CPU %u (hwid %d) error: %ld\n",
+			   target_cpu, hwid, hvrc);
+}
+
+static void prod_others(void)
+{
+	unsigned int cpu;
+
+	for_each_online_cpu(cpu) {
+		if (cpu != smp_processor_id())
+			prod_single(cpu);
+	}
+}
+
+static u16 clamp_slb_size(void)
+{
+	u16 prev = mmu_slb_size;
+
+	slb_set_size(SLB_MIN_SIZE);
+
+	return prev;
+}
+
+static int do_suspend(void)
+{
+	u16 saved_slb_size;
+	int status;
+	int ret;
+
+	pr_info("calling ibm,suspend-me on CPU %i\n", smp_processor_id());
+
+	/*
+	 * The destination processor model may have fewer SLB entries
+	 * than the source. We reduce mmu_slb_size to a safe minimum
+	 * before suspending in order to minimize the possibility of
+	 * programming non-existent entries on the destination. If
+	 * suspend fails, we restore it before returning. On success
+	 * the OF reconfig path will update it from the new device
+	 * tree after resuming on the destination.
+	 */
+	saved_slb_size = clamp_slb_size();
+
+	ret = rtas_ibm_suspend_me(&status);
+	if (ret != 0) {
+		pr_err("ibm,suspend-me error: %d\n", status);
+		slb_set_size(saved_slb_size);
+	}
+
+	return ret;
+}
+
+static int do_join(void *arg)
+{
+	atomic_t *counter = arg;
+	long hvrc;
+	int ret;
+
+	/* Must ensure MSR.EE off for H_JOIN. */
+	hard_irq_disable();
+	hvrc = plpar_hcall_norets(H_JOIN);
+
+	switch (hvrc) {
+	case H_CONTINUE:
+		/*
+		 * All other CPUs are offline or in H_JOIN. This CPU
+		 * attempts the suspend.
+		 */
+		ret = do_suspend();
+		break;
+	case H_SUCCESS:
+		/*
+		 * The suspend is complete and this cpu has received a
+		 * prod.
+		 */
+		ret = 0;
+		break;
+	case H_BAD_MODE:
+	case H_HARDWARE:
+	default:
+		ret = -EIO;
+		pr_err_ratelimited("H_JOIN error %ld on CPU %i\n",
+				   hvrc, smp_processor_id());
+		break;
+	}
+
+	if (atomic_inc_return(counter) == 1) {
+		pr_info("CPU %u waking all threads\n", smp_processor_id());
+		prod_others();
+	}
+	/*
+	 * Execution may have been suspended for several seconds, so
+	 * reset the watchdog.
+	 */
+	touch_nmi_watchdog();
+	return ret;
+}
+
+static int pseries_migrate_partition(u64 handle)
+{
+	atomic_t counter = ATOMIC_INIT(0);
+	int ret;
+
+	ret = wait_for_vasi_session_suspending(handle);
+	if (ret)
+		return ret;
+
+	ret = stop_machine(do_join, &counter, cpu_online_mask);
+	if (ret == 0)
+		post_mobility_fixup();
+
+	return ret;
+}
+
 static ssize_t migration_store(struct class *class,
 			       struct class_attribute *attr, const char *buf,
 			       size_t count)
@@ -416,16 +540,10 @@ static ssize_t migration_store(struct class *class,
 	if (rc)
 		return rc;
 
-	rc = wait_for_vasi_session_suspending(streamid);
+	rc = pseries_migrate_partition(streamid);
 	if (rc)
 		return rc;
 
-	rc = rtas_ibm_suspend_me_unsafe(streamid);
-	if (rc)
-		return rc;
-
-	post_mobility_fixup();
-
 	return count;
 }
 
-- 
2.28.0


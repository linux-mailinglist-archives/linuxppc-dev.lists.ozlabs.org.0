Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053D29FAAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:41:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlQr1X09zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 12:41:40 +1100 (AEDT)
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
 header.s=pp1 header.b=rmSjN6kh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkvy1SLmzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U12DXd010647
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qOO6FfWzpnvZ7BkKCXiE/xO1dXl5jiUDyIqlGAVYRJI=;
 b=rmSjN6khCFYSfqYZdMyzjBQyYH42sR6uiw4/bWXw5eRkfZbwKChF0a/nAIEr2adp+zHJ
 nLcH4ub6pH/rKND7oyp6A8YjmOCYtZ9mTryxQ9oRF6cQcqkLMjxu2HB1Z8qWybJa3Tk9
 X4vWUciNIExacwfHSKfRJINk1wNw0V9mS5DCryCWfXqbkO94ToLsKtAP5Dsyv1PF+pZN
 6KjXb6HhXvH75p4VFxUPMWi1aE0pjHbjt08X9ljy5beOBlABFkATZXN1kizNwDNv9VrX
 LIqs9cTkIsewE49yv16jHOx7WlugCXrMxJaecGmUro5JrfP3tNYi62qz2ml5qYTghqrf ZA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fnh0e2cn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1HE7p000700
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 34e1gpc5bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IA0p59638044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:10 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02CFDBE05B;
 Fri, 30 Oct 2020 01:18:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD1CFBE051;
 Fri, 30 Oct 2020 01:18:17 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/29] powerpc/pseries/mobility: use stop_machine for
 join/suspend
Date: Thu, 29 Oct 2020 20:17:49 -0500
Message-Id: <20201030011805.1224603-14-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=1 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
index 1b8ae221b98a..44ca7d4e143d 100644
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
@@ -412,6 +414,128 @@ static int wait_for_vasi_session_suspending(u64 handle)
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
+		goto out;
+
+	ret = stop_machine(do_join, &counter, cpu_online_mask);
+	if (ret == 0)
+		post_mobility_fixup();
+out:
+	return ret;
+}
+
 static ssize_t migration_store(struct class *class,
 			       struct class_attribute *attr, const char *buf,
 			       size_t count)
@@ -423,16 +547,10 @@ static ssize_t migration_store(struct class *class,
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
2.25.4


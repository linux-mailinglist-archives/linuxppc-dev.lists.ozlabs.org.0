Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A61F7366
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:19:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jpts4JcyzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpl55XNBzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C534wZ114638; Fri, 12 Jun 2020 01:12:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kq68jurg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:42 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C54VRx121932;
 Fri, 12 Jun 2020 01:12:42 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kq68jura-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:42 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C5AXtY021982;
 Fri, 12 Jun 2020 05:12:42 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 31g2sb2xtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CfWA53019018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:41 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC6328068;
 Fri, 12 Jun 2020 05:12:41 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF03628060;
 Fri, 12 Jun 2020 05:12:40 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:40 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/18] powerpc/rtas: don't online CPUs for partition suspend
Date: Fri, 12 Jun 2020 00:12:22 -0500
Message-Id: <20200612051238.1007764-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 cotscore=-2147483648 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=3 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Partition suspension, used for hibernation and migration, requires
that the OS place all but one of the LPAR's processor threads into one
of two states prior to calling the ibm,suspend-me RTAS function:

  * the architected offline state (via RTAS stop-self); or
  * the H_JOIN hcall, which does not return until the partition
    resumes execution

Using H_CEDE as the offline mode, introduced by
commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU into
an appropriate offline state"), means that any threads which are
offline from Linux's point of view must be moved to one of those two
states before a partition suspension can proceed.

This was eventually addressed in commit 120496ac2d2d ("powerpc: Bring
all threads online prior to migration/hibernation"), which added code
to temporarily bring up any offline processor threads so they can call
H_JOIN. Conceptually this is fine, but the implementation has had
multiple races with cpu hotplug operations initiated from user
space[1][2][3], the error handling is fragile, and it generates
user-visible cpu hotplug events which is a lot of noise for a platform
feature that's supposed to minimize disruption to workloads.

With commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU
into an appropriate offline state") reverted, this code becomes
unnecessary, so remove it. Since any offline CPUs now are truly
offline from the platform's point of view, it is no longer necessary
to bring up CPUs only to have them call H_JOIN and then go offline
again upon resuming. Only active threads are required to call H_JOIN;
stopped threads can be left alone.

[1] commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and
    serialization during LPM")
[2] commit 9fb603050ffd ("powerpc/rtas: retry when cpu offline races
    with suspend/migration")
[3] commit dfd718a2ed1f ("powerpc/rtas: Fix a potential race between
    CPU-Offline & Migration")

Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h          |   2 -
 arch/powerpc/kernel/rtas.c               | 122 +----------------------
 arch/powerpc/platforms/pseries/suspend.c |  22 +---
 3 files changed, 3 insertions(+), 143 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 014968f25f7e..0107d724e9da 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -253,8 +253,6 @@ extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
 extern void rtas_progress(char *s, unsigned short hex);
 extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
 extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
-extern int rtas_online_cpus_mask(cpumask_var_t cpus);
-extern int rtas_offline_cpus_mask(cpumask_var_t cpus);
 extern int rtas_ibm_suspend_me(u64 handle);
 
 struct rtc_time;
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index a09eba03f180..806d554ce357 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -843,96 +843,6 @@ static void rtas_percpu_suspend_me(void *info)
 	__rtas_suspend_cpu((struct rtas_suspend_me_data *)info, 1);
 }
 
-enum rtas_cpu_state {
-	DOWN,
-	UP,
-};
-
-#ifndef CONFIG_SMP
-static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
-				cpumask_var_t cpus)
-{
-	if (!cpumask_empty(cpus)) {
-		cpumask_clear(cpus);
-		return -EINVAL;
-	} else
-		return 0;
-}
-#else
-/* On return cpumask will be altered to indicate CPUs changed.
- * CPUs with states changed will be set in the mask,
- * CPUs with status unchanged will be unset in the mask. */
-static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
-				cpumask_var_t cpus)
-{
-	int cpu;
-	int cpuret = 0;
-	int ret = 0;
-
-	if (cpumask_empty(cpus))
-		return 0;
-
-	for_each_cpu(cpu, cpus) {
-		struct device *dev = get_cpu_device(cpu);
-
-		switch (state) {
-		case DOWN:
-			cpuret = device_offline(dev);
-			break;
-		case UP:
-			cpuret = device_online(dev);
-			break;
-		}
-		if (cpuret < 0) {
-			pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
-					__func__,
-					((state == UP) ? "up" : "down"),
-					cpu, cpuret);
-			if (!ret)
-				ret = cpuret;
-			if (state == UP) {
-				/* clear bits for unchanged cpus, return */
-				cpumask_shift_right(cpus, cpus, cpu);
-				cpumask_shift_left(cpus, cpus, cpu);
-				break;
-			} else {
-				/* clear bit for unchanged cpu, continue */
-				cpumask_clear_cpu(cpu, cpus);
-			}
-		}
-		cond_resched();
-	}
-
-	return ret;
-}
-#endif
-
-int rtas_online_cpus_mask(cpumask_var_t cpus)
-{
-	int ret;
-
-	ret = rtas_cpu_state_change_mask(UP, cpus);
-
-	if (ret) {
-		cpumask_var_t tmp_mask;
-
-		if (!alloc_cpumask_var(&tmp_mask, GFP_KERNEL))
-			return ret;
-
-		/* Use tmp_mask to preserve cpus mask from first failure */
-		cpumask_copy(tmp_mask, cpus);
-		rtas_offline_cpus_mask(tmp_mask);
-		free_cpumask_var(tmp_mask);
-	}
-
-	return ret;
-}
-
-int rtas_offline_cpus_mask(cpumask_var_t cpus)
-{
-	return rtas_cpu_state_change_mask(DOWN, cpus);
-}
-
 int rtas_ibm_suspend_me(u64 handle)
 {
 	long state;
@@ -940,8 +850,6 @@ int rtas_ibm_suspend_me(u64 handle)
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
 	struct rtas_suspend_me_data data;
 	DECLARE_COMPLETION_ONSTACK(done);
-	cpumask_var_t offline_mask;
-	int cpuret;
 
 	if (!rtas_service_present("ibm,suspend-me"))
 		return -ENOSYS;
@@ -962,9 +870,6 @@ int rtas_ibm_suspend_me(u64 handle)
 		return -EIO;
 	}
 
-	if (!alloc_cpumask_var(&offline_mask, GFP_KERNEL))
-		return -ENOMEM;
-
 	atomic_set(&data.working, 0);
 	atomic_set(&data.done, 0);
 	atomic_set(&data.error, 0);
@@ -973,24 +878,8 @@ int rtas_ibm_suspend_me(u64 handle)
 
 	lock_device_hotplug();
 
-	/* All present CPUs must be online */
-	cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
-	cpuret = rtas_online_cpus_mask(offline_mask);
-	if (cpuret) {
-		pr_err("%s: Could not bring present CPUs online.\n", __func__);
-		atomic_set(&data.error, cpuret);
-		goto out;
-	}
-
 	cpu_hotplug_disable();
 
-	/* Check if we raced with a CPU-Offline Operation */
-	if (!cpumask_equal(cpu_present_mask, cpu_online_mask)) {
-		pr_info("%s: Raced against a concurrent CPU-Offline\n", __func__);
-		atomic_set(&data.error, -EAGAIN);
-		goto out_hotplug_enable;
-	}
-
 	/* Call function on all CPUs.  One of us will make the
 	 * rtas call
 	 */
@@ -1001,18 +890,11 @@ int rtas_ibm_suspend_me(u64 handle)
 	if (atomic_read(&data.error) != 0)
 		printk(KERN_ERR "Error doing global join\n");
 
-out_hotplug_enable:
-	cpu_hotplug_enable();
 
-	/* Take down CPUs not online prior to suspend */
-	cpuret = rtas_offline_cpus_mask(offline_mask);
-	if (cpuret)
-		pr_warn("%s: Could not restore CPUs to offline state.\n",
-				__func__);
+	cpu_hotplug_enable();
 
-out:
 	unlock_device_hotplug();
-	free_cpumask_var(offline_mask);
+
 	return atomic_read(&data.error);
 }
 
diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 0a24a5a185f0..f789693f61f4 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -132,15 +132,11 @@ static ssize_t store_hibernate(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buf, size_t count)
 {
-	cpumask_var_t offline_mask;
 	int rc;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (!alloc_cpumask_var(&offline_mask, GFP_KERNEL))
-		return -ENOMEM;
-
 	stream_id = simple_strtoul(buf, NULL, 16);
 
 	do {
@@ -150,32 +146,16 @@ static ssize_t store_hibernate(struct device *dev,
 	} while (rc == -EAGAIN);
 
 	if (!rc) {
-		/* All present CPUs must be online */
-		cpumask_andnot(offline_mask, cpu_present_mask,
-				cpu_online_mask);
-		rc = rtas_online_cpus_mask(offline_mask);
-		if (rc) {
-			pr_err("%s: Could not bring present CPUs online.\n",
-					__func__);
-			goto out;
-		}
-
 		stop_topology_update();
 		rc = pm_suspend(PM_SUSPEND_MEM);
 		start_topology_update();
-
-		/* Take down CPUs not online prior to suspend */
-		if (!rtas_offline_cpus_mask(offline_mask))
-			pr_warn("%s: Could not restore CPUs to offline "
-					"state.\n", __func__);
 	}
 
 	stream_id = 0;
 
 	if (!rc)
 		rc = count;
-out:
-	free_cpumask_var(offline_mask);
+
 	return rc;
 }
 
-- 
2.25.4


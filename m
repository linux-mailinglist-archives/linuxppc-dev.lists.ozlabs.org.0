Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AD5F594
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 11:28:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fXhd6L8hzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 19:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=huntbag@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fXXQ3d2TzDqZl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 19:21:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x649H9Ni118018
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 05:21:08 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2thee20uqp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 05:21:07 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Thu, 4 Jul 2019 10:21:06 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Jul 2019 10:21:02 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x649L19l46792912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2019 09:21:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 456094C04E;
 Thu,  4 Jul 2019 09:21:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B86F14C052;
 Thu,  4 Jul 2019 09:20:59 +0000 (GMT)
Received: from boston16h.aus.stglabs.ibm.com (unknown [9.3.23.78])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jul 2019 09:20:59 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pm@vger.kernel.org
Subject: [RFC v3 3/3] cpuidle-powernv : Recompute the idle-state timeouts when
 state usage is enabled/disabled
Date: Thu,  4 Jul 2019 04:18:27 -0500
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704091827.19555-1-huntbag@linux.vnet.ibm.com>
References: <20190704091827.19555-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19070409-0008-0000-0000-000002F9CFF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070409-0009-0000-0000-000022672115
Message-Id: <20190704091827.19555-4-huntbag@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907040122
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
Cc: ego@linux.vnet.ibm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 npiggin@gmail.com, Abhishek Goel <huntbag@linux.vnet.ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The disable callback can be used to compute timeout for other states
whenever a state is enabled or disabled. We store the computed timeout
in "timeout" defined in cpuidle state strucure. So, we compute timeout
only when some state is enabled or disabled and not every time in the
fast idle path.
We also use the computed timeout to get timeout for snooze, thus getting
rid of get_snooze_timeout for snooze loop.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---
 drivers/cpuidle/cpuidle-powernv.c | 35 +++++++++++--------------------
 include/linux/cpuidle.h           |  1 +
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index f51478460..7350f404a 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -45,7 +45,6 @@ struct stop_psscr_table {
 static struct stop_psscr_table stop_psscr_table[CPUIDLE_STATE_MAX] __read_mostly;
 
 static u64 default_snooze_timeout __read_mostly;
-static bool snooze_timeout_en __read_mostly;
 
 static u64 forced_wakeup_timeout(struct cpuidle_device *dev,
 				 struct cpuidle_driver *drv,
@@ -67,26 +66,13 @@ static u64 forced_wakeup_timeout(struct cpuidle_device *dev,
 	return 0;
 }
 
-static u64 get_snooze_timeout(struct cpuidle_device *dev,
-			      struct cpuidle_driver *drv,
-			      int index)
+static void pnv_disable_callback(struct cpuidle_device *dev,
+				 struct cpuidle_driver *drv)
 {
 	int i;
 
-	if (unlikely(!snooze_timeout_en))
-		return default_snooze_timeout;
-
-	for (i = index + 1; i < drv->state_count; i++) {
-		struct cpuidle_state *s = &drv->states[i];
-		struct cpuidle_state_usage *su = &dev->states_usage[i];
-
-		if (s->disabled || su->disable)
-			continue;
-
-		return s->target_residency * tb_ticks_per_usec;
-	}
-
-	return default_snooze_timeout;
+	for (i = 0; i < drv->state_count; i++)
+		drv->states[i].timeout = forced_wakeup_timeout(dev, drv, i);
 }
 
 static int snooze_loop(struct cpuidle_device *dev,
@@ -94,16 +80,20 @@ static int snooze_loop(struct cpuidle_device *dev,
 			int index)
 {
 	u64 snooze_exit_time;
+	u64 snooze_timeout = drv->states[index].timeout;
+
+	if (!snooze_timeout)
+		snooze_timeout = default_snooze_timeout;
 
 	set_thread_flag(TIF_POLLING_NRFLAG);
 
 	local_irq_enable();
 
-	snooze_exit_time = get_tb() + get_snooze_timeout(dev, drv, index);
+	snooze_exit_time = get_tb() + snooze_timeout;
 	ppc64_runlatch_off();
 	HMT_very_low();
 	while (!need_resched()) {
-		if (likely(snooze_timeout_en) && get_tb() > snooze_exit_time) {
+		if (get_tb() > snooze_exit_time) {
 			/*
 			 * Task has not woken up but we are exiting the polling
 			 * loop anyway. Require a barrier after polling is
@@ -168,7 +158,7 @@ static int stop_loop(struct cpuidle_device *dev,
 	u64 timeout_tb;
 	int forced_wakeup = 0;
 
-	timeout_tb = forced_wakeup_timeout(dev, drv, index);
+	timeout_tb = drv->states[index].timeout;
 	if (timeout_tb)
 		forced_wakeup = set_dec_before_idle(timeout_tb);
 
@@ -255,6 +245,7 @@ static int powernv_cpuidle_driver_init(void)
 	 */
 
 	drv->cpumask = (struct cpumask *)cpu_present_mask;
+	drv->disable_callback = pnv_disable_callback;
 
 	return 0;
 }
@@ -414,8 +405,6 @@ static int powernv_idle_probe(void)
 		/* Device tree can indicate more idle states */
 		max_idle_state = powernv_add_idle_states();
 		default_snooze_timeout = TICK_USEC * tb_ticks_per_usec;
-		if (max_idle_state > 1)
-			snooze_timeout_en = true;
  	} else
  		return -ENODEV;
 
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index 8a0e54bd0..31662b657 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -50,6 +50,7 @@ struct cpuidle_state {
 	int		power_usage; /* in mW */
 	unsigned int	target_residency; /* in US */
 	bool		disabled; /* disabled on all CPUs */
+	unsigned long long timeout; /* timeout for exiting out of a state */
 
 	int (*enter)	(struct cpuidle_device *dev,
 			struct cpuidle_driver *drv,
-- 
2.17.1


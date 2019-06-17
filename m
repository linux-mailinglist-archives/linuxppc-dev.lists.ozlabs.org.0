Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A947F33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 12:05:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S6KF2xxvzDqML
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 20:05:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S6D21fwtzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 20:00:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H9wqlD019203
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 06:00:47 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t66vb4ru2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 06:00:47 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Mon, 17 Jun 2019 11:00:45 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 11:00:40 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HA0dQj54853752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 10:00:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE041A406B;
 Mon, 17 Jun 2019 10:00:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EABBA4051;
 Mon, 17 Jun 2019 10:00:38 +0000 (GMT)
Received: from boston16h.aus.stglabs.ibm.com (unknown [9.3.23.78])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 10:00:38 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 1/1] cpuidle-powernv : forced wakeup for stop states
Date: Mon, 17 Jun 2019 04:56:48 -0500
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617095648.18847-1-huntbag@linux.vnet.ibm.com>
References: <20190617095648.18847-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19061710-4275-0000-0000-00000342FDA9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061710-4276-0000-0000-000038531FEB
Message-Id: <20190617095648.18847-2-huntbag@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170093
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

Currently, the cpuidle governors determine what idle state a idling CPU
should enter into based on heuristics that depend on the idle history on
that CPU. Given that no predictive heuristic is perfect, there are cases
where the governor predicts a shallow idle state, hoping that the CPU will
be busy soon. However, if no new workload is scheduled on that CPU in the
near future, the CPU may end up in the shallow state.

This is problematic, when the predicted state in the aforementioned
scenario is a shallow stop state on a tickless system. As we might get
stuck into shallow states for hours, in absence of ticks or interrupts.

To address this, We forcefully wakeup the cpu by setting the
decrementer. The decrementer is set to a value that corresponds with the
residency of the next available state. Thus firing up a timer that will
forcefully wakeup the cpu. Few such iterations will essentially train the
governor to select a deeper state for that cpu, as the timer here
corresponds to the next available cpuidle state residency. Thus, cpu will
eventually end up in the deepest possible state.

Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
---

Auto-promotion
 v1 : started as auto promotion logic for cpuidle states in generic
driver
 v2 : Removed timeout_needed and rebased the code to upstream kernel
Forced-wakeup
 v1 : New patch with name of forced wakeup started
 v2 : Extending the forced wakeup logic for all states. Setting the
decrementer instead of queuing up a hrtimer to implement the logic.

 drivers/cpuidle/cpuidle-powernv.c | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index 84b1ebe212b3..bc9ca18ae7e3 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -46,6 +46,26 @@ static struct stop_psscr_table stop_psscr_table[CPUIDLE_STATE_MAX] __read_mostly
 static u64 default_snooze_timeout __read_mostly;
 static bool snooze_timeout_en __read_mostly;
 
+static u64 forced_wakeup_timeout(struct cpuidle_device *dev,
+				 struct cpuidle_driver *drv,
+				 int index)
+{
+	int i;
+
+	for (i = index + 1; i < drv->state_count; i++) {
+		struct cpuidle_state *s = &drv->states[i];
+		struct cpuidle_state_usage *su = &dev->states_usage[i];
+
+		if (s->disabled || su->disable)
+			continue;
+
+		return (s->target_residency + 2 * s->exit_latency) *
+			tb_ticks_per_usec;
+	}
+
+	return 0;
+}
+
 static u64 get_snooze_timeout(struct cpuidle_device *dev,
 			      struct cpuidle_driver *drv,
 			      int index)
@@ -144,8 +164,26 @@ static int stop_loop(struct cpuidle_device *dev,
 		     struct cpuidle_driver *drv,
 		     int index)
 {
+	u64 dec_expiry_tb, dec, timeout_tb, forced_wakeup;
+
+	dec = mfspr(SPRN_DEC);
+	timeout_tb = forced_wakeup_timeout(dev, drv, index);
+	forced_wakeup = 0;
+
+	if (timeout_tb && timeout_tb < dec) {
+		forced_wakeup = 1;
+		dec_expiry_tb = mftb() + dec;
+	}
+
+	if (forced_wakeup)
+		mtspr(SPRN_DEC, timeout_tb);
+
 	power9_idle_type(stop_psscr_table[index].val,
 			 stop_psscr_table[index].mask);
+
+	if (forced_wakeup)
+		mtspr(SPRN_DEC, dec_expiry_tb - mftb());
+
 	return index;
 }
 
-- 
2.17.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89EC984C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 08:33:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kNVy6BDczDqXX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 16:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=huntbag@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kNQp6cc6zDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 16:29:54 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x936Lw49045837
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 3 Oct 2019 02:29:52 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vd587146u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Oct 2019 02:29:52 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <huntbag@linux.vnet.ibm.com>;
 Thu, 3 Oct 2019 07:29:50 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 3 Oct 2019 07:29:46 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x936TkI448693282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 06:29:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4ECFA405B;
 Thu,  3 Oct 2019 06:29:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65574A405C;
 Thu,  3 Oct 2019 06:29:44 +0000 (GMT)
Received: from boston16h.aus.stglabs.ibm.com (unknown [9.3.23.78])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 06:29:44 +0000 (GMT)
From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
To: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/3] cpuidle-powernv : forced wakeup for stop states
Date: Thu,  3 Oct 2019 01:26:44 -0500
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003062646.54258-1-huntbag@linux.vnet.ibm.com>
References: <20191003062646.54258-1-huntbag@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19100306-0008-0000-0000-0000031D8E1E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100306-0009-0000-0000-00004A3C93E0
Message-Id: <20191003062646.54258-2-huntbag@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030061
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
  v3 : Cleanly handle setting/resetting of decrementer so as to not break
irq work
  v4 : Changed type and name of set/reset decrementer fucntion
       Handled irq_work_pending in try_set_dec_before_idle
  v5 : Removed forced wakeup for last stop state by changing the
       checking conditon of timeout_tb

 arch/powerpc/include/asm/time.h   |  2 ++
 arch/powerpc/kernel/time.c        | 43 +++++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-powernv.c | 40 ++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 08dbe3e68..06a6a2314 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -184,6 +184,8 @@ static inline unsigned long tb_ticks_since(unsigned long tstamp)
 extern u64 mulhdu(u64, u64);
 #endif
 
+extern bool try_set_dec_before_idle(u64 timeout);
+extern void try_reset_dec_after_idle(void);
 extern void div128_by_32(u64 dividend_high, u64 dividend_low,
 			 unsigned divisor, struct div_result *dr);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308..d004c0d8e 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -576,6 +576,49 @@ void arch_irq_work_raise(void)
 
 #endif /* CONFIG_IRQ_WORK */
 
+/*
+ * This function tries setting decrementer before entering into idle.
+ * Returns true if we have reprogrammed the decrementer for idle.
+ * Returns false if the decrementer is unchanged.
+ */
+bool try_set_dec_before_idle(u64 timeout)
+{
+	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
+	u64 now = get_tb_or_rtc();
+
+	if (now + timeout > *next_tb)
+		return false;
+
+	set_dec(timeout);
+	if (test_irq_work_pending())
+		set_dec(1);
+
+	return true;
+}
+
+/*
+ * This function gets called if we have set decrementer before
+ * entering into idle. It tries to reset/restore the decrementer
+ * to its original value.
+ */
+void try_reset_dec_after_idle(void)
+{
+	u64 now;
+	u64 *next_tb;
+
+	if (test_irq_work_pending())
+		return;
+
+	now = get_tb_or_rtc();
+	next_tb = this_cpu_ptr(&decrementers_next_tb);
+	if (now >= *next_tb)
+		return;
+
+	set_dec(*next_tb - now);
+	if (test_irq_work_pending())
+		set_dec(1);
+}
+
 /*
  * timer_interrupt - gets called when the decrementer overflows,
  * with interrupts disabled.
diff --git a/drivers/cpuidle/cpuidle-powernv.c b/drivers/cpuidle/cpuidle-powernv.c
index 84b1ebe21..d7686ce6e 100644
--- a/drivers/cpuidle/cpuidle-powernv.c
+++ b/drivers/cpuidle/cpuidle-powernv.c
@@ -21,6 +21,7 @@
 #include <asm/opal.h>
 #include <asm/runlatch.h>
 #include <asm/cpuidle.h>
+#include <asm/time.h>
 
 /*
  * Expose only those Hardware idle states via the cpuidle framework
@@ -46,6 +47,26 @@ static struct stop_psscr_table stop_psscr_table[CPUIDLE_STATE_MAX] __read_mostly
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
@@ -144,8 +165,27 @@ static int stop_loop(struct cpuidle_device *dev,
 		     struct cpuidle_driver *drv,
 		     int index)
 {
+	u64 timeout_tb;
+	bool forced_wakeup = false;
+
+	timeout_tb = forced_wakeup_timeout(dev, drv, index);
+
+	if (timeout_tb) {
+		/* Ensure that the timeout is at least one microsecond
+		 * greater than current decrement value. Else, we will
+		 * unnecesarily wakeup again within a microsecond if we
+		 * set decrementer with such timeout value.
+		 */
+		timeout_tb += 512;
+		forced_wakeup = try_set_dec_before_idle(timeout_tb);
+	}
+
 	power9_idle_type(stop_psscr_table[index].val,
 			 stop_psscr_table[index].mask);
+
+	if (forced_wakeup)
+		try_reset_dec_after_idle();
+
 	return index;
 }
 
-- 
2.17.1


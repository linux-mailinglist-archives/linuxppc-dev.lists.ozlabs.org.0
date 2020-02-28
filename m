Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6389C173214
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 08:52:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TMFk5GZgzDrL6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 18:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TMD322xnzDrHP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 18:50:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S7oRFk073702
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 02:50:54 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepxfcgqq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 02:50:53 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Fri, 28 Feb 2020 07:50:51 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 28 Feb 2020 07:50:49 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01S7omTd54525972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 07:50:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 022F652050;
 Fri, 28 Feb 2020 07:50:48 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.58.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E7D055204F;
 Fri, 28 Feb 2020 07:50:46 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 1/2] powerpc/perf: Implement a global lock to avoid races
 between trace, core and thread imc events.
Date: Fri, 28 Feb 2020 13:20:42 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022807-0016-0000-0000-000002EB11A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022807-0017-0000-0000-0000334E4983
Message-Id: <20200228075043.28364-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_02:2020-02-26,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 adultscore=0 suspectscore=1 impostorscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280065
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IMC(In-memory Collection Counters) does performance monitoring in
two different modes, i.e accumulation mode(core-imc and thread-imc events),
and trace mode(trace-imc events). A cpu thread can either be in
accumulation-mode or trace-mode at a time and this is done via the LDBAR
register in POWER architecture. The current design does not address the
races between thread-imc and trace-imc events.

Patch implements a global id and lock to avoid the races between
core, trace and thread imc events. With this global id-lock
implementation, the system can either run core, thread or trace imc
events at a time. i.e. to run any core-imc events, thread/trace imc events
should not be enabled/monitored.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
Changes from v2->v3:

- Addressed the off-line comments from Michael Ellerman
- Optimized the *_event_init code path for trace, core and thread imc
- Handled the global refc in cpuhotplug scenario
- Re-order the patch series
- Removed the selftest patches and will send as a follow up patch

Changes from v1 -> v2:

- Added self test patches to the series.
---
 arch/powerpc/perf/imc-pmu.c | 165 ++++++++++++++++++++++++++++++------
 1 file changed, 141 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index cb50a9e1fd2d..a366e2ec0351 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -44,6 +44,16 @@ static DEFINE_PER_CPU(u64 *, trace_imc_mem);
 static struct imc_pmu_ref *trace_imc_refc;
 static int trace_imc_mem_size;

+/*
+ * Global data structure used to avoid races between thread,
+ * core and trace-imc
+ */
+static struct imc_pmu_ref imc_global_refc = {
+	.lock = __MUTEX_INITIALIZER(imc_global_refc.lock),
+	.id = 0,
+	.refc = 0,
+};
+
 static struct imc_pmu *imc_event_to_pmu(struct perf_event *event)
 {
 	return container_of(event->pmu, struct imc_pmu, pmu);
@@ -698,6 +708,13 @@ static int ppc_core_imc_cpu_offline(unsigned int cpu)
 			return -EINVAL;

 		ref->refc = 0;
+		/*
+		 * Reduce the global reference count, if this is the
+		 * last cpu in this core and core-imc event running
+		 * in this cpu.
+		 */
+		if (imc_global_refc.id == IMC_DOMAIN_CORE)
+			imc_global_refc.refc--;
 	}
 	return 0;
 }
@@ -710,6 +727,23 @@ static int core_imc_pmu_cpumask_init(void)
 				 ppc_core_imc_cpu_offline);
 }

+static void reset_global_refc(struct perf_event *event)
+{
+		mutex_lock(&imc_global_refc.lock);
+		imc_global_refc.refc--;
+
+		/*
+		 * If no other thread is running any
+		 * event for this domain(thread/core/trace),
+		 * set the global id to zero.
+		 */
+		if (imc_global_refc.refc <= 0) {
+			imc_global_refc.refc = 0;
+			imc_global_refc.id = 0;
+		}
+		mutex_unlock(&imc_global_refc.lock);
+}
+
 static void core_imc_counters_release(struct perf_event *event)
 {
 	int rc, core_id;
@@ -759,6 +793,8 @@ static void core_imc_counters_release(struct perf_event *event)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
+	reset_global_refc(event);
 }

 static int core_imc_event_init(struct perf_event *event)
@@ -819,6 +855,29 @@ static int core_imc_event_init(struct perf_event *event)
 	++ref->refc;
 	mutex_unlock(&ref->lock);

+	/*
+	 * Since the system can run either in accumulation or trace-mode
+	 * of IMC at a time, core-imc events are allowed only if no other
+	 * trace/thread imc events are enabled/monitored.
+	 *
+	 * Take the global lock, and check the refc.id
+	 * to know whether any other trace/thread imc
+	 * events are running.
+	 */
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == 0 || imc_global_refc.id == IMC_DOMAIN_CORE) {
+		/*
+		 * No other trace/thread imc events are running in
+		 * the system, so set the refc.id to core-imc.
+		 */
+		imc_global_refc.id = IMC_DOMAIN_CORE;
+		imc_global_refc.refc++;
+	} else {
+		mutex_unlock(&imc_global_refc.lock);
+		return -EBUSY;
+	}
+	mutex_unlock(&imc_global_refc.lock);
+
 	event->hw.event_base = (u64)pcmi->vbase + (config & IMC_EVENT_OFFSET_MASK);
 	event->destroy = core_imc_counters_release;
 	return 0;
@@ -877,7 +936,20 @@ static int ppc_thread_imc_cpu_online(unsigned int cpu)

 static int ppc_thread_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	/*
+	 * Set the bit 0 of LDBAR to zero.
+	 *
+	 * If bit 0 of LDBAR is unset, it will stop posting
+	 * the counetr data to memory.
+	 * For thread-imc, bit 0 of LDBAR will be set to 1 in the
+	 * event_add function. So reset this bit here, to stop the updates
+	 * to memory in the cpu_offline path.
+	 */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) & (~(1UL << 63))));
+
+	/* Reduce the refc if thread-imc event running on this cpu */
+	if (imc_global_refc.id == IMC_DOMAIN_THREAD)
+		imc_global_refc.refc--;
 	return 0;
 }

@@ -916,7 +988,22 @@ static int thread_imc_event_init(struct perf_event *event)
 	if (!target)
 		return -EINVAL;

+	mutex_lock(&imc_global_refc.lock);
+	/*
+	 * Check if any other trace/core imc events are running in the
+	 * system, if not set the global id to thread-imc.
+	 */
+	if (imc_global_refc.id == 0 || imc_global_refc.id == IMC_DOMAIN_THREAD) {
+		imc_global_refc.id = IMC_DOMAIN_THREAD;
+		imc_global_refc.refc++;
+	} else {
+		mutex_unlock(&imc_global_refc.lock);
+		return -EBUSY;
+	}
+	mutex_unlock(&imc_global_refc.lock);
+
 	event->pmu->task_ctx_nr = perf_sw_context;
+	event->destroy = reset_global_refc;
 	return 0;
 }

@@ -1063,10 +1150,12 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 	int core_id;
 	struct imc_pmu_ref *ref;

-	mtspr(SPRN_LDBAR, 0);
-
 	core_id = smp_processor_id() / threads_per_core;
 	ref = &core_imc_refc[core_id];
+	if (!ref) {
+		pr_debug("imc: Failed to get event reference count\n");
+		return;
+	}

 	mutex_lock(&ref->lock);
 	ref->refc--;
@@ -1082,6 +1171,10 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
+	/* Set bit 0 of LDBAR to zero, to stop posting updates to memory */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) & (~(1UL << 63))));
+
 	/*
 	 * Take a snapshot and calculate the delta and update
 	 * the event counter values.
@@ -1133,7 +1226,16 @@ static int ppc_trace_imc_cpu_online(unsigned int cpu)

 static int ppc_trace_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	/*
+	 * No need to set bit 0 of LDBAR to zero, as
+	 * it is set to zero for imc trace-mode
+	 *
+	 * Reduce the refc if any trace-imc event running
+	 * on this cpu.
+	 */
+	if (imc_global_refc.id == IMC_DOMAIN_TRACE)
+		imc_global_refc.refc--;
+
 	return 0;
 }

@@ -1226,15 +1328,14 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
 	local_mem = get_trace_imc_event_base_addr();
 	ldbar_value = ((u64)local_mem & THREAD_IMC_LDBAR_MASK) | TRACE_IMC_ENABLE;

-	if (core_imc_refc)
-		ref = &core_imc_refc[core_id];
+	/* trace-imc reference count */
+	if (trace_imc_refc)
+		ref = &trace_imc_refc[core_id];
 	if (!ref) {
-		/* If core-imc is not enabled, use trace-imc reference count */
-		if (trace_imc_refc)
-			ref = &trace_imc_refc[core_id];
-		if (!ref)
-			return -EINVAL;
+		pr_debug("imc: Failed to get the event reference count\n");
+		return -EINVAL;
 	}
+
 	mtspr(SPRN_LDBAR, ldbar_value);
 	mutex_lock(&ref->lock);
 	if (ref->refc == 0) {
@@ -1242,13 +1343,11 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
 				get_hard_smp_processor_id(smp_processor_id()))) {
 			mutex_unlock(&ref->lock);
 			pr_err("trace-imc: Unable to start the counters for core %d\n", core_id);
-			mtspr(SPRN_LDBAR, 0);
 			return -EINVAL;
 		}
 	}
 	++ref->refc;
 	mutex_unlock(&ref->lock);
-
 	return 0;
 }

@@ -1274,16 +1373,13 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 	int core_id = smp_processor_id() / threads_per_core;
 	struct imc_pmu_ref *ref = NULL;

-	if (core_imc_refc)
-		ref = &core_imc_refc[core_id];
+	if (trace_imc_refc)
+		ref = &trace_imc_refc[core_id];
 	if (!ref) {
-		/* If core-imc is not enabled, use trace-imc reference count */
-		if (trace_imc_refc)
-			ref = &trace_imc_refc[core_id];
-		if (!ref)
-			return;
+		pr_debug("imc: Failed to get event reference count\n");
+		return;
 	}
-	mtspr(SPRN_LDBAR, 0);
+
 	mutex_lock(&ref->lock);
 	ref->refc--;
 	if (ref->refc == 0) {
@@ -1297,6 +1393,7 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
 	trace_imc_event_stop(event, flags);
 }

@@ -1314,10 +1411,30 @@ static int trace_imc_event_init(struct perf_event *event)
 	if (event->attr.sample_period == 0)
 		return -ENOENT;

+	/*
+	 * Take the global lock, and make sure
+	 * no other thread is running any core/thread imc
+	 * events
+	 */
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == 0 || imc_global_refc.id == IMC_DOMAIN_TRACE) {
+		/*
+		 * No core/thread imc events are running in the
+		 * system, so set the refc.id to trace-imc.
+		 */
+		imc_global_refc.id = IMC_DOMAIN_TRACE;
+		imc_global_refc.refc++;
+	} else {
+		mutex_unlock(&imc_global_refc.lock);
+		return -EBUSY;
+	}
+	mutex_unlock(&imc_global_refc.lock);
+
 	event->hw.idx = -1;
 	target = event->hw.target;

 	event->pmu->task_ctx_nr = perf_hw_context;
+	event->destroy = reset_global_refc;
 	return 0;
 }

@@ -1429,10 +1546,10 @@ static void cleanup_all_core_imc_memory(void)
 static void thread_imc_ldbar_disable(void *dummy)
 {
 	/*
-	 * By Zeroing LDBAR, we disable thread-imc
-	 * updates.
+	 * By setting 0th bit of LDBAR to zero, we disable thread-imc
+	 * updates to memory.
 	 */
-	mtspr(SPRN_LDBAR, 0);
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) & (~(1UL << 63))));
 }

 void thread_imc_disable(void)
--
2.20.1


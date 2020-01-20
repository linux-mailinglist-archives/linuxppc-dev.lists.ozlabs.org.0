Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150D1428A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 11:58:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481TCr0pH1zDqhH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 21:58:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 481T7H3S0GzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 21:53:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00KAn0ku035636
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 05:53:56 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xmfyxmvn1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 05:53:55 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Mon, 20 Jan 2020 10:53:53 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 10:53:51 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00KAro0L47513948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 10:53:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F218A404D;
 Mon, 20 Jan 2020 10:53:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0114A4059;
 Mon, 20 Jan 2020 10:53:48 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.27.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jan 2020 10:53:48 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/perf: Implement a global lock to avoid races
 between trace, core and thread imc events.
Date: Mon, 20 Jan 2020 16:23:41 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200120105341.25802-1-anju@linux.vnet.ibm.com>
References: <20200120105341.25802-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012010-0028-0000-0000-000003D2C008
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012010-0029-0000-0000-00002496F148
Message-Id: <20200120105341.25802-2-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-20_01:2020-01-20,
 2020-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=1
 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001200096
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
Cc: nasastry@in.ibm.com, anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.vnet.ibm.com
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
 arch/powerpc/perf/imc-pmu.c | 177 +++++++++++++++++++++++++++++++-----
 1 file changed, 153 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index cb50a9e1fd2d..2e220f199530 100644
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
@@ -759,6 +769,20 @@ static void core_imc_counters_release(struct perf_event *event)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == IMC_DOMAIN_CORE) {
+		imc_global_refc.refc--;
+		/*
+		 * If no other thread is running any core-imc
+		 * event, set the global id to zero.
+		 */
+		if (imc_global_refc.refc <= 0) {
+			imc_global_refc.refc = 0;
+			imc_global_refc.id = 0;
+		}
+	}
+	mutex_unlock(&imc_global_refc.lock);
 }
 
 static int core_imc_event_init(struct perf_event *event)
@@ -779,6 +803,22 @@ static int core_imc_event_init(struct perf_event *event)
 	if (event->cpu < 0)
 		return -EINVAL;
 
+	/*
+	 * Take the global lock, and make sure
+	 * no other thread is running any trace OR thread imc event
+	 */
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == 0) {
+		imc_global_refc.id = IMC_DOMAIN_CORE;
+		imc_global_refc.refc++;
+	} else if (imc_global_refc.id == IMC_DOMAIN_CORE) {
+		imc_global_refc.refc++;
+	} else {
+		mutex_unlock(&imc_global_refc.lock);
+		return -EBUSY;
+	}
+	mutex_unlock(&imc_global_refc.lock);
+
 	event->hw.idx = -1;
 	pmu = imc_event_to_pmu(event);
 
@@ -877,7 +917,16 @@ static int ppc_thread_imc_cpu_online(unsigned int cpu)
 
 static int ppc_thread_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	/*
+	 * Toggle the bit 0 of LDBAR.
+	 *
+	 * If bit 0 of LDBAR is unset, it will stop posting
+	 * the counetr data to memory.
+	 * For thread-imc, bit 0 of LDBAR will be set to 1 in the
+	 * event_add function. So toggle this bit here, to stop the updates
+	 * to memory in the cpu_offline path.
+	 */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) ^ (1UL << 63)));
 	return 0;
 }
 
@@ -889,6 +938,24 @@ static int thread_imc_cpu_init(void)
 			  ppc_thread_imc_cpu_offline);
 }
 
+static void thread_imc_counters_release(struct perf_event *event)
+{
+
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == IMC_DOMAIN_THREAD) {
+		imc_global_refc.refc--;
+		/*
+		 * If no other thread is running any thread-imc
+		 * event, set the global id to zero.
+		 */
+		if (imc_global_refc.refc <= 0) {
+			imc_global_refc.refc = 0;
+			imc_global_refc.id = 0;
+		}
+	}
+	mutex_unlock(&imc_global_refc.lock);
+}
+
 static int thread_imc_event_init(struct perf_event *event)
 {
 	u32 config = event->attr.config;
@@ -905,6 +972,27 @@ static int thread_imc_event_init(struct perf_event *event)
 	if (event->hw.sample_period)
 		return -EINVAL;
 
+	mutex_lock(&imc_global_refc.lock);
+	/*
+	 * Check if any other thread is running
+	 * core-engine, if not set the global id to
+	 * thread-imc.
+	 */
+	if (imc_global_refc.id == 0) {
+		imc_global_refc.id = IMC_DOMAIN_THREAD;
+		imc_global_refc.refc++;
+	} else if (imc_global_refc.id == IMC_DOMAIN_THREAD) {
+		/*
+		 * Increase the ref count if the global id is
+		 * set to thread-imc.
+		 */
+		imc_global_refc.refc++;
+	} else {
+		mutex_unlock(&imc_global_refc.lock);
+		return -EBUSY;
+	}
+	mutex_unlock(&imc_global_refc.lock);
+
 	event->hw.idx = -1;
 	pmu = imc_event_to_pmu(event);
 
@@ -917,6 +1005,7 @@ static int thread_imc_event_init(struct perf_event *event)
 		return -EINVAL;
 
 	event->pmu->task_ctx_nr = perf_sw_context;
+	event->destroy = thread_imc_counters_release;
 	return 0;
 }
 
@@ -1063,10 +1152,12 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
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
@@ -1082,6 +1173,10 @@ static void thread_imc_event_del(struct perf_event *event, int flags)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
+	/* Toggle bit 0 of LDBAR */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) ^ (1UL << 63)));
+
 	/*
 	 * Take a snapshot and calculate the delta and update
 	 * the event counter values.
@@ -1133,7 +1228,8 @@ static int ppc_trace_imc_cpu_online(unsigned int cpu)
 
 static int ppc_trace_imc_cpu_offline(unsigned int cpu)
 {
-	mtspr(SPRN_LDBAR, 0);
+	/* Toggle bit 0 of LDBAR. */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) ^ (1UL << 63)));
 	return 0;
 }
 
@@ -1226,15 +1322,14 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
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
@@ -1242,13 +1337,11 @@ static int trace_imc_event_add(struct perf_event *event, int flags)
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
 
@@ -1274,16 +1367,13 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
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
@@ -1297,9 +1387,30 @@ static void trace_imc_event_del(struct perf_event *event, int flags)
 		ref->refc = 0;
 	}
 	mutex_unlock(&ref->lock);
+
+	/* Toggle bit 0 of LDBAR */
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) ^ (1UL << 63)));
+
 	trace_imc_event_stop(event, flags);
 }
 
+static void trace_imc_counters_release(struct perf_event *event)
+{
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == IMC_DOMAIN_TRACE) {
+		imc_global_refc.refc--;
+		/*
+		 * If no other thread is running any trace-imc
+		 * event, set the global id to zero.
+		 */
+		if (imc_global_refc.refc <= 0) {
+			imc_global_refc.refc = 0;
+			imc_global_refc.id = 0;
+		}
+	}
+	mutex_unlock(&imc_global_refc.lock);
+}
+
 static int trace_imc_event_init(struct perf_event *event)
 {
 	struct task_struct *target;
@@ -1314,10 +1425,28 @@ static int trace_imc_event_init(struct perf_event *event)
 	if (event->attr.sample_period == 0)
 		return -ENOENT;
 
+	/*
+	 * Take the global lock, and make sure
+	 * no other thread is running any core/thread imc
+	 * event
+	 */
+	mutex_lock(&imc_global_refc.lock);
+	if (imc_global_refc.id == 0) {
+		imc_global_refc.id = IMC_DOMAIN_TRACE;
+		imc_global_refc.refc++;
+	} else if (imc_global_refc.id == IMC_DOMAIN_TRACE) {
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
+	event->destroy = trace_imc_counters_release;
 	return 0;
 }
 
@@ -1429,10 +1558,10 @@ static void cleanup_all_core_imc_memory(void)
 static void thread_imc_ldbar_disable(void *dummy)
 {
 	/*
-	 * By Zeroing LDBAR, we disable thread-imc
-	 * updates.
+	 * By toggling 0th bit of LDBAR, we disable thread-imc
+	 * updates to memory.
 	 */
-	mtspr(SPRN_LDBAR, 0);
+	mtspr(SPRN_LDBAR, (mfspr(SPRN_LDBAR) ^ (1UL << 63)));
 }
 
 void thread_imc_disable(void)
-- 
2.20.1


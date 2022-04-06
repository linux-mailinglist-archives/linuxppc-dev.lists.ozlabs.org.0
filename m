Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB694F67D7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYXFs5FrVz3bcm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 03:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVUm6hht;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HVUm6hht; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYXC42wjxz3bbn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 03:52:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236Hj4Yi025382; 
 Wed, 6 Apr 2022 17:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BcR3gIKzSiOjVh7Agu1X/eiZNgo2PdhBaIDwVK9ABaA=;
 b=HVUm6hhtNaDDJh7RPIlOMVAAD/Jtmkx+9xPzhJD/WwvUhlrEdJFL4dTjqeZwbg57SRFt
 gHmsw+q4OOxvHOfRqTfViH1Z91bvmx0dA/4dp61Mm7YxsqkeBB3zpLWB8k54tM4UEl5h
 +T7fjGqkh2qfizngWbaRiVqqzDbgaDTFSbsjMQbLO5pWOd5X/A3mKoGQ6r/NKGU8LuW9
 lzBPH0we2ihLpGmuRP/v2Y9a/dlf8oA0EsKVkAu9yS2vtvwPbw7MX2Wd6tfF4lKw9vTY
 GAgruWZNhs2UWclzoIWMX/V1u2p4k4kXLsr9BsKHsICMh00xITz6FCnNi04k6LGQAvd2 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8twg8usf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:46 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 236HjZKA028010;
 Wed, 6 Apr 2022 17:51:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8twg8uru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 236Hh9TQ018159;
 Wed, 6 Apr 2022 17:51:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3f6e4908md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 17:51:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 236Hpekg39846192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 17:51:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98ABD4C04A;
 Wed,  6 Apr 2022 17:51:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C9844C046;
 Wed,  6 Apr 2022 17:51:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.90.125])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 17:51:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH v2 3/4] tools/perf: Fix perf numa bench to fix usage of
 affinity for machines with #CPUs > 1K
Date: Wed,  6 Apr 2022 23:21:12 +0530
Message-Id: <20220406175113.87881-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
References: <20220406175113.87881-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ex8HKKw-QfxWNZJs90VonxTYaJTMYmbv
X-Proofpoint-GUID: J6NBuQE-ikpceLtDq9RlGplaO45gb9dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_09,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060087
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf bench numa testcase fails on systems with CPU's
more than 1K.

Testcase: perf bench numa mem -p 1 -t 3 -P 512 -s 100 -zZ0qcm --thp  1
Snippet of code:
<<>>
perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
Aborted (core dumped)
<<>>

bind_to_node function uses "sched_getaffinity" to save the original
cpumask and this call is returning EINVAL ((invalid argument).
This happens because the default mask size in glibc is 1024.
To overcome this 1024 CPUs mask size limitation of cpu_set_t,
change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
allocate cpumask, CPU_ALLOC_SIZE for size. Apart from fixing this
for "orig_mask", apply same logic to "mask" as well which is used to
setaffinity so that mask size is large enough to represent number
of possible CPU's in the system.

sched_getaffinity is used in one more place in perf numa bench. It
is in "bind_to_cpu" function. Apply the same logic there also. Though
currently no failure is reported from there, it is ideal to change
getaffinity to work with such system configurations having CPU's more
than default mask size supported by glibc.

Also fix "sched_setaffinity" to use mask size which is large enough
to represent number of possible CPU's in the system.

Fixed all places where "bind_cpumask" which is part of "struct
thread_data" is used such that bind_cpumask works in all configuration.

Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
---
 tools/perf/bench/numa.c | 97 ++++++++++++++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 26 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index f2640179ada9..29e41e32bd88 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -54,7 +54,7 @@
 
 struct thread_data {
 	int			curr_cpu;
-	cpu_set_t		bind_cpumask;
+	cpu_set_t		*bind_cpumask;
 	int			bind_node;
 	u8			*process_data;
 	int			process_nr;
@@ -266,46 +266,71 @@ static bool node_has_cpus(int node)
 	return ret;
 }
 
-static cpu_set_t bind_to_cpu(int target_cpu)
+static cpu_set_t *bind_to_cpu(int target_cpu)
 {
-	cpu_set_t orig_mask, mask;
+	int nrcpus = numa_num_possible_cpus();
+	cpu_set_t *orig_mask, *mask;
+	size_t size;
 	int ret;
 
-	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
-	BUG_ON(ret);
+	orig_mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!orig_mask);
+	size = CPU_ALLOC_SIZE(nrcpus);
+	CPU_ZERO_S(size, orig_mask);
+
+	ret = sched_getaffinity(0, size, orig_mask);
+	if (ret) {
+		CPU_FREE(orig_mask);
+		BUG_ON(ret);
+	}
 
-	CPU_ZERO(&mask);
+	mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!mask);
+	CPU_ZERO_S(size, mask);
 
 	if (target_cpu == -1) {
 		int cpu;
 
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &mask);
+			CPU_SET_S(cpu, size, mask);
 	} else {
 		BUG_ON(target_cpu < 0 || target_cpu >= g->p.nr_cpus);
-		CPU_SET(target_cpu, &mask);
+		CPU_SET_S(target_cpu, size, mask);
 	}
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
+	ret = sched_setaffinity(0, size, mask);
+	CPU_FREE(mask);
 	BUG_ON(ret);
 
 	return orig_mask;
 }
 
-static cpu_set_t bind_to_node(int target_node)
+static cpu_set_t *bind_to_node(int target_node)
 {
-	cpu_set_t orig_mask, mask;
+	int nrcpus = numa_num_possible_cpus();
+	cpu_set_t *orig_mask, *mask;
+	size_t size;
 	int cpu;
 	int ret;
 
-	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
-	BUG_ON(ret);
+	orig_mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!orig_mask);
+	size = CPU_ALLOC_SIZE(nrcpus);
+	CPU_ZERO_S(size, orig_mask);
+
+	ret = sched_getaffinity(0, size, orig_mask);
+	if (ret) {
+		CPU_FREE(orig_mask);
+		BUG_ON(ret);
+	}
 
-	CPU_ZERO(&mask);
+	mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!mask);
+	CPU_ZERO_S(size, mask);
 
 	if (target_node == NUMA_NO_NODE) {
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &mask);
+			CPU_SET_S(cpu, size, mask);
 	} else {
 		struct bitmask *cpumask = numa_allocate_cpumask();
 
@@ -313,24 +338,29 @@ static cpu_set_t bind_to_node(int target_node)
 		if (!numa_node_to_cpus(target_node, cpumask)) {
 			for (cpu = 0; cpu < (int)cpumask->size; cpu++) {
 				if (numa_bitmask_isbitset(cpumask, cpu))
-					CPU_SET(cpu, &mask);
+					CPU_SET_S(cpu, size, mask);
 			}
 		}
 		numa_free_cpumask(cpumask);
 	}
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
+	ret = sched_setaffinity(0, size, mask);
+	CPU_FREE(mask);
 	BUG_ON(ret);
 
 	return orig_mask;
 }
 
-static void bind_to_cpumask(cpu_set_t mask)
+static void bind_to_cpumask(cpu_set_t *mask)
 {
 	int ret;
+	size_t size = CPU_ALLOC_SIZE(numa_num_possible_cpus());
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
-	BUG_ON(ret);
+	ret = sched_setaffinity(0, size, mask);
+	if (ret) {
+		CPU_FREE(mask);
+		BUG_ON(ret);
+	}
 }
 
 static void mempol_restore(void)
@@ -376,7 +406,7 @@ do {							\
 static u8 *alloc_data(ssize_t bytes0, int map_flags,
 		      int init_zero, int init_cpu0, int thp, int init_random)
 {
-	cpu_set_t orig_mask;
+	cpu_set_t *orig_mask;
 	ssize_t bytes;
 	u8 *buf;
 	int ret;
@@ -434,6 +464,7 @@ static u8 *alloc_data(ssize_t bytes0, int map_flags,
 	/* Restore affinity: */
 	if (init_cpu0) {
 		bind_to_cpumask(orig_mask);
+		CPU_FREE(orig_mask);
 		mempol_restore();
 	}
 
@@ -589,6 +620,7 @@ static int parse_setup_cpu_list(void)
 		BUG_ON(bind_cpu_0 > bind_cpu_1);
 
 		for (bind_cpu = bind_cpu_0; bind_cpu <= bind_cpu_1; bind_cpu += step) {
+			size_t size = CPU_ALLOC_SIZE(g->p.nr_cpus);
 			int i;
 
 			for (i = 0; i < mul; i++) {
@@ -608,10 +640,12 @@ static int parse_setup_cpu_list(void)
 					tprintf("%2d", bind_cpu);
 				}
 
-				CPU_ZERO(&td->bind_cpumask);
+				td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
+				BUG_ON(!td->bind_cpumask);
+				CPU_ZERO_S(size, td->bind_cpumask);
 				for (cpu = bind_cpu; cpu < bind_cpu+bind_len; cpu++) {
 					BUG_ON(cpu < 0 || cpu >= g->p.nr_cpus);
-					CPU_SET(cpu, &td->bind_cpumask);
+					CPU_SET_S(cpu, size, td->bind_cpumask);
 				}
 				t++;
 			}
@@ -1241,7 +1275,7 @@ static void *worker_thread(void *__tdata)
 		 * by migrating to CPU#0:
 		 */
 		if (first_task && g->p.perturb_secs && (int)(stop.tv_sec - last_perturbance) >= g->p.perturb_secs) {
-			cpu_set_t orig_mask;
+			cpu_set_t *orig_mask;
 			int target_cpu;
 			int this_cpu;
 
@@ -1265,6 +1299,7 @@ static void *worker_thread(void *__tdata)
 				printf(" (injecting perturbalance, moved to CPU#%d)\n", target_cpu);
 
 			bind_to_cpumask(orig_mask);
+			CPU_FREE(orig_mask);
 		}
 
 		if (details >= 3) {
@@ -1398,21 +1433,31 @@ static void init_thread_data(void)
 
 	for (t = 0; t < g->p.nr_tasks; t++) {
 		struct thread_data *td = g->threads + t;
+		size_t cpuset_size = CPU_ALLOC_SIZE(g->p.nr_cpus);
 		int cpu;
 
 		/* Allow all nodes by default: */
 		td->bind_node = NUMA_NO_NODE;
 
 		/* Allow all CPUs by default: */
-		CPU_ZERO(&td->bind_cpumask);
+		td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
+		BUG_ON(!td->bind_cpumask);
+		CPU_ZERO_S(cpuset_size, td->bind_cpumask);
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &td->bind_cpumask);
+			CPU_SET_S(cpu, cpuset_size, td->bind_cpumask);
 	}
 }
 
 static void deinit_thread_data(void)
 {
 	ssize_t size = sizeof(*g->threads)*g->p.nr_tasks;
+	int t;
+
+	/* Free the bind_cpumask allocated for thread_data */
+	for (t = 0; t < g->p.nr_tasks; t++) {
+		struct thread_data *td = g->threads + t;
+		CPU_FREE(td->bind_cpumask);
+	}
 
 	free_data(g->threads, size);
 }
-- 
2.35.1


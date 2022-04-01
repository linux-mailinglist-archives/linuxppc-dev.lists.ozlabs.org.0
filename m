Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDF4EFA3E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 21:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVV0C5vKCz3cDX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 06:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLBsVtDB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MLBsVtDB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVTxd1B0Dz30Fw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 05:59:48 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231GtXAW004963; 
 Fri, 1 Apr 2022 18:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=084QExmGtFqhUTbvbPsoKnHTsj91QjOI0kM7ZjCouM0=;
 b=MLBsVtDBimyou2CJKPeT2kkgNPRqiqOKXAN4OArAzCCTJD0czjD6S0N1C6AVUpYok4Lf
 K2ZLQH0Ne3E/0dYX26/qFWGoJAWIl1vdX66GdOBaaY/pfJvx2iEmVoqKec3vOgm3VVBX
 hR4K4L0/hRhifNjhjzNUrU9Ook3sZsiDHJKYKhHL5vumQKcbHNB9nFw8eIyRSaAVhZZU
 bSUPDywYG+m/w3qktjDuDRHcm9I9UiTNKQQddMnlsUd8IvDzV26u1TmFUOdrSuz0f4W0
 hJph6HlsT4YzNXq0Bfvr2HFaxmkaDAc5x1fc1D2oq2Bit6v+X/FgUcrRWTOlNNvEnxkp sQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f632kdm9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231Ivhpb016567;
 Fri, 1 Apr 2022 18:59:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3f1tf93h5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 231IlXrZ38666526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 18:47:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11CDCA4054;
 Fri,  1 Apr 2022 18:59:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E6ADA405B;
 Fri,  1 Apr 2022 18:59:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.128.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 18:59:32 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 3/4] tools/perf: Fix perf numa bench to fix usage of affinity
 for machines with #CPUs > 1K
Date: Sat,  2 Apr 2022 00:28:52 +0530
Message-Id: <20220401185853.23912-4-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LKbV-xYywK8f8wvjwbVfjGJabtWGwe3n
X-Proofpoint-ORIG-GUID: LKbV-xYywK8f8wvjwbVfjGJabtWGwe3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010088
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
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

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/bench/numa.c | 109 +++++++++++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 28 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index f2640179ada9..333896907e45 100644
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
@@ -266,46 +266,75 @@ static bool node_has_cpus(int node)
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
-	BUG_ON(ret);
+	ret = sched_setaffinity(0, size, mask);
+	if (ret) {
+		CPU_FREE(mask);
+		BUG_ON(ret);
+	}
+
+	CPU_FREE(mask);
 
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
 
@@ -313,24 +342,33 @@ static cpu_set_t bind_to_node(int target_node)
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
-	BUG_ON(ret);
+	ret = sched_setaffinity(0, size, mask);
+	if (ret) {
+		CPU_FREE(mask);
+		BUG_ON(ret);
+	}
+
+	CPU_FREE(mask);
 
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
@@ -376,7 +414,7 @@ do {							\
 static u8 *alloc_data(ssize_t bytes0, int map_flags,
 		      int init_zero, int init_cpu0, int thp, int init_random)
 {
-	cpu_set_t orig_mask;
+	cpu_set_t *orig_mask;
 	ssize_t bytes;
 	u8 *buf;
 	int ret;
@@ -434,6 +472,7 @@ static u8 *alloc_data(ssize_t bytes0, int map_flags,
 	/* Restore affinity: */
 	if (init_cpu0) {
 		bind_to_cpumask(orig_mask);
+		CPU_FREE(orig_mask);
 		mempol_restore();
 	}
 
@@ -589,6 +628,7 @@ static int parse_setup_cpu_list(void)
 		BUG_ON(bind_cpu_0 > bind_cpu_1);
 
 		for (bind_cpu = bind_cpu_0; bind_cpu <= bind_cpu_1; bind_cpu += step) {
+			size_t size = CPU_ALLOC_SIZE(g->p.nr_cpus);
 			int i;
 
 			for (i = 0; i < mul; i++) {
@@ -608,10 +648,12 @@ static int parse_setup_cpu_list(void)
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
@@ -1241,7 +1283,7 @@ static void *worker_thread(void *__tdata)
 		 * by migrating to CPU#0:
 		 */
 		if (first_task && g->p.perturb_secs && (int)(stop.tv_sec - last_perturbance) >= g->p.perturb_secs) {
-			cpu_set_t orig_mask;
+			cpu_set_t *orig_mask;
 			int target_cpu;
 			int this_cpu;
 
@@ -1265,6 +1307,7 @@ static void *worker_thread(void *__tdata)
 				printf(" (injecting perturbalance, moved to CPU#%d)\n", target_cpu);
 
 			bind_to_cpumask(orig_mask);
+			CPU_FREE(orig_mask);
 		}
 
 		if (details >= 3) {
@@ -1398,21 +1441,31 @@ static void init_thread_data(void)
 
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

